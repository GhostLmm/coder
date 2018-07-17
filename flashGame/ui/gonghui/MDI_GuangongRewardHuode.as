package ui.gonghui
{
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_banghui_guangong_reward;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	
	public class MDI_GuangongRewardHuode extends Mediator
	{
		[Inject]
		public var window:GuangongRewardHuodeWindow;
		
		public function MDI_GuangongRewardHuode()
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
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_sure,TqtEvent.BUTTON_CLICK,onSureClicked);
		}
		private function onSureClicked(evt:Event):void
		{
			window.close();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			var data:Node_banghui_guangong_reward=XMLDataManager.getBanghui_guangong_rewardById(gonghuiModel.gonghuiVo.guanggongmiaoLevel);
			if(null==data)
			{
				return;
			}
			window._fnt_tili.text=data.reward_tili.toString();
			window._pos_item1.fillWithObject(new JiangliMc().loadData({"key":"money","num":data.reward_tongqian}));
			window._pos_item2.fillWithObject(new JiangliMc().loadData({"key":"rongyu","num":data.reward_shengwang}));
		}
		public override function destroy():void
		{
			super.destroy();
		}
	}
}