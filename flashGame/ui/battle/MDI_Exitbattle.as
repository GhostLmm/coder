package ui.battle
{
	import com.fish.modules.core.models.BattleModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	public class MDI_Exitbattle extends Mediator
	{
		[Inject]
		public var window:ExitbattleWindow;
		
		public function MDI_Exitbattle()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_queding,TqtEvent.BUTTON_CLICK,onQuedingClicked);
			addViewListener(window._btn_quxiao,TqtEvent.BUTTON_CLICK,onQuxiaoClicked);
		}
		private function onQuedingClicked(evt:Event):void
		{
			window.close();
			BattleModel.userStopBattle();
		}
		private function onQuxiaoClicked(evt:Event):void
		{
			window.close();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			
		}
		public override function destroy():void
		{
			super.destroy();
		}
	}
}