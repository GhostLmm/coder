package ui.chaonengli
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChaonengliModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_chaonengli;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	import ui.widget.ImageBitmap;
	
	import util.Util;
	
	public class MDI_Chaonengli_WeiJiesuo extends Mediator
	{
		[Inject]
		public var window:Chaonengli_WeiJiesuo_Window;
		
		private var m_node:Node_chaonengli;
		
		private var mc:Mc_ChaonengliItem;
		
		public function MDI_Chaonengli_WeiJiesuo()
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
			if(_msgType==C2SEmitter.REQ_ChaonengFireHandler)
			{
				if(_code==1)
				{
					Util.flow("解锁超能力成功");
					window.close();
				}
			}
		}
		private function onJiesuoClicked(evt:Event):void
		{
			var chaonengliModel:ChaonengliModel=Context.getInjectInstance(ChaonengliModel);
			var re:JudgeResult=chaonengliModel.couldJieSuo(m_node);
			if(re.success)
			{
				C2SEmitter.chaonengliJieSuo(m_node.id);
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
			window._fnt_nengli_name.text=m_node.name;
			if(m_node.lv_limit>0)
			{
				window._fnt_need_lv.visible=true;
			}
			else
			{
				window._fnt_need_lv.visible=false;
			}
			window._fnt_need_lv.text=Util.getLanguage("超能力解锁等级限制",m_node.lv_limit);
			window._fnt_add_nengli.text=ChaonengliModel.convertAddPropertyToString(m_node);
			window._fnt_needmoney_num.text=m_node.cost_money.toString();
			window._fnt_needstar_num.text=m_node.cost_star.toString();
			window._pos_xingxing_item.fillWithObject(new ImageBitmap("image_star"));
			window._pos_jinbi_item.fillWithObject(new ImageBitmap("image_money"));
			mc=new Mc_ChaonengliItem();
			mc.setData(m_node);
			mc.setZhezhaoAndNameVisible(false,false);
			mc.mouseChildren=false;
			mc.mouseEnabled=false;
			window._pos_skill.fillWithObject(mc);
			
			window._scroller.setData(ChaonengliModel.convertToCostToItemArray(m_node));
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			m_node=null;
			if(mc){mc.destory();mc=null;};
			super.destroy();
		}
	}
}