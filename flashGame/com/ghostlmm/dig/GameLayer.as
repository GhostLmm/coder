package com.ghostlmm.dig
{
	import com.fish.GameSwitchSceneController;
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.roguedevelopment.pulse.PulseEngine;
	import com.roguedevelopment.pulse.emitter.IParticleEmitter;
	import com.roguedevelopment.pulse.simple.SimpleParticles;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import core.LayerController;
	import core.PlayerGuideManager;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import ui.dig.WakuangShengjiWindow;
	import ui.dig.ZidongChushouWindow;
	import ui.layer.TwoPostionMC;
	import ui.layer.UIBrPart;
	import ui.layer.UserInfoBar;
	import ui.layer.WindowLayer;
	import ui.widget.Button;
	
	import util.Util;
	
	public class GameLayer
	{
		public function GameLayer()
		{
			_listenerProxy=new ListenerAddProxy();
			super();
		}
		
		public var layer:Sprite;
		
		public var staticgroudLayer:Sprite;
		public var backgroundLayer:Sprite;
		public var roleLayer:Sprite;
		public var bossLayer:Sprite;
		
		public var mapEffectLayer:Sprite;
		
//		public var windowLayer:Sprite;
		public var uiLayer:Sprite;
		
		public var guideLayer:Sprite;
		
		public var effectLayer:Sprite;
		
		public var userInfoBar:UserInfoBar;
		public var digInfo:WakuangInfo;
		
		public var mcHuijia:MovieClip;
		public var TM_Huijia:TwoPostionMC;
		
		private var mcShezhi:MovieClip;
		public var TM_Shezhi:TwoPostionMC;
		
		private var mcShengji:MovieClip;
		public var TM_Shengji:TwoPostionMC;
		
		public var rbUI:UIBrPart;
		
		protected var _listenerProxy:ListenerAddProxy;
		
		private static const BtnSpace:Number=113+20;
		
		public function init($root:Sprite):void{
			layer=new Sprite();
			$root.addChild(layer);
			staticgroudLayer=new Sprite();
			backgroundLayer=new Sprite();
			roleLayer=new Sprite();
			effectLayer=new Sprite();
//			windowLayer=new Sprite();
			uiLayer=new Sprite();
			layer.addChild(staticgroudLayer);
			layer.addChild(backgroundLayer);
			layer.addChild(roleLayer);
			mapEffectLayer=new Sprite();
			layer.addChild(mapEffectLayer);
			
			$root.addChild(uiLayer);
			
			
//			$root.addChild(windowLayer);
			LayerController.instance.windowLayer=new WindowLayer();
			$root.addChild(LayerController.instance.windowLayer);
			
			guideLayer=new Sprite();
			$root.addChild(guideLayer);
			guideLayer.mouseEnabled=false;
			$root.addChild(effectLayer);
			LayerController.instance.floatLayer=effectLayer;
			
			rbUI=new UIBrPart();
			uiLayer.addChild(rbUI.display);
			rbUI.jumpBtn.visible=false;
			rbUI.init();
			rbUI.btn_gonghui.visible=false;
//			WindowManager.
		}
		
		
		public function hideUi():void{
			uiLayer.visible=false;
		}
		public function showUI():void{
			
			uiLayer.visible=true;
		}
		
		public function destory():void{
			
			
			if(_listenerProxy){
				_listenerProxy.clear();
				_listenerProxy=null;
			}
			if(mcHuijia) {Util.killDiaplayButtonEffect(mcHuijia); mcHuijia=null;}
			if(mcShezhi) {Util.killDiaplayButtonEffect(mcShezhi); mcShezhi=null;}
			if(mcShengji) {Util.killDiaplayButtonEffect(mcShengji); mcShengji=null;}
			
			if(userInfoBar){
				userInfoBar.destory();userInfoBar=null;
			}
			if(layer) {layer.removeChildren(); layer=null;}
			if(uiLayer) {uiLayer.removeChildren(); uiLayer=null;}
			if(roleLayer) {roleLayer.removeChildren(); roleLayer=null;}
//			if(windowLayer) {windowLayer.removeChildren(); windowLayer=null;}
			if(effectLayer) {effectLayer.removeChildren(); effectLayer=null;}
//			if(uiLayer) {uiLayer.removeChildren(); uiLayer=null;}
			if(TM_Huijia) {TM_Huijia.destory();TM_Huijia=null;}
			if(TM_Shezhi) {TM_Shezhi.destory(); TM_Shezhi=null;}
			if(TM_Shengji) {TM_Shengji.destory(); TM_Shengji=null;}
			
			if(rbUI) {rbUI.destory(); rbUI=null;}
			
			if(LayerController.instance.windowLayer){
				LayerController.instance.windowLayer.destory();
				if(LayerController.instance.windowLayer.parent){
					LayerController.instance.windowLayer.parent.removeChild(LayerController.instance.windowLayer);
				}
				LayerController.instance.windowLayer=null;
			}
			if(guideLayer) {guideLayer.removeChildren(); guideLayer=null;}
		}
		
		
		public function initUI():void{
			userInfoBar=new UserInfoBar();
			uiLayer.addChild(userInfoBar.display);
			userInfoBar.init();
		
			digInfo=new WakuangInfo();
			digInfo.init();
			uiLayer.addChild(digInfo.display);
			
			mcHuijia=new BtnHuijia;
			Util.setDiaplayButtonEffect(mcHuijia);
			var siwtch_1:Point=new Point();
			siwtch_1.x=-mcHuijia.width;
			siwtch_1.y=GlobalRef.height-mcHuijia.height;
			var siwtch_2:Point=new Point();
			
			siwtch_2.x=0;
			siwtch_2.y=GlobalRef.height-mcHuijia.height;
			
			TM_Huijia=new TwoPostionMC();
			TM_Huijia.init(mcHuijia,siwtch_1,siwtch_2);
			
			
			mcShezhi=new BtnWakuangShezhi();
			
			Util.setDiaplayButtonEffect(mcShezhi);
			var siwtch_1:Point=new Point();
			siwtch_1.x=GlobalRef.width;
			siwtch_1.y=GlobalRef.height-mcShezhi.height;
			var siwtch_2:Point=new Point();
			
			siwtch_2.x=GlobalRef.width-mcShezhi.width;
			siwtch_2.y=GlobalRef.height-mcShezhi.height;
			
			TM_Shezhi=new TwoPostionMC();
			TM_Shezhi.init(mcShezhi,siwtch_1,siwtch_2);
			
			uiLayer.addChild(mcHuijia);
			uiLayer.addChild(mcShezhi);
			
			mcShengji=new BtnDigLv();
			Util.setDiaplayButtonEffect(mcShengji);
			var siwtch_1:Point=new Point();
			siwtch_1.x=GlobalRef.width;
			siwtch_1.y=0;
			var siwtch_2:Point=new Point();
			
			siwtch_2.x=GlobalRef.width-mcShengji.width;
			siwtch_2.y=0;
			
			TM_Shengji=new TwoPostionMC();
			TM_Shengji.init(mcShengji,siwtch_1,siwtch_2);
			uiLayer.addChild(mcShengji);
			
			
			addViewListener(mcHuijia,TQTTouchEvent.TOUCH_TAP,onClickHuijia);
			addViewListener(mcShezhi,TQTTouchEvent.TOUCH_TAP,onClickShezhi);
			addViewListener(mcShengji,TQTTouchEvent.TOUCH_TAP,onClickShengji);
		}
		
		private function onClickHuijia(evt:Event):void{
//			DigGameControl.instance.destory();
//			GameSwitchSceneController.getInstance().enterFlash();
			if(!Util.guideIsCompelete()){
				PlayerGuideManager.getInstance().createFadeButtonClick("backHome");
			}
			
			GameSwitchSceneController.getInstance().goFlashFromMining();
		}
		
		private function onClickShezhi(evt:Event):void{
			WindowManager.openOnlyWinodw(ZidongChushouWindow);
		}
		private function onClickShengji(evt:Event):void{
			WindowManager.openOnlyWinodw(WakuangShengjiWindow);
		}

		
		public function debug():void{
			layer.stage.addEventListener(MouseEvent.MOUSE_MOVE,drawAiRect);
			effectLayer=new Sprite();
			layer.addChild(effectLayer);
		}
		
		private function drawAiRect(evt:MouseEvent):void{
			var p:Point=new Point(layer.mouseX,layer.mouseY);
			
			
			if(Math.ceil(layer.mouseX)==115){
				trace();
			}
			
			var tileP:Object=DigGameControl.instance.calcLayerPositionToTile(p.x,p.y);
			trace("鼠标位置：\t"+p.toString()+"\t网格位置："+"("+tileP.x+","+tileP.y+")");
			var left:Array=DigGameControl.instance.mapData.getLineTilesByDir(tileP.x,tileP.y,DigGameControl.ST_Left);
			var right:Array=DigGameControl.instance.mapData.getLineTilesByDir(tileP.x,tileP.y,DigGameControl.ST_Right);
			trace("[left]\t"+left);
			trace("[right]\t"+right);
			effectLayer.graphics.clear();
			drawEffectRect(left,0xff0000);
			drawEffectRect(right,0x00ff00);
			
		}
		
		private function onMove(evt:MouseEvent):void{
			var p:Point=new Point(layer.mouseX,layer.mouseY);
			
			
			if(Math.ceil(layer.mouseX)==115){
				trace();
			}
			
			var tileP:Object=DigGameControl.instance.calcLayerPositionToTile(p.x,p.y);
			trace("鼠标位置：\t"+p.toString()+"\t网格位置："+"("+tileP.x+","+tileP.y+")");
			var mid:Array=DigGameControl.instance.getNearTiles(tileP.x,tileP.y,DigGameControl.ST_Mid);
			var left:Array=DigGameControl.instance.getNearTiles(tileP.x,tileP.y,DigGameControl.ST_Left);
			var right:Array=DigGameControl.instance.getNearTiles(tileP.x,tileP.y,DigGameControl.ST_Right);
			var down:Array=DigGameControl.instance.getNearTiles(tileP.x,tileP.y,DigGameControl.ST_Down);
			
			trace("[mid]\t"+mid);
			trace("[left]\t"+left);
			trace("[right]\t"+right);
			trace("[down]\t"+down);
			
			effectLayer.graphics.clear();
			drawEffectRect(mid,0x555555);
			drawEffectRect(left,0xff0000);
			drawEffectRect(right,0x00ff00);
			drawEffectRect(down,0x0000ff);
			
			
		}
		
		private function drawEffectRect(tiles:Array,color:uint):void{
			for each(var tile:GameTile in tiles){
				var layerP:Object=DigGameControl.instance.calcTileToLayerPosition(tile.tileX,tile.tileY);
				effectLayer.graphics.beginFill(color);
				effectLayer.graphics.drawRect(layerP.x-GameConstConfig.Tile_Width/2,layerP.y-GameConstConfig.Tile_Height/2,
					GameConstConfig.Tile_Width,GameConstConfig.Tile_Height);
				effectLayer.graphics.endFill();
			}
			
		}
		
		protected function addViewListener(target:Object,type:String,listener:Function,useCapture:Boolean=false,priority:int=0,useWeek:Boolean=false):void
		{
			_listenerProxy.addListener(target,type,listener,useCapture,priority,useCapture);
		}
		
		
	}
}