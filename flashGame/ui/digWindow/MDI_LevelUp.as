package ui.digWindow
{
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_level;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	public class MDI_LevelUp extends Mediator
	{
		[Inject]
		public var wm:LevelUpWindow;
		[Inject]
		public var userModel:UserModel;
		private var timeLine:TimelineLite;
		private var showArray:Array;
		
		public function MDI_LevelUp()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			addViewListener(wm._btn_queding,TqtEvent.BUTTON_CLICK,closeWindow);
			
			setShow();
		}
		
		private function closeWindow(evt:Event):void{
			if(wm._params && (wm._params is Function)){
				(wm._params as Function)();
			}
			if(wm) wm.close();
		}
		
		private function setShow():void{
			updateShow();
			showEnterMovie();
		}
		
		private function showEnterMovie():void{
			
		}
		
		private function clearTimeline():void
		{
			if(timeLine!=null && showArray){
				timeLine.clear();
				timeLine._kill();
				timeLine=null;
				for each(var display:DisplayObject in showArray){
					TweenLite.killTweensOf(display);
				}
			}
		}
		
		public function updateShow():void{
			userModel.resetUserLevelChange();
			userModel.resetUserLevelChange();
			var preLevel:int=userModel.userVo.userLevel>1?userModel.userVo.userLevel-1:userModel.userVo.userLevel;
			wm._fnt_lv.text=preLevel.toString();
			wm._fnt_lv_up.text=userModel.userVo.userLevel.toString();
			
			var preLevelNode:Node_level=XMLDataManager.getLevelById(preLevel);
			var levelNode:Node_level=XMLDataManager.getLevelById(userModel.userVo.userLevel);
		}
		
		
		
		public override function destroy():void
		{
			// todo
			clearTimeline();
			super.destroy();
		}
	}
}