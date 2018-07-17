package ui.battle
{
	
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_Shibai extends Mediator
	{
		[Inject]
		public var shibaiWindow:ShibaiWindow;
		
		private var resultData:BattleResultWindowData;
		
		public function MDI_Shibai()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			initModule();
			registerEvent();
			setShow();
		}
		
		private function initModule():void
		{
			resultData=shibaiWindow._params as BattleResultWindowData;
		}
		private function onCloseClicked(evt:Event):void
		{
			if(evt.target!=shibaiWindow._btn_bianqiang)
			{
				shibaiWindow.close();
				CommonControlFun.endBattle();
//				Util.showLevelUpWindow();
			}
			GameSwitchSceneController.getInstance().proccessAfterBattle();
			
		}
		private function setShow():void
		{
			if(!Util.guideIsCompelete()){
				shibaiWindow._btn_bianqiang.visible=false;
			}
			if(null!=resultData)
			{
//				shibaiWindow._fn.text=resultData.reward_exp.toString();
//				shibaiWindow._fnt_money.text =resultData.reward_money.toString();
				if(resultData.type==CoreSwitchEvent.BT_Leitai){
					shibaiWindow._mc_leitaihuode.visible=true;
					shibaiWindow._fnt_desc_kexi.visible=false;
					shibaiWindow._fnt_money.text=resultData.packData.bonus_money.toString();
					shibaiWindow._fnt_rongyu.text=resultData.packData.bouns_rongyu.toString();
				}else{
					shibaiWindow._mc_leitaihuode.visible=false;
					shibaiWindow._fnt_desc_kexi.visible=true;
				}
				return;
			}
			
			shibaiWindow._mc_shibaitishi.visible = false;
		}
		private function registerEvent():void
		{
			addViewListener(shibaiWindow._btn_ok,TQTTouchEvent.TOUCH_TAP,onCloseClicked);
			addViewListener(shibaiWindow._btn_bianqiang,TqtEvent.BUTTON_CLICK,onBianqiangClicked);
		}
		private function onBianqiangClicked(evt:Event):void
		{
			shibaiWindow.close();
			CommonControlFun.endBattle();
//			GameSwitchSceneController.getInstance().proccessAfterBattle();
			GameSwitchSceneController.getInstance().enterFlash();
			WindowManager.openOnlyWinodw(BianqiangWindow);
		}
		
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}