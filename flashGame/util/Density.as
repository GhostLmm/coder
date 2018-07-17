package util
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public final class Density
	{
		public static const WIDTH:int = 960;
//		public static const HEIGHT:int = 1960;
		public static const HEIGHT:int = 640;
		public static var fullScreenWidth:uint;
		public static var fullScreenHeight:uint;
		private static var _scale:Number = 1.0;
		private static var _offset:Point = new Point();
		
		public static function initialize(stage:Stage):void {
			fullScreenWidth = stage.fullScreenWidth;
			fullScreenHeight = stage.fullScreenHeight;
			var scale_x:Number = fullScreenWidth / WIDTH;
			var scale_y:Number = fullScreenHeight / HEIGHT;
			_scale = scale_x < scale_y ? scale_x : scale_y;
			offset.x = (fullScreenWidth - WIDTH*scale) / 2;
			offset.y = (fullScreenHeight - HEIGHT*scale) / 2;
		}
		
		public static function zoom(object:DisplayObject):void {
			object.scaleX = scale;
			object.scaleY = scale;
			object.x = object.x*scale + offset.x;
			object.y = object.y*scale + offset.y;
		}
		
		public static function unzoom(object:*):void {
			object.width = object.width/scale;
			object.height = object.height/scale;
			object.x = (object.x-offset.x)/scale;
			object.y = (object.y-offset.y)/scale;
		}
		
		public static function genRectangle(x:Number=0, y:Number=0, width:Number=0, height:Number=0):Rectangle
		{
			return new Rectangle(x*scale,y*scale,width,height);
		}

		public static function get offset():Point
		{
			return _offset;
		}

		public static function get scale():Number
		{
			return _scale;
		}


	}
}