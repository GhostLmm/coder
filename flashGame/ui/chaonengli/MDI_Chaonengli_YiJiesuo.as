package ui.chaonengli
{
	import com.fish.modules.core.models.ChaonengliModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_chaonengli;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.ImageBitmap;
	
	import util.Util;
	
	public class MDI_Chaonengli_YiJiesuo extends Mediator
	{
		[Inject]
		public var window:Chaonengli_YiJiesuo_Window;
		
		private var m_node:Node_chaonengli;
		
		private var mc:Mc_ChaonengliItem;
		
		public function MDI_Chaonengli_YiJiesuo()
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
			m_node=window._params as Node_chaonengli;
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_queding,TqtEvent.BUTTON_CLICK,onQuedingClicked);
		}
		private function onQuedingClicked(evt:Event):void
		{
			window.close();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			if(null==m_node)
			{
				return;
			}
			window._fnt_nengli_name.text=m_node.name;
			window._fnt_add_nengli.text=ChaonengliModel.convertAddPropertyToString(m_node);
			mc=new Mc_ChaonengliItem();
			mc.setData(m_node);
			mc.setZhezhaoAndNameVisible(false,false);
			mc.mouseChildren=false;
			mc.mouseEnabled=false;
			window._pos_skill.fillWithObject(mc);
		}
		public override function destroy():void
		{
			if(mc){mc.destory();mc=null;};
			super.destroy();
		}
	}
}