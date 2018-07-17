package ui.fuben
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ErrorCode;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.ShoujiModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.tempData.FubenBoxData;
	import com.fish.modules.core.models.tempData.GuangmingData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_huodong_shouji_duihuan;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.LayerController;
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.layer.UiLayer;
	import ui.mc.JiangliMc;
	import ui.widget.ImageBitmap;
	import ui.window.CommonRewardWindow;
	
	import util.GameTime;
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_FubenChakan extends Mediator
	{
		[Inject]
		public var wm:FubenChakanWindow;
		[Inject]
		public var timerModel:TimerModel;
		[Inject]
		public var mapModel:MapModel;
		[Inject]
		public var userModel:UserModel;
		[Inject]
		public var shoujiModel:ShoujiModel;
		
		private var fubenBox:FubenBoxData;
		
		private var lock:Boolean=false;
		private var guanmingDetails:Array;
		
		public function MDI_FubenChakan()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			fubenBox=wm._params as FubenBoxData;
			
			
			
			var rewardData:RewardsPackData=new RewardsPackData();
			rewardData.bouns_itmes=Util.createArrayJosnToMap(fubenBox.node.reward_item,fubenBox.node.reward_item_num);
			
			for each(var node:Node_huodong_shouji_duihuan in shoujiModel.getActiveShoujiNodes()){
				rewardData.bouns_itmes[node.shouji_id]=1;
			}
			wm._scr_item.initClass(JiangliMc);
			wm._scr_item.setData(rewardData.createItemDatas());
			
			wm._fnt_title.text=fubenBox.node.name;
			wm._fnt_name.text="";
			wm._scr_paiming.initClass(Item_FubenGuanming);
			
			mapModel.currentChallengeFubenId=fubenBox.node.id;
			
			setStar();
			setTiaozhanNumShow();
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_tiaozhan,TqtEvent.BUTTON_CLICK,onTiaozan);
			addViewListener(wm._btn_tiaozhanshici,TqtEvent.BUTTON_CLICK,onShaodang);
			addViewListener(wm._btn_tiaozhanshici,TqtEvent.BUTTON_CLICK_DISABLE,onDisableSaodang);
			addViewListener(wm._btn_my_paiming,TqtEvent.BUTTON_CLICK,onClickPaiming);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			
			mapModel.fubenGuanmingDetailGetCom_SN.add(onGuanmingDetailCom);
			mapModel.getFubenGuanmingDetail(fubenBox.node.id);
			
			onTick();
			timerModel.secondTimer_SN.add(onTick);
			
