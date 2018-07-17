package ui.map
{
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.tempData.FubenBoxData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.PlayerGuideManager;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.fuben.FubenChakanWindow;
	import ui.widget.FontField;
	
	import util.Util;

	public class MapItem
	{
		public function MapItem($mc:MovieClip,$guideMc:MovieClip=null)
		{
			mc=$mc;
			guideMc=$guideMc;
			_fnt_name=new FontField(mc.fnt_name);
			_mc_boss=mc.mc_final_flag;
		}
		public var mc:MovieClip;
		public var guideMc:MovieClip;
		public var data:FubenBoxData;
		private var _fnt_name:FontField;
		private var _mc_boss:MovieClip;
		public function initMapItemData($data:FubenBoxData):void{
			data=$data;
			if(guideMc){
				guideMc.gotoAndStop(1);
			}
			if(data.hasPass){
				mc.gotoAndStop(2);
				
			}else{
				if(data.isActive){
					mc.gotoAndStop(1);
				}else{
					mc.gotoAndStop(3);
					if(guideMc){
						guideMc.gotoAndStop(2);
					}
					
				}
			}
			
			_fnt_name.text=data.node.name;
			
			_mc_boss.visible=data.isLastFuben;
			
//			mc.gotoAndStop(data.status);
//			if(data.status==MapItemData.st_Pass){
//				mc.mc_star.gotoAndStop(data.star+1);
//			}
			
			if(data.hasPass){
				mc.mc_star.gotoAndStop(data.getStars()+1);
			}
			
			Util.setDiaplayButtonEffect(mc);
			mc.addEventListener(TQTTouchEvent.TOUCH_TAP,onTap);
		}
		
		public function setMapName(mapName:String):void{
			if(_fnt_name) {_fnt_name.text=mapName;}
			if(data) {data.fubenName=mapName;}
		}
		
		private function onTap(evt:Event):void{
			trace("点击地图item ："+data.node.id+"\t"+mc.name);
//			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
//			battleModel.startBattle(data.node.id);
			
			if(data.isActive){
				var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
				if(!guideModel.isComplete){
					PlayerGuideManager.getInstance().createFadeButtonClick(mc.name);
				}
				WindowManager.openOnlyWinodw(FubenChakanWindow,data);
				
			}else{
				Util.flow(Util.getLanguage("关卡box未激活提示"));
			}
			
		}
		
		public function destory():void{
			if(mc){
				Util.killDiaplayButtonEffect(mc);
				mc.removeEventListener(TQTTouchEvent.TOUCH_TAP,onTap);
				mc=null;
			}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			_mc_boss=null;
		}
	}
}