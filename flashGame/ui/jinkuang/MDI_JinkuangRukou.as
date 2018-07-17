package ui.jinkuang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JinkuangModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import util.Util;
	
	
	public class MDI_JinkuangRukou extends Mediator
	{
		[Inject]
		public var window:JinkuangRukouWindow;
		public var jinkuangModel:JinkuangModel;
		
		public function MDI_JinkuangRukou()
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
			jinkuangModel=Context.getInjectInstance(JinkuangModel);
			window._scrollController.initItemClass(Item_JinkuangRukou);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_chakanguize,TqtEvent.BUTTON_CLICK,onChakanGuizeClicked);
		}
		private function onChakanGuizeClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(JinkuangguizeWindow);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetUserKuangHandler)
			{
				if(_code>0)
				{
					setRukouShow();
				}
			}
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			C2SEmitter.getUserKuangInfo();
		}
		private function setRukouShow():void
		{
			window._scrollController.setData(JinkuangModel.getJinkuangrukouList());
			if(jinkuangModel.jinkuangVo.lastLeitaiRank>0)
			{
				window._fnt_paiming.text = Util.getLanguage("排名",jinkuangModel.jinkuangVo.lastLeitaiRank);
			}
			else
			{
				window._fnt_paiming.text = Util.getLanguage("没有擂台排名");
			}
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			jinkuangModel=null;
			super.destroy();
		}
	}
}