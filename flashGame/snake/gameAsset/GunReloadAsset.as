package snake.gameAsset
{
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.system.ApplicationDomain;
	
	import snake.BattleAssetPreload;
	import snake.GameManager;
	import snake.guns.GunData;

	public class GunReloadAsset
	{
		public static const AppearanceIndex:Array=[3];
		public static const ColorIndex:Array=[6];
		public static var tempMc:MovieClip;
		
		public static var a:int;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var character_colorTransform:ColorTransform;
		public static var tempGunBM:BitmapData;
		
		public var gun_reload_right:BitmapData;
		public var gun_reload_left:BitmapData;
		
		public var key:String;
		
		public function GunReloadAsset(weapon:int)
		{
			key=GameAssetPool.createGunKey(weapon);
//			var gunId:int=BattleAssetPreload.convertIndexToId(weapon);
			var gunNode:Node_gun=XMLDataManager.getGunById(weapon);
			if (gunNode.gun_hasReloadAnim == 1)
			{
				tempMc=new (ApplicationDomain.currentDomain.getDefinition("gun"+gunNode.gun_appearence+"_reload") as Class)();
//				tempMc.filters = [GunBaseAsset.myfilter];
//				tempMc.transform.colorTransform.color= uint(gunNode.gun_color);
				var gunData:GunData=BattleAssetPreload.getInstance().gunDataVect[weapon];
				//					var gunAsset:GunAsset=gunAssetVect[b];
				trans = new Matrix();
				gun_reload_right = new BitmapData(tempMc.width * (tempMc.totalFrames / 2), tempMc.height, true, 0);
				gunData.gun_reload_x = -tempMc.origin.x;
				gunData.gun_reload_y = -tempMc.origin.y;
				gunData.gun_reload_w = tempMc.width;
				gunData.gun_reload_mag_x = tempMc.mag.x;
				gunData.gun_reload_mag_y = tempMc.mag.y;
				a = 0;
				while (a < tempMc.totalFrames / 2)
				{
					
					tempMc.gotoAndStop((a + 1));
					tempMc.hand1.gotoAndStop(GunBaseAsset.HandFrame);
					tempMc.hand2.gotoAndStop(GunBaseAsset.HandFrame);
//					character_colorTransform = tempMc.hand1.color1.transform.colorTransform;
//					character_colorTransform.color = character_colors[6];
//					tempMc.hand1.color1.transform.colorTransform = character_colorTransform;
//					character_colorTransform = tempMc.hand2.color1.transform.colorTransform;
//					character_colorTransform.color = character_colors[6];
//					tempMc.hand2.color1.transform.colorTransform = character_colorTransform;
					gun_reload_right.draw(tempMc, trans, null, null, null, true);
					trans.translate(tempMc.width, 0);
					
					a  ++ ;
					
				}
				trans = new Matrix();
				trans.scale(-1, 1);
				gun_reload_left = new BitmapData(tempMc.width * (tempMc.totalFrames / 2), tempMc.height, true, 0);
				trans.translate(tempMc.width, 0);
				a = 0;
				while (a < (tempMc.totalFrames / 2))
				{
					
					tempMc.gotoAndStop(((a + (tempMc.totalFrames / 2)) + 1));
					tempMc.hand1.gotoAndStop(GunBaseAsset.HandFrame);
					tempMc.hand2.gotoAndStop(GunBaseAsset.HandFrame);
					tempMc.hand3.gotoAndStop(GunBaseAsset.HandFrame);
//					character_colorTransform = tempMc.hand1.color1.transform.colorTransform;
//					character_colorTransform.color = character_colors[6];
//					tempMc.hand1.color1.transform.colorTransform = character_colorTransform;
//					character_colorTransform = tempMc.hand2.color1.transform.colorTransform;
//					character_colorTransform.color = character_colors[6];
//					tempMc.hand2.color1.transform.colorTransform = character_colorTransform;
					gun_reload_left.draw(tempMc, trans, null, null, null, true);
					trans.translate(tempMc.width, 0);
					
					a  ++ ;
					
					
				}
			}
		}
	}
}