package snake
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BlurFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.System;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	
	import snake.gameEnemys.CharAnimData;
	import snake.gameEnemys.CharSpriteAsset;
	import snake.gameEnemys.Enemy;
	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticle_bgs.SimpleParticle_bg;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.gameobj.Player;
	import snake.guns.GunAsset;
	import snake.guns.GunData;
	import snake.module.DamageUtil;

	public class GameCanvas
	{
		public function GameCanvas()
		{
		}
		
		
		public var sound:GameSoundSFX;
		public var level:GameLevel;
		public var tileSet:GameTileSet;
//		public var assetConfig:AssetConfig;
		public var assetConfig:BattleAssetPreload;
		
		public var k:Array;
		public var kD:Array;
		public var screenWidth:int;
		public var screenHeight:int;
		public var screenWidthTiles:int;
		public var screenHeightTiles:int;
		
		public var bm:BitmapData;
		public var bg:Bitmap;
		
		/** 背景格子，整个场景大小 **/
		private var level_bm:BitmapData;
		/** 具体格子类型  中间量**/
//		public var tileOn:int;
		
		/***   微缩地图**/
		public var userMap:BitmapData;
		
		public var node_bm:BitmapData;
		public var node_bm2:BitmapData;
		
		public var nextStart:Boolean=true;
		
		/*public var alphabet_bm_lg:BitmapData;
		public var alphabet_bm_sm:BitmapData;
		public var health_meter:BitmapData;
		public var health_meter_back:BitmapData;
		public var health_meter_top:BitmapData;
		public var ammo_meter:BitmapData;
		public var ammo_meter_back:BitmapData;
		public var ammo_meter_top:BitmapData;
		public var combo_meter:BitmapData;
		public var combo_meter_back:BitmapData;
		public var combo_meter_top:BitmapData;
		public var keyHeadsUp:BitmapData;
		public var hud_back:BitmapData;
		public var cursor:BitmapData;
		public var door_bm:BitmapData;
		public var door_keycard_bm:BitmapData;
		public var health_bm:BitmapData;
		public var time_bm:BitmapData;
		public var door_lock_bm:BitmapData;
		public var collectable_gunPiece_bm:BitmapData;
		public var disc_bm:BitmapData;
		public var briefcase_bm:BitmapData;
		public var collectStar_yellow_bm:BitmapData;
		public var collectStar_red_bm:BitmapData;
		public var collectStar_blue_bm:BitmapData;
		public var collectStar_white_bm:BitmapData;*/
		
		public var cameraShakeX:Number=0;
		public var cameraShakeY:Number=0;
		public var cameraShakeXOld:Number=0;
		public var cameraShakeYOld:Number=0;
		
		private var viewRectX:int;
		private var viewRectY:int;
		private var viewRectX1:int;
		private var viewRectY1:int;
		
		public var shadowColor:uint;
		public var tempSlope:Number;
		public var tempRise:Number;
		public var tempRun:Number;
		public var tempDist:Number;
		public var lineLength:Number;
		public var endPoint:Point;
		public var endPoint2:Point;
		public var lightMatrix:Matrix;
		public var lightTransform:ColorTransform;
		public var lightMatrix2:Matrix;
		public var shadowMapScale:int;
		public var shadowBuffer:BitmapData;
		public var lightTexture:BitmapData;
		public var tempRect_x:Number;
		public var tempRect_y:Number;
		public var tempRect_width:Number;
		public var tempRect_height:Number;
		public var tempRect_x_width:Number;
		public var tempRect_y_height:Number;
		public var tempLight:Point;
		public var lightSizeHalf:Number;
		
		public var lightMask:Shape;
		public var shadowBuffer_bm:Bitmap;
		public var bf:Object;
		public var light_num:int;
		public var finished_lights:Boolean;
		public var doLights:Boolean;
		
		public var cameraX:Number;
		public var cameraY:Number;
		
		public var characterStartPoint:Point;
		public var cameraStart_x:int;
		public var cameraStart_y:int;
		
		
		
		// 剩余时间
		public var timeRemaining:int;
		public var didLastRender:int;
		
		
		//  时间相关
		public var newTime:Number;
		public var frameTime:Number;
		public var currentTime:Number;
		public var accumulator:Number;
		public var framesPerSecond:Number;
		public var precompute_time:int;
		
		public var interpAmount:Number;
		public var tempInterpPoint:Point=new Point();
		public var tempInterpPointOld:Point=new Point();
		public var interpFinal:Point=new Point();
		
		public var pauseState:int;
		
		public var bloodLoop:int;
		public var splatterCount:int;
		
		//  中间值
		public static var a:int;
		public static var b:int;
		public static var c:int;
		public static var d:int;
		public static var e:int;
		public static var tempMc:MovieClip;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var tempPoint:Point=new Point();
		public static var tempInterp:Point=new Point();
		public static var tempInterpOld:Point=new Point();
		public static var tileOn:int;
		
		
		public var pauseFlag:Boolean=false;
		
		public function setPauseFlag(value:Boolean):void{
			pauseFlag=value;
		}
		
		/**  描绘模式   **/
		public var sceneMode:int;
		public static const MD_Battle:int=0;
		public static const MD_Zhucheng:int=1;
		
		public function setMode($value:int):void
		{
			sceneMode=$value;
		}
		
		public function drawToLevelBm($source:IBitmapDrawable, $matrix:Matrix=null, $colorTransform:ColorTransform=null,
									  $blendMode:String=null, $clipRect:Rectangle=null, $smoothing:Boolean=false):void{
			if(sceneMode==MD_Battle){
				level_bm.draw($source,$matrix,$colorTransform,$blendMode,$clipRect,$smoothing);
			}
			
		}
		public function setLevelBm($bm:BitmapData):void{
			level_bm=$bm;
		}
		public function copyToLevelBm($sourceBitmapData:BitmapData, $sourceRect:Rectangle, $destPoint:Point, 
									  $alphaBitmapData:BitmapData=null, $alphaPoint:Point=null, $mergeAlpha:Boolean=false):void{
			if(sceneMode==MD_Battle){
				level_bm.copyPixels($sourceBitmapData,$sourceRect,$destPoint,$alphaBitmapData,$alphaPoint,$mergeAlpha);
			}
		}
		
		public function createSceenMap():void{
			shadowColor=0;
			newTime = 0;
			frameTime = 0;
			currentTime = 0;
			accumulator = 0;
			framesPerSecond = 0.035;
			
			finished_lights=false;
			k = [87, 83, 65, 68, 69, 70, 82, 80, 77, 192];
			kD = [false, false, false, false, false, false, false, false, false, false];
//			screenWidth = GlobalRef.width/GlobalRef.TileScale*GlobalRef.scale;
//			screenHeight = GlobalRef.height/GlobalRef.TileScale*GlobalRef.scale;
			screenWidth = GlobalRef.width/GlobalRef.TileScale;
			screenHeight = GlobalRef.height/GlobalRef.TileScale;
			
			cameraX=screenWidth/2;
			cameraY=screenHeight/2;
			cameraX=0;
			cameraY=0;
			
			screenWidthTiles = int(screenWidth / 50);
			screenHeightTiles = int(screenHeight / 50);
			if(sceneMode==MD_Battle){
				bm = new BitmapData(screenWidth, screenHeight, false, 0);
			}
			if(sceneMode==MD_Zhucheng){
				bm = new BitmapData(screenWidth, screenHeight, true, 0);
			}
			bg = new Bitmap(bm,"auto",true);
//			bg = new Bitmap(bm);
//			bg.scaleX=GlobalRef.TileScale/GlobalRef.scale;
//			bg.scaleY=GlobalRef.TileScale/GlobalRef.scale;
			bg.scaleX=GlobalRef.TileScale;
			bg.scaleY=GlobalRef.TileScale;
			
			lightMask=new Shape();
			
			if(GameManager.manager.mapInfo.hasOwnProperty("view")){
				viewRectX=GameManager.manager.mapInfo.view[0];
				viewRectY=GameManager.manager.mapInfo.view[1];
				viewRectX1=GameManager.manager.mapInfo.view[2]+viewRectX;
				viewRectY1=GameManager.manager.mapInfo.view[3]+viewRectY;
			}else{
				viewRectX=0;
				viewRectY=0;
				viewRectX1=level.level_width;
				viewRectY1=level.level_height;
			}
			
			
			if(sceneMode==MD_Battle){
				level_bm=GameManager.manager.mapbit;
				
				SimpleParticle_bg.addSimpleParticle_bg(5,level.pos_portalX,level.pos_portalY,0,0,0);
			}
			
		
			
		}
		
		
		public function showNodeInfo():void{
//			level.nodeMap
			var tf:TextField=new TextField();
			tf.textColor=0xFF0000;
			var ma:Matrix=new Matrix();
//			ma.scale(2,2);
			
			for(a=0; a<level.level.length; a++){
				b=int(a/level.level_width);
				c=a%level.level_width;
//				tf.text=level.nodeMap[a];
				tf.text=(b*level.level_width+c).toString()+":"+level.level_collidable[level.level[a]];
				ma.tx=c*50;
				ma.ty=b*50;
				level_bm.draw(tf,ma);
			}
		}
		
		private static var rotInterp:Number;
		private static var interpFrame:Number;
		private static var tempHeadRot:Number;
		
		public function render_a_character(renderArg:RenderPlayerArg):void
		
		{
			var _posX:Number=renderArg._posX ;
			var _posY:Number=renderArg._posY ;
			var _posX_old:Number=renderArg._posX_old ;
			var _posY_old:Number=renderArg._posY_old ;
			var _frame:int=renderArg._frame ;
			var _frameOld:int=renderArg._frameOld ;
			var _face:int=renderArg._face ;
			var _gunRot:Number=renderArg._gunRot ;
			var _gunRotOld:Number=renderArg._gunRotOld ;
			var _headRot:Number=renderArg._headRot ;
			var _gunX:Number=renderArg._gunX ;
			var _gunY:Number=renderArg._gunY ;
			var _gunXOld:Number=renderArg._gunXOld ;
			var _gunYOld:Number=renderArg._gunYOld ;
			var _gunFrame:int=renderArg._gunFrame ;
			var _headless:Boolean=renderArg._headless ;
			var _reloadTime:int=renderArg._reloadTime ;
			var _charAnimData:CharAnimData=renderArg._charAnimData ;
			var _charAsset:CharSpriteAsset=renderArg._charAsset ;
			var _gunAsset:GunAsset=renderArg._gunAsset ;
			var _gunData:GunData=renderArg._gunData ;
			var hasDroppedMag:Boolean=renderArg.hasDroppedMag;
			
			interpFun(_gunRot, 0, _gunRotOld, 0);
			rotInterp = interpFinal.x;
			interpFun(_frame, 0, _frameOld, 0);
			interpFrame = interpFinal.x;
			if (_face == 0){
				interpFun(_posX, _posY, _posX_old, _posY_old);
				if (_charAnimData.hasHands == 1){
					trans.createBox(1, 1, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand1, trans);
				};
				trans.createBox(1, 1, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(1, 1, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				trans.createBox(1, 1, _charAnimData.body_r[int(interpFrame)], (interpFinal.x + _charAnimData.body_x[int(interpFrame)]), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]));
				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < -0.75){
						tempHeadRot = -0.75;
					}
					else {
						if (tempHeadRot > 0.5){
							tempHeadRot = 0.5;
						};
					};
					trans.createBox(1, 1, tempHeadRot, (interpFinal.x + _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				}
				else {
					trans.createBox(1, 1, _charAnimData.head_r[int(interpFrame)], (interpFinal.x + _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				};
				if (_headless == false){
					bm.draw(_charAsset.char_head, trans);
				};
				trans.createBox(1, 1, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(1, 1, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					trans.createBox(1, 1, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand2, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						trans.createBox(1, 1, rotInterp, (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y));
//						if (_spriteSet == 0){
//							bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
//						}
//						else {
//							
//							bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
//						};
						bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						rect.height = _gunAsset.gun_reload_right.height;
							tempPoint.x = (interpFinal.x + _gunData.gun_reload_x);
							tempPoint.y = (interpFinal.y + _gunData.gun_reload_y);
							rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
							if (rect.x < 0){
								rect.x = 0;
							}
							else {
								if (rect.x > 29){
									rect.x = 29;
								};
							};
							if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
								switch (_gunData.gun_magType){
									case 1:
										sound.playSoundEffect(49, 1, 0);
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 3:
										sound.playSoundEffect(49, 1, 0);
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 4:
										b = 0;
										while (b < 6) {
											Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
											b++;
										};
										break;
									case 5:
										b = 0;
										while (b < 5) {
											Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
											b++;
										};
										break;
									case 6:
										sound.playSoundEffect(49, 1, 0);
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 7:
										sound.playSoundEffect(49, 1, 0);
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 8:
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((Math.random() * 8) + 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 9:
										b = 0;
										while (b < 4) {
											Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
											b++;
										};
								};
								hasDroppedMag = true;
								if(renderArg._host&&renderArg._host.hasOwnProperty("hasDroppedMag"))
								{
									renderArg._host.hasDroppedMag=true;
								}
							};
							rect.x = (rect.x * _gunData.gun_reload_w);
							rect.y = 0;
							
							bm.copyPixels(_gunAsset.gun_reload_right, rect, tempPoint, null, null, false);
								};
				};
			}
			else {
				if (_charAnimData.hasHands == 1){
					interpFun(_posX, _posY, _posX_old, _posY_old);
					trans.createBox(-1, 1, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand1, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						trans.createBox(1, -1, -(rotInterp), (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y));
//						if (_spriteSet == 0){
//							
//							bm.draw(_gunAsset.gun_left[_gunData.gunFrames[_gunFrame]], trans);
//						}
//						else {
//							bm.draw(_gunAsset.gun_left[_gunData.gunFrames[_gunFrame]], trans);
//						};
						bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						
						rect.height = _gunAsset.gun_reload_left.height;
							tempPoint.x = ((interpFinal.x - _gunData.gun_reload_x) - _gunData.gun_reload_w);
							tempPoint.y = (interpFinal.y + _gunData.gun_reload_y);
							rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
							if (rect.x < 0){
								rect.x = 0;
							}
							else {
								if (rect.x > 29){
									rect.x = 29;
								};
							};
							if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
								switch (_gunData.gun_magType){
									case 1:
										Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 3:
										Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 4:
										b = 0;
										while (b < 6) {
											Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
											b++;
										};
										break;
									case 5:
										b = 0;
										while (b < 5) {
											Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
											b++;
										};
										break;
									case 6:
										Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 7:
										Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 8:
										Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w - _gunData.gun_reload_mag_x)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((Math.random() * -8) - 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										break;
									case 9:
										b = 0;
										while (b < 4) {
											Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
											b++;
										};
										break;
								};
								hasDroppedMag = true;
								if(renderArg._host&&renderArg._host.hasOwnProperty("hasDroppedMag"))
								{
									renderArg._host.hasDroppedMag=true;
								}
							};
							rect.x = (rect.x * _gunData.gun_reload_w);
							rect.y = 0;
							bm.copyPixels(_gunAsset.gun_reload_left, rect, tempPoint, null, null, false);
								};
				};
				interpFun(_posX, _posY, _posX_old, _posY_old);
				trans.createBox(-1, 1, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(-1, 1, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				trans.createBox(-1, 1, _charAnimData.body_r[int(interpFrame)], (interpFinal.x - _charAnimData.body_x[int(interpFrame)]), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]));
				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < 0){
						if (tempHeadRot > -2.5){
							tempHeadRot = -2.5;
						};
					}
					else {
						if (tempHeadRot < 2.75){
							tempHeadRot = 2.75;
						};
					};
					trans.createBox(1, -1, -(tempHeadRot), (interpFinal.x - _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				}
				else {
					trans.createBox(-1, 1, _charAnimData.head_r[int(interpFrame)], (interpFinal.x - _charAnimData.head_x[int(interpFrame)]), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]));
				};
				if (_headless == false){
					bm.draw(_charAsset.char_head, trans);
				};
				trans.createBox(-1, 1, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(-1, 1, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle1_x[int(interpFrame)]), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]));
				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					trans.createBox(-1, 1, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand2_x[int(interpFrame)]), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]));
					bm.draw(_charAsset.char_hand2, trans);
				};
			};
			
			if(renderArg.renderInfo){
				tempPoint.x=_posX-renderArg.playerInfo.bitdata.width/2;
				tempPoint.y=_posY;
				bm.copyPixels(renderArg.playerInfo.bitdata,renderArg.playerInfo.bitdata.rect,tempPoint,null,null,true);
			}
			
			if(renderArg.talkInfo){
				tempPoint.x=_posX-renderArg.talkInfo.offset.x;
				tempPoint.y=_posY-renderArg.talkInfo.offset.y;
				bm.copyPixels(renderArg.talkInfo.bitdata,renderArg.talkInfo.bitdata.rect,tempPoint,null,null,true);
			}
		}
		
		private function addToContainer($dis:DisplayObject,$container:Sprite,scaleX:Number, scaleY:Number, rotation:Number=0, tx:Number=0, ty:Number=0):void{
//			$dis.scaleX=scaleX;
//			$dis.scaleY=scaleY;
//			$dis.rotation=rotation;
//			$dis.x=tx;
//			$dis.y=ty;
			var $mat:Matrix=new Matrix();
			$mat.createBox(scaleX,scaleY,rotation,tx,ty);
			$dis.transform.matrix=$mat;
			trace($dis.name,scaleX,scaleY,rotation,tx,ty);
			$container.addChild($dis);
		}
			
		
		public function reder_a_large_character_sprite(renderArg:RenderPlayerArg,_scal:Number=1.3):Sprite{
			
			var con:Sprite=new Sprite();
			
			var _posX:Number=renderArg._posX ;
			var _posY:Number=renderArg._posY ;
			var _posX_old:Number=renderArg._posX_old ;
			var _posY_old:Number=renderArg._posY_old ;
			var _frame:int=renderArg._frame ;
			var _frameOld:int=renderArg._frameOld ;
			var _face:int=renderArg._face ;
			var _gunRot:Number=renderArg._gunRot ;
			var _gunRotOld:Number=renderArg._gunRotOld ;
			var _headRot:Number=renderArg._headRot ;
			var _gunX:Number=renderArg._gunX ;
			var _gunY:Number=renderArg._gunY ;
			var _gunXOld:Number=renderArg._gunXOld ;
			var _gunYOld:Number=renderArg._gunYOld ;
			var _gunFrame:int=renderArg._gunFrame ;
			var _headless:Boolean=renderArg._headless ;
			var _reloadTime:int=renderArg._reloadTime ;
			var _charAnimData:CharAnimData=renderArg._charAnimData ;
			var _charAsset:CharSpriteAsset=renderArg._charAsset ;
			var _gunAsset:GunAsset=renderArg._gunAsset ;
			var _gunData:GunData=renderArg._gunData ;
			var hasDroppedMag:Boolean=renderArg.hasDroppedMag;
			
			interpFun(_gunRot, 0, _gunRotOld, 0);
			rotInterp = interpFinal.x;
			interpFun(_frame, 0, _frameOld, 0);
			interpFrame = interpFinal.x;
			if (_face == 0){
				interpFun(_posX, _posY, _posX_old, _posY_old);
				if (_charAnimData.hasHands == 1){
					addToContainer( _charAsset.char_hand1 , con, _scal, _scal, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]*_scal));
//					bm.draw(_charAsset.char_hand1, trans);
				};
				addToContainer( _charAsset.char_foot , con, _scal, _scal, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_foot, trans);
				addToContainer( _charAsset.char_ankle , con, _scal, _scal, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_ankle, trans);
				addToContainer( _charAsset.char_body , con, _scal, _scal, _charAnimData.body_r[int(interpFrame)], (interpFinal.x + _charAnimData.body_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < -0.75){
						tempHeadRot = -0.75;
					}
					else {
						if (tempHeadRot > 0.5){
							tempHeadRot = 0.5;
						};
					};
					addToContainer( _charAsset.char_head , con, _scal, _scal, tempHeadRot, (interpFinal.x + _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				}
				else {
					addToContainer( _charAsset.char_head , con, _scal, _scal, _charAnimData.head_r[int(interpFrame)], (interpFinal.x + _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				};
				if (_headless == false){
//					bm.draw(_charAsset.char_head, trans);
				};
				addToContainer( _charAsset.char_foot , con, _scal, _scal, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_foot, trans);
				addToContainer( _charAsset.char_ankle , con, _scal, _scal, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					addToContainer( _charAsset.char_hand2 , con, _scal, _scal, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]*_scal));
//					bm.draw(_charAsset.char_hand2, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						addToContainer( _gunAsset.gun_right[_gunData.gunFrames[_gunFrame]] , con, _scal, _scal, rotInterp, (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y*_scal));
						//						if (_spriteSet == 0){
						//							bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
						//						}
						//						else {
						//							
						//							bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
						//						};
//						bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						rect.height = _gunAsset.gun_reload_right.height;
						tempPoint.x = (interpFinal.x + _gunData.gun_reload_x*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);
						rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
						if (rect.x < 0){
							rect.x = 0;
						}
						else {
							if (rect.x > 29){
								rect.x = 29;
							};
						};
						if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
							//							trace("_reloadTime"+_reloadTime);
							//							trace("_gunData.gun_reload_time"+_gunData.gun_reload_time);
							//							trace("_gunData.gun_magDropFrame"+_gunData.gun_magDropFrame);
							//							trace("rect.x"+rect.x);
							//							trace("hasDroppedMag"+hasDroppedMag);
							switch (_gunData.gun_magType){
								case 1:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 3:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 4:
									b = 0;
									while (b < 6) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 5:
									b = 0;
									while (b < 5) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 6:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 7:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 8:
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((Math.random() * 8) + 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 9:
									b = 0;
									while (b < 4) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
							};
							hasDroppedMag = true;
							if(renderArg._host&&renderArg._host.hasOwnProperty("hasDroppedMag"))
							{
								renderArg._host.hasDroppedMag=true;
							}
						};
						rect.width = _gunData.gun_reload_w;
						rect.height = _gunAsset.gun_reload_right.height;
						rect.x = (rect.x * _gunData.gun_reload_w);
						rect.y = 0;
						var tempBitdata:BitmapData=new BitmapData(rect.width,rect.height);
						tempBitdata.copyPixels(_gunAsset.gun_reload_right, rect,new Point(0,0), null, null, false);
						var reloadSprite:Sprite=new Sprite();
						reloadSprite.graphics.beginBitmapFill(tempBitdata);
						reloadSprite.graphics.drawRect(0,0,rect.width,rect.height);
						
						tempPoint.x = (interpFinal.x + _gunData.gun_reload_x*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);						
						rect.x = (rect.x * _gunData.gun_reload_w*_scal);
						rect.y = 0;
						addToContainer( reloadSprite , con, _scal,_scal,0,tempPoint.x,tempPoint.y);
//						bm.draw(reloadSprite, trans);
					};
				};
			}
			else {
				if (_charAnimData.hasHands == 1){
					interpFun(_posX, _posY, _posX_old, _posY_old);
					addToContainer( _charAsset.char_hand1 , con, -_scal, _scal, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]*_scal));
