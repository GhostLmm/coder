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

	internal class CharHand
	{
		public static const AppearanceIndex:Array=[4];
		public static const ColorIndex:Array=[8];
		public static var tempMc1:MovieClip;
		public static var tempMc2:MovieClip;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var character_colorTransform:ColorTransform;
		
		
		public var char_hand1:Sprite=new Sprite();
		public var char_hand1_bm:BitmapData;
		public var char_hand2:Sprite=new Sprite();
		public var char_hand2_bm:BitmapData;
		public var key:String;
		public function CharHand(character_appearance:Array,character_colors:Array)
		{
			key=GameAssetPool.createCharPartKey(character_appearance,character_appearance,AppearanceIndex,ColorIndex);
			if(tempMc1==null) tempMc1 = new character_hand1_mc();
			tempMc1.gotoAndStop(character_appearance[3]);
			character_colorTransform = tempMc1.color1.transform.colorTransform;
			character_colorTransform.color = character_colors[6];
			tempMc1.color1.transform.colorTransform = character_colorTransform;
			char_hand1_bm = new BitmapData(tempMc1.box.width, tempMc1.box.height, true, 0);
			tempMc1.box.visible = false;
			tempMc1.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc1.box.x);
			trans.ty = -(tempMc1.box.y);
			char_hand1_bm.draw(tempMc1, trans);
			trans.tx = tempMc1.box.x;
			trans.ty = tempMc1.box.y;
			char_hand1.graphics.clear();
			char_hand1.graphics.beginBitmapFill(char_hand1_bm, trans, false, true);
			
			char_hand1.graphics.drawRect(tempMc1.box.x, tempMc1.box.y, tempMc1.box.width, tempMc1.box.height);
			
			if(tempMc2==null) tempMc2 = new character_hand2_mc();
			tempMc2.gotoAndStop(character_appearance[3]);
			character_colorTransform = tempMc2.color1.transform.colorTransform;
			character_colorTransform.color = character_colors[6];
			tempMc2.color1.transform.colorTransform = character_colorTransform;
			char_hand2_bm = new BitmapData(tempMc2.box.width, tempMc2.box.height, true, 0);
			tempMc2.box.visible = false;
			tempMc2.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc2.box.x);
			trans.ty = -(tempMc2.box.y);
			char_hand2_bm.draw(tempMc2, trans);
			trans.tx = tempMc2.box.x;
			trans.ty = tempMc2.box.y;
			char_hand2.graphics.clear();
			char_hand2.graphics.beginBitmapFill(char_hand2_bm, trans, false, true);
			
			char_hand2.graphics.drawRect(tempMc2.box.x, tempMc2.box.y, tempMc2.box.width, tempMc2.box.height);
		}
	}
}