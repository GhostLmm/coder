package ui.battle
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.tool.MovieClipControl;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TimelineLite;
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import snake.GameManager;
	
	import ui.mc.JiangliMc;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_Shengli extends Mediator
	{
		[Inject]
		public var shengliWindow:ShengliWindow;
		[Inject]
		public var battleModel:BattleModel;
		private var resultData:BattleResultWindowData;
		
		private var timeLine:TimelineMax;
		private var shengliStars:Array;
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			initModule();
			registerEvent();
			setShow();
		}
		
		private function setShow():void
		{
			if(null!=resultData)
			{
//				shengliWindow._fnt_exp.text=resultData.reward_exp.toString();
//				shengliWindow._fnt_money.text =resultData.reward_money.toString();
				var maxHealth:int=GameManager.manager.player.character_maxHealth;
				shengliWindow._scr_wupin.setData(resultData.packData.createItemDatas());
				shengliWindow._fnt_passtimel_num.text=Util.getLanguage("时间秒",resultData.killTime);
				shengliWindow._fnt_remaind_hp_num.text=int(resultData.life/maxHealth*100)+"%";
				
				if(resultData.type!=CoreSwitchEvent.BT_Copy){
					shengliWindow._fnt_time.text=Util.getLanguage("战斗胜利使用时间desc");
				}
				
				startMovie();
				return;
			}
			shengliWindow._mc_baoxiang.gotoAndStop(0);	
		}
		private var moveArray:Array;
		private function startMovie():void{
			timeLine=new TimelineMax();
			var label:String="label";
			var enterLabel:String="enter";
			var time:Number=0;
			timeLine.addLabel(label);
			timeLine.addLabel(enterLabel,"+="+shengliWindow._mc_bg.totalFrames/30);
			timeLine.addCallback(MovieClipControl.controlMovieClip,label+"+="+time,[shengliWindow._mc_bg,onBgCom,30,1]);
			time+=0.7;
			var index:int=0;
			shengliStars=[];
			var star:ShengliStar;
			if(resultData.oldStarNum>3) resultData.oldStarNum=3;
			if(resultData.newStarNum>3) resultData.newStarNum=3;
			for(; index<3; index++){
				if(index<resultData.oldStarNum){
					star=new ShengliStar(shengliWindow._mc_stars[index],shengliWindow,1);
				}else if(index<resultData.newStarNum){
					star=new ShengliStar(shengliWindow._mc_stars[index],shengliWindow,2);
				}else{
					star=new ShengliStar(shengliWindow._mc_stars[index],shengliWindow,0);
				}
				
				timeLine.addCallback(star.show,label+"+="+time);
				time+=star.showTime;
				shengliStars.push(star);
			}
			
			
			moveArray=[];
			moveArray.push(shengliWindow._mc_time,shengliWindow._mc_blood,shengliWindow._mc_shengli_jiangli,shengliWindow._btn_ok);
			time=0;
			index=0;
			for(; index<moveArray.length; index++){
				var tweenMC:TweenShengliMC=new TweenShengliMC();
				tweenMC.init(moveArray[index],0);
				timeLine.add(tweenMC.tween(),enterLabel+"+="+time);
				time+=0.2;
			}
			
			
//			MovieClipControl.controlMovieClip(shengliWindow._mc_bg,onBgCom,30,1);
		}
		
		private function tweenMove(mc:Sprite,dir:int):*{
			var nowX:Number=mc.x;
			if(dir==0){
				mc.x = -GlobalRef.width/2-mc.width;
			}else{
				mc.x= GlobalRef.width/2;
			}
			return TweenLite.to(mc,0.75,{x:nowX});
		}
		
		
		private function onBgCom($mc:MovieClip):void{
			
		}
		
		
		private function initModule():void
		{
			shengliWindow._scr_wupin.initClass(JiangliMc);
			resultData=shengliWindow._params as BattleResultWindowData;
		}
		private function registerEvent():void
		{
			addViewListener(shengliWindow._btn_ok,TQTTouchEvent.TOUCH_TAP,onCloseClicked);
		}
		private function onCloseClicked(evt:Event):void
		{				
			shengliWindow.close();
			
			// waning 胜利后 如果有升级的话 
			if(!Util.showLevelUpWindow(endBattle)){
				endBattle();
			}
			
		}
		
		private function endBattle():void{
			CommonControlFun.endBattle();
			GameSwitchSceneController.getInstance().proccessAfterBattle();
		}
		
		public override function destroy():void
		{
			// todo
			if(moveArray){
				for each(var $mc:Sprite in moveArray){
					TweenLite.killTweensOf($mc);
				}
				moveArray=[];
			}
			if(timeLine){
				timeLine.kill();
				timeLine.stop();
				timeLine=null;
			}
			if(shengliStars){
				for each(var star:ShengliStar in shengliStars){
					star.destory();
				}
				shengliStars=null;
			}
			super.destroy();
		}
	}
}
import com.greensock.TweenLite;
import com.greensock.easing.Back;
import com.greensock.easing.Elastic;

import flash.display.Sprite;

class TweenShengliMC{
	public var mc:Sprite;
	private var targetX:Number;
	
	public function init($mc:Sprite,dir:int):void{
		mc=$mc;
		targetX=mc.x;
		if(dir==0){
			mc.x=-GlobalRef.width/2-mc.width;
		}else{
			mc.y=GlobalRef.width/2;
		}
	}
	
	public function tween():*{
		return TweenLite.to(mc,0.5,{x:targetX,ease:Back.easeOut});
	}
}