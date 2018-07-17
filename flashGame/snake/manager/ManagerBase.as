package snake.manager
{
	
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import core.LayerController;
	import core.WindowManager;
	
	import snake.BattleAssetPreload;
	import snake.BattleLayer;
	import snake.GameCanvas;
	import snake.GameLevel;
	import snake.GameManager;
	import snake.GameObjective;
	import snake.GameRolerManager;
	import snake.GameSoundSFX;
	import snake.GameTileSet;
	import snake.gameEnemys.Enemy;
	import snake.gameEnemys.EnemyCreator;
	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticle_bgs.SimpleParticle_bg;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.gameobj.Player;
	import snake.guns.GunData;
	import snake.module.DamageUtil;
	import snake.module.HpBarUtil;
	import snake.ui.Game_Gui;
	
	import ui.layer.WindowLayer;

	public class ManagerBase
	{
		public var mapInfo:Object;
		public var level:GameLevel;
		public var tileSet:GameTileSet;
		public var canvas:GameCanvas;
		public var assetConfig:BattleAssetPreload;
		public var sound:GameSoundSFX;
		public var stage:Stage;
		public var objective:GameObjective;
		public var player:Player;
		
		public var enemyCreator:EnemyCreator;
		
		public var isUseTexture:Boolean;
		public var texture:BitmapData;
		public var mapbit:BitmapData;
		/** 是否 复杂加载地图素材  **/
		private var loadAssetComplex:Boolean;
		
		public var game_Gui:Game_Gui;
		
		public var type:String;
		
		public function ManagerBase($type:String)
		{
			type=$type;
			trace("生成manager:\t"+type);
		}
		
		
		public function loadTexture($texture:BitmapData,$mapInfo:Object,$container:Sprite,$loadAssetComplex:Boolean):void
		{
			isUseTexture=true;
			texture=$texture;
			mapInfo=$mapInfo;
			BattleLayer.initLayer($container);
			loadAssetComplex=$loadAssetComplex;
		}
		
		public function initEnemyCreator():void{
			enemyCreator=new EnemyCreator();
			enemyCreator.initMapInfo(mapInfo.pos_monster);
		}
		
		public function loadMapbit($mapbit:BitmapData,$mapInfo:Object,$container:Sprite,$loadAssetComplex:Boolean):void{
			isUseTexture=false;
			mapbit=$mapbit;
			mapInfo=$mapInfo;
			BattleLayer.initLayer($container);
			loadAssetComplex=$loadAssetComplex;
		}
		
		public function start():void{
			TopTip.showBattleWait();
			
			var time:int=getTimer();
			
			stage=GlobalRef.stage;
			level=GameLevel.createLevel(2);
			tileSet=GameTileSet.createTileSet(level.level_tileSet);
			level.loadTileSet(tileSet);
			sound=GameSoundSFX.getInstance();
			canvas=new GameCanvas();
			canvas.level=level;
			if(isUseTexture){
				canvas.texture=texture;
				canvas.setMode(GameCanvas.MD_Zhucheng);
			}else{
				canvas.setMode(GameCanvas.MD_Battle);
			}
			
			canvas.tileSet=tileSet;
			canvas.sound=sound;
			
			objective=new GameObjective();
			objective.initData();
			trace("1:\t"+(getTimer()-time));
			time=getTimer();
			
			//CharacterAnimManager.getInstance().initData();
			
			trace("人物信息:\t"+(getTimer()-time));
			time=getTimer();
			assetConfig=BattleAssetPreload.getInstance();
			
			
			
			assetConfig.levelColorFilter=tileSet.levelColorFilter;
			
			if(enemyCreator){
				assetConfig.setMonsterIds(enemyCreator.monsterIds);
				assetConfig.setGunIds(enemyCreator.monsterGunIds);
			}else{
				assetConfig.setMonsterIds([]);
				assetConfig.setGunIds([]);
			}
			
			if(loadAssetComplex){
				assetConfig.loadAssetForBattleComplete_SN.addOnce(onLoadAssetCom);
			}else{
				assetConfig.loadAssetForZhuchengComplete_SN.addOnce(onLoadAssetCom);
			}
			
//			TimerModel.instance.frame_SN.add(onloadFrame);
			stage.addEventListener(Event.ENTER_FRAME,onloadFrame);
		}
		protected function onloadFrame(evt:Event):void{
			if(loadAssetComplex){
				assetConfig.loadAssetForBattle();
			}else{
				assetConfig.loadAssetForZhucheng();
			}
		}
		protected function onLoadAssetCom():void{
			stage.removeEventListener(Event.ENTER_FRAME,onloadFrame);
			var time:int=getTimer();
			
			trace("assetConfig信息:\t"+(getTimer()-time));
			time=getTimer();
			
			canvas.assetConfig=assetConfig;
			
			Particle.assetConfig=assetConfig;
			Particle.tileSet=tileSet;
			Particle.level=level;
			Particle.canvas=canvas;
			Particle.sound=sound;
			Particle.objective=objective;
			
			SimpleParticle.assetConfig=assetConfig;
			SimpleParticle.tileSet=tileSet;
			SimpleParticle.level=level;
			SimpleParticle.canvas=canvas;
			SimpleParticle.sound=sound;
			SimpleParticle.objective=objective;
			
			Enemy.assetConfig=assetConfig;
			Enemy.tileSet=tileSet;
			Enemy.level=level;
			Enemy.canvas=canvas;
			Enemy.sound=sound;
			Enemy.objective=objective;
			//			Enemy.initLargeMovieAnimate();
			//			Enemy.initBeamMovieData();
			//			Enemy.initZombieMovieData();
			//			Enemy.initCharAnimData();
			Enemy.init();
			trace("Enemy信息:\t"+(getTimer()-time));
			time=getTimer();
			
			
			
			//			Enemy.initCharAssetByIds(enemyCreator.monsterIds);
			
			time=getTimer();
			
			SimpleParticle_bg.assetConfig=assetConfig;
			SimpleParticle_bg.tileSet=tileSet;
			SimpleParticle_bg.level=level;
			SimpleParticle_bg.canvas=canvas;
			SimpleParticle_bg.sound=sound;
			SimpleParticle_bg.objective=objective;
			
			GunData.assetConfig=assetConfig;
			GunData.tileSet=tileSet;
			GunData.level=level;
			GunData.canvas=canvas;
			GunData.sound=sound;
			GunData.objective=objective;
			GunData.init();
			//GunData.initData();
			trace("GunData信息:\t"+(getTimer()-time));
			time=getTimer();
			//GunData.initEnemyGunAsset(enemyCreator.monsterIds);
			
			sound.cannvas=canvas;
			
			
			canvas.createSceenMap();
			
			
			BattleLayer.mainLayer.addChild(canvas.bg);
			
//			stage.addEventListener(KeyboardEvent.KEY_UP,keyUp);
//			stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
			stage.addEventListener(Event.ENTER_FRAME,onFrame);
			
			proccessLoadAssetCom();
			
//			TopTip.hideBattleWait();
			
			HpBarUtil.canvas=canvas;
			
			
			onFrame(null);
		}
		
		/** 处理素材加载完毕后的操作  添加敌人、主角、播放剧情等  **/
		protected function proccessLoadAssetCom():void{
			TopTip.hideBattleWait();
		}
		
		private  function onFrame(evt:Event):void{
			if(!GlobalRef.activateState) return ;
			if(canvas){
				canvas.enterFrameFun();
			}
			if(canvas){
				GameManager.render_SN.dispatch(canvas.cameraX,canvas.cameraY);
			}
		}
		
//		public var render_SN:Signal=new Signal(Number,Number);
		/*public var keyMap:Dictionary=new Dictionary();
		public var debugFlag:Boolean=false;
		private  function keyDown(evt:KeyboardEvent):void{
			keyMap[evt.keyCode]=true;
			if(Keyboard.ENTER==evt.keyCode){
				debugFlag=!debugFlag;
			}
		}
		private  function keyUp(evt:KeyboardEvent):void{
			keyMap[evt.keyCode]=false;
		}*/
		
		/** 添加gui  **/
		protected function addGui(useUI:Boolean=false,_shootVisible:Boolean=true):void
		{
			if(null!=game_Gui)
			{
				game_Gui.destroy();
			}
			game_Gui=new Game_Gui(useUI);
			game_Gui.setCouldShoot(_shootVisible);
			BattleLayer.uiLayer.addChild(game_Gui);
		}
		
		public function endBattle(manager:ManagerBase):void{
			GameManager.manager=null;
			removeAll();
			trace("移除manager ");
			destory();
			
		}
		
		public function removeAll():void{
			GameRolerManager.instance.removeAll();
//			stage.removeEventListener(KeyboardEvent.KEY_UP,keyUp);
//			stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyDown);
			stage.removeEventListener(Event.ENTER_FRAME,onFrame);
			if(game_Gui){
				game_Gui.destroy();
				game_Gui=null;
			}
			if(player){
				player.destroy();
				player=null;
			}
			//			removeLeitaiMovie();
			Enemy.destory();
			Particle.destory();
			SimpleParticle.destory();
			SimpleParticle_bg.destory();
			if(canvas){
				canvas.destory();
				canvas=null;
			}
			BattleLayer.destory();
			DamageUtil.removeAll();
			stage.removeEventListener(Event.ENTER_FRAME,onloadFrame);
			assetConfig.loadAssetForZhuchengComplete_SN.remove(onLoadAssetCom);
			assetConfig.loadAssetForBattleComplete_SN.remove(onLoadAssetCom);
		}
		
		private var windowLayer:WindowLayer;
		protected function addWindowLayer():void{
			windowLayer=new WindowLayer();
			
			LayerController.instance.windowLayer=windowLayer;
			BattleLayer.windowLayer.addChild(LayerController.instance.windowLayer);
		}
		protected  function removeWindowLayer():void
		{
			WindowManager.closeAllWindow();
			if(windowLayer){
				windowLayer.destory();
				windowLayer=null;
			}
		}
		
		public function destory():void{
			if(enemyCreator)
			{
				enemyCreator.destory();
				enemyCreator=null;
			}
			if(stage) stage.removeEventListener(Event.ENTER_FRAME,onloadFrame);
			trace("destory mananger：\t"+type);
		}
	}
}