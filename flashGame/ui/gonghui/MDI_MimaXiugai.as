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
	
	public class MDI_MimaXiugai extends Mediator
	{
		[Inject]
		public var window:MimaXiugaiWindow;
		
		public function MDI_MimaXiugai()
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
			addViewListener(window._btn_chongzhi,TqtEvent.BUTTON_CLICK,onChongzhiClicked);
			addViewListener(window._btn_quxiao,TqtEvent.BUTTON_CLICK,onQuxiaoClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_ChangeBanghuiPasswordHandler)
			{
				if(_code==1)
				{
					Util.flow("密码修改成功");
					window.close();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function onChongzhiClicked(evt:Event):void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			if(!gonghuiModel.checkIfIamHuizhang())
			{
				Util.flow("不具有权限");
				return;
			}
			if(!window._fnt_pswd_old.isInputed())
			{
				Util.flow("请输入原密码");
				return;
			}
			if(!window._fnt_pswd_new.isInputed())
			{
				Util.flow("请输入新密码");
				return;
			}
			if(!window._fnt_pswd_sure.isInputed())
			{
				Util.flow("请再次输入密码确认");
				return;
			}
			if(window._fnt_pswd_new.text!=window._fnt_pswd_sure.text)
			{
				Util.flow("两次输入密码不一致");
				return;
			}
			C2SEmitter.changeBanghuiPassWord(gonghuiModel.myBanghuiData.bid,window._fnt_pswd_old.text,window._fnt_pswd_new.text);
		}
		private function onQuxiaoClicked(evt:Event):void
		{
			window.close();
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