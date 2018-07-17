package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.window.JinggaoWindow;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_BangJiesan extends Mediator
	{
		[Inject]
		public var window:BangJiesanWindow;
		
		private var gonghuiModel:GonghuiModel;
		
		public function MDI_BangJiesan()
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
			gonghuiModel=Context.getInjectInstance(GonghuiModel);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_quxiao,TqtEvent.BUTTON_CLICK,onQuxiaoClicked);
			addViewListener(window._btn_chongzhi,TqtEvent.BUTTON_CLICK,onQuedingClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_BanghuiJiesanHandler)
			{
				if(_code==1)
				{
					Util.flow("帮会解散成功");
					window.close();
					CommonControlFun.banghuiJiesanSucDo();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function onQuxiaoClicked(evt:Event):void
		{
			window.close();
		}
		private function onQuedingClicked(evt:Event):void
		{
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			if(!window._fnt_pswd_old.isInputed())
			{
				Util.flow("请输入帮会密码");
				return;
			}
			var alert:JinggaoWindow;
			alert = new JinggaoWindow({data:{msg:Util.getLanguage("确定要解散帮会嘛？")}});
			alert.addEventListener(TqtEvent.ALERT_OK,onConfirmJiesan,false,0,true);
			alert.open();
		}
		private function onConfirmJiesan(evt:Event):void
		{
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			GonghuiModel.jiesanBanghui(gonghuiModel.gonghuiVo.bid,window._fnt_pswd_old.text);
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