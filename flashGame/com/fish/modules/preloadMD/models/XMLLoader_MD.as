package com.fish.modules.preloadMD.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.preloadMD.events.PreloadEvent;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.ghostlmm.lightMVC.impl.Model;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.greensock.loading.data.XMLLoaderVars;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.ByteArray;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import Tool.CryptoTool;
	import Tool.ghostCacheLoad.GLCacheLaoderEvent;
	import Tool.ghostCacheLoad.GLCacheLoadConst;
	import Tool.ghostCacheLoad.GLLoader;
	
	import nochump.util.zip.ZipEntry;
	import nochump.util.zip.ZipFile;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	public class XMLLoader_MD extends Model
	{
		[Inject]
		public var log:ILogger;
		[Inject]
		public var coreDispatch:IEventDispatcher;
		
		
		private var dic:Dictionary;
		public var totalXmls:int;
		public var hasLoadXmls:int;
		
		public var mainXmlCom_SN:Signal;
		public var childXmlCom_SN:Signal;
		public var allXmlCom_SN:Signal;
		
		private var glCacheLoad:GLLoader;
		private var zipFile:ZipFile;
		
		private var glCacheLoadHuodong:GLLoader;
		private var zipFileHuodong:ZipFile;
		
		private var xmlNameArray:Array;
		
		
		public static const UseCache:Boolean=false;
		
		/**  是否使用加密算法
		 * */
		private static const UserRes:Boolean=false;
		
		private static const Key:String="nobodycanhelpme";
		
		
		private static const XmlUrl:String="assets/XML/";
		
		public function XMLLoader_MD()
		{
			mainXmlCom_SN=new Signal();
			childXmlCom_SN=new Signal();
			allXmlCom_SN=new Signal();
			super();
		}
		
		private function loadZip():void
		{
			var dic:Dictionary=new Dictionary();
			//			dic[UrlConfig.xmlZipUrl]=UrlConfig.xmlVersion;
			//			GLCacheLoadConst.setHashDic(dic);
			GLCacheLoadConst.setHashFile(UrlConfig.xmlZipUrl,UrlConfig.xmlVersion);
			if(glCacheLoad==null){
				glCacheLoad=new GLLoader();
				glCacheLoad.addEventListener(GLCacheLaoderEvent.COMPLETE,onLoadComplete);
				glCacheLoad.addEventListener(GLCacheLaoderEvent.NETERROR,onNeteError);
			}
			glCacheLoad.startLoad(UrlConfig.xmlZipUrl);
		}
		
		private function onLoadComplete(evt:GLCacheLaoderEvent):void
		{
			
			var fileData:ByteArray=evt.data;
			
			if(UserRes){
				fileData=CryptoTool.decode(fileData,Key);
			}			
			zipFile=new ZipFile(fileData);
			loadHuodongXml();
		}
		private function loadHuodongXml():void
		{
			GLCacheLoadConst.setHashFile(UrlConfig.huodongXmlUrl,UrlConfig.huodongXmlVersion);
			if(glCacheLoadHuodong==null){
				glCacheLoadHuodong=new GLLoader();
				glCacheLoadHuodong.addEventListener(GLCacheLaoderEvent.COMPLETE,onLoadHuodongComplete);
				glCacheLoadHuodong.addEventListener(GLCacheLaoderEvent.NETERROR,onNeteError);
			}
			glCacheLoadHuodong.startLoad(UrlConfig.huodongXmlUrl);			
		}
		private function onLoadHuodongComplete(evt:GLCacheLaoderEvent):void
		{			
			var fileData:ByteArray=evt.data;			
			if(UserRes){
				fileData=CryptoTool.decode(fileData,Key);
			}			
			zipFileHuodong=new ZipFile(fileData);
			loadMainXml();
		}
		private function getByteData(fileName:String):ByteArray
		{
			var entry:ZipEntry;
			var data:ByteArray;
			if(zipFileHuodong && null!=zipFileHuodong.getEntry(fileName))
			{
				entry=zipFileHuodong.getEntry(fileName);
				data=zipFileHuodong.getInput(entry);
			}
			else
			{
				entry=zipFile.getEntry(fileName);
				data=zipFile.getInput(entry);
			}
			return data;
		}
		
		
		private function onNeteError(evt:GLCacheLaoderEvent):void
		{
//			Util.flow("加载超时，请检查网络连接");
			TopTip.showExitTip("加载配置文件失败，请检查网络连接",loadZip,Util.exitGame,true,null,"退出游戏");
		}
		//		private var mainXML:XML;
		private var curLoadIndex:int;
		private var totalLength:int;
		
		private function onFrame(evt:Event):void
		{
			var fileName:String=xmlNameArray[curLoadIndex];
			var xml:XML=new XML(getByteData(fileName));
			
			XMLDataManager.parseXml(xml,fileName.substr(0,fileName.length-4));
			
			hasLoadXmls++;
			log.info("后台 加载过程：{0} / {1} / {2}",[totalXmls,hasLoadXmls,fileName]);
			childXmlCom_SN.dispatch();
			
			curLoadIndex++;
			
			if(totalLength==curLoadIndex){
				GlobalRef.stage.removeEventListener(Event.ENTER_FRAME,onFrame);
				log.info("后台 xml加载完毕: 解析时间：{0}");
				allXmlCom_SN.dispatch();
				Music.LoadSoundXmlMaterial();
				clear();
			}
		}
		
		private function clear():void
		{
			GlobalRef.stage.removeEventListener(Event.ENTER_FRAME,onFrame);
			
			if(glCacheLoad){
				glCacheLoad.clear();
				glCacheLoad.removeEventListener(GLCacheLaoderEvent.COMPLETE,onLoadComplete);
				glCacheLoad.removeEventListener(GLCacheLaoderEvent.NETERROR,onNeteError);
				glCacheLoad=null;
			}
			zipFile=null;
			if(glCacheLoadHuodong){
				glCacheLoadHuodong.clear();
				glCacheLoadHuodong.removeEventListener(GLCacheLaoderEvent.COMPLETE,onLoadHuodongComplete);
				glCacheLoadHuodong.removeEventListener(GLCacheLaoderEvent.NETERROR,onNeteError);
				glCacheLoadHuodong=null;
			}
			zipFileHuodong=null;
		}
		
		
		private function loadMainXml():void
		{
			//			dic=new Dictionary();
			//			mainXML=new XML(getByteData("XMLConfig.xml"));
			xmlNameArray=[];
			for each(var entry:ZipEntry in zipFile.entries){
				xmlNameArray.push(entry.name);
			}
			for each(var entryHuodong:ZipEntry in zipFileHuodong.entries){
				xmlNameArray.push(entryHuodong.name);
			}			
			totalLength=xmlNameArray.length;
			curLoadIndex=0;
			//			totalLength=mainXML.file.length();
			totalXmls=totalLength;
			GlobalRef.stage.addEventListener(Event.ENTER_FRAME,onFrame);
			
			//			var loaderMax:LoaderMax=new LoaderMax({onComplete:allXmlComplete});
			/*totalXmls=0;
			hasLoadXmls=0;
			for each(var file:XML in mainXML.file)
			{
			totalXmls++;
			dic[String(file.@name)]=String(file.@path);
			//				loaderMax.append(new XMLLoader(UrlConfig.xmlPreUrl+String(file.@path),{name:String(file.@name),onComplete:childXmlLoadComplete,
			//					onFail:childXmlLoadFail,onError:childXmlLoadFail,onIOError:childXmlLoadFail}));
			}*/
			//			loaderMax.autoDispose=true;
			//			loaderMax.maxConnections=1;
			//			loaderMax.load();
			
			log.info("开始加载子xml：{0}",[totalXmls]);
			
			mainXmlCom_SN.dispatch();
		}
		
		
		
		
		
		public function startLoadMainXml():void
		{
			
			if(UseCache){
				trace("开始加载 xml zip");
				loadZip();
			}else{
				var loaderVar:XMLLoaderVars=new XMLLoaderVars();
				//			loaderVar.autoDispose(true);
				loaderVar.name("mainXml");
				loaderVar.onComplete(onMainXmlLoadComplete);
				loaderVar.onFail(onMainFail);
				loaderVar.onError(onMainFail);
				loaderVar.onIOError(onMainFail);
				
				var xmlLoader:XMLLoader=new XMLLoader(XmlUrl+"XMLConfig.xml",loaderVar);
				xmlLoader.load();
			}
			
			
			
		}
		private function onMainFail(e:LoaderEvent):void
		{
			log.info(e.text);
		}
		private function onMainXmlLoadComplete(e:LoaderEvent):void
		{
			
			dic=new Dictionary();
			var mainXML:XML=LoaderMax.getContent("mainXml") as XML;
			(e.target as XMLLoader).dispose();
			var loaderMax:LoaderMax=new LoaderMax({onComplete:allXmlComplete});
			totalXmls=0;
			hasLoadXmls=0;
			for each(var file:XML in mainXML.file)
			{
				totalXmls++;
				dic[String(file.@name)]=String(file.@path);
				loaderMax.append(new XMLLoader(XmlUrl+String(file.@path),{name:String(file.@name),onComplete:childXmlLoadComplete,
					onFail:childXmlLoadFail,onError:childXmlLoadFail,onIOError:childXmlLoadFail}));
			}
			loaderMax.autoDispose=true;
			loaderMax.maxConnections=1;
			loaderMax.load();
			
			log.info("前端 开始加载子xml：{0}",[totalXmls]);
			
			mainXmlCom_SN.dispatch();
		}
		
		private function allXmlComplete(e:LoaderEvent):void
		{
			//			var t:int=getTimer();
			//			for(var name:String in dic)
			//			{
			////				XMLManager.updateXML(name,LoaderMax.getContent(name) as XML);
			//				
			//				XMLDataManager.parseXml(LoaderMax.getContent(name) as XML,name);
			//			}
			//			GameStatus.setStatus(GameStatus.ST_LoginCom);
			childXmlCom_SN.dispatch();
			
			GameStatus.configFlag=true;
			log.info("前端 xml加载完毕: 解析时间：{0}");
			(e.target as LoaderMax).dispose();
			allXmlCom_SN.dispatch();
			Music.LoadSoundXmlMaterial();
			//xml 加载完毕， 开始登陆
			//			coreDispatch.dispatchEvent(new PreloadEvent(PreloadEvent.StartLogin));
		}
		
		private function childXmlLoadComplete(e:LoaderEvent):void
		{
			var name:String=(e.currentTarget as XMLLoader).name;
			XMLDataManager.parseXml(LoaderMax.getContent(name) as XML,name);
			hasLoadXmls++;
			log.info("前端 加载过程：{0} / {1} / {2}",[totalXmls,hasLoadXmls,name]);
			childXmlCom_SN.dispatch();
		}
		private function childXmlLoadFail(e:LoaderEvent):void
		{
			log.info(e.text);
		}
		
		public override function destory():void
		{
			if(mainXmlCom_SN){
				mainXmlCom_SN.removeAll();
				mainXmlCom_SN=null;
			}
			if(childXmlCom_SN){
				childXmlCom_SN.removeAll();
				childXmlCom_SN=null;
			}
			
			clear();
			super.destory();
		}
	}
}

