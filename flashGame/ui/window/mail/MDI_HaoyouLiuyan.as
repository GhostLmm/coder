package ui.window.mail
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.commontools.CheckBanWords;
	import view.viewData.MailReceiverInfo;
	
	public class MDI_HaoyouLiuyan extends Mediator
	{
		[Inject]
		public var window:HaoyouLiuyanWindow;
		
		public function MDI_HaoyouLiuyan()
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
		private var receiverData:MailReceiverInfo;
		private function initModule():void
		{
			receiverData=window._params as MailReceiverInfo;
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_quxiao,TqtEvent.BUTTON_CLICK,onQuxiaoClicked);
			addViewListener(window._btn_queding,TqtEvent.BUTTON_CLICK,onQuedingClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_SendMailHandler)
			{
				if(_code==1)
				{
					Util.flow("邮件发送成功");
					window.close();
				}
			}
		}
		private function onQuedingClicked(evt:Event):void
		{
			if(Util.checkIfShijieliaotianJinyan())
			{
				CommonControlFun.JinyanDo();
				return;
			}
			if((window._fnt_mail.isInputed()==false)||(window._fnt_mail.text==""))
			{
				Util.flow("您还没有输入邮件内容");
				return;
			}
			if(CheckBanWords.isBad(window._fnt_mail.text))
			{
				Util.flow("包含敏感词汇，请重新输入");
				return;
			}
			C2SEmitter.sendMail(window._fnt_mail.text,receiverData.name,receiverData.uid);
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
			window._fnt_to_player.htmlText=Util.getLanguage("给玩家留言",receiverData.name);
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destroy();
		}
	}
}