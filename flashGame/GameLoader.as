package
{
	import Tool.CapacityDownload;
	
	import com.hurlant.util.Base64;
	
	import flash.desktop.NativeApplication;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.SharedObject;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.utils.ByteArray;
	import flash.utils.Timer;


	[SWF(backgroundColor="#000000", width="640", height="960")]
	public class GameLoader extends Sprite
	{
		private static const LW_App:int=1;
		private static const LW_Store:int=2;
		private static const LW_Web:int=3;
		
//		public static const RequstURL:String="";
		// cdn
//		public static const PreloadUrl:String="http://meijiasset.utgame.com/";
		public static const PreloadUrl:String="http://oss.aliyuncs.com/meijidazhan/";
		
		public static const Version:String="2014031201";
		public static const MainSwfPath:String="Meiji.swf";
		
		private static const SharePath:String="meijiversion";
		private var _so:SharedObject;
		
		private var _webFileUrl:String;
		private var _webVersion:String;
		private var _range:Number=100000;
		
		private var _loadWay:int;
		
		private var _capacityLoad:CapacityDownload;
		private var _codeLoad:Loader;
		
		private var _gamePreload:Preloading;
		
		private var _hasInit:Boolean=false;
		
		private var _xmlLoader:GamePreloadConfig;
		
		private var _tipTimer:Timer;
		
		public function GameLoader()
		{
			super();
			initEnviroment();
			setShow();
			requestAssetWeb();
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown);
//			Meiji
		}
		private function handleKeyDown(evt:KeyboardEvent):void
		{		
			if(evt.keyCode == Keyboard.BACK)
			{
				if(!_hasInit){
					exitGame();
					return ;
				}
				evt.preventDefault();
				if(!GameAlert.isShow()){
					GameAlert.openAlert(this,"是否退出游戏",exitGame);
				}
			}
		}
		private function getShareVersion():String{
			try
			{
				if(_so==null){
					_so=SharedObject.getLocal(SharePath);
				}

				return _so.data.version;
			} 
			catch(error:Error) 
			{
				return null;
			}
			return null;
		}
		private function setShareVersion(value:String):void{
			try{
				if(_so==null){
					_so=SharedObject.getLocal(SharePath);
				}

				_so.data.version=value;
				_so.flush();
			}catch(e:Error){
				
			}
		}
		
		private function initEnviroment():void{
			var _width:int=Math.min(stage.fullScreenWidth,stage.fullScreenHeight);
			var _height:int=Math.max(stage.fullScreenWidth,stage.fullScreenHeight);
			var _scaleX:Number=_width/640;
			var _scaleY:Number=_height/960;
			var s:Number=Math.min(_scaleX,_scaleY);
			var align:String;
			//			align=StageAlign.TOP_LEFT;
			if(_scaleX==s)
			{
				align=StageAlign.LEFT;
			}
			if(_scaleY==s)
			{
				align=StageAlign.TOP;
			}
			// 支持 autoOrient
			stage.align = align;
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.displayState=StageDisplayState.FULL_SCREEN_INTERACTIVE;
			//			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality=StageQuality.LOW;
			stage.frameRate=30;
		}
		
		//
		private function setShow():void{
			_gamePreload=new Preloading();
			this.addChild(_gamePreload);
			
		}
		
		private function requestAssetWeb():void
		{
			_xmlLoader=new GamePreloadConfig();
			_xmlLoader.loadResult_SN.add(onXmlLoadResult);
			_xmlLoader.startLoadXml(PreloadUrl+"preloadConfig.xml"+"?"+(new Date()).time+""+int(Math.random()*int.MAX_VALUE));
			
			
		}
		
		private function reloadXml():void{
			_xmlLoader.startLoadXml(PreloadUrl+"preloadConfig.xml");
		}
		
		private function onTimer(evt:Event=null):void
		{
			if(_gamePreload){
				_gamePreload.setDescText(_xmlLoader.getDesc());
			}
		}
		
		private function onXmlLoadResult(success:Boolean):void
		{
			if(success){
				_webFileUrl=PreloadUrl+_xmlLoader.getVersion()+"/"+_xmlLoader.getSwfName();
				_webVersion=_xmlLoader.getVersion();
				_hasInit=true;
				
				if(_tipTimer==null){
					_tipTimer=new Timer(3000);
					_tipTimer.addEventListener(TimerEvent.TIMER,onTimer);
					_tipTimer.start();
				}
				onTimer();
				checkLocalVerision();
				loadAsset();
			}else{
				GameAlert.openAlert(this,_xmlLoader.getLange("ln_xmlLoadFailTip"),reloadXml,exitGame);
			}
		}
		
		
		/**  检测素材库中是否存在
		 * */
		public function checkLocalVerision():void
		{
			if(getShareVersion()==null){
				// 判断本地版本是否跟web上一致
				if(Version==_webVersion){
					//第一次加载
					if(localAppHasMainSwf()){
						//如果素材ku中包含需要的代码
						_loadWay=LW_App;
						return ;
					}
					_loadWay=LW_Web;
					return;
				}
			}
			if(getShareVersion()==_webVersion){
				_loadWay=LW_Store;
			}else{
				_loadWay=LW_Web;
			}
		}
		
		/**  拷贝到缓存中
		 * */
		private function copyAppToLocal():void
		{
			
		}
		
		/**  本地素材库是否包含需要的 swf
		 * */
		private function localAppHasMainSwf():Boolean{
			return hasAppFile(MainSwfPath);
		}
		
		/**   加载swf代码
		 * */
		private function loadCode(dataOrUrl:*):void{
			if(_codeLoad==null){
				_codeLoad=new Loader();
				var loaderContext:LoaderContext = new LoaderContext();
				loaderContext.allowCodeImport = true;
				loaderContext.allowLoadBytesCodeExecution=true;
//				loaderContext
				//			loaderContext.applicationDomain = ApplicationDomain.currentDomain;
				_codeLoad.contentLoaderInfo.addEventListener(Event.COMPLETE,createMain);
			}
			
			if(dataOrUrl is ByteArray){
				_codeLoad.loadBytes(dataOrUrl,loaderContext);
			}else{
				_codeLoad.load(new URLRequest(dataOrUrl),loaderContext);
			}
		}
		
		/**   创建主游戏逻辑
		 * */
		private function createMain(evt:Event):void{
			trace("加载完毕，启动游戏");
			this.removeChildren();
			this.addChild(_codeLoad);
			clear();
			
		}
		
		private function clear():void{
			NativeApplication.nativeApplication.removeEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown);
			GameAlert.destory();
			if(_codeLoad){
				_codeLoad.contentLoaderInfo.removeEventListener(Event.COMPLETE,createMain);
				_codeLoad=null;
			}
			if(_capacityLoad){
				_capacityLoad.destory();
				_capacityLoad=null;
			}
			if(_gamePreload){
				_gamePreload.destory();
				_gamePreload=null;
			}
			if(_xmlLoader){
				_xmlLoader.destory();
				_xmlLoader=null;
			}
			if(_tipTimer){
				_tipTimer.removeEventListener(TimerEvent.TIMER,onTimer);
				_tipTimer=null;
			}
		}
		
		private function loadAsset():void{
			switch(_loadWay){
				case LW_App:
					loadFromApp();
					break;
				case LW_Store:
					loadFromStore();
					break;
				case LW_Web:
					loadFromWeb();
					break;
			}
		}
		
		private function loadFromApp():void{
			trace("从应用程序中加载");
			loadCode(MainSwfPath);
		}
		private function loadFromStore():void{
			trace("从缓存中加载");
			var localPath:String=getLocalPath(MainSwfPath,_webVersion);
			if(hasLocalFile(localPath)){
				var data:ByteArray=readFileFromCache(localPath);
				if(data){
					loadCode(data);
				}
			}else{
				_loadWay=LW_Web;
				loadAsset();
			}
		}
		
		private function loadFromWeb():void{
			trace("从网络中加载");
			var oldVersion:String=getShareVersion();
			if(oldVersion!=null){
				var oldFilePath:String=getLocalPath(MainSwfPath,oldVersion);
				deleteFile(oldFilePath);
			}
			
			
			_capacityLoad=new CapacityDownload();
			_capacityLoad.loadFail_SN.add(onLoadWebFail);
			_capacityLoad.loadInfo_SN.add(onGetLoadInfo);
			_capacityLoad.loadProgress_SN.add(updateProress);
			_capacityLoad.loadSuccess.add(onLoadWebComplete);
			
			var webUrl:String=_webFileUrl+"?"+_webVersion;
			var localUrl:String=getLocalPath(MainSwfPath,_webVersion);
			
			var range:Number=_xmlLoader.getRange();
			if(isNaN(range) || range<1000){
				range=_range;
			}
			
			_capacityLoad.setBaseInfo(webUrl,localUrl,range);
			_capacityLoad.getWebFileInfo();
		}
		
		private function continueLoad():void{
			_capacityLoad.continueLoad();
		}
		private function exitGame():void{
			NativeApplication.nativeApplication.exit();
		}
		
		private function onLoadWebFail():void{
			GameAlert.openAlert(this,_xmlLoader.getLange("ln_loadAssetFailTip"),continueLoad,exitGame);
		}
		private function onGetLoadInfo(total:Number,loadSize:Number):void{
			_gamePreload.setTipText(_xmlLoader.getLange("ln_fileSize",{size:getSizeString(total-loadSize)}));
			GameAlert.openAlert(this,_xmlLoader.getLange("ln_downDesc",{size:getSizeString(total-loadSize)}),_capacityLoad.startRangeLoad,exitGame);
//			showAlert("下载提示","需要更新"+int((total-loadSize)/1024/1024)+"M"+"资源，请最好在wifi网络下更新","更新",_capacityLoad.startRangeLoad,"退出",exitGame);
		}
		private function updateProress(total:Number,loadSize:Number,speed:Number):void{
			var tip:String="";
			_gamePreload.setProgress(loadSize/total);
			tip+="加载进度：\t"+int(loadSize/1024)+"k"+"/"+int(total/1024)+"k\t\t"+int(speed/1024)+"k/s";
			_gamePreload.setTipText(tip);
		}
		private function onLoadWebComplete():void{
			_loadWay=LW_Store;
			setShareVersion(_webVersion);
			loadAsset();
		}
		
		private function getSizeString(size:Number):String
		{
			var k:int=int(size/1024);
			var m:int=int(size/1024/1024);
			if(m>0){
				return m+"M";
			}
			if(k>0){
				return k+"K";
			}
			return size+"B";
		}
		
		/**   是否有本地缓存文件
		 * */
		private static function hasLocalFile(path:String):Boolean
		{
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			
			if(file.spaceAvailable && file.size)
			{
				return true;
			}
			return false;
		}
		
		/**  app 文件中是否存在
		 * */
		private static function hasAppFile(path:String):Boolean{
			var file:File = File.applicationDirectory.resolvePath(path);
			
			if(file.spaceAvailable && file.size)
			{
				return true;
			}
			return false;
		}
		
		
		/**  读取缓存文件数据
		 * */
		private static function readFileFromCache(fileUrl:String):ByteArray{
			try{
				var file:File = File.applicationStorageDirectory.resolvePath(fileUrl);
				var data:ByteArray = new ByteArray();
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.READ);
				fs.readBytes(data);
				fs.close();
				trace("File read complete FileUrl:"+fileUrl);
				return data;
			}catch(e:Error){
				trace("File read form cache error fileUrl:"+fileUrl);
				trace("Error: "+e.message);
				return null;
			}
			return null;
		}
		
		/**   获取路径名称
		 * */
		private function getLocalPath(url:String,version:String):String
		{
			var sourcePath:String=url+"@code:"+version;
			var targetPath:String=Base64.encode(sourcePath);
			var __reg:RegExp = new RegExp('\\\\', 'g');
			targetPath=targetPath.replace(__reg, "-");
			targetPath=targetPath.replace(/\//g, "~")
			return targetPath;
		}
		/**  删除文件
		 * */
		private static function deleteFile(fileUrl:String):void{
			try{
				
				var file:File = File.applicationStorageDirectory.resolvePath(fileUrl);
				if(file.spaceAvailable && file.size)
				{
					file.deleteFileAsync();
					trace("delete file "+file.nativePath);
				}
				
			}catch(e:Error){
				trace("deleteOldFile error file: "+fileUrl+" error:"+e.message);
			}
		}
		/*public function showAlert(title:String,message:String,button1:String="Ok",callback1:Function=null,button2:String=null,callback2:Function=null):void{
			CONFIG::AlertAne{
				try{
					import com.freshplanet.ane.AirAlert.AirAlert;
					AirAlert.getInstance().showAlert(title,message,button1,callback1,button2,callback2);
				}catch(e:Error){
					
				}
				return ;
			}
			GameAlert.openAlert(this,message,callback1,callback2);
		}*/
		
	}
}
import flash.display.DisplayObjectContainer;
import flash.display.MovieClip;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.MouseEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.text.TextField;

