package ui.layer
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreEvent;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.dig.Avatar;
	import com.ghostlmm.dig.DigGameControl;
	import com.ghostlmm.dig.GameConstConfig;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.tool.WheelControl;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;
	
	import core.LayerController;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import snake.BattleEnterance;
	
	import ui.digWindow.JiubaWindow;
	import ui.digWindow.LeitaiWindow;
	import ui.digWindow.bag.BagWindow;
	
	import util.Util;
	
	public class MDI_World extends Mediator
	{
		public static const BuildingOffsetY:Number=126;
		[Inject]
		public var worldLayer:WorldLayer;
		[Inject]
		public var timerModel:TimerModel;
		[Inject]
		public var guankaModel:GuankaModel;
		[Inject]
		public var userModel:UserModel;
		[Inject]
		public var battleModel:BattleModel;
		
		private var avatar:Avatar;
		private var zhucheng:Zhucheng;
		private var gameTime:Number=0;
		private static const ST_Building:int=4;
		private static const ST_Map:int=5;
		
		private var worldState:int=ST_Building;
		
		private static const BtnSpace:Number=113+20;
		
		/**  视觉离边界的距离 **/
		private static const ViewSpace:Number=80;
		
		
		private static const BoomSpan:Number=100;
		
		/** 自动启动挂机标志 **/
		private var monitorDigFlag:Boolean=false;
		
		public function MDI_World()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			//      BattleEnterance.enterBattleUserTextureAndJson("zhucheng");
			battleModel.startBattle(1);
			Context.getInsance().coreDispatcher.dispatchEvent(new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Copy}));
			
			return;
			
			// todo
			avatar=new Avatar();
			zhucheng=new Zhucheng();
			
			avatar.setState(Avatar.ST_Biulding);
			GameConstConfig.initOffset(zhucheng.width,zhucheng.height);
			
			zhucheng.init(worldLayer.buildingLayer,avatar);
			
			WheelControl.startControl(worldLayer.mapLayer);
			
			WindowManager.windowOp_SN.add(onWindowOp);
			
			initUI();
			
			worldLayer.roleLayer.addChild(avatar.display);
			
			zhucheng.clickBuilding_SN.add(goOpenBuilding);
			
			
			
			if(guankaModel.continueMapFlag){
				trace("继续map场景");
				worldState=ST_Map;
				avatar.setState(Avatar.ST_Diging);
				LayerController.instance.uiLayer.mouseChildren=true;
				LayerController.instance.uiLayer.btn_switch.gotoAndStop(1);
				LayerController.instance.uiLayer.TM_Switch.showToSecond(0);
				LayerController.instance.uiLayer.TM_Bag.showToSecond(0);
				LayerController.instance.uiLayer.TM_Guaji.showToSecond(0);
				LayerController.instance.uiLayer.showCengshu();
				worldLayer.x=(GlobalRef.width-zhucheng.width)/2;
				
				setWheelContorlEnable(false);
				timerModel.frame_SN.remove(onFrame);
				DigGameControl.instance.init(avatar,true);
				DigGameControl.instance.start(true);
				Music.play(Music.DIG_Fight);
			}else{
				worldState=ST_Building;
				startMonitorAutoDig();
				setWheelContorlEnable(true);
				
				timerModel.frame_SN.add(onFrame);
				DigGameControl.instance.init(avatar);
				DigGameControl.instance.viewToCenter(true);
				initAvatarPos();
				adjustView(true);
				Music.play(Music.DIG_Main);
			}
			
		}
		
		
		
		private function initAvatarPos():void{
			
			avatar.y=GameConstConfig.OffsetY-GameConstConfig.Tile_Height*1-BuildingOffsetY;
			avatar.x=zhucheng.width/2;
		}
		
		public function adjustView(mid:Boolean=false):void{
			var lastX:Number=worldLayer.x;
			if(mid){
				worldLayer.x=GlobalRef.width/2-avatar.x;
				zhucheng.moveOffset(worldLayer.x-lastX);
				return ;
			}
			
			
			// avatar 不能越界
			if(avatar.x-avatar.width/2<0){
				avatar.x=avatar.width/2+0;
			}
			if(avatar.x+avatar.width/2>zhucheng.width-0){
				avatar.x=zhucheng.width-avatar.width/2-0;
			}
			
			
			worldLayer.x=GlobalRef.width/2-avatar.x;
			
			
			if(worldLayer.x>=0){
				worldLayer.x=0;
			}
			if(worldLayer.x<=GlobalRef.width-zhucheng.width){
				worldLayer.x=GlobalRef.width-zhucheng.width;
			}
			zhucheng.moveOffset(worldLayer.x-lastX);
		}
		
		private function initUI():void{
			LayerController.instance.uiLayer.initTMMC();
			LayerController.instance.uiLayer.userInfoBar.updateShow();
			addViewListener(LayerController.instance.uiLayer.btn_switch,TQTTouchEvent.TOUCH_TAP,onClickButton);
			addViewListener(LayerController.instance.uiLayer.btn_bag,TQTTouchEvent.TOUCH_TAP,onClickBage);
			addViewListener(LayerController.instance.uiLayer.btn_guaji,TQTTouchEvent.TOUCH_TAP,onClickGuaji);
			LayerController.instance.uiLayer.btn_switch.gotoAndStop(2);
		}
		
		private function onClickGuaji(evt:Event):void{
			if(DigGameControl.instance.hasAI){
				DigGameControl.instance.stopAutoDig();
				LayerController.instance.uiLayer.TM_Info.showToFirst(1);
				LayerController.instance.uiLayer.btn_guaji.gotoAndStop(1);
			}else{
				DigGameControl.instance.startAutoDig();
				LayerController.instance.uiLayer.TM_Info.showToSecond(1);
				LayerController.instance.uiLayer.btn_guaji.gotoAndStop(2);
			}
			
		}
		
		private function onClickBage(evt:Event):void{
			WindowManager.openOnlyWinodw(BagWindow);
		}
		
		private function onClickButton(evt:Event):void{
			if(worldState==ST_Building){
				readyToDig();
			}else{
				gotoBuilding();
			}
		}
		private function onWindowOp():void{
			if(ST_Building==worldState){
				if(WindowManager.hasWindowOpen()){
					stopMonitorAutoDig();
				}else{
					startMonitorAutoDig();
				}
			}
		}
		private function showWaitDigTime(time:int):void
		{
			//      trace("显示等待挖矿时间："+int(time/1000)+"ms");
		}
		private function stopShowWaitDig():void{
			trace("停止显示等待时间");
		}
		private function startAutoDigForMonitor():void{
			trace("开始自动挖矿");
			stopMonitorAutoDig();
			monitorDigFlag=true;
			readyToDig();
			
		}
		
		/** 开始自动挖矿监视 **/
		private function startMonitorAutoDig():void{
			UserOperaterMonitor.startMonitor(XMLDataManager.getConstById("AutoDigMonitorTime").value,XMLDataManager.getConstById("AutoDigWaitTime").value);
			UserOperaterMonitor.waite_SN.add(showWaitDigTime);
			UserOperaterMonitor.reMonitor_SN.add(stopShowWaitDig);
			UserOperaterMonitor.activate_SN.add(startAutoDigForMonitor);
		}
		/** 关闭自动挖矿监视 **/
		private function stopMonitorAutoDig(isDestory:Boolean=false):void{
			if(!isDestory){
				stopShowWaitDig();
			}
			
			UserOperaterMonitor.stopMonitor();
			UserOperaterMonitor.waite_SN.remove(showWaitDigTime);
			UserOperaterMonitor.reMonitor_SN.remove(stopShowWaitDig);
			UserOperaterMonitor.activate_SN.remove(startAutoDigForMonitor);
		}
		
		/**
		 *   设置是否使用 方向控制
		 */
		private function setWheelContorlEnable(enable:Boolean):void{
			if(enable){
				WheelControl.changeDir_SN.add(onChangeDir);
				WheelControl.swipUp_SN.add(onSwipUp);
				WheelControl.startControl(LayerController.instance.worldLayer);
				LayerController.instance.worldLayer.mouseChildren=true;
			}else{
				WheelControl.changeDir_SN.remove(onChangeDir);
				WheelControl.swipUp_SN.remove(onSwipUp);
				WheelControl.stopControl();
				LayerController.instance.worldLayer.mouseChildren=false;
			}
		}
		
		/**
		 *   向上手势
		 */
		private function onSwipUp():void{
			//      var pos:Position=zhucheng.checkEnterBuilding();
			//      if(pos){
			//        goOpenBuilding(pos);
			//      }
		}
		private function goOpenBuilding(pos:MovieClip,type:String):void{
			setWheelContorlEnable(false);
			timerModel.frame_SN.remove(onFrame);
			var targetX:Number=pos.x+pos.width/2;
			var time:Number=Math.abs(targetX-avatar.x)/(GameConstConfig.WorldRunSpeed*GameConstConfig.Tile_Height);
			
			if(targetX>avatar.x){
				avatar.turn(WheelControl.DIR_Right);
			}else{
				avatar.turn(WheelControl.DIR_Left);
			}
			TweenLite.to(avatar,time,{x:targetX,onComplete:openBuilding,onCompleteParams:[type],onUpdate:focusRole});
		}
		
		private function focusRole():void{
			adjustView();
			DigGameControl.instance.viewToLayer();
		}
		
		private function openBuilding(type:String):void{
			setWheelContorlEnable(true);
			timerModel.frame_SN.add(onFrame);
			trace("打开建筑");
			//      WindowManager.openOnlyWinodw(LeitaiWindow);
			if(type=="WindowJiuba"){
				WindowManager.openOnlyWinodw(JiubaWindow);
			}else{
				WindowManager.openOnlyWinodw(LeitaiWindow);
			}
		}
		
		private function gotoBuilding():void{
			guankaModel.flush();
			DigGameControl.instance.pause();
			LayerController.instance.uiLayer.hideCengshu();
			setWheelContorlEnable(true);
			g_step1();
			
			guankaModel.getNewLayerMap();
			guankaModel.layerDataReady_SN.addOnce(onDataReady);
			
			var p:Point=Util.getRelativePostion(avatar.display,LayerController.instance.guochangLayer,new Point());
			
			//      LayerController.instance.guochangLayer.showHuojianGuochang(reset,g_step2,p.x,p.y);
			checkCount=0;
			LayerController.instance.guochangLayer.showHuojianGuochang1(checkReady,g_step2,p.x,p.y);
			avatar.display.visible=false;
			
		}
		private var checkCount:int=0;
		private function checkReady():void{
			checkCount++;
			if(checkCount>=2){
				checkCount=0;
				reset();
				LayerController.instance.guochangLayer.showHuojianGuochang2();
			}
		}
		
		private function onDataReady(guanka:int):void{
			checkReady();
		}
		
		
		private function reset():void{
			monitorDigFlag=false;
			guankaModel.reset();
			worldLayer.y=0;
			DigGameControl.instance.reset();
			zhucheng.reset();
			DigGameControl.instance.viewToCenter(true);
			
			initAvatarPos();
			adjustView(true);
			avatar.setState(Avatar.ST_Biulding);
			avatar.display.visible=true;
		}
		
		private function g_step1():void{
			LayerController.instance.uiLayer.mouseChildren=false;
			
			LayerController.instance.uiLayer.btn_switch.gotoAndStop(2);
			LayerController.instance.uiLayer.TM_Bag.showToFirst(0.5);
			LayerController.instance.uiLayer.TM_Switch.showToFirst(0.5);
			LayerController.instance.uiLayer.TM_Guaji.showToFirst(0.5);
			LayerController.instance.uiLayer.TM_Info.showToFirst(0.5);
			
			
		}
		private function g_step2():void{
			//      mc_button.mouseEnabled=true;
			
			LayerController.instance.uiLayer.mouseChildren=true;
			timerModel.frame_SN.add(onFrame);
			WheelControl.startControl(worldLayer.mapLayer);
			worldState=ST_Building;
			startMonitorAutoDig();
			Music.play(Music.DIG_Main);
		}
		
		private function readyToDig():void{
			setWheelContorlEnable(false);
			timerModel.frame_SN.remove(onFrame);
			
			step1();
			moveMC();
			Music.play(Music.DIG_Fight);
		}
		private function moveMC():void{
			//      mc_button.mouseEnabled=false;
			LayerController.instance.uiLayer.mouseChildren=false;
			LayerController.instance.uiLayer.btn_switch.gotoAndStop(1);
			LayerController.instance.uiLayer.TM_Switch.showToSecond(1);
			LayerController.instance.uiLayer.TM_Bag.showToSecond(1);
		}
		/**
		 *   人往中间偏右
		 */
		private function step1():void{
			trace("开始第一步");
			
			var targetX:Number=zhucheng.width/2+BoomSpan;
			
			var time:Number=Math.abs(targetX-avatar.x)/(GameConstConfig.WorldRunSpeed*GameConstConfig.Tile_Height);
			var layerY:Number=-avatar.y+GameConstConfig.GameHeight*GameConstConfig.ViewCenterPercent;
			
			time=Math.max(0.5,time);
			time=Math.min(1,time);
			TweenLite.to(worldLayer,time,{x:(GlobalRef.width-zhucheng.width)/2});
			
			TweenLite.to(avatar,time,{x:targetX,onComplete:step2,onUpdate:DigGameControl.instance.viewToLayer});
			if(targetX>avatar.x){
				avatar.turn(WheelControl.DIR_Right);
			}else{
				avatar.turn(WheelControl.DIR_Left);
			}
			
		}
		/**
		 *   看炸弹表演
		 */
		private function step2():void{
			avatar.turn(WheelControl.DIR_Left);
			zhucheng.boomCom_SN.add(step3);
			zhucheng.showBoom();
		}
		private function step3():void{
			
			var targetX:Number=zhucheng.width/2;
			
			var time:Number=1;
			var layerY:Number=-avatar.y+GameConstConfig.GameHeight*GameConstConfig.ViewCenterPercent;
			
			TweenLite.to(worldLayer,time,{y:layerY,x:(GlobalRef.width-zhucheng.width)/2});
			
			TweenLite.to(avatar,time,{x:targetX,onComplete:step4,onUpdate:DigGameControl.instance.viewToLayer});
			if(targetX>avatar.x){
				avatar.turn(WheelControl.DIR_Right);
			}else{
				avatar.turn(WheelControl.DIR_Left);
			}
			
		}
		
		private function step4():void{
			//跑个三二一 提示
			worldState=ST_Map;
			DigGameControl.instance.viewToCenter();
			startDig();
		}
		
		
		private function startDig():void{
			
			avatar.setState(Avatar.ST_Diging);
			LayerController.instance.uiLayer.mouseChildren=true;
			LayerController.instance.uiLayer.showCengshu();
			DigGameControl.instance.start();
			LayerController.instance.uiLayer.TM_Guaji.showToSecond(1);
			LayerController.instance.uiLayer.btn_guaji.gotoAndStop(1);
			
			if(monitorDigFlag){
				monitorDigFlag=false;
				DigGameControl.instance.startAutoDig();
				LayerController.instance.uiLayer.TM_Info.showToSecond(1);
				LayerController.instance.uiLayer.btn_guaji.gotoAndStop(2);
			}
		}
		
		private function onFrame(time:Number):void{
			if(WindowManager.hasWindowOpen()){
				return ;
			}
			if(WheelControl.direction==WheelControl.DIR_Left){
				avatar.toLeft(time,GameConstConfig.WorldRunSpeed);
			}
			if(WheelControl.direction==WheelControl.DIR_Right){
				avatar.toRight(time,GameConstConfig.WorldRunSpeed);
			}
			if(WheelControl.direction==WheelControl.DIR_None){
				avatar.stopRun();
			}
			adjustView();
			DigGameControl.instance.viewToLayer();
		}
		
		
		private function onChangeDir():void{
			trace("[方向]\t"+WheelControl.direction);
		}
		
		
		public function initBuilding():void{
			//      worldLayer.buildingLayer.addChild(
		}
		
		
		
		
		
		public override function destroy():void
		{
			WindowManager.windowOp_SN.remove(onWindowOp);
			TweenLite.killDelayedCallsTo(reset);
			TweenLite.killDelayedCallsTo(g_step2);
			timerModel.frame_SN.remove(onFrame);
			setWheelContorlEnable(false);
			if(avatar){
				TweenLite.killTweensOf(avatar);
				avatar.destory();
				avatar=null;
			}
			DigGameControl.instance.destory();
			stopMonitorAutoDig(true);
			super.destroy();
		}
	}
}
import com.ghostlmm.dig.Avatar;
import com.ghostlmm.tool.MovieClipControl;
import com.ghostlmm.tool.RepeatImage;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.Event;
import flash.geom.Point;

