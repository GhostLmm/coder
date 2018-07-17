package ui.leitai
{
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	
	public class MDI_LeitaiReward extends Mediator
	{
		[Inject]
		public var leitaiWindow:LeitaiRewardWindow;
		public var leitaiModel:LeitaiModel;
		
		public function MDI_LeitaiReward()
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
			leitaiModel=Context.getInjectInstance(LeitaiModel);
			leitaiWindow._scrollController.initItemClass(Item_BaoxiangItem_LeitaiScene);
		}
		private function registerEvent():void
		{
			addViewListener(leitaiWindow._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			leitaiModel.leitaiVoArrayChange_SN.add(setLastRankShow);
		}
		private function onCloseClicked(evt:Event):void
		{
			leitaiWindow.close();
		}
		public function getCloseBtn():Button
		{
			return leitaiWindow._btn_close;
		}
		private function setShow():void
		{
			var xmlList:Array=XMLDataManager.Node_leitaiArray;
			leitaiWindow._scrollController.setData(xmlList);
			setLastRankShow();
		}
		private function setLastRankShow():void
		{
			leitaiWindow._fnt_paiming.text=leitaiModel._leitaiVo.lastRank.toString();
		}
		public override function destroy():void
		{
			leitaiModel.leitaiVoArrayChange_SN.remove(setLastRankShow);
			leitaiModel=null;
			super.destroy();
		}
	}
}