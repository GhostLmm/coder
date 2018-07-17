package com.fish.modules.preloadMD.models
{
	import com.ghostlmm.lightMVC.impl.Model;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import Tool.CryptoTool;
	import Tool.ghostCacheLoad.GLCacheLaoderEvent;
	import Tool.ghostCacheLoad.GLCacheLoadConst;
	import Tool.ghostCacheLoad.GLLoader;
	
	import nochump.util.zip.ZipFile;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	public class LoaderLanguagerMD extends Model
	{
		public var deviver:int=1;
		public var progress:int=0;
		private var glCacheLoad:GLLoader;
		
		private var useLocalLanguager:Boolean=false;
		
		public var complete_SN:Signal;
		
		public function LoaderLanguagerMD()
		{
			super();
			complete_SN=new Signal();
			CONFIG::UseLocalLanguager{
				useLocalLanguager=true;
			}
		}
		
		public function startLoadeLanguager():void{
			if(useLocalLanguager){
				var urlLoader:URLLoader=new URLLoader();
				urlLoader.addEventListener(Event.COMPLETE,onFileLoadCom);
				urlLoader.load(new URLRequest("assets/zh_CN.txt"));
			}else{
				GLCacheLoadConst.setHashFile(UrlConfig.xmlZipUrl,UrlConfig.xmlVersion);
				if(glCacheLoad==null){
					glCacheLoad=new GLLoader();
					glCacheLoad.addEventListener(GLCacheLaoderEvent.COMPLETE,onLoadComplete);
					glCacheLoad.addEventListener(GLCacheLaoderEvent.NETERROR,onNeteError);
				}
				glCacheLoad.startLoad(UrlConfig.xmlZipUrl);
			}
			
		}
		private function onFileLoadCom(evt:Event):void{
			var urlLoader:URLLoader=evt.currentTarget as URLLoader;
			urlLoader.removeEventListener(Event.COMPLETE,onFileLoadCom);
			setJson(urlLoader.data);
		}
		private function onNeteError(evt:GLCacheLaoderEvent):void
		{
			Util.flow("加载超时，请检查网络连接");
		}
		
		private function onLoadComplete(evt:GLCacheLaoderEvent):void
		{
			
			var fileData:ByteArray=evt.data;
			
			var zipFile:ZipFile=new ZipFile(fileData);
			var fileData:ByteArray=zipFile.getInput(zipFile.entries[0]);
			setJson(fileData);
		}
		
		private function setJson(fileData:*):void{
			var json:String;
			if(fileData is ByteArray){
				fileData.position=0;
				json=fileData.readUTFBytes(fileData.length);
			}else{
				json=fileData;
			}
			
//			Language.setup(JSON.parse(json));
			progress=1;
			trace("加载翻译完毕");
//			trace(Language.getWindowLan("test",{v1:"DigGame"}));
			complete_SN.dispatch();
		}
		
		public override function destory():void
		{
			if(glCacheLoad){
				glCacheLoad.removeEventListener(GLCacheLaoderEvent.COMPLETE,onLoadComplete);
				glCacheLoad.removeEventListener(GLCacheLaoderEvent.NETERROR,onNeteError);
				glCacheLoad=null;
			}
			if(complete_SN){
				complete_SN.removeAll();
			}
		}
	}
}