package Tool.ghostCacheLoad
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;

	public class GLLoaderTest
	{
		public function GLLoaderTest()
		{
		}
		
		private var loadArray:Array=[];
		private var index:int=0;
		
		private var loader:GLLoader;
		
		private var dic:Dictionary;
		
		
		public function loadConfig():void
		{
			var loader:URLLoader=new URLLoader();
			loader.addEventListener(Event.COMPLETE,onComplete);
			loader.load(new URLRequest("https://s3-ap-northeast-1.amazonaws.com/redwar/testAssets/assets/configData.xml"));
		}
		
		private function onComplete(evt:Event):void{
			var dataXml:XML = new XML((evt.target as URLLoader).data);
			trace(dataXml);
			dic=new Dictionary();
			var xmlList:XMLList=dataXml.asset;
			for each(var xml:XML in xmlList)
			{
				var key:String="https://s3-ap-northeast-1.amazonaws.com/redwar/testAssets/assets/configData/"+String(xml.@value)
				dic[key]=String(xml.@version);
				loadArray.push(key);
			}
			GLCacheLoadConst.setHashDic(dic);
			
			for each(var fileUrl:String in loadArray){
				var l:GLLoader=new GLLoader();
				l.addEventListener(GLCacheLaoderEvent.COMPLETE,onDataLoadComplete);
				l.addEventListener(GLCacheLaoderEvent.FORCESTOP,onStop);
				l.startLoad(fileUrl);
			}
		}
		private function onStop(evt:GLCacheLaoderEvent):void{
			trace("Stop "+(evt.target as GLLoader).fileUrl)
		}
		private function onDataLoadComplete(evt:GLCacheLaoderEvent):void{
//			var xml:XML=new XML(evt.data);
//			trace(xml);
//			trace(evt.data.toString());
//			GLCacheLoadConst.setHashDic(dic);
		}
		
		
	}
}