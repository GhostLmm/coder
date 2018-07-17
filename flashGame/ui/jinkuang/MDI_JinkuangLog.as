package ui.jinkuang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.ExtrdataVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.JinkuangModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.window.CommonRewardWindow;
	
	
	public class MDI_JinkuangLog extends Mediator
	{
		[Inject]
		public var window:JinkuangLogWindow;
		private var jinkuangModel:JinkuangModel;
		public function MDI_JinkuangLog()
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
			window._scrollController.initItemClass(Item_JinkuangLog);
		}
		private function registerEvent():void
		{
			jinkuangModel.JinkuangLogChange_SN.add(onJinkuangLogChange);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GatherUserInfoKuangHandler)
			{
				if(_code==1)
				{
					var rewardMoney:int;
					var extraVo:ExtrdataVO=GameVOManager.getInstance().extrdata;
					rewardMoney=extraVo.xitongkuangMoney;
					if(rewardMoney>0)
					{
						var param:RewardsPackData=new RewardsPackData();
						param.bonus_money=rewardMoney;
						WindowManager.openOnlyWinodw(CommonRewardWindow,param);
					}
					onJinkuangLogChange();
				}
			}
		}
		private function onJinkuangLogChange():void
		{
			setLogShow();
		}
		private function setLogShow():void
		{
			var voList:Array=GameVOManager.getInstance().jinkuanglogs;
			voList.sortOn("id",Array.NUMERIC|Array.DESCENDING);
			window._scrollController.setData(voList);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			C2SEmitter.getJinkuangLog();
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			jinkuangModel.JinkuangLogChange_SN.remove(onJinkuangLogChange);
			jinkuangModel=null;
			super.destroy();
		}
	}
}