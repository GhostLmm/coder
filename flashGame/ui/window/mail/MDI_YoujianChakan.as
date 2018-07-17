package ui.window.mail
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.viewData.MailReceiverInfo;
	import view.viewData.MailViewData;
	
	public class MDI_YoujianChakan extends Mediator
	{
		[Inject]
		public var window:YoujianChakanWindow;
		
		public function MDI_YoujianChakan()
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
		private var viewData:MailViewData;
		private function initModule():void
		{
			viewData=window._params as MailViewData;
			window._scroll_jiangli.initClass(JiangliMc);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._Btn_liuyan_huifu,TqtEvent.BUTTON_CLICK,onHuifuClicked);
			addViewListener(window._Btn_queding,TqtEvent.BUTTON_CLICK,onQuedingClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_HandleMailHandler)
			{
				if(_code==1)
				{
					if(viewData.checkIfHasRewards())
					{
						var result:RewardsPackData=viewData.createRewardpackData();
						WindowManager.openOnlyWinodw(CommonRewardWindow,result);
					}
					window.close();
				}
			}
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function onHuifuClicked(evt:Event):void
		{
			if(!viewData.checkIfSenderIsUser())
			{
				Util.flow("不能回复系统邮件");
				return;
			}
			var param:MailReceiverInfo=new MailReceiverInfo();
			param.name=viewData.vo.sender;
			param.uid=viewData.vo.senderUid;
			WindowManager.openOnlyWinodw(HaoyouLiuyanWindow,param);
		}
		private function onQuedingClicked(evt:Event):void
		{
			var re:JudgeResult=viewData.couldLingqu();
			if(re.success){
				C2SEmitter.handleMail(viewData.id);
			}else{
				if(re.code==JudgeResult.CD_BagGridNotEnough){
					CommonControlFun.haldeEquipGridNotEnough();
				}else{
					Util.flow(re.desc);
				}
			}
		}
		private function setShow():void
		{
			if(null==viewData)
			{
				return;
			}
			window._fnt_to_player.htmlText=viewData.mailTitle;
			window._fnt_mail.htmlText=viewData.mailChakanShowDesc;
			if(viewData.checkIfSenderIsUser())
			{
				window._Btn_liuyan_huifu.visible=true;
				window._Btn_queding.visible=true;
			}
			else
			{
				window._Btn_liuyan_huifu.visible=false;
				window._Btn_queding.x=0;
				window._Btn_queding.visible=true;
			}
			setJiangliShow();
		}
		private function setJiangliShow():void
		{
			if(viewData.checkIfHasRewards())
			{
				var result:RewardsPackData=viewData.createRewardpackData();
				var items:Array=(result as RewardsPackData).createItemDatas();
				window._scroll_jiangli.setData(items);
				window._fnt_wu.visible=false;
			}
			else
			{
				window._fnt_wu.visible=true;
			}
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			viewData=null;
			super.destroy();
		}
	}
}