import org.osflash.signals.Signal;

class GameAlert extends GamePreJinggao{
	
	public function GameAlert(){
		super();
		btn_queding.gotoAndStop(1);
		btn_quxiao.gotoAndStop(1);
		btn_queding.addEventListener(MouseEvent.CLICK,onQueding);
		btn_quxiao.addEventListener(MouseEvent.CLICK,onQiuxiao);
		
	}
	
	private function removeFromStage():void{
		if(parent){
			parent.removeChild(this);
		}
	}
	
	private function onQueding(evt:Event):void{
		if(_okFn!=null){
			_okFn();
		}
		removeFromStage();
	}
	private function onQiuxiao(evt:Event):void{
		if(_cancelFn!=null){
			_cancelFn();
		}
		removeFromStage();
	}
	
	private static var _okFn:Function;
	private static var _cancelFn:Function;
	private static var _instance:GameAlert;
	public static function openAlert(container:DisplayObjectContainer,desc:String,$okFn:Function,$cancel:Function=null):void{
		_okFn=$okFn;
		_cancelFn=$cancel;
		if(_instance==null){
			_instance=new GameAlert();
		}
		_instance.fnt_desc.text=desc;
		container.addChild(_instance);
	}
	
	public static function isShow():Boolean{
		if(_instance && _instance.parent){
			return true;
		}
		return false;
	}
	
	
	public static function destory():void{
		if(_instance){
			_instance.removeFromStage();
			_instance=null;
		}
		_okFn=null;
		_cancelFn=null;
	}
}