//					bm.draw(_charAsset.char_hand1, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						addToContainer( _gunAsset.gun_right[_gunData.gunFrames[_gunFrame]] , con, _scal, -_scal, -(rotInterp), (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y*_scal));
						//						if (_spriteSet == 0){
						//							
						//							bm.draw(_gunAsset.gun_left[_gunData.gunFrames[_gunFrame]], trans);
						//						}
						//						else {
						//							bm.draw(_gunAsset.gun_left[_gunData.gunFrames[_gunFrame]], trans);
						//						};
//						bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						
						rect.height = _gunAsset.gun_reload_left.height;
						tempPoint.x = ((interpFinal.x - _gunData.gun_reload_x*_scal) - _gunData.gun_reload_w*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);
						rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
						if (rect.x < 0){
							rect.x = 0;
						}
						else {
							if (rect.x > 29){
								rect.x = 29;
							};
						};
						if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
							switch (_gunData.gun_magType){
								case 1:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 3:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 4:
									b = 0;
									while (b < 6) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 5:
									b = 0;
									while (b < 5) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 6:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 7:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 8:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((Math.random() * -8) - 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 9:
									b = 0;
									while (b < 4) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
							};
							hasDroppedMag = true;
							if(renderArg._host&&renderArg._host.hasOwnProperty("hasDroppedMag"))
							{
								renderArg._host.hasDroppedMag=true;
							}
						};
						rect.width = _gunData.gun_reload_w;
						rect.height = _gunAsset.gun_reload_left.height;
						rect.x = (rect.x * _gunData.gun_reload_w);
						rect.y = 0;
						var tempBitdata:BitmapData=new BitmapData(rect.width,rect.height);
						tempBitdata.copyPixels(_gunAsset.gun_reload_left, rect,new Point(0,0), null, null, false);
						var reloadSprite:Sprite=new Sprite();
						reloadSprite.graphics.beginBitmapFill(tempBitdata);
						reloadSprite.graphics.drawRect(0,0,rect.width,rect.height);
						
						tempPoint.x = ((interpFinal.x - _gunData.gun_reload_x*_scal) - _gunData.gun_reload_w*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);					
						rect.x = (rect.x * _gunData.gun_reload_w*_scal);
						rect.y = 0;
						addToContainer( reloadSprite , con, _scal,_scal,0,tempPoint.x,tempPoint.y);
