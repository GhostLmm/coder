package ui.window
{
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Elastic;
	
	import core.PlayerGuideManager;
	import core.event.TQTTouchEvent;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import view.CommonControlFun;
	
	public class MDI_UserShengji extends Mediator
	{
		[Inject]
		public var window:ShengjiWindow;
		public var userModel:UserModel;
		
		private var timeLine:TimelineLite;
		
		public function MDI_UserShengji()
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
			userModel=Context.getInjectInstance(UserModel);
		}
		private function registerEvent():void
		{
			addViewListener(window,TQTTouchEvent.TOUCH_TAP,onCloseClicked);
		}
		private function onCloseClicked(evt:Event):void
		{
			CommonControlFun.showLevelUpGuide();
			PlayerGuideManager.getInstance().createFadeButtonClick("closeShengjiWindow");
			window.close();
		}
		private function setShow():void
		{
			updateShow()			
			showEnterMovie();
		}
		public function updateShow():void
		{
			userModel.resetUserLevelChange();
			var preLevel:int=userModel.userVo.userLevel>1?userModel.userVo.userLevel-1:userModel.userVo.userLevel;
			window._fnt_chika.text=UserModel.computeChikashu(preLevel,userModel.userVo.vipLevel).toString();
			window._fnt_chika_up.text=userModel.chikashu.toString();
			window._fnt_friend.text=XMLDataManager.getLevelById(preLevel).friend.toString();
			window._fnt_friend_up.text=userModel.currentLevelNode.friend.toString();
			window._fnt_lv.text=preLevel.toString();
			window._fnt_lv_up.text=userModel.userVo.userLevel.toString();
			
			window._fnt_tili.text=XMLDataManager.getConstById("lvup_tili").value.toString();
			window._fnt_yongqi.text=XMLDataManager.getConstById("lvup_yongqi").value.toString();
			
			if(userModel.userVo.userLevel<=XMLDataManager.getConstById("shilian_unlock_level").value){
				window._mc_item5.visible=false;
			}else{
				window._mc_item5.visible=true;
			}
			
		}
		private function showEnterMovie():void
		{
			timeLine=new TimelineLite({onComplete:clearTimeline});
			var tweens:Array=[];
			for(var index:int=1; index<=5; index++){
				var display:DisplayObject=window["_mc_item"+index];
				display.x=display.x+400;
				tweens.push(TweenLite.to(display,0.7,{x:display.x-400}));
			}
			timeLine.insertMultiple(tweens,0,"normal",0.2);
		}
		
		private function clearTimeline():void
		{
			if(timeLine!=null && window){
				timeLine.clear();
				timeLine._kill();
				timeLine=null;
				for(var index:int=1; index<=5; index++){
					var display:DisplayObject=window["_mc_item"+index];
					TweenLite.killTweensOf(display);
				}
			}
		}
				
		public override function destroy():void
		{
			userModel=null;
			clearTimeline();
			super.destroy();
		}
	}
}