package ui.liaotian
{	
	import com.fish.modules.core.models.ChatModel;
	import com.fish.modules.core.models.ItemModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.module.LabelSwitch;

	public class MDI_Liaotian extends Mediator
	{	
		[Inject]
		public var window:LiaotianWindow;
		
		private var labelSwitch:LabelSwitch;
		
		private var itemModel:ItemModel;
		private var chatModel:ChatModel;
		
		public function MDI_Liaotian()
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
			chatModel=Context.getInjectInstance(ChatModel);
			itemModel=Context.getInjectInstance(ItemModel);
			labelSwitch=new LabelSwitch(window._pos_item,[window._btn_shijie,window._btn_banghui],[Panel_Shijie_LiaotianWindow,Panel_Gonghui_LiaotianWindow],[null,checkCouldBanghuiLiaotian]);
		}
		private function registerEvent():void
		{
			itemModel.modelUpdata_SN.add(updateItemNum);
//			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
		}
		private function onGonglveClick(evt:Event):void
		{
			window.close();
			CommonControlFun.showHelpWebpage();
		}
		private function updateItemNum():void
		{
			window._fnt_num.text="x"+itemModel.getItemNumById(chatModel.ChatCostItemId);
		}
		/*private function onCloseClicked(evt:Event):void
		{
			window.playCloseMovie();
		}*/
		private function setShow():void
		{
			if((null!=window._params)&&((window._params==Panel_Shijie_LiaotianWindow)||(window._params==Panel_Gonghui_LiaotianWindow)))
			{
				labelSwitch.changeShowPanel(window._params as Class);
			}
			else
			{
				labelSwitch.changeShowPanel(Panel_Shijie_LiaotianWindow);
			}
			updateItemNum();
		}
		public override function destroy():void
		{
			itemModel.modelUpdata_SN.remove(updateItemNum);
			itemModel=null;
			labelSwitch.destory();
			labelSwitch=null;
			super.destroy();
		}
		private function checkCouldBanghuiLiaotian():Boolean
		{
			if(Util.checkCouldBanghuiLiaotian())
			{
				return true;
			}
			Util.flow("帮会功能尚未开启");
			window._btn_banghui.isSelected=false;
			window._btn_shijie.isSelected=true;
			return false;
		}
	}
}