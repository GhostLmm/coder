package ui.choujiang
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.RewardsData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.plugins.FramePlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	
	import util.Util;
	
	public class MDI_Choujiangfenjie extends Mediator
	{
		[Inject]
		public var window:ChoujiangfenjieWindow;
		
		private var equipNode:Node_equip;
		private var timelineLite:TimelineLite;
		
		public function MDI_Choujiangfenjie()
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
			equipNode=window._params["node"] as Node_equip;
			timelineLite=window._params["timeLine"] as TimelineLite;
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_queding,TqtEvent.BUTTON_CLICK,onQuedingClicked);
		}
		private function onQuedingClicked(evt:Event):void
		{
			timelineLite.play();
			window.close();
		}
		private function setShow():void
		{
			setDesc();
			setPos1Show();
			setPos2Show();
			showMovie();
		}
		private var DerTime:Number=1;
		private var timeline:TimelineLite;
		private function showMovie():void
		{
			window._pos_1.visible=false;
			window._pos_2.visible=false;
			window._btn_queding.visible=false;
			
			var totalFrame:int=window._mc_anmi.totalFrames;
			window._mc_anmi.gotoAndStop(1);
			TweenPlugin.activate([FramePlugin]);
			timeline=new TimelineLite();
			timeline.append(new TweenLite(window._mc_anmi,DerTime,{frame:totalFrame,onComplete:function():void
			{
				window._mc_anmi.stop();
				window._pos_1.visible=true;
				window._pos_2.visible=true;
				window._btn_queding.visible=true;
			}}));
		}
		private function setDesc():void
		{
			var fenjieName:String=equipNode.name;
			var fenjieArray:Array=JSON.parse(equipNode.fenjie) as Array;
			var id:int=fenjieArray[0];
			var num:int=fenjieArray[1];
			var targetName:String=XMLDataManager.getItemById(id).name;
			window._fnt_desc.htmlText=Util.getLanguage("枪支分解提示",fenjieName,targetName,num);
		}
		private function setPos1Show():void
		{
			var data:RewardsData=new RewardsData();
			data.key=ResourceConst.R_equip;
			data.xid=equipNode.id;
			data.num=1;
			var jiangliMc:JiangliMc=new JiangliMc();
			jiangliMc.loadData(data);
			window._pos_1.fillWithObject(jiangliMc);
		}
		private function setPos2Show():void
		{
			var fenjieArray:Array=JSON.parse(equipNode.fenjie) as Array;
			var id:int=fenjieArray[0];
			var num:int=fenjieArray[1];
			var data:RewardsData=new RewardsData();
			data.key=ResourceConst.R_item;
			data.xid=id;
			data.num=num;
			var jiangliMc:JiangliMc=new JiangliMc();
			jiangliMc.loadData(data);
			window._pos_2.fillWithObject(jiangliMc);
		}
		public override function destroy():void
		{
			if(timeline){timeline.clear();timeline=null;};
			equipNode=null;
			timelineLite=null;
			super.destroy();
		}
	}
}