//						bm.draw(reloadSprite, trans);
					};
				};
				interpFun(_posX, _posY, _posX_old, _posY_old);
				addToContainer( _charAsset.char_foot , con, -_scal, _scal, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_foot, trans);
				addToContainer( _charAsset.char_ankle , con, -_scal, _scal, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_ankle, trans);
				addToContainer( _charAsset.char_body , con, -_scal, _scal, _charAnimData.body_r[int(interpFrame)], (interpFinal.x - _charAnimData.body_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < 0){
						if (tempHeadRot > -2.5){
							tempHeadRot = -2.5;
						};
					}
					else {
						if (tempHeadRot < 2.75){
							tempHeadRot = 2.75;
						};
					};
					addToContainer( _charAsset.char_head , con, _scal, -_scal, -(tempHeadRot), (interpFinal.x - _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				}
				else {
					addToContainer( _charAsset.char_head , con, -_scal, _scal, _charAnimData.head_r[int(interpFrame)], (interpFinal.x - _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				};
				if (_headless == false){
//					bm.draw(_charAsset.char_head, trans);
				};
				var foot:Sprite=new Sprite();
//				foot.graphics.
				foot.graphics.copyFrom(_charAsset.char_foot.graphics);
				addToContainer( foot , con, -_scal, _scal, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_foot, trans);
				addToContainer( _charAsset.char_ankle , con, -_scal, _scal, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]*_scal));
//				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					addToContainer( _charAsset.char_hand2 , con, -_scal, _scal, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]*_scal));
//					bm.draw(_charAsset.char_hand2, trans);
				};
			};
			
			if(renderArg.renderInfo){
				tempPoint.x=_posX-renderArg.playerInfo.bitdata.width/2;
				tempPoint.y=_posY;
				bm.copyPixels(renderArg.playerInfo.bitdata,renderArg.playerInfo.bitdata.rect,tempPoint,null,null,true);
			}
			return con;
		}
		
		/**
		 *  大的人物
		 */
		public function render_a_large_character(renderArg:RenderPlayerArg,_scal:Number=1.3):void
			
		{
			var _posX:Number=renderArg._posX ;
			var _posY:Number=renderArg._posY ;
			var _posX_old:Number=renderArg._posX_old ;
			var _posY_old:Number=renderArg._posY_old ;
			var _frame:int=renderArg._frame ;
			var _frameOld:int=renderArg._frameOld ;
			var _face:int=renderArg._face ;
			var _gunRot:Number=renderArg._gunRot ;
			var _gunRotOld:Number=renderArg._gunRotOld ;
			var _headRot:Number=renderArg._headRot ;
			var _gunX:Number=renderArg._gunX ;
			var _gunY:Number=renderArg._gunY ;
			var _gunXOld:Number=renderArg._gunXOld ;
			var _gunYOld:Number=renderArg._gunYOld ;
			var _gunFrame:int=renderArg._gunFrame ;
			var _headless:Boolean=renderArg._headless ;
			var _reloadTime:int=renderArg._reloadTime ;
			var _charAnimData:CharAnimData=renderArg._charAnimData ;
			var _charAsset:CharSpriteAsset=renderArg._charAsset ;
			var _gunAsset:GunAsset=renderArg._gunAsset ;
			var _gunData:GunData=renderArg._gunData ;
			var hasDroppedMag:Boolean=renderArg.hasDroppedMag;
			
			interpFun(_gunRot, 0, _gunRotOld, 0);
			rotInterp = interpFinal.x;
			interpFun(_frame, 0, _frameOld, 0);
			interpFrame = interpFinal.x;
			if (_face == 0){
				interpFun(_posX, _posY, _posX_old, _posY_old);
				if (_charAnimData.hasHands == 1){
					trans.createBox(_scal, _scal, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]*_scal));
					bm.draw(_charAsset.char_hand1, trans);
				};
				trans.createBox(_scal, _scal, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(_scal, _scal, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_ankle, trans);
				trans.createBox(_scal, _scal, _charAnimData.body_r[int(interpFrame)], (interpFinal.x + _charAnimData.body_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < -0.75){
						tempHeadRot = -0.75;
					}
					else {
						if (tempHeadRot > 0.5){
							tempHeadRot = 0.5;
						};
					};
					trans.createBox(_scal, _scal, tempHeadRot, (interpFinal.x + _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				}
				else {
					trans.createBox(_scal, _scal, _charAnimData.head_r[int(interpFrame)], (interpFinal.x + _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				};
				if (_headless == false){
					bm.draw(_charAsset.char_head, trans);
				};
				trans.createBox(_scal, _scal, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x + _charAnimData.foot1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(_scal, _scal, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x + _charAnimData.ankle1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					trans.createBox(_scal, _scal, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x + _charAnimData.hand2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]*_scal));
					bm.draw(_charAsset.char_hand2, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						trans.createBox(_scal, _scal, rotInterp, (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y*_scal));
						//						if (_spriteSet == 0){
						//							bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
						//						}
						//						else {
						//							
						//							bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
						//						};
						bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						rect.height = _gunAsset.gun_reload_right.height;
						tempPoint.x = (interpFinal.x + _gunData.gun_reload_x*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);
						rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
						if (rect.x < 0){
							rect.x = 0;
						}
						else {
							if (rect.x > 29){
								rect.x = 29;
							};
						};
						if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
//							trace("_reloadTime"+_reloadTime);
//							trace("_gunData.gun_reload_time"+_gunData.gun_reload_time);
//							trace("_gunData.gun_magDropFrame"+_gunData.gun_magDropFrame);
//							trace("rect.x"+rect.x);
//							trace("hasDroppedMag"+hasDroppedMag);
							switch (_gunData.gun_magType){
								case 1:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 3:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 4:
									b = 0;
									while (b < 6) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 5:
									b = 0;
									while (b < 5) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 6:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 7:
									sound.playSoundEffect(49, 1, 0);
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 8:
									Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((Math.random() * 8) + 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 9:
									b = 0;
									while (b < 4) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 10), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
							};
							hasDroppedMag = true;
							if(renderArg._host&&renderArg._host.hasOwnProperty("hasDroppedMag"))
							{
								renderArg._host.hasDroppedMag=true;
							}
						};
						rect.width = _gunData.gun_reload_w;
						rect.height = _gunAsset.gun_reload_right.height;
						rect.x = (rect.x * _gunData.gun_reload_w);
						rect.y = 0;
						var tempBitdata:BitmapData=new BitmapData(rect.width,rect.height);
						tempBitdata.copyPixels(_gunAsset.gun_reload_right, rect,new Point(0,0), null, null, false);
						var reloadSprite:Sprite=new Sprite();
						reloadSprite.graphics.beginBitmapFill(tempBitdata);
						reloadSprite.graphics.drawRect(0,0,rect.width,rect.height);

						tempPoint.x = (interpFinal.x + _gunData.gun_reload_x*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);						
						rect.x = (rect.x * _gunData.gun_reload_w*_scal);
						rect.y = 0;
						trans.createBox(_scal,_scal,0,tempPoint.x,tempPoint.y);
						bm.draw(reloadSprite, trans);
					};
				};
			}
			else {
				if (_charAnimData.hasHands == 1){
					interpFun(_posX, _posY, _posX_old, _posY_old);
					trans.createBox(-_scal, _scal, _charAnimData.hand1_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand1_y[int(interpFrame)]*_scal));
					bm.draw(_charAsset.char_hand1, trans);
				}
				else {
					if ((((_reloadTime < 1)) || ((_gunData.gun_hasReloadAnim == 0)))){
						interpFun(_gunX, _gunY, _gunXOld, _gunYOld);
						trans.createBox(_scal, -_scal, -(rotInterp), (interpFinal.x - cameraX), ((interpFinal.y - cameraY) + _gunData.gunShoulder_y*_scal));
						//						if (_spriteSet == 0){
						//							
						//							bm.draw(_gunAsset.gun_left[_gunData.gunFrames[_gunFrame]], trans);
						//						}
						//						else {
						//							bm.draw(_gunAsset.gun_left[_gunData.gunFrames[_gunFrame]], trans);
						//						};
						bm.draw(_gunAsset.gun_right[_gunData.gunFrames[_gunFrame]], trans);
					}
					else {
						interpFun(_posX, _posY, _posX_old, _posY_old);
						rect.width = _gunData.gun_reload_w;
						
						rect.height = _gunAsset.gun_reload_left.height;
						tempPoint.x = ((interpFinal.x - _gunData.gun_reload_x*_scal) - _gunData.gun_reload_w*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);
						rect.x = (30 - int((30 * (_reloadTime / (_gunData.gun_reload_time + 1)))));
						if (rect.x < 0){
							rect.x = 0;
						}
						else {
							if (rect.x > 29){
								rect.x = 29;
							};
						};
						if ((((rect.x >= _gunData.gun_magDropFrame)) && ((hasDroppedMag == false)))){
							switch (_gunData.gun_magType){
								case 1:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 4, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 3:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 5, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 4:
									b = 0;
									while (b < 6) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 5:
									b = 0;
									while (b < 5) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
								case 6:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 6, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 7:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * -7), (Math.random() * 2), 4, 7, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 8:
									Particle.addParticle(0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + (_gunData.gun_reload_w*_scal - _gunData.gun_reload_mag_x*_scal)) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((Math.random() * -8) - 12), ((Math.random() * -8) - 6), 4, 8, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
									break;
								case 9:
									b = 0;
									while (b < 4) {
										Particle.addParticle(0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, ((tempPoint.x + _gunData.gun_reload_mag_x*_scal) + cameraX), ((tempPoint.y + _gunData.gun_reload_mag_y*_scal) + cameraY), 0, (Math.random() * 7), (Math.random() * 2), 0, 3, (int((Math.random() * 3)) + 12), ((int((Math.random() * 4)) + 0.25) / 10), 0, 0);
										b++;
									};
									break;
							};
							hasDroppedMag = true;
							if(renderArg._host&&renderArg._host.hasOwnProperty("hasDroppedMag"))
							{
								renderArg._host.hasDroppedMag=true;
							}
						};
						rect.width = _gunData.gun_reload_w;
						rect.height = _gunAsset.gun_reload_left.height;
						rect.x = (rect.x * _gunData.gun_reload_w);
						rect.y = 0;
						var tempBitdata:BitmapData=new BitmapData(rect.width,rect.height);
						tempBitdata.copyPixels(_gunAsset.gun_reload_left, rect,new Point(0,0), null, null, false);
						var reloadSprite:Sprite=new Sprite();
						reloadSprite.graphics.beginBitmapFill(tempBitdata);
						reloadSprite.graphics.drawRect(0,0,rect.width,rect.height);
						
						tempPoint.x = ((interpFinal.x - _gunData.gun_reload_x*_scal) - _gunData.gun_reload_w*_scal);
						tempPoint.y = (interpFinal.y + _gunData.gun_reload_y*_scal);					
						rect.x = (rect.x * _gunData.gun_reload_w*_scal);
						rect.y = 0;
						trans.createBox(_scal,_scal,0,tempPoint.x,tempPoint.y);
						bm.draw(reloadSprite, trans);
					};
				};
				interpFun(_posX, _posY, _posX_old, _posY_old);
				trans.createBox(-_scal, _scal, _charAnimData.foot2_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot2_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(-_scal, _scal, _charAnimData.ankle2_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle2_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_ankle, trans);
				trans.createBox(-_scal, _scal, _charAnimData.body_r[int(interpFrame)], (interpFinal.x - _charAnimData.body_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.body_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_body, trans);
				if (_charAnimData.headRot == 0){
					tempHeadRot = _headRot;
					if (tempHeadRot < 0){
						if (tempHeadRot > -2.5){
							tempHeadRot = -2.5;
						};
					}
					else {
						if (tempHeadRot < 2.75){
							tempHeadRot = 2.75;
						};
					};
					trans.createBox(_scal, -_scal, -(tempHeadRot), (interpFinal.x - _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				}
				else {
					trans.createBox(-_scal, _scal, _charAnimData.head_r[int(interpFrame)], (interpFinal.x - _charAnimData.head_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.head_y[int(interpFrame)]*_scal));
				};
				if (_headless == false){
					bm.draw(_charAsset.char_head, trans);
				};
				trans.createBox(-_scal, _scal, _charAnimData.foot1_r[int(interpFrame)], (interpFinal.x - _charAnimData.foot1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.foot1_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_foot, trans);
				trans.createBox(-_scal, _scal, _charAnimData.ankle1_r[int(interpFrame)], (interpFinal.x - _charAnimData.ankle1_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.ankle1_y[int(interpFrame)]*_scal));
				bm.draw(_charAsset.char_ankle, trans);
				if (_charAnimData.hasHands == 1){
					trans.createBox(-_scal, _scal, _charAnimData.hand2_r[int(interpFrame)], (interpFinal.x - _charAnimData.hand2_x[int(interpFrame)]*_scal), (interpFinal.y + _charAnimData.hand2_y[int(interpFrame)]*_scal));
					bm.draw(_charAsset.char_hand2, trans);
				};
			};
			
			if(renderArg.renderInfo){
				tempPoint.x=_posX-renderArg.playerInfo.bitdata.width/2;
				tempPoint.y=_posY;
				bm.copyPixels(renderArg.playerInfo.bitdata,renderArg.playerInfo.bitdata.rect,tempPoint,null,null,true);
			}
		}
		
		private static const ES_StartEnd:int=1;
		private static const ES_ShowEndMovie:int=2;
		private static const ES_WaitForMessage:int=3;
		private var endState:int=0;
		
		public function endBattle():void{
			endState=ES_StartEnd;
		}
		
		public function destory():void{
//			GameManager.stage.removeEventListener(Event.ENTER_FRAME,enterFrameFun);
//			(Context.getInjectInstance(BattleModel) as BattleModel).getRewardMsgCom.addOnce(onGetRewardCom);
			if(level_bm){
				level_bm.dispose();
				level_bm=null;
			}
			if(bm){
				bm.dispose();
				bm=null;
			}
			
		}
		
		/** **/
		public function placeBloodSplatter(_arg_1:Number, _arg_2:Number, _arg_3:*):void
		{
			_arg_1 = (_arg_1 + ((Math.random() * 70) - 45));
			_arg_2 = (_arg_2 + ((Math.random() * 70) - 45));
			bloodLoop = 0;
			while (bloodLoop < int((Math.random() * 5))) {
				Particle.addParticle(6, ((_arg_1 + (Math.random() * 70)) - 35), ((_arg_2 + (Math.random() * 70)) - 35), 0, Particle.particleLastX, Particle.particleLastY, 0, 0, (Math.random() + 0.5), 0, ((Math.random() * 1) + 1), 0, 0, 0, 0);
				bloodLoop++;
			};
			if (level.level_id != 4){
				trans.createBox(((Math.random() * 0.25) + 1), ((Math.random() * 0.25) + 1), (Math.random() * 360), 100, 100);
			}
			else {
				trans.createBox(((Math.random() * 0.75) + 1), ((Math.random() * 0.75) + 1), (Math.random() * 360), 100, 100);
			};
			rect.x = 0;
			rect.y = 0;
			rect.width = 200;
			rect.height = 200;
			
			assetConfig.tempBloodSplatter_bm.fillRect(rect, 0xFFFFFF);
			
			assetConfig.tempBloodSplatter_bm.draw(assetConfig.bloodSplatters[int(Math.random() * 8)], trans);
			tempPoint.x = (int(((_arg_1 - 100) / 50)) * 50);
			tempPoint.y = (int(((_arg_2 - 100) / 50)) * 50);
			rect.width = 50;
			rect.height = 50;
			bloodLoop = 0;
			while (bloodLoop < 5) {
				c = 0;
				while (c < 5) {
					rect.x = (tempPoint.x + (c * 50));
					rect.y = (tempPoint.y + (bloodLoop * 50));
					tileOn = ((int((rect.y / 50)) * level.level_width) + int((rect.x / 50)));
					if ((((tileOn < 0)) || ((tileOn > (level.level.length - 1))))){
						rect.x = (rect.x - (_arg_1 - 100));
						rect.y = (rect.y - (_arg_2 - 100));
						assetConfig.tempBloodSplatter_bm.fillRect(rect, 0xFFFFFF);
					}
					else {
						if (level.level_collidable[level.level[tileOn]] == 1){
							rect.x = (rect.x - (_arg_1 - 100));
							rect.y = (rect.y - (_arg_2 - 100));
							assetConfig.tempBloodSplatter_bm.fillRect(rect, 0xFFFFFF);
						};
					};
					c++;
				};
				bloodLoop++;
			};
			trans.createBox(1, 1, 0, (_arg_1 - 100), (_arg_2 - 100));
			if (level.level_id != 4){
				level_bm.draw(assetConfig.tempBloodSplatter_bm, trans, null, "multiply");
			}
			else {
				level_bm.draw(assetConfig.tempBloodSplatter_bm, trans, null, "hardlight");
			};
			if (_arg_3 == 0){
				splatterCount = (splatterCount + 1);
				/*if (scoreTimesEarned[9] == 0){
					if (splatterCount >= 250){
						scoreTimesEarned[9] = 1;
						tempScoreQue = "";
						tempScoreQue = (tempScoreQue + scoreNames[9]);
						scoreTally = (scoreTally + 25);
						scoreQue.push(tempScoreQue);
						if (scoreQue.length > 3){
							scoreQue.splice(0, 1);
						};
						scoreQueTime = 60;
						multiplier_countdown = max_multiplier_countdown;
					};
				};
				if (scoreTimesEarned[10] == 0){
					if (splatterCount >= 500){
						scoreTimesEarned[10] = 1;
						tempScoreQue = "";
						tempScoreQue = (tempScoreQue + scoreNames[10]);
						scoreTally = (scoreTally + 50);
						scoreQue.push(tempScoreQue);
						if (scoreQue.length > 3){
							scoreQue.splice(0, 1);
						};
						scoreQueTime = 60;
						multiplier_countdown = max_multiplier_countdown;
					};
				};
				if (scoreTimesEarned[11] == 0){
					if (splatterCount >= 1000){
						scoreTimesEarned[11] = 1;
						tempScoreQue = "";
						tempScoreQue = (tempScoreQue + scoreNames[11]);
						scoreTally = (scoreTally + 100);
						scoreQue.push(tempScoreQue);
						if (scoreQue.length > 3){
							scoreQue.splice(0, 1);
						};
						scoreQueTime = 60;
						multiplier_countdown = max_multiplier_countdown;
					};
				};*/
			};
		}
		
		
		private function addDiscEnemy():void{
			a = 0;
			while (a < level.level_item_type.length)
			{
				
				switch(level.level_item_type[a])
				{
					case 13:
					{
						Enemy.addEnemy(3, 1, 1, 1, 0, level.level_item_x[a] * 50 + 25, level.level_item_y[a] * 50 + 25);
						break;
					}
					default:
					{
						break;
					}
				}
				
				a  ++ ;
				
			}
		}
		
		/** 添加初始化的**/
		private function addInitParticle():void{
			a = 0;
			
			while (a < level.level_item_type.length)
			{
				
				switch(level.level_item_type[a])
				{
					case 0:
					{
						SimpleParticle_bg.addSimpleParticle_bg(1, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0, 0);
						break;
					}
					case 1:
					{
						SimpleParticle_bg.addSimpleParticle_bg(2, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0, 0);
						break;
					}
					case 2:
					{
						SimpleParticle_bg.addSimpleParticle_bg(3, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0, 0);
						break;
					}
					case 3:
					{
						SimpleParticle_bg.addSimpleParticle_bg(4, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0, 0);
						break;
					}
					case 4:
					{
						Particle.addParticle(4, level.level_item_x[a] * 50 + 25, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
						break;
					}
					case 5:
					{
						Particle.addParticle(5, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
						break;
					}
					case 6:
					{
						Particle.addParticle(5, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 1, 0, 0, 0, 0, 0);
						break;
					}
					case 7:
					{
						Particle.addParticle(5, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 2, 0, 0, 0, 0, 0);
						break;
					}
					case 8:
					{
						Particle.addParticle(5, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 3, 0, 0, 0, 0, 0);
						break;
					}
					case 9:
					{
						Particle.addParticle(8, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
						break;
					}
					case 10:
					{
						// warning
						characterStartPoint=new Point();
						characterStartPoint.x = level.level_item_x[a] * 50 + 25;
						characterStartPoint.y = level.level_item_y[a] * 50 + 52;
						cameraStart_x = level.level_item_x[a] * 50 + 25;
						cameraStart_y = level.level_item_y[a] * 50 + 52;
						break;
					}
					case 11:
					{
						Particle.addParticle(10, level.level_item_x[a] * 50 + 25, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
						break;
					}
					case 12:
					{
						Particle.addParticle(11, level.level_item_x[a] * 50, level.level_item_y[a] * 50, 0, 0,0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
						break;
					}
					default:
					{
						break;
					}
				}
				
				a  ++ ;
				
			}
			a = 0;
			while (a < level.level_height)
			{
				
				b = 0;
				while (b < level.level_width)
				{
					
					tileOn = level.level[a * level.level_width + b];
					switch(tileSet.id)
					{
						case 1:
						{
							switch(tileOn)
							{
								case 82:
								{
									tileOn = level[a * level.level_width + b - level.level_width];
									if (level.level_collidable[tileOn] == 1)
									{
										if (tileOn != 82)
										{
											SimpleParticle_bg.addSimpleParticle_bg(0, b * 50 - 4, a * 50, 0, 0, 0);
										}
									}
									
									break;
								}
								default:
								{
									break;
								}
							}
							break;
						}
						case 3:
						{
							switch(tileOn)
							{
								case 0:
								{
									level.level[a * level.level_width + b] = int(Math.random() * 8);
									break;
								}
								case 102:
								{
									tileOn = level.level[a * level.level_width + b - level.level_width];
									if (level.level_collidable[tileOn] == 1)
									{
										if (tileOn != 102)
										{
											SimpleParticle_bg.addSimpleParticle_bg(0, b * 50 - 4, a * 50, 0, 0, 0);
										}
									}
									
									break;
								}
								default:
								{
									break;
								}
							}
							break;
						}
						case 4:
						{
							switch(tileOn)
							{
								case 105:
								{
									tileOn = level.level[a * level.level_width + b - level.level_width];
									if (level.level_collidable[tileOn] == 1)
									{
										if (tileOn != 105)
										{
											SimpleParticle_bg.addSimpleParticle_bg(0, b * 50 - 4, a * 50, 0, 0, 0);
										}
									}
									
									break;
								}
								default:
								{
									break;
								}
							}
							break;
						}
						case 5:
						{
							switch(tileOn)
							{
								case 62:
								{
									tileOn = level.level[a * level.level_width + b - level.level_width];
									if (level.level_collidable[tileOn] == 1)
									{
										if (tileOn != 62)
										{
											SimpleParticle_bg.addSimpleParticle_bg(0, b * 50 - 4, a * 50, 0, 0, 0);
										}
									}
									
									break;
								}
								default:
								{
									break;
								}
							}
							break;
						}
						case 6:
						{
							switch(tileOn)
							{
								case 105:
								{
									tileOn = level.level[a * level.level_width + b - level.level_width];
									if (level.level_collidable[tileOn] == 1)
									{
										if (tileOn != 105)
										{
											SimpleParticle_bg.addSimpleParticle_bg(0, b * 50 - 4, a * 50, 0, 0, 0);
										}
									}
									
									break;
								}
								default:
								{
									break;
								}
							}
							break;
						}
						default:
						{
							break;
						}
					}
					
					b  ++ ;
					
				}
				
				a  ++ ;
				
			}
		}
		
		
		private function createBlurShader():void{
			tempSlope = 0;
			tempRise = 0;
			tempRun = 0;
			tempDist = 0;
			lineLength = 0;
			endPoint = new Point();
			endPoint2 = new Point();
			lightMatrix = new Matrix();
			lightTransform = new ColorTransform(1, 1, 1, tileSet.globalIllumination, 0, 0, 0, 0);
			lightMatrix2 = new Matrix();
			shadowMapScale = 4;
			shadowBuffer = new BitmapData(level_bm.width / shadowMapScale, level_bm.height / shadowMapScale, false, shadowColor);
			lightTexture = new BitmapData(1000 / shadowMapScale, 1000 / shadowMapScale, false, 0);
			tempRect_x = 0;
			tempRect_y = 0;
			tempRect_width = 0;
			tempRect_height = 0;
			tempRect_x_width = 0;
			tempRect_y_height = 0;
			tempLight = new Point();
			lightSizeHalf = 0;
			
			trace("Map Stuff: " + (getTimer() - precompute_time) + "ms");
			precompute_time = getTimer();
			bf = new BlurFilter(16, 16, 1);
			light_num = 0;
			finished_lights = false;
			rect.width = screenWidth;
			rect.height = screenHeight;
			rect.x = 0;
			rect.y = 0;
			shadowBuffer.fillRect(rect, 0);
			doLights = true;
			trace("Lights: " + (getTimer() - precompute_time) + "ms");
		}
		
		
		/*private function simulateCameraMove():void{
			tempPoint.x=0;
			tempPoint.y=0;
			if(GameManager.manager.keyMap[Keyboard.UP]){
				tempPoint.y--;
			}
			if(GameManager.manager.keyMap[Keyboard.DOWN]){
				tempPoint.y++;
			}
			if(GameManager.manager.keyMap[Keyboard.LEFT]){
				tempPoint.x--;
			}
			if(GameManager.manager.keyMap[Keyboard.RIGHT]){
				tempPoint.x++;
			}
			
			cameraX+=10*tempPoint.x;
			cameraY+=10*tempPoint.y;
			
		}*/
		
		private var showEndFlag:Boolean=false;
		
		public var getRewardFlag:Boolean=false;
//		private function onGetRewardCom():void{
//			getRewardFlag=true;
//		}
		private function checkEnd():void{
			if(getRewardFlag && endState==ES_WaitForMessage){
				GameManager.endBattle();
			}
		}
		
		public function setRewardFlag():void{
			getRewardFlag=true;
			checkEnd();
		}
		
		public function enterFrameFun(event:Event=null):void
		{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
			{
				var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
				if(endState==ES_StartEnd){
					if(battleModel.hasNextMinorGuanka()){
						GameManager.endBattle();
						trace("这边开始结束战斗");
						return;
					}else{
						endState=ES_ShowEndMovie;
//						battleModel.getBattleReward();
					}
				}
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)
			{
				if(endState==ES_StartEnd)
				{
					endState=ES_ShowEndMovie;
				}
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				if(endState==ES_StartEnd)
				{
					endState=ES_ShowEndMovie;
				}
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				if(endState==ES_StartEnd)
				{
					endState=ES_ShowEndMovie;
				}
			}
			if(endState==ES_ShowEndMovie){
				// 显示结束动画效果
				endState=ES_WaitForMessage;
				return ;
			}
			if(endState==ES_WaitForMessage){
				checkEnd();
				return ;
			}
			
			newTime = getTimer();
			frameTime = (newTime - currentTime) / 1000;
			currentTime = newTime;
			accumulator = accumulator + frameTime;
			if (accumulator > 0.3)
			{
				accumulator = 0.3;
			}
			precompute_time = getTimer();
			
//			trace("每一帧 时间： "+frameTime+"/"+accumulator+"/"+framesPerSecond+"/"+int(accumulator/framesPerSecond));
//			d=0;
			if(accumulator > 500){
				return ;
			}
			
			if(pauseFlag || GameManager.guideStopFlag){
				return ;
			}
			
			while (accumulator > framesPerSecond)
			{
				accumulator = accumulator - framesPerSecond;
				
				gameLogic();
			}
			interpAmount = accumulator / framesPerSecond;
			if(sceneMode==MD_Battle){
				render();
			}
			if(sceneMode==MD_Zhucheng){
				renderZhucheng();
			}
			if(finished_lights==false){
//				if(!GameManager.useMyMap){
//					do_lights_fun();
//				}
			}
			
		}
		
		private function gameLogic():void{
			GameItemManager.getInstance().logic();
			GameRolerManager.instance.logic();
			if(GameManager.manager.player) GameManager.manager.player.logic();
			enemyLogic();
			particleLogic();
		}
		
		private function enemyLogic():void{
//			trace("********************Enemy.logic()*********************8");
			Enemy.logic();
		}
		
		private function particleLogic():void{
			sound.numberOfBloodSplatSFX = 0;
			if (sound.acidSfx > 0)
			{
				
				sound.acidSfx  -- ;
				
			}
			sound.closestArtifact_dist = 0;
			sound.closestArtifact_num = -1;
			if (sound.artifactSfx > 0)
			{
				
				sound.artifactSfx  -- ;
				
			}
			SimpleParticle_bg.logic();
			SimpleParticle.logic();
			Particle.logic();
		}
		
		
		/** 创建微缩地图 **/
		private function createMiroMap():void{
			userMap = new BitmapData(level.level_width, level.level_height, false, 0);
			
			a = 0;
			while (a < (level.level_height - 1))
			{
				b = 0;
				while (b < level.level_width)
				{
					tileOn = level.level[a * level.level_width + b];
					if (level.level_collidable[tileOn] == 1)
					{
						userMap.setPixel(b, a, tileSet.userMapColor);
					}
					b  ++ ;
				}
				a  ++ ;
			}
		}
		
		/** 创建 箭头位图数据**/
		public function createNodeBitdata():void{
			tempMc = new node_mc();
			node_bm = new BitmapData(200, 50, true, 0);
			a = 0;
			while (a < 4)
			{
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 50;
				trans.ty = 0;
				node_bm.draw(tempMc, trans);
				a  ++ ;
			}
			tempMc = new node_mc2();
			node_bm2 = new BitmapData(50, 50, true, 0);
			node_bm2.draw(tempMc);
		}
		
		/**  创建其他所需的 位图数据  **/
		public function createOtherBitdata():void{
			/*tempMc = new alphabet_mc_lg();
			alphabet_bm_lg = new BitmapData(tempMc.width, tempMc.height, true, 0);
			alphabet_bm_lg.draw(tempMc);
			tempMc = new alphabet_sm();
			alphabet_bm_sm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			tempMc.gotoAndStop(1);
			alphabet_bm_sm.draw(tempMc);
			tempMc = new health_meter_mc();
			health_meter = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 50;
				trans.ty = 0;
				health_meter.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new health_meter_back_mc();
			health_meter_back = new BitmapData(tempMc.width, tempMc.height, true, 0);
			health_meter_back.draw(tempMc);
			tempMc = new health_meter_shine_mc();
			health_meter_top = new BitmapData(tempMc.width, tempMc.height, true, 0);
			health_meter_top.draw(tempMc);
			tempMc = new ammo_meter_mc();
			ammo_meter = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 50;
				trans.ty = 0;
				ammo_meter.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new ammo_meter_back_mc();
			ammo_meter_back = new BitmapData(tempMc.width, tempMc.height, true, 0);
			ammo_meter_back.draw(tempMc);
			tempMc = new ammo_meter_top_mc();
			ammo_meter_top = new BitmapData(tempMc.width, tempMc.height, true, 0);
			ammo_meter_top.draw(tempMc);
			tempMc = new combo_meter_mc();
			combo_meter = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 175;
				trans.ty = 0;
				combo_meter.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new combo_meter_back_mc();
			combo_meter_back = new BitmapData(tempMc.width, tempMc.height, true, 0);
			combo_meter_back.draw(tempMc);
			tempMc = new combo_meter_top_mc();
			combo_meter_top = new BitmapData(tempMc.width, tempMc.height, true, 0);
			combo_meter_top.draw(tempMc);
			keyHeadsUp = new BitmapData(1, 1, true, 0);
			keyHeadsUpFun();
			tempMc = new hud_back_mc();
			hud_back = new BitmapData(tempMc.width, tempMc.height, true, 0);
			hud_back.draw(tempMc);
			tempMc = new cursor_mc();
			cursor = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 35;
				trans.ty = 0;
				cursor.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc=new tileSet.door_tileset_Cls();
			door_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			door_bm.draw(tempMc);
			tempMc = new door_keycard_mc();
			door_keycard_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			door_keycard_bm.draw(tempMc);
			tempMc = new health_mc();
			health_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			health_bm.draw(tempMc);
			tempMc = new time_mc();
			time_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			time_bm.draw(tempMc);
			tempMc=new tileSet.door_lock_tileset_Cls();
			door_lock_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 50;
				trans.ty = 0;
				door_lock_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new collectable_gunPiece();
			collectable_gunPiece_bm = new BitmapData(tempMc.width * 4, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 75;
				trans.ty = 0;
				collectable_gunPiece_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new disc_mc();
			disc_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				tempMc.g.gotoAndStop((a + 1));
				trans.tx = a * 60;
				trans.ty = 0;
				disc_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new briefcase_mc();
			briefcase_bm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			briefcase_bm.draw(tempMc);
			tempMc = new collectStar_yellow_mc();
			collectStar_yellow_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 8;
				trans.ty = 0;
				collectStar_yellow_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new collectStar_red_mc();
			collectStar_red_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 8;
				trans.ty = 0;
				collectStar_red_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new collectStar_blue_mc();
			collectStar_blue_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 8;
				trans.ty = 0;
				collectStar_blue_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}
			tempMc = new collectStar_white_mc();
			collectStar_white_bm = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 8;
				trans.ty = 0;
				collectStar_white_bm.draw(tempMc, trans);
				
				a  ++ ;
				
			}*/
		}
		
		
		
//		public var zhuchengBack:ZhuchengBackground;
		public var texture:BitmapData;
//		public var buildingContainer:Sprite;
		
		public function renderZhucheng():void{
			var player:Player=GameManager.manager.player;
			//			cameraX = $camerX - screenWidth * 0.5;
			//			cameraY = $camerY - screenHeight * 0.65 + 50;
			
			if ((((pauseState == 0)) || ((pauseState == 2)))){
				interpFun(((player.character_x + 0) + cameraShakeX), (player.character_y + cameraShakeY), ((player.character_xOld + 0) + cameraShakeXOld), (player.character_yOld + cameraShakeYOld));
			}
			//			else {
			//				interpFun(intro_cameraX, intro_cameraY, intro_cameraXOld, intro_cameraYOld);
			//			};
			cameraX = (interpFinal.x - (screenWidth * 0.5));
			cameraY = ((interpFinal.y - (screenHeight * 0.65)) + 50);
			if (cameraX < (viewRectX * 50 - cameraShakeX)){
				cameraX = (viewRectX * 50 - cameraShakeX);
			};
			if (cameraX > (((viewRectX1 * 50) - screenWidth) + cameraShakeX)){
				cameraX = (((viewRectX1* 50) - screenWidth) + cameraShakeX);
			};
			
			if (cameraY < (viewRectY*50 - cameraShakeY)){
				cameraY = (viewRectY*50 - cameraShakeY);
			};
			if (cameraY > ((viewRectY1*50 - screenHeight) + cameraShakeY)){
				cameraY = ((viewRectY1*50 - screenHeight) + cameraShakeY);
			};
			
			
			
			
//			trace("前 ："+cameraX+" / "+cameraY);
//			renderZhuchengBackground();
			
//			buildingContainer.x=-cameraX;
//			buildingContainer.y=-cameraY;
			
			bm.lock();
			
			bm.fillRect(bm.rect,0);
			
			
			
			var sx:int=int(cameraX/50);
			var sy:int=int(cameraY/50);
			
			if(sx<0) sx=0;
			if(sy<0) sy=0;
			
			var tw:int=texture.width/50;
			var th:int=texture.height/50;
			
			var ex:int=screenWidthTiles+2+sx;
			var ey:int=screenHeightTiles+2+sy;
			
			
			if(ex>level.level_width){
				ex=level.level_width;
			}
			if(ey>level.level_height){
				ey=level.level_height;
			}
			
			rect.width=50;
			rect.height=50;
			
			b=sy;
			while(b<ey){
				a=sx;
				while(a<ex){
					
					tileOn=level.level[b*level.level_width+a];
					if(tileOn>0){
						rect.x= ((tileOn-1)%tw)*50;
						rect.y= int(( tileOn-1 )/tw)*50;
						tempPoint.x=a*50-cameraX;
						tempPoint.y=b*50-cameraY;
						bm.copyPixels(texture,rect,tempPoint);
					}
					a++;
				}
				b++;
			}
			
			a = 0;
			SimpleParticle_bg.render();
			
			GameItemManager.getInstance().render()
			GameRolerManager.instance.render();
			GameManager.manager.player.render();
			
			Enemy.render();
			
			SimpleParticle.render();
			Particle.render();
			
			bm.unlock();
//			trace("后 ："+cameraX+" / "+cameraY);
		}
		
		private function renderZhuchengBackground():void{
//			zhuchengBack.render(cameraX,cameraY);
		}
		
		
		public function render():void{
			bm.lock();
			
			
				
			var player:Player=GameManager.manager.player;
//			cameraX = $camerX - screenWidth * 0.5;
//			cameraY = $camerY - screenHeight * 0.65 + 50;
			if(player){
				if ((((pauseState == 0)) || ((pauseState == 2)))){
					interpFun(((player.character_x + 0) + cameraShakeX), (player.character_y + cameraShakeY), ((player.character_xOld + 0) + cameraShakeXOld), (player.character_yOld + cameraShakeYOld));
				}
			}
			
//			else {
//				interpFun(intro_cameraX, intro_cameraY, intro_cameraXOld, intro_cameraYOld);
//			};
			cameraX = (interpFinal.x - (screenWidth * 0.5));
			cameraY = ((interpFinal.y - (screenHeight * 0.65)) + 50);
			if (cameraX < (0 - cameraShakeX)){
				cameraX = (0 - cameraShakeX);
			};
			if (cameraX > (((level.level_width * 50) - screenWidth) + cameraShakeX)){
				cameraX = (((level.level_width * 50) - screenWidth) + cameraShakeX);
			};
			if (cameraY < (0 - cameraShakeY)){
				cameraY = (0 - cameraShakeY);
			};
			if (cameraY > (((level.level_height * 50) - screenHeight) + cameraShakeY)){
				cameraY = (((level.level_height * 50) - screenHeight) + cameraShakeY);
			};
			
			
			
			rect.width = screenWidth;
//			rect.height = screenHeight - 80;
			rect.height = screenHeight;
			rect.x = cameraX;
			rect.y = cameraY;
			tempPoint.x = 0;
			tempPoint.y = 0;
			bm.copyPixels(level_bm, rect, tempPoint, null, null, false);
			a = 0;
			SimpleParticle_bg.render();
			
			
			Enemy.render();
			GameManager.manager.player.render();
			
			SimpleParticle.render();
			Particle.render();
			
			DamageUtil.render();
			
			bm.unlock();
		}
		
		
		private function keyHeadsUpFun():void
		{
			// warning
			/*trans = new Matrix();
			tempMc = new keyHeadsUp_mc();
			tempMc.key.gotoAndStop(k[5]);
			keyHeadsUp = new BitmapData(tempMc.width * tempMc.totalFrames, tempMc.height, true, 0);
			a = 0;
			while (a < tempMc.totalFrames)
			{
				
				tempMc.gotoAndStop((a + 1));
				trans.tx = a * 166;
				trans.ty = 0;
				keyHeadsUp.draw(tempMc, trans);
				
				a  ++ ;
				
			}*/
			return;
		}
		public function castShadow(param1:Number, param2:Number, param3:Number, param4:Number):void
		{
			tempRect_x = param1;
			tempRect_y = param2;
			tempRect_width = param3;
			tempRect_height = param4;
			tempRect_x_width = tempRect_x + tempRect_width;
			tempRect_y_height = tempRect_y + tempRect_height;
			if (Math.abs(tempRect_x + tempRect_width * 0.5 - tempLight.x) < tempRect_width * 0.5 + lightSizeHalf)
			{
				if (Math.abs(tempRect_y + tempRect_height * 0.5 - tempLight.y) < tempRect_height * 0.5 + lightSizeHalf)
				{
					lightMask.graphics.beginFill(shadowColor, 1);
					lightMask.graphics.moveTo(tempRect_x, tempRect_y);
					drawLine(tempRect_x, tempRect_x_width, tempRect_y, tempRect_y);
					drawLine(tempRect_x_width, tempRect_x_width, tempRect_y, tempRect_y_height);
					drawLine(tempRect_x_width, tempRect_x, tempRect_y_height, tempRect_y_height);
					drawLine(tempRect_x, tempRect_x, tempRect_y, tempRect_y);
					lightMask.graphics.endFill();
					if (tempLight.y > tempRect_y)
					{
						shadowFromLine(tempRect_x, tempRect_x_width, tempRect_y, tempRect_y);
					}
					if (tempLight.x < tempRect_x_width)
					{
						shadowFromLine(tempRect_x_width, tempRect_x_width, tempRect_y, tempRect_y_height);
					}
					if (tempLight.y < tempRect_y_height)
					{
						shadowFromLine(tempRect_x, tempRect_x_width, tempRect_y_height, tempRect_y_height);
					}
					if (tempLight.x > tempRect_x)
					{
						shadowFromLine(tempRect_x, tempRect_x, tempRect_y_height, tempRect_y);
					}
				}
			}
			return;
		}
		public function getRay(param1:Number, param2:Number, param3:Number, param4:Number):void
		{
			tempRise = param3 - param4;
			tempRun = param1 - param2;
			lineLength = 100;
			endPoint2.x = param1 + tempRun * lineLength;
			endPoint2.y = param3 + tempRise * lineLength;
			return;
		}
		public function drawRay(param1:Number, param2:Number, param3:Number, param4:Number):void
		{
			tempRise = param3 - param4;
			tempRun = param1 - param2;
			lineLength = 100;
			endPoint.x = param1 + tempRun * lineLength;
			endPoint.y = param3 + tempRise * lineLength;
			lightMask.graphics.lineTo(endPoint.x, endPoint.y);
			return;
		}
		public function shadowFromLine(param1:Number, param2:Number, param3:Number, param4:Number):void
		{
			lightMask.graphics.moveTo(param1, param3);
			lightMask.graphics.beginFill(shadowColor, 1);
			drawRay(param1, tempLight.x, param3, tempLight.y);
			getRay(param2, tempLight.x, param4, tempLight.y);
			drawLine(endPoint.x, endPoint2.x, endPoint.y, endPoint2.y);
			drawLine(endPoint2.x, param2, endPoint2.y, param4);
			drawLine(param2, param1, param4, param3);
			lightMask.graphics.endFill();
			return;
		}
		public function drawLine(param1:Number, param2:Number, param3:Number, param4:Number):void
		{
			lightMask.graphics.lineTo(param2, param4);
			return;
		}
		/** 绘制灯光 **/
		public function renderLight(param1:Number, param2:Number, param3:Number):void
		{
			tempLight.x = param1;
			tempLight.y = param2;
			if (param3 == 0)
			{
				lightSizeHalf = tileSet.light_bm_lg.width / 2;
				lightTexture = new BitmapData(tileSet.light_bm_lg.width / shadowMapScale, tileSet.light_bm_lg.width / shadowMapScale, false, 0);
			}
			else if (param3 == 1)
			{
				lightSizeHalf = tileSet.light_bm_md.width / 2;
				lightTexture = new BitmapData(tileSet.light_bm_md.width / shadowMapScale, tileSet.light_bm_md.height / shadowMapScale, false, 0);
			}
			else if (param3 == 2)
			{
				lightSizeHalf = tileSet.light_bm_sm.width / 2;
				lightTexture = new BitmapData(tileSet.light_bm_sm.width / shadowMapScale, tileSet.light_bm_sm.height / shadowMapScale, false, 0);
			}
			rect.x = 0;
			rect.y = 0;
			rect.width = lightTexture.width;
			rect.height = lightTexture.height;
			lightTexture.fillRect(rect, shadowColor);
			lightMask = new Shape();
			lightMatrix.tx = tempLight.x - lightSizeHalf;
			lightMatrix.ty = tempLight.y - lightSizeHalf;
			if (param3 == 0)
			{
				lightMask.graphics.beginBitmapFill(tileSet.light_bm_lg, lightMatrix, false, false);
			}
			else if (param3 == 1)
			{
				lightMask.graphics.beginBitmapFill(tileSet.light_bm_md, lightMatrix, false, false);
			}
			else if (param3 == 2)
			{
				lightMask.graphics.beginBitmapFill(tileSet.light_bm_sm, lightMatrix, false, false);
			}
			lightMask.graphics.moveTo(tempLight.x - lightSizeHalf, tempLight.y - lightSizeHalf);
			lightMask.graphics.lineTo(tempLight.x + lightSizeHalf, tempLight.y - lightSizeHalf);
			lightMask.graphics.lineTo(tempLight.x + lightSizeHalf, tempLight.y + lightSizeHalf);
			lightMask.graphics.lineTo(tempLight.x - lightSizeHalf, tempLight.y + lightSizeHalf);
			lightMask.graphics.lineTo(tempLight.x - lightSizeHalf, tempLight.y - lightSizeHalf);
			lightMask.graphics.endFill();
			b = 0;
			while (b < level.level_rect_x.length)
			{
				
				castShadow(level.level_rect_x[b], level.level_rect_y[b], level.level_rect_w[b], level.level_rect_h[b]);
				
				b  ++ ;
				
			}
			lightMatrix2 = new Matrix();
			lightMatrix2.scale(1 / shadowMapScale, 1 / shadowMapScale);
			shadowBuffer.draw(lightMask, lightMatrix2, null, "add", null, false);
			return;
		}
		
		
		public function interpFun(param1:Number, param2:Number, param3:Number, param4:Number):void
		{
			interpFinal.x=param1;
			interpFinal.y=param2;
			return ;
			/*tempInterpPoint.x = param1;
			tempInterpPoint.y = param2;
			tempInterpPointOld.x = param3;
			tempInterpPointOld.y = param4;
			interpFinal = Point.interpolate(tempInterpPointOld, tempInterpPoint, 0);*/

			return;
		}
		
		public function drawMapRect():void{
			return;
			a=0;
			while(a<level.level_rect_x.length){
				level_bm.fillRect(new Rectangle(level.level_rect_x[a],level.level_rect_y[a],level.level_rect_w[a],level.level_rect_h[a]),0xff0000+0xf0*a);
				a++;
			}
		}
		
		
		public function do_lights_fun():void{
//			return;
			if (finished_lights == false)
			{
				while (getTimer() - precompute_time < 100)
				{
					
					renderLight(level.light_x[light_num], level.light_y[light_num], level.light_s[light_num]);
					
					light_num  ++ ;
					
					if (light_num >= level.light_x.length)
					{
						finished_lights = true;
						a = 100000;
					}
				}
			}
			if (finished_lights == true)
			{
				lightMatrix2 = new Matrix();
				lightMatrix2.scale(shadowMapScale, shadowMapScale);
				shadowBuffer_bm = new Bitmap(shadowBuffer);
				shadowBuffer_bm.filters = [bf];
				level_bm.draw(shadowBuffer_bm, lightMatrix2, lightTransform, "overlay", null, false);
				rect.width = 50;
				rect.height = 50;
				a = 0;
				while (a < level.level_height)
				{
					
					b = 0;
					while (b < level.level_width)
					{
						
						tempPoint.x = b * 50;
						tempPoint.y = a * 50;
						tileOn = level.level[a * level.level_width + b];
						if (tileSet.id == 1)
						{
						}
						else if (tileSet.id == 3)
						{
							if (level.level_collidable[tileOn] == 1)
							{
								rect.x = tileOn * 50;
								rect.y = 0;
								level_bm.copyPixels(tileSet.tileSet_bm, rect, tempPoint, null, null, false);
							}
						}
						else if (tileSet.id == 4)
						{
							if (level.level_collidable[tileOn] == 1)
							{
								rect.x = tileOn * 50;
								rect.y = 0;
								level_bm.copyPixels(tileSet.tileSet_bm, rect, tempPoint, null, null, false);
							}
						}
						else if (tileSet.id == 6)
						{
							if (level.level_collidable[tileOn] == 1)
							{
								rect.x = tileOn * 50;
								rect.y = 0;
								level_bm.copyPixels(tileSet.tileSet_bm, rect, tempPoint, null, null, false);
							}
						}
						
						b  ++ ;
						
					}
					
					a  ++ ;
					
				}
				if (tileSet.id == 3)
				{
					lightMask = new Shape();
					lightMask.graphics.beginFill(4631);
					lightMask.graphics.drawRect(0, 0, level_bm.width, level_bm.height);
					lightMask.graphics.endFill();
					level_bm.draw(lightMask, null, null, "add", null, false);
				}
				else if (tileSet.id == 4)
				{
					lightMask = new Shape();
					lightMask.graphics.beginFill(1317152);
					lightMask.graphics.drawRect(0, 0, level_bm.width, level_bm.height);
					lightMask.graphics.endFill();
					level_bm.draw(lightMask, null, null, "add", null, false);
				}
				else if (tileSet.id == 6)
				{
					lightMask = new Shape();
					lightMask.graphics.beginFill(2040590);
					lightMask.graphics.drawRect(0, 0, level_bm.width, level_bm.height);
					lightMask.graphics.endFill();
					level_bm.draw(lightMask, null, null, "add", null, false);
				}
				dispose_of_light_stuff();
			}
			
		}
		
		public function dispose_of_light_stuff():void
		{
			lightMask = new Shape();
			level.light_x = [];
			level.light_y = [];
			level.light_s = [];
			shadowBuffer = new BitmapData(1, 1, false, shadowColor);
			lightTexture = new BitmapData(1, 1, false, 0);
			shadowBuffer_bm = new Bitmap(shadowBuffer);
			tileSet.light_bm_lg = new BitmapData(1, 1, true, 0);
			tileSet.light_bm_md = new BitmapData(1, 1, true, 0);
			tileSet.light_bm_sm = new BitmapData(1, 1, true, 0);
			tileSet.occlusion_bm = new BitmapData(1, 1, true, 0);
			System.gc();
			return;
		}// end function
		
		/** 给格子添加渐变光效 , 在格子的边缘会产生阴影效果  **/
		public function createGridOcclusion():void{
			
			tempMc =new tileSet.occlusion_mc_Cls();
			/*occlusion_bm = new BitmapData(50 * 12, 50, true, 0);
			trans = new Matrix();
			a = 0;
			while (a < 12)
			{
				tempMc.gotoAndStop((a + 1));
				occlusion_bm.draw(tempMc, trans, null, null, null, true);
				trans.translate(50, 0);
				a  ++ ;
			}*/
			
			rect.y = 0;
			rect.width = 50;
			rect.height = 50;
			a = 0;
			var occlusionMap:Array=level.occlusionMap;
			while (a < occlusionMap.length)
			{
				
				rect.x = occlusionMap[a] * 50;
				tempPoint.x = a % level.level_width * 50;
				tempPoint.y = int(a / level.level_width) * 50;
				if (occlusionMap[a] > -1)
				{
					trans.tx = tempPoint.x;
					trans.ty = tempPoint.y;
					tempMc.gotoAndStop((occlusionMap[a] + 1));
					level_bm.draw(tempMc, trans, null, "darken", null, true);
				}
				a  ++ ;
			}
		}
		
		/** 创建后面格子 背景 **/
		public function createGridBackground():void{
			level_bm = new BitmapData(level.level_width * 50, level.level_height * 50, false, 0);
			a = 0;
			while (a < level.level_height)
			{
				
				b = 0;
				while (b < level.level_width)
				{
					
					tempPoint.x = b * 50;
					tempPoint.y = a * 50;
					tileOn = level.level[a * level.level_width + b];
					rect.x = tileOn * 50;
					rect.y = 0;
					rect.width = 50;
					rect.height = 50;
					level_bm.copyPixels(tileSet.tileSet_bm, rect, tempPoint, null, null, false);
					b  ++ ;
				}
				a  ++ ;
			}
		}
		/** 振动屏幕 **/
		public function cameraShakeFun(shakeTime:Number):void{
			
		}
	}
}