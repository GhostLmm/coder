package ui.paihangbang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.RankModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.paihangbang.Panel_Dengji_RankingWindow;
	import ui.paihangbang.Panel_Liansheng_RankingWindow;
	import ui.paihangbang.Panel_Tuhao_RankingWindow;
	import ui.paihangbang.Panel_Xiongba_RankingWindow;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.module.LabelSwitch;
	
	public class MDI_Ranking extends Mediator
	{
		[Inject]
		public var window:RankingWindow;
		
		private var rankModel:RankModel;
		
		private var labelSwitch:LabelSwitch;
		
		public function MDI_Ranking()
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
			rankModel=Context.getInjectInstance(RankModel);
			window._fnt_desc.text=Util.getLanguage("今日操作次数");
			labelSwitch=new LabelSwitch(window._pos_scene_paihangbang,[window._btn_xiongbabang,window._btn_lianshengbang,window._btn_dengjibang,window._btn_tuhaobang],[Panel_Xiongba_RankingWindow,Panel_Liansheng_RankingWindow,Panel_Dengji_RankingWindow,Panel_Tuhao_RankingWindow]);
		}
		private function registerEvent():void
		{
			rankModel.rankOpt_SN.add(onRankOptChange);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_code>0)
			{
				switch(_msgType)
				{
					case C2SEmitter.REQ_GetLevelHonorListHandler:
					case C2SEmitter.REQ_GetLeitaiHonorListHandler:
					case C2SEmitter.REQ_GetLianshengHonorListHandler:
					case C2SEmitter.REQ_GetPayHonorListHandler:
						onRankOptChange();
				}
			}
			if(_code>0)
			{
				switch(_msgType)
				{
					case C2SEmitter.REQ_ChongbaiLevelHonorHandler:
					case C2SEmitter.REQ_ChongbaiLianshengHonorHandler:
					case C2SEmitter.REQ_ChongbaiChongzhiHonorHandler:
					case C2SEmitter.REQ_ChongbaiLeitaiHonorHandler:
					case C2SEmitter.REQ_BishiChonzhiHonorHandler:
						var param:RewardsPackData=new RewardsPackData();
						param.bonus_money=RankModel.getRankOptRewardMoney();
						WindowManager.openOnlyWinodw(CommonRewardWindow,param);
						break;
				}
			}
		}
		private function onRankOptChange():void
		{
			window._prg_cishu.progress=rankModel.getRankOptCount();
			window._prg_cishu.devider=rankModel.getMaxRankOptCount();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			if((null!=window._params)&&((window._params==Panel_Xiongba_RankingWindow)||(window._params==Panel_Liansheng_RankingWindow)||(window._params==Panel_Dengji_RankingWindow)||(window._params==Panel_Tuhao_RankingWindow)))
			{
				labelSwitch.changeShowPanel(window._params as Class);
			}
			else
			{
				labelSwitch.changeShowPanel(Panel_Xiongba_RankingWindow);
			}
			onRankOptChange();
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			rankModel.rankOpt_SN.remove(onRankOptChange);
			rankModel.VoArrayChane.remove(onRankOptChange);
			rankModel=null;
			labelSwitch.destory();
			labelSwitch=null;
			super.destroy();
			Util.GC();
		}
	}
}