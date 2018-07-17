package Tool.ghostCacheLoad
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	[Event(name="glCacheComplete", type="Tool.ghostCacheLoad.GLCacheLaoderEvent")]
	[Event(name="glCacheNeterror", type="Tool.ghostCacheLoad.GLCacheLaoderEvent")]
	[Event(name="glCacheForcestop", type="Tool.ghostCacheLoad.GLCacheLaoderEvent")]
	public class GLLoader extends EventDispatcher
	{
		
		
		private var _data:ByteArray;
		
		private var _fileUrl:String;
		
		private var hashCode:String;
		
		/**   是否启用缓存， 如果没有hashCode 就会直接从网络加载。
		 * */
		private var _useCache:Boolean=true;
		
		
		private var _loadStats:int=0;

		public function get fileUrl():String{
			return _fileUrl;
		}
		
		public function GLLoader()
		{
			super();
			_loadStats=GLLoadStats.Stats_UnStart;
		}
		
		public function startLoad(_url:String):void{
			
			clear();
			
			_loadStats=GLLoadStats.Stats_Loading;
			GLCacheLoadConst.addLoader(this);
			_fileUrl=_url;
			analysisUseCache();
			
			if(!_useCache){
				loadFromWeb();
			}else{
				if(GLCacheLoadConst.hasCacheFile(_fileUrl)){
					loadFromCache();
				}else{
					loadFromWeb();
				}
			}
		}
		
		private var _loadCount:int=0;
		private var _urlLoader:URLLoader;
		/**   从网络中加载   三次加载， 
		 * */
		private function loadFromWeb():void{
			_loadCount=0;
			if(_urlLoader==null)
			{
				_urlLoader=new URLLoader();
				_urlLoader.addEventListener(IOErrorEvent.IO_ERROR,onWebLoadError);
				_urlLoader.addEventListener(Event.COMPLETE,onWebLoadComplete);
				_urlLoader.dataFormat=URLLoaderDataFormat.BINARY;
			}
			_urlLoader.load(new URLRequest(_fileUrl));
		}
		
		private function onWebLoadError(evt:IOErrorEvent):void{
			_loadCount++;
			trace("loadCount:"+_loadCount+" "+evt.text);
			if(_loadCount>=3){
				_loadStats=GLLoadStats.Stats_LoadFail;
				GLCacheLoadConst.removeLoader(this);
				var failEvt:GLCacheLaoderEvent=new GLCacheLaoderEvent(GLCacheLaoderEvent.NETERROR);
				dispatchEvent(failEvt);
			}else{
				_urlLoader.load(new URLRequest(_fileUrl));
			}
		}
		
		private function onWebLoadComplete(evt:Event):void{
			_loadStats=GLLoadStats.Stats_LoadComplete;
			GLCacheLoadConst.removeLoader(this);
			trace("File web load complete: "+_fileUrl);
			_data=_urlLoader.data;
			var completeEvt:GLCacheLaoderEvent=new GLCacheLaoderEvent(GLCacheLaoderEvent.COMPLETE);
			completeEvt.data=_data;
			
			
			if(_useCache){
				GLCacheLoadConst.deleteOldFile(_fileUrl);
				GLCacheLoadConst.saveFileToLocal(_fileUrl,hashCode,_data);
			}
			
			
			dispatchEvent(completeEvt);
		}
		/**   从缓存中加载
		 * */
		private function loadFromCache():void{
			_loadStats=GLLoadStats.Stats_LoadComplete;
			_data=GLCacheLoadConst.readFileFromCache(_fileUrl,hashCode);
			
			if(_data==null)
			{
				_useCache=false;
				trace("Load from cache error, and load from web : "+_fileUrl);
				loadFromWeb();
			}
			else{
				var completeEvt:GLCacheLaoderEvent=new GLCacheLaoderEvent(GLCacheLaoderEvent.COMPLETE);
				completeEvt.data=_data;
				dispatchEvent(completeEvt);
			}
			
		}
		
		private function analysisUseCache():void{
			hashCode=GLCacheLoadConst.getHashCode(_fileUrl);
			if(hashCode==null){
				_useCache=false;
				trace("File loade doesnt use cache FileUrl: "+_fileUrl);
			}else
			{
				_useCache=true;
			}
		}
		
		public function clear():void{
			_loadStats=GLLoadStats.Stats_UnStart;
			if(_data!=null){
				_data.clear();
				_data=null;
			}
			if(_urlLoader!=null){
				_urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,onWebLoadError);
				_urlLoader.removeEventListener(Event.COMPLETE,onWebLoadComplete);
				try{
					_urlLoader.close();
				}catch(e:Error){
					trace("close loader error : "+e.message );
				}
				_urlLoader=null;
			}
			_urlLoader=null;
			_loadCount=0;
		}
		
		internal function forceStop():void{
			
			if(_loadStats==GLLoadStats.Stats_Loading){
				var evt:GLCacheLaoderEvent=new GLCacheLaoderEvent(GLCacheLaoderEvent.FORCESTOP);
				dispatchEvent(evt);
				clear();
			}
			
			
		}
	}
}