package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.commontools.CheckBanWords;
	
	public class MDI_BanghuiGonggao extends Mediator
	{
		[Inject]
		public var window:BanghuiGonggaoWindow;
		
		public function MDI_BanghuiGonggao()
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
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_quxiao,TqtEvent.BUTTON_CLICK,onQuxiaoClicked);
			addViewListener(window._btn_chongzhi,TqtEvent.BUTTON_CLICK,onChongzhiClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_ChangeBanghuiGonggaoHandler)
			{
				if(_code==1)
				{
					Util.flow("帮会公告修改成功");
					window.close();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function onQuxiaoClicked(evt:Event):void
		{
			window.close();
		}
		private function onChongzhiClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			if(!window._fnt_shuru_gonggao.isInputed())
			{
				Util.flow("请输入帮会公告");
				return;
			}
			if(CheckBanWords.isBad(window._fnt_shuru_gonggao.text))
			{
				Util.flow("包含敏感词汇，请重新输入");
				return;
			}
			C2SEmitter.changeBanghuiGonggao(gonghuiModel.myBanghuiData.bid,window._fnt_shuru_gonggao.text);
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
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destroy();
		}
	}
}