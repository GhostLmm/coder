package ui.jinkuang
{
	import com.fish.modules.core.models.JinkuangModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_jinkuangrukou;
	
	import flash.events.Event;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	import core.event.TqtEvent;
	
	import ui.window.mail.Panel_Jinkuang_Mail;
	
	import util.Queue;
	
	import view.CommonControlFun;
	
	
	public class MDI_Jinkuang extends Mediator
	{
		[Inject]
		public var window:JinkuangWindow;
		private var jinkuangModel:JinkuangModel;
		private var itemsQueue:Queue;
		private var showItem:Item_Move_Jinkuang;
		
		public function MDI_Jinkuang()
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
		private var rukouData:Node_jinkuangrukou;
		private function initModule():void
		{
			jinkuangModel=Context.getInjectInstance(JinkuangModel);
			rukouData=window._params as Node_jinkuangrukou;
			jinkuangModel.cacheRukouData=rukouData;
			initQueue();
			window._scroller.initItems(itemsQueue);
		}
		private function initQueue():void
		{
			itemsQueue=new Queue();
			showItem=new Item_Move_Jinkuang();
			itemsQueue.push(showItem);
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_lingqu,TqtEvent.BUTTON_CLICK,onLingquClicked);
		}
		private function onLingquClicked(evt:Event):void
		{
			CommonControlFun.openMailWindow(Panel_Jinkuang_Mail);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private var timeOut:int;
		private function setShow():void
		{
			window._fnt_name.text=rukouData.name;
			showItem.loadData(rukouData);	
			moveToMiddle();
		}
		private function moveToMiddle():void
		{
			window._scroller.containerDirection-=(showItem.width-GlobalRef.width)/2;
		}
		private function destroyMc():void
		{
			itemsQueue=null;
			showItem.destory();
			showItem=null;
		}
		public override function destroy():void
		{
			clearTimeout(timeOut);
			jinkuangModel=null;
			rukouData=null;
			destroyMc();
			super.destroy();
		}
	}
}