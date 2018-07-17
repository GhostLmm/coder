package com.ghostlmm.dig
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.FlyAnimate;
	import com.ghostlmm.tool.MovieClipControl;
	import com.ghostlmm.tool.WheelControl;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	import core.LayerController;
	import core.PlayerGuideManager;
	import core.WindowManager;
	
	import org.osflash.signals.Signal;
	
	import ui.mc.ItemMc;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class DigGameControl
	{
		public function DigGameControl()
		{
		}
		
		public static const instance:DigGameControl=new DigGameControl();
		
		
		
		public var gameLayer:GameLayer;
		public var gameRole:GameRole;
		public var mapData:MapData;
//		private var _boss:BossView;
		
		
		
		
		public var time_SN:Signal;
		private var stage:Stage;
		
		
		
		private var _controlState:int;
		
		public var dirChange_SN:Signal;
		public var update_SN:Signal;
		
		public static const ST_Left:int=1;
		public static const ST_Right:int=-1;
		public static const ST_Down:int=0;
		public static const ST_Mid:int=100;
		
		private var guankaModel:GuankaModel;
		private var userModel:UserModel;
		
		public var hasAI:Boolean=false;
		
		/**
		 *   已经显示
		 */
		private var boosHasDie:Boolean=false;
		
		/**
		 *    视角的状态
		 */
		private var viewState:int;
		/**
		 *    视角聚焦到 主角
		 */
		private static const VT_FocusRole:int=1;
		/**
		 *   boss层 锁定
		 */
		private static const VT_LockBoss:int=2;
		
		/**
		 *   向下速度
		 */	
		private static const VT_Speed:int=3;
		
		/** 暂停标志量 **/
		private var pauseFlag:Boolean=false;
		
//		public static const ST_
		
		private var enterScene:MiningEnterScene;
		
		public var digGuide:DigGuide;
		
		/**
		 *   技能锁定
		 */
		private var effectLock:Object={};
		public function lockEffect(type:int):void
		{
			effectLock[type]=true;
		}
		public function unLockEffect(type:int):void{
			effectLock[type]=false;
		}
		public function hasLockEffect(type:int):Boolean{
			return effectLock[type];
		}
		public function unlockAll():void{
			effectLock={};
		}
		
		public function set controlState(value:int):void{
			_controlState=value;
			dirChange_SN.dispatch(_controlState);
		}
		public function get controlState():int{
			return _controlState;
		}
		
		
		
		private function proccessEffect(tileData:TileData,tx:int,ty:int):void{
//			return ;
//			var maxDeep:int=guankaModel.curBossLayer-ty-1;
			var maxDeep:int=int.MAX_VALUE;
			if(tileData.id==TileData.TY_Boom){
				if(hasLockEffect(TileData.TY_Zhuantou) || hasLockEffect(TileData.TY_Boom) ){
					return ;
				}
				lockEffect(tileData.id);
				gameRole.onChangeDir(ST_Down);
				var left:int=tx-int((GameConstConfig.BoomWidth-1)/2);
				
				var boomDeep:int=GameConstConfig.BoomDeep;
				boomDeep=Math.min(boomDeep,maxDeep);
				
				for (var x:int=left; x<left+GameConstConfig.BoomWidth; x++){
					for (var y:int=ty; y<=ty+boomDeep; y++){
						
						
						var tile:GameTile=mapData.getTile(x,y);
						if(tile && tile.couldDrill()){
							tile.die();
							if(tile.couldEat()) tile.eat();
						}
					}
				}
				unLockEffect(tileData.id);
			}
			
			if(tileData.id==TileData.TY_Zhuantou){
				lockEffect(tileData.id);
				var drillDeep:int=GameConstConfig.DrillDeep;
				drillDeep=Math.min(drillDeep,maxDeep);
				gameRole.addDrillEffect(drillDeep);
			}
			

			if(tileData.type==ResourceConst.R_cash){
				onEatCash(tileData,tx,ty);
			}
			if(tileData.type==ResourceConst.R_money){
				onEatMoney(tileData,tx,ty);
			}
			if(tileData.type==ResourceConst.R_exp){
				onEatExp(tileData,tx,ty);
				
//				CommonControlFun.
				
			}
			if(tileData.type==ResourceConst.R_equip){
				onEatEquip(tileData,tx,ty);
			}
			
			if(tileData.type==ResourceConst.R_equip || tileData.type==ResourceConst.R_item){
				guankaModel.addEatItem(tileData,ty,tx-GameConstConfig.ExtrTileNum-GameConstConfig.ExtrWallNum);
			}
			
		}
		private function onEatEquip(tileData:TileData,tx:int,ty:int):void{
			var source:DisplayObject=new ItemMc().loadData(XMLDataManager.getEquipById(tileData.xid));
			source.width=GameConstConfig.Tile_Width;
			source.height=GameConstConfig.Tile_Height;
			var p:Object=calcTileToLayerPosition(tx,ty);
			source.x=p.x-source.width/2;
			source.y=p.y-source.height/2;
			gameLayer.backgroundLayer.addChild(source);
			FlyAnimate.fly(source,gameLayer.rbUI.btn_bg.view,onEatEquipCom);
		}
		
		private function onEatEquipCom():void{
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().onGetEquip();
			}
		}
		
		
		private function onEatExp(tileData:TileData,tx:int,ty:int):void{
			Music.playFX(Music.DIG_Exp);
			var source:DisplayObject=AssetManager.createDisplay(tileData.image);
			source.width=GameConstConfig.Tile_Width;
			source.height=GameConstConfig.Tile_Height;
			var p:Object=calcTileToLayerPosition(tx,ty);
			source.x=p.x-source.width/2;
			source.y=p.y-source.height/2;
			gameLayer.backgroundLayer.addChild(source);
			var exp:DisplayObject=gameLayer.userInfoBar._mc_exp;
			var targetP:Point=Util.getRelativePostion(exp,gameLayer.effectLayer,new Point(exp.width/2,0));
			FlyAnimate.flyToPos(source,targetP,addUserExp,[guankaModel.curExpPrice]);
		}
		
		private function addUserExp(price:int):void{
			userModel.addExp(price);
			Util.showLevelUpWindow();
		}
		
		private function onEatMoney(tileData:TileData,tx:int,ty:int):void{
			Music.playFX(Music.DIG_Money);
			var source:DisplayObject=AssetManager.createDisplay(tileData.image);
			source.width=GameConstConfig.Tile_Width;
			source.height=GameConstConfig.Tile_Height;
			var p:Object=calcTileToLayerPosition(tx,ty);
			source.x=p.x-source.width/2;
			source.y=p.y-source.height/2;
			gameLayer.backgroundLayer.addChild(source);
			
			FlyAnimate.fly(source,gameLayer.userInfoBar._mc_money,userModel.addMoney,[guankaModel.curMoneyPrice]);
		}
		
		private function onEatCash(tileData:TileData,tx:int,ty:int):void{
			
			var source:DisplayObject=AssetManager.createDisplay(tileData.image);
			source.width=GameConstConfig.Tile_Width;
			source.height=GameConstConfig.Tile_Height;
			var p:Object=calcTileToLayerPosition(tx,ty);
			source.x=p.x-source.width/2;
			source.y=p.y-source.height/2;
			gameLayer.backgroundLayer.addChild(source);
//			FlyAnimate.fly(source,LayerController.instance.uiLayer.userInfoBar._mc_cash,userModel.addCash,[tileData.effect]);
		}
		
		private var ai:GameAI;
		/**
		 *   开启自动挖掘
		 */
		public function startAutoDig():void{
			hasAI=true;
			WheelControl.changeDir_SN.remove(onTurn);
		}
		public function stopAutoDig():void{
			hasAI=false;
			WheelControl.changeDir_SN.add(onTurn);
			onTurn();
		}
		
		/**
		 *   数据准备好了，继续往下
		 */
		private function onDataReady(circle:int):void{
			viewState=VT_Speed;
			resume();
		}
		
		
		private function onDrillComplete():void{
			unLockEffect(TileData.TY_Zhuantou);
		}
		
		
		public function init($avatar:Avatar,$root:Sprite,$isContinue:Boolean=false):void{
			GameConstConfig.configFormConst();
			userModel=Context.getInjectInstance(UserModel);
			guankaModel=Context.getInjectInstance(GuankaModel);
			dirChange_SN=new Signal(int);
			update_SN=new Signal(Number);
			stage=GlobalRef.stage;
			gameLayer=new GameLayer();
			
			mapData=new MapData();
			gameRole=new GameRole();
			
			gameLayer.init($root);
			gameLayer.initUI();
			gameLayer.roleLayer.addChild($avatar.display);
			gameLayer.layer.x=(GlobalRef.width-GameConstConfig.BuildingWidth)/2;
//			gameLayer.layer.x=(GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum)*GameConstConfig.Tile_Width-GameConstConfig.OffsetX;
			
			gameRole.init($avatar);
			
			gameLayer.hideUi();
			
			
			
			gameRole.arriveLayer_SN.add(onArriveNewLayer);
			
			ai=new GameAI();
			ai.changDir_SN.add(onTurnAi);
			
			gameLayer.digInfo.setShow();
//			viewToCenter(true);
//			viewToRole();
//			update(0);
			
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().startGuide(gameLayer.guideLayer);
			}
			
			if(!guankaModel.needShowGuide){
				GameConstConfig.initOffset(GlobalRef.width*1.5,0);
				gameRole.avatar.setState(Avatar.ST_Diging);
				gameRole.avatar.x=GameConstConfig.BuildingWidth/2;
				gameRole.avatar.y=GlobalRef.height*GameConstConfig.ViewCenterPercent;
				
				gameLayer.layer.x=(GlobalRef.width-GameConstConfig.BuildingWidth)/2;
				
				mapData.init(proccessEffect);
				putInitTile();
//				viewToLayer();
//				gameRole.avatar.y=GameConstConfig.BuildingHeight;
//				trace(GameConstConfig.BuildingHeight);
			}
		}
		
		
		public function showEnterEffect():void{
			enterScene=new MiningEnterScene();
			gameLayer.effectLayer.addChild(enterScene.display);
			enterScene.effectCom_SN.add(onEffectCom);
			enterScene.startShow();
		}
		private function onEffectCom():void{
			Music.play(Music.MC_Wakuang);
			if(enterScene) {enterScene.destory();enterScene=null;}
			
			if(guankaModel.needShowGuide){
				showGuide();
			}else{
				startDirect();
				
			}
		}
		
		private function startDirect():void{
			
			gameRole.avatar.setState(Avatar.ST_Diging);
			gameRole.avatar.x=GameConstConfig.BuildingWidth/2;
			gameLayer.showUI();
			gameLayer.TM_Huijia.showToSecond(1);
			gameLayer.TM_Shezhi.showToSecond(1);
			gameLayer.TM_Shengji.showToSecond(1);
			gameLayer.digInfo.TM_Info.showToSecond(1);
			
			viewToCenter(true);
			start();
			startAutoDig();
		}
		
		
		private function onGuideCom():void{
			gameRole.avatar.setState(Avatar.ST_Diging);
			start();
			startAutoDig();
			gameLayer.showUI();
			gameLayer.TM_Huijia.showToSecond(1);
			gameLayer.TM_Shezhi.showToSecond(1);
			gameLayer.TM_Shengji.showToSecond(1);
			gameLayer.digInfo.TM_Info.showToSecond(1);
			if(digGuide){
				digGuide.destory();
				digGuide=null;
			}
		}
		
		private function showGuide():void{
			
			digGuide=new DigGuide(gameRole.avatar);
			digGuide.guideCom_SN.addOnce(onGuideCom);
			digGuide.startShow();
			
			mapData.init(proccessEffect);
			putInitTile();
			viewToCenter(true);
		}
		
		
		public function reset():void{
			pauseFlag=false;
			hasAI=false;
			boosHasDie=false;
			guankaModel.layerDataReady_SN.remove(onDataReady);
			unlockAll();
			guankaModel.reset();
			mapData.reset();
			gameRole.reset();
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			timerModel.frame_SN.remove(update);
			
			WheelControl.changeDir_SN.remove(onTurn);
			
			
			gameRole.drillComplete_SN.remove(onDrillComplete);
			
			putInitTile();
			
			
		}
		
		
		
		private var gameTime:Number=0;
		private var durTime:Number=0;
		
		
		private function onKey(evt:KeyboardEvent):void{
			if(evt.keyCode==Keyboard.ENTER){
				if(pauseFlag){
					resume();
				}else{
					pause();
				}
			}
		}
		
		public function start(isContinue:Boolean=false):void{
			
//			GlobalRef.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKey);
			
			
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			timerModel.frame_SN.add(update);
//			WheelControl.startControl(LayerController.instance.worldLayer.mapLayer);
//			WheelControl.changeDir_SN.add(onTurn);
			
			gameRole.drillComplete_SN.add(onDrillComplete);
			if(isContinue){
				viewState=VT_LockBoss;
			}else{
				viewState=VT_Speed;
			}
			
			viewToRole();
			gameRole.start();
			onTurn();
			
			if(isContinue){
				showBossFightResut(guankaModel.fightResult);
			}else{
				boosHasDie=false;
			}
		}
		
		/**
		 *   显示战斗结束剧情 
		 */
		private function showBossFightResut(fightResult:Boolean):void{
			trace("显示战斗结束剧情，目前直接隐藏boss");
			boosHasDie=true;
		}
		
		private function onTurn():void
		{
			
			if(WheelControl.direction==WheelControl.DIR_Left){
				controlState=ST_Left;
			}
			if(WheelControl.direction==WheelControl.DIR_Right){
				controlState=ST_Right;
			}
			if(WheelControl.direction==WheelControl.DIR_None){
				controlState=ST_Down;
			}
		}
		
		private function onTurnAi():void{
			controlState=ai.dir;
		}
		
		
		public function viewToLayer():void
		{
			var grid:Object=DigGameControl.instance.calcLayerPositionToTile(-gameLayer.layer.x,0);
			mapData.viewTOXY(Math.floor(grid.x)-1,mapData.VY);
		}
		
		public function viewToCenter(init:Boolean=false):void{
			var vx:int=GameConstConfig.ExtrWallNum-1;
			var vy:int=mapData.VY;
			if(init){
				vy=0;
				mapData.initView(vx,vy);
			}else{
				mapData.viewTOXY(vx,vy);
			}
		}
		
		/**
		 *   锁定 boss 的哪一行
		 */
		/*private function lockBossLine():void{
			var viewY:Number=calcViewToLine(gameLayer.layer.y);
			if(viewY+GameConstConfig.TileHeightNums>=guankaModel.curBossLayer+1){
				gameLayer.layer.y=calcLineToViewY(guankaModel.curBossLayer-GameConstConfig.TileHeightNums+1);
			}
		}*/
		
		/**
		 *  根据 gamelayer的位置，来设置 数据
		 */
		private function updateViewData():void
		{
			var lastVY:int=mapData.VY;
			
			var viewY:int=calcViewLine(gameLayer.layer.y);
			
			for(var y:int=lastVY; y<viewY; y++){
				
				var line:LineData=guankaModel.createLineTileData(y+mapData.viewHeight);
				mapData.putLineData(y+mapData.viewHeight,line);
			}
			
			mapData.viewTOXY(mapData.VX,viewY);
			
			// 添加 boss的 显示控制
			
			/*if(needShowBoss(viewY) && !boosHasDie){
				var boosPos:Object=calcTileToLayerPosition(GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum,
					guankaModel.curBossLayer-guankaModel.curGuankaData.bossHeight);
				_boss.showBoss(guankaModel.curGuankaData,gameLayer.bossLayer,boosPos.x,boosPos.y);
			}else{
				_boss.hideBoss();
			}*/
		}
		
		private function judeViewState():void
		{
			if(viewState==VT_FocusRole){
				var viewY:Number=calcViewToLine(gameLayer.layer.y);
//				if(viewY+GameConstConfig.TileHeightNums>=guankaModel.curBossLayer+1){
//					viewState=VT_LockBoss;
//					
//				}
			}
			if(viewState==VT_Speed){
				if(gameLayer.layer.y<=-gameRole.y+GameConstConfig.GameHeight*GameConstConfig.ViewCenterPercent){
					viewState=VT_FocusRole;
				}
			}
		}
		
		/**
		 *   当到达一个新的层数 
		 */
		private function onArriveNewLayer(layer:int):void{
//			if(layer==guankaModel.curBossLayer-guankaModel.curGuankaData.bossHeight-1){
//				Music.playFX(Music.Dig_ArriveBoss);
//			}
//			guankaModel.addEatItem(null,layer,0);
			guankaModel.arriveLayer(layer);
		}
		
		/**
		 *    
		 */
		private function viewToRole($durTime:Number=0):void{
			judeViewState();
			if(viewState==VT_FocusRole){
				var targetY:Number=-gameRole.y+GameConstConfig.GameHeight*GameConstConfig.ViewCenterPercent;
				if(gameLayer.layer.y>=targetY){
					gameLayer.layer.y=targetY;
				}
				
			}
			if(viewState==VT_LockBoss){
//				gameLayer.layer.y=calcLineToViewY(guankaModel.curBossLayer-GameConstConfig.TileHeightNums+1);
			}
			if(viewState==VT_Speed){
				gameLayer.layer.y-=$durTime*(GameConstConfig.DropSpeed*1.5)*GameConstConfig.Tile_Width/1000;
			}
			updateViewData();
			
		}
		
		/**
		 *   是否显示boss状态
		 */
		/*private function needShowBoss(ty:int):Boolean{
			if(ty<=2) return false;
			if(ty+GameConstConfig.TileHeightNums>=guankaModel.curBossLayer-guankaModel.curGuankaData.bossHeight
				&& ty<guankaModel.curBossLayer)
			{
				return true;
			}
			return false;
		}*/
		
		
		
		private function calcViewLine(vy:Number):int
		{
			var startp:Object=calcTileToLayerPosition(0,0);
			var starty:Number=-(startp.y-GameConstConfig.Tile_Height/2);
			return int((starty-vy)/GameConstConfig.Tile_Height);
		}
		private function calcViewToLine(vy:Number):int
		{
			var startp:Object=calcTileToLayerPosition(0,0);
			var starty:Number=-(startp.y-GameConstConfig.Tile_Height/2);
			return ((starty-vy)/GameConstConfig.Tile_Height);
		}
		private function calcLineToViewY(ty:Number):Number
		{
			var startp:Object=calcTileToLayerPosition(0,0);
			var starty:Number=-(startp.y-GameConstConfig.Tile_Height/2);
			return starty-GameConstConfig.Tile_Height*ty;
		}
		
		
		private function putInitTile():void{
			for(var line:int=0; line<mapData.viewHeight; line++){
				var lineData:LineData=guankaModel.createLineTileData(line);
				mapData.putLineData(line,lineData);
			}
		}
		
		
		
		private function onDeactivate(evt:Event):void{
			controlState=ST_Down;
		}
		public var break_SN:Signal=new Signal();
		private function onKeyDown(evt:KeyboardEvent):void{
			if(evt.keyCode==Keyboard.LEFT){
				controlState=ST_Left;
			}
			if(evt.keyCode==Keyboard.RIGHT){
				controlState=ST_Right;
			}
			if(evt.keyCode==Keyboard.UP){
				break_SN.dispatch();
			}
		}
		private function onKeyUp(evt:KeyboardEvent):void{
			if(evt.keyCode==Keyboard.LEFT){
				if(controlState==ST_Left){
					controlState=ST_Down;
				}
			}
			if(evt.keyCode==Keyboard.RIGHT){
				if(controlState==ST_Right){
					controlState=ST_Down;
				}
			}
		}
		private function onMouseDown(evt:MouseEvent):void{
			if(evt.stageX<=stage.stageWidth/2){
				controlState=ST_Left;
			}else{
				controlState=ST_Right;
			}
		}
		private function onMouseUp(evt:MouseEvent):void{
			controlState=ST_Down;
		}
		
		
		
		private function update($durTime:Number):void{
//			trace("viewState: "+viewState);
			if(WindowManager.hasWindowOpen()){
				return ;
			}
			
			if($durTime>500){
				$durTime=500;
			}
			
			
			var maxDur:Number=GameConstConfig.PreventPassArg/Math.max(GameConstConfig.RunSpeed,GameConstConfig.DropSpeed)*1000;
			while($durTime>maxDur){
				
				if(hasAI){
					ai.update();
				}
				
				/*if(couldCollideBoss()){
					challengeBoss();
					return ;
				}*/
				update_SN.dispatch(maxDur);
				if(pauseFlag){
					return ;
				}
				viewToRole(maxDur);
				
				$durTime-=maxDur;
			}
			
			if(hasAI){
				ai.update();
			}
			/*if(couldCollideBoss()){
				challengeBoss();
				return ;
			}*/
			update_SN.dispatch($durTime);
			if(pauseFlag){
				return ;
			}
			viewToRole($durTime);
			var roleLayer:int=gameRole.curTileY-guankaModel.curStartLayer+1;
			roleLayer=Math.max(roleLayer,0);
//			LayerController.instance.uiLayer.setCengshu(Language.Get(guankaModel.curGuankaData.node.name),roleLayer);
			// 调整自动挖矿按钮
			adjustAutoDigShow();
		}
		
		private function adjustAutoDigShow():void{
			if(hasAI){
			}else{
//				if(viewState==VT_LockBoss){
//					LayerController.instance.uiLayer.TM_Guaji.showToFirst(1);
//				}else{
//					LayerController.instance.uiLayer.TM_Guaji.showToSecond(1);
//				}
			}
			
		}
		
		/**
		 *   计算 一个 网格 到 舞台的坐标 {x:0,y:0}
		 */
		public function calcTileToLayerPosition(tileX:int,tileY:int):Object
		{
			var obj:Object={};
			obj.x=(tileX)*GameConstConfig.Tile_Width+GameConstConfig.OffsetX;
			obj.y=(tileY)*GameConstConfig.Tile_Height+GameConstConfig.OffsetY;
			return obj;
		}
		
		/**
		 *   计算一个点属于哪个网格的 {x:0.5,y:1}
		 */
		public function calcLayerPositionToTile(sx:Number,sy:Number):Object{
			var obj:Object={};
			obj.x=(sx-GameConstConfig.OffsetX)/GameConstConfig.Tile_Width;
			obj.y=(sy-GameConstConfig.OffsetY)/GameConstConfig.Tile_Height;
			return obj;
		}
		
		/** 获取周围tile数据**/
		public function getNearTiles(tx:Number,ty:Number,dir:int,nearWidth:int=0):Array{
			var re:Array=[];
			
			var midX:int=Math.round(tx);
			var midY:int=Math.round(ty);
			
			if(dir==ST_Mid){
				var tile:GameTile=mapData.getTile(midX,midY);
				if(nearWidth>0){
					for(var tempX:int=midX-int(GameConstConfig.DrillWidth/2);tempX<midX-int(GameConstConfig.DrillWidth/2)+GameConstConfig.DrillWidth;tempX++){
						tile=mapData.getTile(tempX,midY+1);
						if(tile){
							re.push(tile);
						}
					}
				}else{
					if(tile){
						re.push(tile);
					}
				}
			}
			
			
			if(dir==ST_Down){
				
				var tile:GameTile;
				if(ty-midY<=0.5 && ty-midY>=0){
					if(nearWidth>0){
						for(var tempX:int=midX-int(GameConstConfig.DrillWidth/2);tempX<midX-int(GameConstConfig.DrillWidth/2)+GameConstConfig.DrillWidth;tempX++){
							tile=mapData.getTile(tempX,midY+1);
							if(tile){
								re.push(tile);
							}
						}
					}else{
						tile=mapData.getTile(midX,midY+1);
						if(tile){
							re.push(tile);
						}
						// 向下可能会有两个 tile 被判别
						if(midX+1-(tx+0.5)<GameConstConfig.NearbyPercent){
							tile=mapData.getTile(midX+1,midY+1);
							if(tile) re.push(tile);
						}
						if((tx-0.5)-(midX-1)<GameConstConfig.NearbyPercent){
							tile=mapData.getTile(midX-1,midY+1);
							if(tile) re.push(tile);
						}
					}
				}
				
			}
			
			if(dir==ST_Left){
				var x:int=midX-1;
				var y:int=midY;
				
				if(midX-tx<=0.5 && midX-tx>=0){
					var tile:GameTile=mapData.getTile(x,y);
					if(tile){
						re.push(tile);
					}
				}
				
			}
			
			if(dir==ST_Right){
				var x:int=midX+1;
				var y:int=midY;
				if(tx-midX<=0.5 && tx-midX>=0){
					var tile:GameTile=mapData.getTile(x,y);
					if(tile){
						re.push(tile);
					}
				}
				
				
			}
			return re;
		}
		
		/** 暂停 **/
		public function pause():void{
			trace("暂停");
			pauseFlag=true;
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			timerModel.frame_SN.remove(update);
			WheelControl.changeDir_SN.remove(onTurn);
//			gameRole.stop();
		}
		/** 继续 **/
		public function resume():void{
			pauseFlag=false;
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			timerModel.frame_SN.add(update);
			WheelControl.changeDir_SN.add(onTurn);
		}
		
		public function destory():void{
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			timerModel.frame_SN.remove(update);
			WheelControl.changeDir_SN.remove(onTurn);
			if(guankaModel){
				guankaModel.layerDataReady_SN.remove(onDataReady);
				guankaModel=null;
			}
			
			
			
			if(update_SN){
				update_SN.removeAll();
				update_SN=null;
			}
			if(dirChange_SN){
				dirChange_SN.removeAll();
				dirChange_SN=null;
			}
			if(gameLayer){
				gameLayer.destory();
				gameLayer=null;
			}
			if(mapData){
				mapData.destory();
				mapData=null;
			}
			if(enterScene) {enterScene.destory();enterScene=null;}
//			if(_boss){
//				_boss.destory();
//				_boss=null;
//			}
			if(gameRole){
				gameRole.arriveLayer_SN.remove(onArriveNewLayer);
				gameRole.destory();
				gameRole=null;
			}
			if(stage){
				
				stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
				stage.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
				stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
				stage=null;
			}
			if(digGuide){
				digGuide.destory();
				digGuide=null;
			}
			WindowManager.closeAllWindow();
		}
		/**
		 *   显示drill 特效
		 */
		public function showDirllEffect(tx:Number,ty:Number):void{
			var mc:MovieClip=new (AssetManager.getAssetClass("AnimWakuangSuishi") as Class)();
			mc.x=tx;
			mc.y=ty;
			gameLayer.mapEffectLayer.addChild(mc);
			MovieClipControl.controlMovieClip(mc,null,24,1,true);
		}
		
		
	}
}
