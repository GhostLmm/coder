package ui.jinkuang
{
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	public class MDI_Jinkuangguize extends Mediator
	{
		[Inject]
		public var window:JinkuangguizeWindow;
		
		public function MDI_Jinkuangguize()
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
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			window._fnt_info.htmlText=Util.getLanguage("金矿规则");
			
		}
		public override function destroy():void
		{
			super.destroy();
		}
	}
}