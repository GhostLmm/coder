package snake.gameAsset
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import snake.GameManager;

	internal class CharHead
	{
		public static const AppearanceIndex:Array=[0,1,5];
		public static const ColorIndex:Array=[0,2,3];
		public static var tempMc:MovieClip;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var character_colorTransform:ColorTransform;
		
		
		public var char_head:Sprite=new Sprite();
		public var char_head_bm:BitmapData;
		public var key:String;
		
		
		
		public function CharHead(character_appearance:Array,character_colors:Array)
		{
			key=GameAssetPool.createCharPartKey(character_appearance,character_appearance,AppearanceIndex,ColorIndex);
			if(tempMc==null){
				tempMc=new character_head_mc();
			}
			tempMc.gotoAndStop(character_appearance[0]);
			tempMc.eye.gotoAndStop(character_appearance[1]);
			tempMc.face.gotoAndStop(character_appearance[5]);
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = character_colors[0];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.color2.transform.colorTransform;
			character_colorTransform.color = character_colors[1];
			tempMc.color2.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.color3.transform.colorTransform;
			character_colorTransform.color = character_colors[0];
			tempMc.color3.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.eye.color1.transform.colorTransform;
			character_colorTransform.color = character_colors[2];
			tempMc.eye.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.eye.color2.transform.colorTransform;
			character_colorTransform.color = character_colors[3];
			tempMc.eye.color2.transform.colorTransform = character_colorTransform;
			char_head_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			char_head_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			char_head.graphics.clear();
			char_head.graphics.beginBitmapFill(char_head_bm, trans, false, true);
			
			char_head.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
		}
	}
}