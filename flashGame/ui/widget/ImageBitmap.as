package ui.widget
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Tool.ImageCache;
	public class ImageBitmap extends Sprite  implements IComponent
	{
		public static const TopLeft:int=0;
		public static const Middle:int=2;
		public static const BottomLeft:int=3;
		private var _imageName:String;
		protected var _bitmap:Bitmap;
		private var _smallLoading:MovieClip;
		
		private var dynamicLoad:Boolean=false;
		
		private var sizeX:int;
		private var sizeY:int;
		private var _align:int;
		
		public function ImageBitmap($imagName:String,$align:int=0)
		{
			super();
			_align=$align;
			_imageName=$imagName;
			//			addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			_bitmap=new Bitmap();
			
			var bit:BitmapData=BitdataChache.getSmallImgCache(_imageName);
			if(bit){
				dynamicLoad=true;
				_bitmap.bitmapData=bit;
			}else{
				_bitmap.bitmapData=BitdataChache.getBitdata(_imageName);
			}
			
			
			if(_bitmap.bitmapData==null){
				
				if(_imageName.indexOf("icon")==-1){
					return ;
				}
				
				dynamicLoad=true;
				_smallLoading=new (AssetManager.getAssetClass("McLoadingSmall") as Class)(); 
				_smallLoading.width=100;
				_smallLoading.height=100;
				this.addChild(_smallLoading);
				ImageCache.GetImageWitCallBack_UseCache(_imageName+".png",onLoadComplete);
				
			}else{
				this.addChild(_bitmap);
				switch ($align){
					case Middle:
						_bitmap.x=-_bitmap.width/2;
						_bitmap.y=-_bitmap.height/2;
						break;
					case BottomLeft:
						_bitmap.x=0;
						_bitmap.y=-_bitmap.height;
				}
			}
			
			
		}
		
		private function onLoadComplete(url:String, bmd:BitmapData):void{
			if(_smallLoading){
				_smallLoading.stop();
				_smallLoading=null;
			}
			this.removeChildren();
			
			BitdataChache.setSmallBitcache(url.substr(0,url.length-4),bmd);
			
			if(_bitmap){
				_bitmap.bitmapData=bmd;
				this.addChild(_bitmap);
				switch (_align){
					case Middle:
						_bitmap.x=-_bitmap.width/2;
						_bitmap.y=-_bitmap.height/2;
						break;
					case BottomLeft:
						_bitmap.x=0;
						_bitmap.y=-_bitmap.height;
				}
			}
			
			
		}
		
		private function analyzeSize():void{
			var array:Array=_imageName.split("_s");
			if(array.length>=2){
				
			}
		}
		
		
		
		
		public function destory():void
		{
			if(dynamicLoad){
				if(_smallLoading){
					_smallLoading.stop();
					_smallLoading=null;
				}
			}else{
				if(_bitmap) {
					if(_bitmap.bitmapData && !dynamicLoad && !Preload.ResidentImagCls[_imageName])
						_bitmap.bitmapData.dispose();
					_bitmap.bitmapData=null;
					_bitmap=null}
			}
			
			this.removeChildren();
		}
	}
}


