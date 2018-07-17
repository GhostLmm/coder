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

	internal class CharAnkle
	{
		public static const AppearanceIndex:Array=[4];
		public static const ColorIndex:Array=[8];
		public static var tempMc:MovieClip;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var character_colorTransform:ColorTransform;
		
		
		public var char_ankle:Sprite=new Sprite();
		public var char_ankle_bm:BitmapData;
		public var key:String;
		
		public function CharAnkle(character_appearance:Array,character_colors:Array)
		{
			key=GameAssetPool.createCharPartKey(character_appearance,character_appearance,AppearanceIndex,ColorIndex);
			if(tempMc==null) tempMc = new character_ankle_mc();
			tempMc.gotoAndStop(character_appearance[4]);
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = character_colors[8];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			char_ankle_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			char_ankle_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			char_ankle.graphics.clear();
			char_ankle.graphics.beginBitmapFill(char_ankle_bm, trans, false, false);
			char_ankle.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
		}
	}
}