package com.ghostlmm.dig
{
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.WheelControl;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;
	


	public class DigGuide
	{
		public static const BuildingOffsetY:Number=120;
		private static const BoomSpan:Number=200;
		public var timerModel:TimerModel;
		public var guankaModel:GuankaModel;
		
		private var avatar:Avatar;
		private var mc_tiltle:McTitle;
		private var gameLayer:GameLayer;
		
		public var guideTip:DigGuideTip;
		
		public var guideCom_SN:Signal;
		
		public function DigGuide($avatar:Avatar)
		{
			guideCom_SN=new Signal();
			avatar=$avatar;
			initMoudle();
		}
		
		
		public function initMoudle():void{
			timerModel=Context.getInjectInstance(TimerModel);
			guankaModel=Context.getInjectInstance(GuankaModel);
			gameLayer=DigGameControl.instance.gameLayer;
			
			
			mc_tiltle=new McTitle();
			avatar.setState(Avatar.ST_Biulding);
			GameConstConfig.initOffset(mc_tiltle.width,mc_tiltle.height);
			gameLayer.roleLayer.addChild(avatar.display);
			gameLayer.staticgroudLayer.addChild(mc_tiltle);
			initAvatarPos();
			adjustView();
			
		}
		private function initAvatarPos():void{
			
			avatar.y=GameConstConfig.OffsetY-BuildingOffsetY;
			avatar.x=0;
		}
		
		public function startShow():void{
			step1();
		}
		private function readyToDig():void{
			
			step1();
		}
		/**
		 *   人往中间偏右
		 */
		private function step1():void{
			trace("开始第一步");
			
			var targetX:Number=mc_tiltle.width/2-BoomSpan;
			
			var time:Number=Math.abs(targetX-avatar.x)/(GameConstConfig.WorldRunSpeed*GameConstConfig.Tile_Height);
			var layerY:Number=-avatar.y+GameConstConfig.GameHeight*GameConstConfig.ViewCenterPercent;
			
			time=Math.max(0.5,time);
			time=Math.min(1,time);
			TweenLite.to(gameLayer.layer,time,{x:(GlobalRef.width-mc_tiltle.width)/2});
			
			TweenLite.to(avatar,time,{x:targetX,onComplete:step2,onUpdate:DigGameControl.instance.viewToLayer});
			if(targetX>avatar.x){
				avatar.turn(WheelControl.DIR_Right);
			}else{
				avatar.turn(WheelControl.DIR_Left);
			}
			
		}
		private function step2():void{
			avatar.turn(WheelControl.DIR_None);
			
			guideTip=new DigGuideTip();
			guideTip.btn_start.addEventListener(TqtEvent.BUTTON_CLICK,onClickOk);
			
			gameLayer.roleLayer.addChild(guideTip.display);
			guideTip.showEffect();
			guideTip.display.x=avatar.x;
			guideTip.display.y=avatar.y;
		}
		
		private function onClickOk(evt:Event):void{
			if(guideTip){guideTip.destory();guideTip=null;}
			step3();
		}
		
		// 往中间走
		private function step3():void{
			var targetX:Number=mc_tiltle.width/2;
			
			var time:Number=Math.abs(targetX-avatar.x)/(GameConstConfig.WorldRunSpeed*GameConstConfig.Tile_Height);
			var layerY:Number=-avatar.y+GameConstConfig.GameHeight*GameConstConfig.ViewCenterPercent;
//			TweenLite.to(gameLayer.layer,time,{y:layerY});
			
			TweenLite.to(avatar,time,{x:targetX,onComplete:step4,onUpdate:DigGameControl.instance.viewToLayer});
			if(targetX>avatar.x){
				avatar.turn(WheelControl.DIR_Right);
			}else{
				avatar.turn(WheelControl.DIR_Left);
			}
			if(targetX>avatar.x){
				avatar.turn(WheelControl.DIR_Right);
			}else{
				avatar.turn(WheelControl.DIR_Left);
			}
		}
		private function step4():void{
			guideCom_SN.dispatch();
		}
		
		public function adjustView(mid:Boolean=false):void{
			var lastX:Number=gameLayer.layer.x;
			if(mid){
				gameLayer.layer.x=GlobalRef.width/2-avatar.x;
				return ;
			}
			
			
			// avatar 不能越界
			if(avatar.x-avatar.width/2<0){
				avatar.x=avatar.width/2+0;
			}
			if(avatar.x+avatar.width/2>mc_tiltle.width-0){
				avatar.x=mc_tiltle.width-avatar.width/2-0;
			}
			
			
			gameLayer.layer.x=GlobalRef.width/2-avatar.x;
			
			
			if(gameLayer.layer.x>=0){
				gameLayer.layer.x=0;
			}
			if(gameLayer.layer.x<=GlobalRef.width-mc_tiltle.width){
				gameLayer.layer.x=GlobalRef.width-mc_tiltle.width;
			}
		}
		
		public function destory():void{
			if(guideCom_SN){
				guideCom_SN.removeAll();
				guideCom_SN=null;
			}
			if(guideTip){
				guideTip.btn_start.removeEventListener(TqtEvent.BUTTON_CLICK,onClickOk);
				guideTip.destory();
				guideTip=null;
			}
		}
	}
}