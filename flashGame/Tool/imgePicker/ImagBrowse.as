package Tool.imgePicker
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.MediaEvent;
	import flash.geom.Rectangle;
	import flash.media.CameraRoll;
	import flash.media.CameraRollBrowseOptions;
	import flash.media.MediaPromise;
	
	/**    flash内部支持 的图片选择， 没有图片切割功能
	 * */
	public class ImagBrowse extends EventDispatcher
	{
		public static const Complete:String="complete";
		public static const Cancle:String="cancle";
		public static const ErrorStats:String="error";
		
		
		public function ImagBrowse(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		
		private var imageLoader:Loader; 
		private var _bitdata:BitmapData;
		
		public function get bitData():BitmapData
		{
			return _bitdata;
		}
		/**  开始选择图片， 在此之前应该先注册事件
		 * */
		public function startBrowse():void
		{
			var cameraRoll:CameraRoll = new CameraRoll(); 
			if( CameraRoll.supportsBrowseForImage ) 
			{ 
				cameraRoll.addEventListener( MediaEvent.SELECT, imageSelected ); 
				cameraRoll.addEventListener( Event.CANCEL, browseCanceled ); 
				cameraRoll.addEventListener( ErrorEvent.ERROR, mediaError ); 
				cameraRoll.browseForImage(); 
			} 
			else { 
				trace( "Image browsing is not supported on this device."); 
				dispatchEvent(new Event(ErrorStats));
			} 
		}
		
		public function clear():void
		{
			if(imageLoader!=null)
			{
				imageLoader.contentLoaderInfo.removeEventListener( Event.COMPLETE, imageLoaded );
				imageLoader.contentLoaderInfo.removeEventListener( IOErrorEvent.IO_ERROR, imageLoadFailed );
				try
				{
					imageLoader.close();
				}
				catch(e:Error){
				}
				imageLoader=null;
			}
			if(_bitdata!=null)
			{
				_bitdata.dispose();
				_bitdata=null;
			}
		}
			
			
		
		private function imageSelected(evt:MediaEvent):void
		{
			trace( "Media selected..." ); 
			var imagePromise:MediaPromise =evt.data 
			imageLoader = new Loader();
			if( imagePromise.isAsync )
			{
				trace( "Asynchronous media promise." );
				imageLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, imageLoaded );
				imageLoader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, imageLoadFailed );
				imageLoader.loadFilePromise( imagePromise );
			}
			else
			{
				trace( "Synchronous media promise." );
				imageLoader.loadFilePromise( imagePromise );
				imageLoaded();
			}
		}
		private function imageLoadFailed(error:IOErrorEvent):void
		{
			trace(error.text);
			dispatchEvent(new Event(ErrorStats));
		}
		private function imageLoaded(evt:Event=null):void
		{
			_bitdata=(imageLoader.content as Bitmap).bitmapData;
			dispatchEvent(new Event(Complete));
		}
		private function browseCanceled(evt:Event):void
		{
			trace("browse cancle");
			dispatchEvent(new Event(Cancle));
		}
		private function mediaError(error:ErrorEvent):void
		{
			trace(error.text);
			dispatchEvent(new Event(ErrorStats));
		}
	}
}