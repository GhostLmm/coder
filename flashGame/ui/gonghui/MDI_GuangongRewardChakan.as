package ui.gonghui
{
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	
	public class MDI_GuangongRewardChakan extends Mediator
	{
		[Inject]
		public var window:GuangongRewardChakanWindow;
		
		public function MDI_GuangongRewardChakan()
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
			window._scrollController.initItemClass(Item_GuangongRewardChakan);
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
			window._scrollController.setData(GonghuiModel.getGuangongRewardList());
		}
		public override function destroy():void
		{
			
			super.destroy();
		}
	}
}