import core.event.TQTTouchEvent;

import org.osflash.signals.Signal;

import ui.widget.Position;

class Zhucheng
{
	private var _container:Sprite;
	private var _building:flash.display.MovieClip;
	
	public var width:Number;
	public var height:Number;
	private var _avatar:Avatar;
	
	
	private var _bilv:Number=0.1;
	
	private var _bg:RepeatImage;
	
	private var _mc_boom:MovieClip;
	private var _boom:MovieClip;
	
	public var boomCom_SN:Signal;
	public var clickBuilding_SN:Signal;
	
	private var buildings:Array;
	
	public function Zhucheng()
	{
		_building=new (AssetManager.getAssetClass("McTitle") as Class)();
		
		
		width=_building.width;
		
		height=_building.height;
		_mc_boom=_building.mc_boom;
		boomCom_SN=new Signal();
		clickBuilding_SN=new Signal(MovieClip,String);
		
		buildings=[];
		
		for(var index:int=1; index<=4; index++){
			var build:MovieClip=_building["mc_"+index];
			build.addEventListener(TQTTouchEvent.TOUCH_TAP,onClickBuilding);
			
			if(index==1 || index==3){
				build.type="WindowJiuba";
			}else{
				build.type="windowleitai";
			}
		}
		
	}
	
