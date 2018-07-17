package ui.widget
{
	import Tool.ImageCache;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	
	public class BaseImage extends Sprite
	{
		private var _bitmap:Bitmap;
		private var _imageName:String;
		private var _blankBitdata:BitmapData
		public function BaseImage($blankBit:BitmapData,$imageName:String)
		{
			super();
			_blankBitdata=$blankBit;
			_bitmap=new Bitmap();
			_bitmap.bitmapData=$blankBit;
			_imageName=$imageName;
			ImageCache.getImageData(_imageName,this);
			this.addChild(_bitmap);
		}
		
		public function resetBitmapdata($data:BitmapData):void
		{
			if(_bitmap && $data){
				_bitmap.bitmapData=$data;
			}
		}
		
		public function setImageName($imageName:String):void
		{
			_bitmap.bitmapData=_blankBitdata;
			ImageCache.getImageData(_imageName,this);
		}
		
		public function destory():void
		{
			_bitmap=null;
			this.removeChildren();
			ImageCache.clearInject(_imageName,this);
		}
		
		
		
	}
}