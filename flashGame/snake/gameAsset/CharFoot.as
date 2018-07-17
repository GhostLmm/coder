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

	internal class CharFoot
	{
		public static const AppearanceIndex:Array=[4];
		public static const ColorIndex:Array=[8,9];
		public static var tempMc:MovieClip;
		public static var trans:Matrix=new Matrix();
		public static var rect:Rectangle=new Rectangle();
		public static var character_colorTransform:ColorTransform;
		
		
		public var char_foot:Sprite=new Sprite();
		public var char_foot_bm:BitmapData;
		public var key:String;
		
		public function CharFoot(character_appearance:Array,character_colors:Array)
		{
			key=GameAssetPool.createCharPartKey(character_appearance,character_appearance,AppearanceIndex,ColorIndex);
			if(tempMc==null) tempMc = new character_foot_mc();
			tempMc.gotoAndStop(character_appearance[4]);
			char_foot_bm = new BitmapData(tempMc.box.width, tempMc.box.height, true, 0);
			tempMc.box.visible = false;
			tempMc.filters = [new ColorMatrixFilter(GameManager.manager.tileSet.levelColorFilter.CalculateFinalFlatArray())];
			character_colorTransform = tempMc.color1.transform.colorTransform;
			character_colorTransform.color = character_colors[8];
			tempMc.color1.transform.colorTransform = character_colorTransform;
			character_colorTransform = tempMc.color2.transform.colorTransform;
			character_colorTransform.color = character_colors[9];
			tempMc.color2.transform.colorTransform = character_colorTransform;
			trans = new Matrix();
			trans.tx = -(tempMc.box.x);
			trans.ty = -(tempMc.box.y);
			char_foot_bm.draw(tempMc, trans);
			trans.tx = tempMc.box.x;
			trans.ty = tempMc.box.y;
			char_foot.graphics.clear();
			char_foot.graphics.beginBitmapFill(char_foot_bm, trans, false, true);
			
			char_foot.graphics.drawRect(tempMc.box.x, tempMc.box.y, tempMc.box.width, tempMc.box.height);
		}
	}
}