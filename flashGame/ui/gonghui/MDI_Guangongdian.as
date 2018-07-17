package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GonghuiVO;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_banghui_guangong_reward;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import util.Util;
	
	public class MDI_Guangongdian extends Mediator
	{
		[Inject]
		public var window:GuangongdianWindow;
		
		private var gonghuiModel:GonghuiModel;
		
		private var userModel:UserModel;
		
		public function MDI_Guangongdian()
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
			userModel=Context.getInjectInstance(UserModel);
		}
		private function registerEvent():void
		{
			userModel.modelUpdata_SN.add(onUserInfoChange);
			gonghuiModel.GonghuiInfo_SN.add(setBanghuiInfo);
			gonghuiModel.GonghuiSelf_SN.add(setBanghuiInfo);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_jiangliyulan,TqtEvent.BUTTON_CLICK,onJiangliyulanClicked);
			addViewListener(window._btn_canbai,TqtEvent.BUTTON_CLICK,onCanbaiClicked);
			addViewListener(window._btn_canbai,TqtEvent.BUTTON_CLICK_DISABLE,onCanbaiClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetBanghuiMiaoHandler)
			{
				if(_code==1)
				{
					updateShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_CanbaiBanghiuMiaoHandler)
			{
				if(_code==1)
				{
					WindowManager.openOnlyWinodw(GuangongRewardHuodeWindow);
					updateShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function onCanbaiClicked(evt:Event):void
		{
			var result:JudgeResult=GonghuiModel.judgeCouldCanbai();
			if(result.success)
			{
				C2SEmitter.canbaiGuangongmiao();
			}
			else
			{
				Util.flow(result.desc);
			}
		}
		private function onUserInfoChange():void
		{
			window._fnt_money.text=userModel.userVo.userMoney.toString();
			window._fnt_cash.text=userModel.userVo.userCash.toString();
		}
		private function onJiangliyulanClicked(evt:Event):void
		{
			WindowManager.openOnlyWinodw(GuangongRewardChakanWindow);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			C2SEmitter.getGuangongmiaoInfo();
		}
		private function updateShow():void
		{
			setBanghuiInfo();
			onUserInfoChange();
		}
		private function setBanghuiInfo():void
		{			
			var gonghuiVo:GonghuiVO=gonghuiModel.gonghuiVo;
			window._fnt_lv.text=Util.getLanguage("帮会等级显示",gonghuiVo.guanggongmiaoLevel);
			window._fnt_jianshedu.text=gonghuiVo.jiangshedu.toString();
			var datingNode:Node_banghui_jianzhulvup=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiModel.gonghuiVo.guanggongmiaoLevel);
			window._fnt_shengjiexp.text=datingNode.banghui_guangongmiao.toString();
			window._fnt_fenshu.text=Util.getLanguage("关公庙参拜次数显示",gonghuiModel.computeCurrentCanbaiLeft());
			var guangongReward:Node_banghui_guangong_reward=XMLDataManager.getBanghui_guangong_rewardById(gonghuiVo.guanggongmiaoLevel);
			window._fnt_costgongxian.text=guangongReward.cost_gongxian.toString();
			
			window._fnt_zongganxian.text=gonghuiModel.myBanghuiData.curGongxian.toString();
			window._fnt_canbai_time.text=XMLDataManager.getConstById("Canbai_time").desc;
			
			if(gonghuiModel.checkIfAreadyCanbai())
			{
				window._btn_canbai.isEnabled=false;
			}
			else
			{
				window._btn_canbai.isEnabled=true;
			}
		}
		public override function destroy():void
		{
			userModel.modelUpdata_SN.remove(onUserInfoChange);
			gonghuiModel.GonghuiInfo_SN.remove(setBanghuiInfo);
			gonghuiModel.GonghuiSelf_SN.remove(setBanghuiInfo);
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			userModel=null;
			gonghuiModel=null;
			super.destroy();
		}
	}
}