package ui.widget
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	public class BitdataChache
	{
		private static var instance:BitdataChache=new BitdataChache();
		
		
		//		public static function revokeBitdata(imageName:String):void
		//		{
		//			instance.revokeBitdata(imageName);
		//		}
		
		
		private static var bitdataDic:Dictionary=new Dictionary();
		//		private var timer:Timer;
		public static function getBitdata(imageName:String):BitmapData
		{
			if(Preload.ResidentImagCls[imageName]){
				var bit:BitmapData=bitdataDic[imageName];
				if(bit==null){
					bit=createBitdata(imageName);
					bitdataDic[imageName]=bit;
				}
				return bit;
			}
			return createBitdata(imageName);
		}
		
		public static function getSmallImgCache(imageName:String):BitmapData{
			return smallImgCacheDic[imageName];
		}
		
		private static var smallImgCacheDic:Dictionary=new Dictionary();
		
		public static function setSmallBitcache(key:String,bit:BitmapData):void{
			smallImgCacheDic[key]=bit;
		}
		
		public static function clear():void
		{
			for each(var bit:BitmapData in bitdataDic){
				bit && bit.dispose();
			}
			bitdataDic=new Dictionary();
		}
		
		/*private function onTimer(evt:Event):void
		{
		for(var key:String in bitdataDic)
		{
		var obj:Object=bitdataDic[key];
		obj.time-=10;
		if(obj.time<0 && obj.ref<=0)
		{
		(obj.bitdata as BitmapData).dispose();
		obj.bitdata=null;
		bitdataDic[key]=null;
		delete bitdataDic[key];
		}
		}
		}*/
		
		private static function createBitdata(imageName:String):BitmapData
		{
			//			return null;
			
			if(ApplicationDomain.currentDomain.hasDefinition(imageName))
			{
				return new (ApplicationDomain.currentDomain.getDefinition(imageName) as Class)();
			}else
			{
				trace("没有找到图片的类： "+imageName);
			}
			return null;
		}
	}
}