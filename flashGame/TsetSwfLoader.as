package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import org.osflash.signals.Signal;
	
	public class TsetSwfLoader extends Sprite
	{
		public static var complete_SN:Signal=new Signal();
		private static var swfXml:XML=<assets>
<swf key="FlaCardImage" url="Assets/Swf/FlaCardImage.swf" version="temp" size="2411142"/>
  <swf key="FlaFight" url="Assets/Swf/FlaFight.swf" version="temp" size="2803356"/>
  <swf key="FlaGonghui" url="Assets/Swf/FlaGonghui.swf" version="temp" size="743042"/>
  <swf key="FlaHuodong" url="Assets/Swf/FlaHuodong.swf" version="temp" size="570423"/>
  <swf key="FlaImage" url="Assets/Swf/FlaImage.swf" version="temp" size="2059063"/>
  <swf key="FlaMainImage" url="Assets/Swf/FlaMainImage.swf" version="temp" size="17214179"/>
</assets>;
		public function TsetSwfLoader()
		{
			super();
		}
		private static var index:int=0;
		public static function loadSwf():void{
			if(index<swfXml.swf.length()){
				var loader:Loader=new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onCompete);
				var context:LoaderContext=new LoaderContext(false,ApplicationDomain.currentDomain);
				context.allowCodeImport=true;
				context.allowLoadBytesCodeExecution=true;
//				context.
				var xml:XML=(swfXml.swf[index]);
				trace(xml.@url);
				loader.load(new URLRequest(String(xml.@url)),context);
			}else{
				complete_SN.dispatch();
			}
		}
		
		private static function onCompete(evt:Event):void{
			index++;
			loadSwf();
		}
		
		
	}
}