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
	

	public class GunBaseAsset
	{
		public static const HandFrame:int=1;
		public static const matrix:Array=[
			1, 0, 0, 0, 0,  
			0, 0, 0, 0, 0,  
			0, 0, 0, 0, 0,  
			0, 0, 0, 1, 0];
		public static const myfilter:ColorMatrixFilter=new ColorMatrixFilter(matrix);

		public static const AppearanceIndex:Array=[3];
		public static const ColorIndex:Array=[6];
		public static var tempMc:MovieClip;
		
		public static var a:int;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var character_colorTransform:ColorTransform;
		public static var tempGunBM:BitmapData;
		
		public var gun_right:Vector.<Sprite>;
		public var gun_left:Vector.<Sprite>;
		public var key:String;
		
		public function GunBaseAsset(weapon:int,needFirstFrame:Boolean=false)
		{
			gun_right=new Vector.<Sprite>();
			gun_left=new Vector.<Sprite>();
			key=GameAssetPool.createGunKey(weapon);
			var node:Node_gun=XMLDataManager.getGunById(weapon);
			tempMc=new (ApplicationDomain.currentDomain.getDefinition("gun"+node.gun_appearence) as Class)();
//			tempMc.transform.colorTransform.color= uint(node.gun_color);
//			tempMc.filters = [myfilter];
			
			a = 0;
			while (a < tempMc.totalFrames / 2)
			{					
				if(needFirstFrame && a!=0) break;
				trans = new Matrix();
				tempMc.gotoAndStop((a + 1));
				tempMc.hand1.gotoAndStop(HandFrame);
				tempMc.hand2.gotoAndStop(HandFrame);
//				character_colorTransform = tempMc.hand1.color1.transform.colorTransform;
//				character_colorTransform.color = character_colors[6];
//				tempMc.hand1.color1.transform.colorTransform = character_colorTransform;
//				character_colorTransform = tempMc.hand2.color1.transform.colorTransform;
//				character_colorTransform.color = character_colors[6];
//				tempMc.hand2.color1.transform.colorTransform = character_colorTransform;
				tempGunBM = new BitmapData(tempMc.width, tempMc.height, true, 0);
				tempGunBM.draw(tempMc, trans, null, null, null, true);
				trans.translate(-tempMc.pivot.x, -tempMc.pivot.y);
				var gunRightSprite:Sprite=new Sprite();
				gun_right.push(gunRightSprite);
				gunRightSprite.graphics.clear();
				gunRightSprite.graphics.beginBitmapFill(tempGunBM, trans, false, true);
				gunRightSprite.graphics.drawRect(-tempMc.pivot.x, -tempMc.pivot.y, tempMc.width, tempMc.height);					
				a  ++ ;					
			}
			
			
			a = 0;
			while (a < tempMc.totalFrames / 2)
			{		
				if(needFirstFrame && a!=0) break;
				trans = new Matrix();
				tempMc.gotoAndStop(a + tempMc.totalFrames / 2 + 1);
				tempMc.hand1.gotoAndStop(HandFrame);
				tempMc.hand2.gotoAndStop(HandFrame);
				tempMc.hand3.gotoAndStop(HandFrame);
//				character_colorTransform = tempMc.hand1.color1.transform.colorTransform;
//				character_colorTransform.color = character_colors[6];
//				tempMc.hand1.color1.transform.colorTransform = character_colorTransform;
//				character_colorTransform = tempMc.hand2.color1.transform.colorTransform;
//				character_colorTransform.color = character_colors[6];
//				tempMc.hand2.color1.transform.colorTransform = character_colorTransform;
				tempGunBM = new BitmapData(tempMc.width, tempMc.height, true, 0);
				tempGunBM.draw(tempMc, trans, null, null, null, true);
				trans.translate(-tempMc.pivot.x, -tempMc.pivot.y);
				var gunLeftSprite:Sprite=new Sprite();
				gun_left.push(gunLeftSprite);
				gunLeftSprite.graphics.clear();
				gunLeftSprite.graphics.beginBitmapFill(tempGunBM, trans, false, true);
				gunLeftSprite.graphics.drawRect(-tempMc.pivot.x, -tempMc.pivot.y, tempMc.width, tempMc.height);					
				a  ++ ;					
			}
			tempMc=null;
		}
	}
}