package ui.shop
{
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.ItemMc;
	
	import util.Util;
	
	public class MDI_Rongyuchakan extends Mediator
	{
		[Inject]
		public var window:RongyuchakanWindow;
		
		public static const MaxNum:int=3;
		
		public function MDI_Rongyuchakan()
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
			window._scrollController.initClass(Item_RongyuchakanWindow);
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
			window._fnt_desc.text="";
			window._fnt_name.text=Util.getLanguage("rongyu");
			window._pos_image.fillWithBitmapByClassName("image_rongyu");
			setGetWayShow();
		}
		private function setGetWayShow():void
		{
			var dataList:Array=[];
			var index:int;
			for(index=1;index<=MaxNum;index++)
			{
				dataList.push(index);
			}
			window._scrollController.setData(dataList);
		}
		public override function destroy():void
		{
			
			super.destroy();
		}
	}
}