	public function checkEnterBuilding():Position{
		//    for each(var pos:Position in buildingPosArray){
		//      if(_avatar.x>=pos.rect.left && _avatar.x<=pos.rect.right){
		//        return pos;
		//      }
		//    }
		return null;
	}
	
	public function init($container:Sprite,$avatar:Avatar):void{
		_container=$container;
		
		_avatar=$avatar;
		_container.addChild(_building);
		
		_bg=new RepeatImage();
		_bg.x=width/2;
		_bg.init(GlobalRef.width,new (AssetManager.getAssetClass("image_bg") as Class)());
		
		_bg.updateViewPort(_bg.globalToLocal(new Point()).x);
		
		_building.pos_bg.removeChildren();
		_building.addChildAt(_bg,0);
		
		//    _container.addChild(_bg);
	}
	
	public function moveOffset(offsetX:Number):void{
		_bg.x+=offsetX*_bilv;
		_bg.updateViewPort(_bg.globalToLocal(new Point()).x);
	}
	
	public function showBoom():void{
		if(_boom==null){
			_boom=new (AssetManager.getAssetClass("McBoom") as Class)();
			
			_boom.x=width/2;
		}
		_boom.gotoAndStop(1);
		_container.addChild(_boom);
		MovieClipControl.controlMovieClip(_boom,removeBoom,24,1);
	}
	
	public function reset():void{
		_mc_boom.visible=true;
	}
	
	private function removeBoom(mc:MovieClip):void{
		_mc_boom.visible=false;
		if(_boom){
			if(_boom.parent){
				_boom.parent.removeChild(_boom);
				_boom.gotoAndStop(1);
			}
		}
		boomCom_SN.dispatch();
	}
	
	public function onClickBuilding(evt:Event):void{
		clickBuilding_SN.dispatch(evt.currentTarget,evt.currentTarget.type);
	}
	
	public function destory():void{
		if(buildings){
			for each(var build:MovieClip in buildings){
				build.removeEventListener(TQTTouchEvent.TOUCH_TAP,onClickBuilding);
			}
		}
		if(clickBuilding_SN){
			clickBuilding_SN.removeAll();
			clickBuilding_SN=null;
		}
		if(_bg){
			_bg.destory();
			_bg=null;
		}
		if(boomCom_SN){
			boomCom_SN.removeAll();boomCom_SN=null;
		}
		
	}
}

