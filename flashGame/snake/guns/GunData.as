package snake.guns
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	import snake.BattleAssetPreload;
	import snake.GameCanvas;
	import snake.GameLevel;
	import snake.GameObjective;
	import snake.GameSoundSFX;
	import snake.GameTileSet;
	
	import util.Dict;

	public class GunData
	{
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
		public static var tileOn:int;
		public static var enemy_dX:Number;
		public static var enemy_dY:Number;
		public static var enemy_tempRise:Number;
		public static var enemy_tempRun:Number;
		public static var enemy_dist:Number;
		public static var enemy_isMoving:Boolean;
		public static var tempScoreQue:String;
		public static var enemy_tempPos_x:int;
		public static var enemy_tempPos_y:int;
		public static var enemy_tempPos_face:int;
		public static var character_colorTransform:ColorTransform;
		public static var tempGunBM:BitmapData;
		
		public static var level:GameLevel;
		public static var tileSet:GameTileSet;
		public static var canvas:GameCanvas;
		public static var assetConfig:BattleAssetPreload;
		
		public static var sound:GameSoundSFX;
		public static var objective:GameObjective;
		
		public static var numberOfGuns:int=21;
		public function GunData()
		{
			
		}
		
		public var gunShoulder_x:int;
		public var gunShoulder_y:int;
		public var gun_barrel_x:Number;
		public var gun_barrel_y:Number;
		public var gun_eject_x:int;
		public var gun_eject_y:int;
		public var gun_dist:int;
		public var gun_coolDown:int;
		public var gun_auto:int;
		public var gun_casingType:int;
		public var gun_bulletType:int;
		public var gun_isIncindiary:int;
		public var gun_frameToEjectShellOn:int;
		public var gun_names:String;
		public var gun_sfx:int;
		public var gun_atp:int;
		public var gun_atp_enemy:int;
		public var gun_mag_size:int;
		public var gun_ammo:int;
		public var gun_total_ammo:int;
		public var gun_reload_time:int;
		public var gun_recoil_x:Number;
		public var gun_recoil_rot:Number;
		public var gun_recoil_dampening:Number;
		public var gun_recoil_xRecover:Number;
		public var gun_hasReloadAnim:int;
		public var gun_magDropFrame:int;
		public var gun_magType:int;
		public var gun_reload_x:Number;
		public var gun_reload_y:Number;
		public var gun_reload_w:Number;
		public var gun_reload_mag_x:Number;
		public var gun_reload_mag_y:Number;
//		public var shellHeight:Number;
		public var gunFrames:Array;
		
		
		
		public static var gunDataVect:Dict;
//		public static var enemyGunAssetVect:Vector.<EnemyGunAsset>;
		public static var enemyGunAssetDict:Dictionary;
		private static var maxGunAssetFrame:int=9;
		
		public static function init():void{
			enemyGunAssetDict=assetConfig.enemyGunAssetDict;
			gunDataVect=assetConfig.gunDataVect;
		}
	}
}