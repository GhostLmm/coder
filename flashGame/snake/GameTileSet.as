package snake
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import fl.motion.AdjustColor;

	public class GameTileSet
	{
		public function GameTileSet()
		{
		}
		
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
		
		public var id:int;
		public var tileSet_collidable:Array;
		public var userMapColor:uint;
		public var tileSet_bm:BitmapData;
		public var tileSet_width:int;
		public var tileSet_numOfTiles:int;
		
		public var ligth_Map:Object;
		
		public var light_bm_lg:BitmapData;
		public var light_bm_md:BitmapData;
		public var light_bm_sm:BitmapData;
		public var occlusion_bm:BitmapData;
		
		public var globalIllumination:Number=0.5;
		public var levelColorFilter:AdjustColor;
		
		public var door_tileset_Class:Class;
		public var door_lock_tileset_Cls:Class;
		public var door_tileset_Cls:Class;
		public var occlusion_mc_Cls:Class;
		
		private function initDataTile_1():void{
			tileSet_collidable = new Array(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1);
			userMapColor=7050535;
			/*var tempMc:MovieClip=new tileSet_1();
			tempMc.cacheAsBitmap = true;
			tileSet_bm = new BitmapData(50 * tempMc.totalFrames, 50, false, 0);
			tileSet_width = int(tileSet_bm.width / 50);
			tileSet_numOfTiles = tempMc.totalFrames;
			
			a = 0;
			while (a < tileSet_numOfTiles)
			{
				
				tempMc.gotoAndStop((a + 1));
				tileSet_bm.draw(tempMc, trans);
				trans.translate(50, 0);
				a  ++ ;
			}*/
			
			ligth_Map={55:{radius:25,type:0},78:{radius:25,type:1}};
			
			tempMc = new light_mc1();
			tempMc.gotoAndStop(id);
			light_bm_lg = new BitmapData(tempMc.width, tempMc.height, true, 0);
			light_bm_lg.draw(tempMc);
			tempMc = new light_mc2();
			tempMc.gotoAndStop(id);
			light_bm_md = new BitmapData(tempMc.width, tempMc.height, true, 0);
			light_bm_md.draw(tempMc);
			tempMc = new light_mc3();
			tempMc.gotoAndStop(id);
			light_bm_sm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			light_bm_sm.draw(tempMc);
			
			/*tempMc = new occlusion_mc_1();
			occlusion_bm = new BitmapData(50 * 12, 50, true, 0);
			trans = new Matrix();
			a = 0;
			while (a < 12)
			{
				tempMc.gotoAndStop((a + 1));
				occlusion_bm.draw(tempMc, trans, null, null, null, true);
				trans.translate(50, 0);
				a  ++ ;
			}*/
//			door_tileset_Class=door_tileset1;
//			door_lock_tileset_Cls=door_lock_tileset1;
//			door_tileset_Cls=door_tileset1;
//			occlusion_mc_Cls=occlusion_mc_1;
			
			levelColorFilter.brightness = -15;
			levelColorFilter.contrast = 5;
			levelColorFilter.saturation = -25;
			levelColorFilter.hue = 0;
			
			globalIllumination = 0.6;
		}
		
		private function initDataTile_3():void{
//			tileSet_collidable = new Array(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
			
			tileSet_collidable=GameManager.manager.mapInfo.tileSet_collidable;
			
			userMapColor = 8831188;
			/*var tempMc:MovieClip=new tileSet_3();
			tempMc.cacheAsBitmap = true;
			tileSet_bm = new BitmapData(50 * tempMc.totalFrames, 50, false, 0);
			tileSet_width = int(tileSet_bm.width / 50);
			tileSet_numOfTiles = tempMc.totalFrames;
			
			a = 0;
			while (a < tileSet_numOfTiles)
			{
				
				tempMc.gotoAndStop((a + 1));
				tileSet_bm.draw(tempMc, trans);
				trans.translate(50, 0);
				a  ++ ;
			}*/
			
			ligth_Map={86:{radius:25,type:0},39:{radius:25,type:2}};
			
			/*tempMc = new light_mc1();
			tempMc.gotoAndStop(id);
			light_bm_lg = new BitmapData(tempMc.width, tempMc.height, true, 0);
			light_bm_lg.draw(tempMc);
			tempMc = new light_mc2();
			tempMc.gotoAndStop(id);
			light_bm_md = new BitmapData(tempMc.width, tempMc.height, true, 0);
			light_bm_md.draw(tempMc);
			tempMc = new light_mc3();
			tempMc.gotoAndStop(id);
			light_bm_sm = new BitmapData(tempMc.width, tempMc.height, true, 0);
			light_bm_sm.draw(tempMc);*/
			
			/*tempMc = new occlusion_mc_3();
			occlusion_bm = new BitmapData(50 * 12, 50, true, 0);
			trans = new Matrix();
			a = 0;
			while (a < 12)
			{
				tempMc.gotoAndStop((a + 1));
				occlusion_bm.draw(tempMc, trans, null, null, null, true);
				trans.translate(50, 0);
				a  ++ ;
			}*/
//			door_tileset_Class=door_tileset3;
//			door_lock_tileset_Cls=door_lock_tileset3;
//			door_tileset_Cls=door_tileset3;
//			occlusion_mc_Cls=occlusion_mc_3;
			
			levelColorFilter.brightness = 25;
			levelColorFilter.contrast = 10;
			levelColorFilter.saturation = -40;
			levelColorFilter.hue = 0;
			
//			levelColorFilter.brightness = 50;
//			levelColorFilter.contrast = 20;
//			levelColorFilter.saturation = -20;
//			levelColorFilter.hue = 0;
			
			globalIllumination = 0.7;
		}
		
		private function initData($id:int):void{
			var time:int=getTimer();
			id=$id;
			levelColorFilter = new AdjustColor();
			if(id==1){
				initDataTile_1();
			}
			if(id==3){
				initDataTile_3();
			}
			trace("tileset init ："+(getTimer()-time));
		}
		
		public static function createTileSet($id:int):GameTileSet
		{
			var tileSet:GameTileSet=new GameTileSet();
			tileSet.initData($id);
			return tileSet;
		}
	}
}