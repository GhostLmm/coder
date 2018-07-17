package ui.chaonengli
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChaonengliModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_chaonengli_main;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	import ui.widget.ImageBitmap;
	
	import util.Util;
	
	public class MDI_ChaonengliJinhua extends Mediator
	{
		[Inject]
		public var window:ChaonengliJinhuaWindow;
		
		private var m_node:Node_chaonengli_main;
		
		private var chaonengliModel:ChaonengliModel;
		
		public function MDI_ChaonengliJinhua()
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
			chaonengliModel=Context.getInjectInstance(ChaonengliModel);
			m_node=XMLDataManager.getChaonengli_mainById(chaonengliModel._chaonengliVo.currentType) as Node_chaonengli_main;
			window._scroller.initClass(JiangliMc);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_jiesuo,TqtEvent.BUTTON_CLICK,onJiesuoClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_ChaonengUpHandler)
			{
				if(_code==1)
				{
					Util.flow("进化超能力成功");
					window.close();
				}
			}
		}
		private function onJiesuoClicked(evt:Event):void
		{
			var re:JudgeResult=chaonengliModel.couldJinhua();
			if(re.success)
			{
				C2SEmitter.chaonengliJinhua();
			}
			else
			{
				Util.flow(re.desc);
			}
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
			window._fnt_needmoney_num.text=m_node.cost_money.toString();
			window._fnt_needstar_num.text=m_node.cost_star.toString();
			window._pos_xingxing_item.fillWithObject(new ImageBitmap("image_star"));
			window._pos_jinbi_item.fillWithObject(new ImageBitmap("image_money"));
			
			window._scroller.setData(ChaonengliModel.convertToCostToItemArray(m_node));
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			m_node=null;
			super.destroy();
		}
	}
}