class GamePreloadConfig{
	
	private var xmlUrl:String;
	public var xml:XML;
	
	public var loadResult_SN:Signal=new Signal(Boolean);
	
	private var urlLoad:URLLoader;
	
	private var errorTick:int=3;
	
	private var descArray:Array;
	
	public function GamePreloadConfig(){
		
	}
	
	public function startLoadXml(url:String):void{
		xmlUrl=url;
		if(urlLoad==null){
			urlLoad=new URLLoader();
			urlLoad.addEventListener(IOErrorEvent.IO_ERROR,onError);
			urlLoad.addEventListener(Event.COMPLETE,onComplete);
			urlLoad.dataFormat=URLLoaderDataFormat.TEXT;
		}
		urlLoad.load(new URLRequest(url));
	}
	
	private function onError(evt:Event):void{
		errorTick--;
		if(errorTick<0){
			trace("加载xml失败："+xmlUrl);
			loadResult_SN.dispatch(false);
		}else{
			startLoadXml(xmlUrl);
		}
	}
	
	private function onComplete(evt:Event):void{
		xml=new XML(urlLoad.data);
		trace(xml);
		initDesc();
		loadResult_SN.dispatch(true);
	}
	
	public function getDesc():String
	{
		if(descArray==null || descArray.length==0) return "";
		return  descArray[int(Math.random()*int.MAX_VALUE) % descArray.length];
		
	}
	