//			mapModel.fubenGuanmingDetailGetCom_SN.add(onDetailCom);
//			mapModel.getFubenGuanmingDetail(fubenBox.node.id);
		}
		
		private function onClickPaiming(evt:Event):void{
			WindowManager.openOnlyWinodw(FubenPaihangRewardWindow);
		}
		
	
		private function onGuanmingDetailCom(fubenId:int,details:Array):void{
			if(fubenId==fubenBox.node.id){
				wm._scr_paiming.setData(details);
				if(details.length>0){
					wm._fnt_name.text=(details[0] as GuangmingData).name;
				}
			}
		}
		
		
		private function onDisableSaodang(evt:Event):void{
			Util.flow("无法扫荡提示");
		}
		
		private function onMessage(rsType:String,c2s:DigC2SProto,code:int):void{
			if(rsType==C2SEmitter.REQ_FubenClearCountHandler){
				if(code==1)
				{
					setTiaozhanNumShow();
					Util.flow("清除挑战次数成功");
				}
			}
			if(rsType==C2SEmitter.REQ_FubenSaodangHandler){
				if(code==1)
				{
					// 显示扫荡界面
					wm.close();
					WindowManager.openOnlyWinodw(SaodangWindow);
				}
			}
			if(rsType==C2SEmitter.REQ_FubenBattlePreHandler){
//				mapModel.currentChallengeFubenId=fubenBox.node.id;
				if(fubenBox.hasPass){
					// 如果是已经通过的副本，那么下一次 进入的话还是选择这个
					mapModel.showFubenFirst=fubenBox.node.id;
				}else{
					mapModel.showFubenFirst=-1;
				}
				if(code>0){
					showTiliMove();
				}
			}
			
			if(rsType==C2SEmitter.REQ_FubenNamedRewardHandler){
				if(code==ErrorCode.NOT_ALLOW){
					Util.flow("已经不是冠名了，无法领取");
					mapModel.getFubenGuanmingDetail(fubenBox.node.id);
				}
				if(code==ErrorCode.ALREADY_LINGQU){
					Util.flow("已经领取过了，无法再领");
				}
				if(code>0){
					Util.flow("冠名领取成功");
					var pack:RewardsPackData=new RewardsPackData();
					pack.bouns_star=fubenBox.node.guanming_star;
					pack.bonus_money=fubenBox.node.guanming_money;
					pack.bouns_cash=fubenBox.node.guanming_cash;
					pack.bouns_equips=Util.createArrayJosnToMap(fubenBox.node.guanming_item,fubenBox.node.guanming_item_num);
//					wm._scr_reward.setData(pack.createItemDatas());
					WindowManager.openOnlyWinodw(CommonRewardWindow,pack);
					
				}
			}
			
		}
		
		
		
		private function showTiliMove():void{
			GlobalRef.stage.mouseChildren=false;
			Util.tweenFly(new ImageBitmap("image_tili"),wm._btn_tiaozhan.view,LayerController.instance.uiLayer.userInfoBar.tiliMC,0.5,0.7,null,startBattle);
		}
		private function startBattle():void{
			GlobalRef.stage.mouseChildren=true;
			if(mapModel){
				mapModel.goBattle(fubenBox);
			}
		}
		
		private function setStar():void{
			var stars:Array=fubenBox.getStarArray();
			for(var index:int=0; index<stars.length; index++){
				var mc:MovieClip=wm._mc_stars[index];
				if(stars[index]>0){
					mc.gotoAndStop(2);
				}else{
					mc.gotoAndStop(1);
				}
				wm._desc_arrays[index].text=XMLDataManager.getFuben_starById(index+1).desc;
			}
		}
		
		private function setTiaozhanNumShow():void
		{
			wm._num_money.text=fubenBox.node.reward_money+"";
			wm._num_exp.text=fubenBox.node.reward_exp+"";
			wm._num_tili.text=fubenBox.node.cost_tili+"";
			
			var num:int=fubenBox.node.limit_num-fubenBox.hasTioazanCount;
			if(num<=0){
				num=0;
			}
			wm._num_cishu.text=num+"/"+fubenBox.node.limit_num;
//			copyWindow._prg_count.devider = copyData.copyXml.limit_num; 
//			copyWindow._prg_count.progress = copyData.copyVo.count;
			var num:int=fubenBox.node.limit_num-fubenBox.hasTioazanCount;
			if(num<=0){
				num=fubenBox.node.limit_num;
			}
			wm._btn_tiaozhanshici.setText(Util.getLanguage("扫荡次数",num));
		}
		
		private function onTick():void{
			var fresh:Number=mapModel.getSaodangFreshTime();
			var gameTime:GameTime=new GameTime(fresh-timerModel.serverTime);
			if(gameTime.miliSecond>0){
				wm._fnt_lengque.text=gameTime.toString2();
				wm._mc_lengque.visible=true;
				
			}else{
				wm._mc_lengque.visible=false;
			}
			
			
			if(!mapModel.hasPassThisMap(fubenBox)){
				wm._mc_lengque.visible=false;
//				wm._btn_tiaozhanshici.visible=false;
				wm._btn_tiaozhanshici.isEnabled=false;
			}
		}
		
		private function onTiaozan(evt:Event):void{
			var re:JudgeResult=mapModel.couldTiaozan(fubenBox);
			if(re.success){
				MapModel.tiaoZhanFuben(fubenBox.node.id);
			}else{
				if(re.code==JudgeResult.CD_TiliNotEnough){
					// 体力不够
					openWindowBuyTili();
					Util.flow(re.desc);
				}else if(re.code==JudgeResult.CD_HasOverLimit){
					var costCash:int=mapModel.getClearTiaozhanCost();
					WindowManager.openAlert(Util.getLanguage("挑战次数超过上限，是否花费元宝重置",costCash),onQingchuOK);
				}
			}
		}
		
		private function openWindowBuyTili():void{
//			wm.close();
			WindowManager.openOnlyWinodw(TiliGoumaiWindow);
		}
		
		/** 清除挑战次数 **/
		private function onQingchuOK():void{
			var costCash:int=mapModel.getClearTiaozhanCost();
			if(!userModel.cashCouldAfford(costCash))
			{
				CommonControlFun.cashNotEnoughDo();
			}
			else
			{
				C2SEmitter.clearTiaozhancishu(fubenBox.node.id);
			}
		}
		
		private function onShaodang(evt:Event):void{
			var re:JudgeResult=mapModel.couldShaoDang(fubenBox);
			if(re.success){
				C2SEmitter.saodang(fubenBox.node.id);
//				WindowManager.getWindowByClass(SaodangWindow,copyData).open();
//				copyWindow.close();
			}else if(re.code==JudgeResult.CD_HasOverLimit){
				var costCash:int=mapModel.getClearTiaozhanCost();
				WindowManager.openAlert(Util.getLanguage("挑战次数超过上限，是否花费元宝重置",costCash),onQingchuOK);
				
			}
			else if(re.code==JudgeResult.CD_TiliNotEnough){
				openWindowBuyTili();
				Util.flow(re.desc);
			}else{
				Util.flow(re.desc);
			}
		}
		
		
		public override function destroy():void
		{
			mapModel.fubenGuanmingDetailGetCom_SN.remove(onGuanmingDetailCom);
			timerModel.secondTimer_SN.remove(onTick);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			// todo
			super.destroy();
		}
	}
}