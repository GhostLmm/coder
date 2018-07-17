package ui.window.mail
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.MailModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.module.LabelSwitch;
	
	public class MDI_Youjian extends Mediator
	{
		[Inject]
		public var window:YoujianWindow;
		
		private var labelSwitch:LabelSwitch;
		
		private var mailModel:MailModel;
		
		public function MDI_Youjian()
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
			mailModel=Context.getInjectInstance(MailModel);
			labelSwitch=new LabelSwitch(window._pos_item_youjian,[window._btn_tag1,window._btn_tag2,window._btn_tag3],[Panel_Basic_Mail,Panel_Jinkuang_Mail,Panel_Haoyou_Mail]);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			labelSwitch.switch_SN.add(setTipShow);
			mailModel.MailUpdate_SN.add(setTipShow);
			addViewListener(window._btn_yijianlingqu,TqtEvent.BUTTON_CLICK,onYijianlingquClicked);
		}
		private function onYijianlingquClicked(evt:Event):void
		{
			if(mailModel.mailList.length==0)
			{
				Util.flow("没有邮件可以领取");
				return;
			}
			var rewardsPackData:RewardsPackData=mailModel.getAllEmailRewards();
			var re:JudgeResult=RewardsPackData.couldLingqu(rewardsPackData);
			if(re.success){
				mailModel.cacheRewardsData=rewardsPackData;
				mailModel.hasRewards=mailModel.checkIfHasRewards();
				C2SEmitter.handleAllMail();
			}else{
				if(re.code==JudgeResult.CD_BagGridNotEnough){
					CommonControlFun.haldeEquipGridNotEnough();
				}else{
					Util.flow(re.desc);
				}
			}				
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetMailHandler)
			{
				if(_code==1)
				{
					updateShow();
				}
			}
			if(_msgType==C2SEmitter.REQ_MailHandleAllHandler)
			{
				if(_code==1)
				{
					showAllEmailResult();
				}
			}
		}
		private function showAllEmailResult():void
		{
			if(mailModel.hasRewards)
			{
				WindowManager.openOnlyWinodw(CommonRewardWindow,mailModel.cacheRewardsData);
			}
			else
			{
				Util.flow("成功查收所有邮件");
			}
		}
		private function updateShow():void
		{
			if((null!=window._params)&&((window._params==Panel_Basic_Mail)||(window._params==Panel_Jinkuang_Mail)||(window._params==Panel_Haoyou_Mail)))
			{
				labelSwitch.changeShowPanel(window._params as Class);
			}
			else
			{
				labelSwitch.changeShowPanel(Panel_Basic_Mail);
			}
			setTipShow();
		}
		private function setTipShow(param:*=null):void
		{
			if(mailModel.getBasicMailList().length>0)
			{
				window._mc_tishi1.visible=true;
			}
			else
			{
				window._mc_tishi1.visible=false;
			}
			
			if(mailModel.getJinkuangMailList().length>0)
			{
				window._mc_tishi2.visible=true;
			}
			else
			{
				window._mc_tishi2.visible=false;
			}
			
			if(mailModel.getHaoMailList().length>0)
			{
				window._mc_tishi3.visible=true;
			}
			else
			{
				window._mc_tishi3.visible=false;
			}
			
//			if(labelSwitch.m_currentPanel is Panel_Basic_Mail)
//			{
//				window._mc_tishi1.visible=false;
//			}
//			
//			if(labelSwitch.m_currentPanel is Panel_Jinkuang_Mail)
//			{
//				window._mc_tishi2.visible=false;
//			}
//			
//			if(labelSwitch.m_currentPanel is Panel_Haoyou_Mail)
//			{
//				window._mc_tishi3.visible=false;
//			}
			if(getCurrentShowMailNum()>0)
			{
				window._mc_youjian_tishi.visible=false;
			}
			else
			{
				window._mc_youjian_tishi.visible=true;
			}
		}
		private function getCurrentShowMailNum():int
		{
			var showNum:int=0;
			if(labelSwitch.m_currentPanel is Panel_Basic_Mail)
			{
				showNum=mailModel.getBasicMailList().length;
			}
			
			if(labelSwitch.m_currentPanel is Panel_Jinkuang_Mail)
			{
				showNum=mailModel.getJinkuangMailList().length;
			}
			
			if(labelSwitch.m_currentPanel is Panel_Haoyou_Mail)
			{
				showNum=mailModel.getHaoMailList().length;
			}
			return showNum;
		}
		private function setNoMailShow():void
		{
			
		}
		private function setShow():void
		{
			C2SEmitter.getMailList();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			labelSwitch.switch_SN.remove(setTipShow);
			if(labelSwitch){labelSwitch.destory();labelSwitch=null;};
			mailModel.MailUpdate_SN.remove(setTipShow);
			mailModel=null;
			super.destroy();
		}
	}
}