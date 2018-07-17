package ui.fuben
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.VipModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.GameTime;
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_TiliGoumai extends Mediator
	{
		[Inject]
		public var wm:TiliGoumaiWindow;
		[Inject]
		public var userModel:UserModel;
		[Inject]
		public var vipModel:VipModel;
		
		[Inject]
		public var timerModel:TimerModel;
		
		public function MDI_TiliGoumai()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			showInfo();
			
			setTiliHuifuShow();
			
			addViewListener(wm._btn_quxiao,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_goumai,TqtEvent.BUTTON_CLICK,onGoumai);
			
			S2CHanlder.instance.message_SN.add(onMessage);
			timerModel.secondTimer_SN.add(onTick);
		}
		
		private function setTiliHuifuShow():void{
			var time:Number=userModel.userVo.tiliRefreshTime-timerModel.serverTime;
			if(userModel.userVo.currentTili >= userModel.userVo.tiliLimit){
				wm._fnt_ziranhuifu.visible=false;
				return ;
			}
			if(time<=0){
				wm._fnt_ziranhuifu.visible=false;
			}else{
				wm._fnt_ziranhuifu.visible=true;
//				var min:int=time/1000/60;
				var seconds:int=time/1000;
				var tiliHuifu:int=XMLDataManager.getConstById("stepUpTili").value;
				if(seconds>60){
					wm._fnt_ziranhuifu.text=Util.getLanguage("体力时间分回复提示",Math.ceil(seconds/60),tiliHuifu);
				}else{
					wm._fnt_ziranhuifu.text=Util.getLanguage("体力时间秒回复提示",int(time/1000),tiliHuifu);
				}
				
			}
		}
		
		private function onTick():void{
			setTiliHuifuShow();
		}
		
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_TiliBuyHandler){
				Util.flow("体力购买成功");
			}
		}
		
		private function showInfo():void
		{
			wm._fnt_cishu.text=userModel.getCouldBuyTiliCount()+"/"+(userModel.tiliBuyMax+vipModel.addCount_buyTili);
			wm._fnt_num_cash.text=userModel.buyTiliCost().toString();
			wm._fnt_num_tili.text=userModel.buyTiliAddNum.toString();
		}
		
		private function onGoumai(evt:Event):void{
			var re:JudgeResult=userModel.couldBuyTili();
			if(re.success){
				C2SEmitter.buyTili();
				
				wm.close();
				
			}else{
				if(re.code==JudgeResult.CD_CashNotEnough){
					CommonControlFun.cashNotEnoughDo();
				}else if(re.code==JudgeResult.CD_HasOverLimit){
					Util.flow(re.desc);
				}
			}
		}
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.message_SN.remove(onMessage);
			timerModel.secondTimer_SN.remove(onTick);
			super.destroy();
		}
	}
}