	public function getRange():Number
	{
		return Number(getLange("range"));
	}
	
	private function initDesc():void{
		descArray=[];
		var index:int=0;
		while(true){
			index++;
			var desc:String=getLange("ln_tipDesc"+index);
			if(desc.indexOf("ln_tipDesc")==-1){
				descArray.push(desc);
			}else{
				break;
			}
		}
	}
	
	public function destory():void{
		if(urlLoad){
			urlLoad.removeEventListener(IOErrorEvent.IO_ERROR,onError);
			urlLoad.removeEventListener(Event.COMPLETE,onComplete);
			urlLoad.close();
		}
		if(loadResult_SN){
			loadResult_SN.removeAll();
			loadResult_SN=null;
		}
		xml=null;
	}
	public function getVersion():String{
		return getLange("version");
	}
	
	public function getSwfName():String
	{
		return getLange("swf");
	}
	
	
	public function getLange(key:String,arg:Object=null):String{
		if(xml==null){
			trace("配置xml没有加载："+xmlUrl);
			return "miss:"+key;
		}
		try{
			var re:String;
			if(xml.hasOwnProperty(key)){
				re=String(xml[key][0]);
			}else{
				return "miss:"+key;
			}
			if(arg){
				for(var ok:String in arg){
					while(re.indexOf("{"+ok+"}")!=-1){
						re=re.replace("{"+ok+"}",arg[ok]);
					}
				}
			}
			return re;
		}catch(e:Error){
			return "miss:"+key;
		}
		return "miss:"+key;
		
	}
	
}

class Preloading extends GamePreLoading{
	
	private var prgressMc:MovieClip;
	private var fnt_prg_loading:TextField;
	private var fnt_jiazailiang:TextField;
	private var fnt_desc:TextField;
	
	public function Preloading(){
		super();
		prgressMc=mc_loading.prg_loading;
		fnt_prg_loading=mc_loading.fnt_prg_loading;
		fnt_jiazailiang=mc_loading.fnt_jiazailiang;
		fnt_desc=mc_loading.fnt_desc;
		prgressMc.gotoAndStop(1);
		fnt_jiazailiang.text="检测资源更新";
	}
	
	public function setProgress(precent:Number):void{
		var p:int=int(precent*100);
		p=Math.min(p,100);
		p=Math.max(p,0);
		
		var f:int=precent*prgressMc.totalFrames;
		f=Math.max(f,1);
		f=Math.min(f,prgressMc.totalFrames);
		prgressMc.gotoAndStop(f);
		fnt_prg_loading.text=p+"%";
		
	}
	
	public function setDescText(desc:String):void{
		fnt_desc.text=desc;
	}
	
	public function setTipText(text:String):void{
		fnt_jiazailiang.text=text;
	}
	
	public function destory():void{
		prgressMc=null;
		fnt_jiazailiang=null;
		fnt_prg_loading=null;
		this.removeChildren();
	}
}