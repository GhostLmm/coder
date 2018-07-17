package ui.shop
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.RewardsData;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.ShenmiShangdianModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_heidian;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollerControllerMatrix;
	import ui.window.CommonRewardWindow;
	
	import util.GameTime;
	import util.Util;
	
	import view.CommonControlFun;
	import view.Panel_Base;
	
	public class Panel_Shenmishangdian extends Panel_Base
	{
		public var shenmiModel:ShenmiShangdianModel;
		public var timerModel:TimerModel;
		
		public var _pos_scroll_v_choseitem:Position;
		public var _scroller:ScrollerControllerMatrix;
		public var _fnt_time:FontField;
		public var _btn_shuaxin:Button;
		public var _btn_quanbugoumai:Button;
		
		public static var gridNotEngouhTip:Boolean=false;
		
		private var freshFlag:Boolean=false;
		
		public function Panel_Shenmishangdian()
		{
			super();
		}
		protected override function initModule():void
		{
			shenmiModel=Context.getInjectInstance(ShenmiShangdianModel);
			timerModel=Context.getInjectInstance(TimerModel);
			
			_pos_scroll_v_choseitem=new Position(panelMaterial.pos_scroll_shop);
			_scroller=new ScrollerControllerMatrix(_pos_scroll_v_choseitem);
			_fnt_time=new FontField(panelMaterial.fnt_time);
			_btn_shuaxin=new Button(panelMaterial.btn_shuaxin);
			_btn_quanbugoumai=new Button(panelMaterial.btn_quanbugoumai);
			_scroller.initClass(Item_ShenmiShangdian);
		}
		private function clearMc():void
		{
			if(_pos_scroll_v_choseitem) {_pos_scroll_v_choseitem.destory(); _pos_scroll_v_choseitem=null;};
			if(_scroller) {_scroller.destory(); _scroller=null;};
			if(_fnt_time) {_fnt_time.destory(); _fnt_time=null;};
			if(_btn_shuaxin) {_btn_shuaxin.destory(); _btn_shuaxin=null;};
			if(_btn_quanbugoumai) {_btn_quanbugoumai.destory(); _btn_quanbugoumai=null;};
		}
		protected override function registerEvent():void
		{
			addTargetEvent(_btn_shuaxin,TqtEvent.BUTTON_CLICK,onShuaxinClicked);
			addTargetEvent(_btn_quanbugoumai,TqtEvent.BUTTON_CLICK,onQuanbugoumaiClicked);
		}
		private function onQuanbugoumaiClicked(evt:Event):void
		{
			var re:JudgeResult=shenmiModel.couldBuyAllItem();
			if(re.success)
			{
				shenmiModel.cacheBuyArray=shenmiModel.getBuyAllItemNodeArray();
				gridNotEngouhTip=(re.code==JudgeResult.CD_BagGridNotEnough);
				C2SEmitter.buyAllShengmiShangdianItem();
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		private function onShuaxinClicked(evt:Event):void
		{
			var re:JudgeResult=shenmiModel.couldRefreshShangdian();
			if(re.success){
				var needCash:int=shenmiModel.getRfreshCashCost();
				var showStr:String=Util.getLanguage("确定花费元宝刷新黑店",needCash);
				CommonControlFun.confirmDoSth(showStr,confirmShuxin);
			}else if(re.code==JudgeResult.CD_CashNotEnough){
				CommonControlFun.cashNotEnoughDo();
			}
			else{
				Util.flow(re.desc);
			}
		}
		private function confirmShuxin():void
		{
			C2SEmitter.refreshShenmiShangdian();
		}
		protected override function setShow():void
		{			
			timerModel.secondTimer_SN.add(onTick);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			onTick();
			updateItems();
		}
		private function updateItems():void
		{
			_scroller.setData(shenmiModel.getShangdianItemArray());
		}
		private function onMessage(msType:String,c2s:DigC2SProto,_code:int):void
		{
			if(_code!=1)
			{
				
				return;
			}
			if(msType==C2SEmitter.REQ_SpecialShopGetHandler)
			{
				freshFlag=false;
			}
			if(msType==C2SEmitter.REQ_SpecialShopRefreshHandler){
				Util.flow("刷新成功");
			}
			if(msType==C2SEmitter.REQ_SpecialShopBuyHandler){
				if(gridNotEngouhTip){
					Util.flow("购买装备时格子不够提示");
				}
				var id:int=c2s.buy.heidianId;
				var node:Node_heidian=XMLDataManager.getHeidianById(id);
				
				var rewardsData:RewardsData=new RewardsData();
				rewardsData.key=node.type;
				rewardsData.xid=node.item_id;
				rewardsData.num=node.item_num;
				var rewardPackData:RewardsPackData=new RewardsPackData();
				rewardPackData.tiltle=RewardsPackData.Title_BuySuccess;
				rewardPackData.desc=RewardsPackData.Desc_BuySuccess;
				rewardPackData.itemObjArray=[rewardsData];
				WindowManager.openOnlyWinodw(CommonRewardWindow,rewardPackData);
			}
			if(msType==C2SEmitter.REQ_SpecialShopBuyAllHandler)
			{
				showBuyAllItemRewards();
			}
			updateItems();
		}
		private function showBuyAllItemRewards():void
		{
			if(gridNotEngouhTip){
				Util.flow("购买装备时格子不够提示");
			}else{
				Util.flow("购买全部商品后刷新");
			}
			
			var rewardsArray:Array=shenmiModel.cacheBuyArray;
			if(null==rewardsArray)
			{
				return;
			}
			var paramArray:Array=[];
			var index:int;
			for(index=0;index<rewardsArray.length;index++)
			{
				var data:ViewData_Shenmishangdian=rewardsArray[index] as ViewData_Shenmishangdian;
				var node:Node_heidian=data.node;
				if(null==node)
				{
					continue;
				}
				var rewardsData:RewardsData=new RewardsData();
				rewardsData.key=node.type;
				rewardsData.xid=node.item_id;
				rewardsData.num=node.item_num;
				paramArray.push(rewardsData);
			}
			var rewardPackData:RewardsPackData=new RewardsPackData();
			rewardPackData.tiltle=RewardsPackData.Title_BuySuccess;
			rewardPackData.desc=RewardsPackData.Desc_BuySuccess;
			rewardPackData.itemObjArray=paramArray;
			WindowManager.openOnlyWinodw(CommonRewardWindow,rewardPackData);
		}
		private function onTick():void
		{
			var gameTime:GameTime=new GameTime(shenmiModel.shenmiVo.refreshTime-timerModel.serverTime);
			if(gameTime.miliSecond<0 && !freshFlag){
				freshFlag=true;
				C2SEmitter.getShengmiShangdianData();
				gameTime.setMiliSeconds(0);
				if(WindowManager.currentAlert){
					WindowManager.currentAlert.close();
				}
			}
			if(gameTime.miliSecond<0){
				gameTime.setMiliSeconds(0);
			}
			_fnt_time.text=gameTime.toString3();
		}
		protected override function get panelClassName():Class
		{
			return SceneShop1;
		}
		private function get panelMaterial():SceneShop1
		{
			return material as SceneShop1;
		}
		public override function clear():void
		{
			timerModel.secondTimer_SN.remove(onTick);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			timerModel=null;
			shenmiModel=null;
			clearMc();
			super.clear();
		}
	}
}