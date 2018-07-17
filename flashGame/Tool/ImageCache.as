//Created by Action Script Viewer - http://www.buraks.com/asv
package Tool
{
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	
	public class ImageCache 
	{
		
		public static const UNLOADED:uint = 0;
		public static const LOADING:uint = 1;
		public static const LOADED:uint = 2;
		public static const GAVE_UP:uint = 3;
		
		public static var load:Array;
		public static var groups:Object = {};
		private static var instance:ImageCache;
		private static var allowInstantiation:Boolean = false;
		public static var prependImagePath:String = "";
		
		public var queue:Array;
		public var cache:Object;
		private var concurrentLoadLimit:uint = 20;
		private var loadTick:Timer;
		
		public function ImageCache()
		{
			if (allowInstantiation)
			{
				load = [].concat();
				this.queue = [].concat();
				this.cache = {};
				this.loadTick = new Timer(100);
				this.loadTick.addEventListener(TimerEvent.TIMER, this.checkQueue);
				this.loadTick.start();
			}
			else
			{
				throw (new Error("nice try, sucka'!"));
			};
		}
		
		private static function getInstance():ImageCache
		{
			if (!instance)
			{
				allowInstantiation = true;
				instance = new (ImageCache)();
				allowInstantiation = false;
			};
			return (instance);
		}
		
		/* public static function GetImageGroupWithCallBack(_arg1:String, _arg2:Array, _arg3:Function=null, _arg4:Boolean=true, _arg5:int=4, _arg6:String=null):void
		{
		var _local7:Object;
		var _local8:String;
		if (!groups[_arg1])
		{
		groups[_arg1] = {
		urls:{},
		cbfs:[_arg3]
		};
		for each (_local8 in _arg2)
		{
		groups[_arg1].urls[_local8] = {
		loaded:false,
		bmd:null,
		state:_arg6
		};
		};
		for each (_local8 in _arg2)
		{
		GetImageWithCallBack(_local8, GroupImageLoaded, _arg4, _arg5, _arg1);
		};
		}
		else
		{
		groups[_arg1].cbfs.push(_arg3);
		GroupImageLoaded(_arg1);
		};
		}*/
		
		/*public static function GroupImageLoaded(_arg1:String, _arg2:String=null, _arg3:BitmapData=null):void
		{
		var _local4:Object;
		var _local5:String;
		var _local7:Array;
		var _local8:Function;
		if (_arg2)
		{
		_local4 = groups[_arg1].urls[_arg2];
		_local4.loaded = true;
		_local4.bmd = _arg3;
		};
		var _local6:Boolean = true;
		for each (_local4 in groups[_arg1].urls)
		{
		if (!_local4.loaded)
		{
		_local6 = false;
		};
		};
		if (_local6)
		{
		_local7 = [];
		for (_local5 in groups[_arg1].urls)
		{
		_local4 = groups[_arg1].urls[_local5];
		_local7.push([_local5, _local4.bmd]);
		};
		for each (_local8 in groups[_arg1].cbfs)
		{
		(_local8(_local7, _local4.state));
		};
		groups[_arg1].cbfs = [];
		};
		}*/
		
		/**    远程加载，本地缓存
		 * */
		public static function GetImageWitCallBack_UseCache(imageUrl:String, callback:Function=null, shouldPrepend:Boolean=true, priority:int=4, key:String="", extraArgs:Array=null,container:Object=null):void{
			//			imageUrl="Assets/PNG/"+imageUrl;
			GetImageWithCallBack(imageUrl,callback,shouldPrepend,priority,key,extraArgs,container,true);
		}
		
		public static function GetImageWithCallBack(imageUrl:String, callback:Function=null, shouldPrepend:Boolean=true, priority:int=4, key:String="", extraArgs:Array=null,container:Object=null,useCache:Boolean=false):void
		{
			
			
			var _local9:Loadable;
			var _local10:Loadable;
			var _local7:Boolean;
			var url:String = imageUrl;
			url = url.replace(" ","_");
			//            if (getInstance().cache[url])
			//            {
			//                if (callback != null)
			//                {
			//                    getInstance().cache[url].callbacks.push([callback, key, extraArgs,container]);
			//                };
			//                getInstance().executeAndRemoveCallbacksOnLoadable(getInstance().cache[url]);
			//                _local7 = true;
			//            }
			var _local8:Boolean;
			for each (_local9 in getInstance().queue)
			{
				if (_local9.key == url)
				{
					if (callback != null)
					{
						_local9.callbacks.push([callback, key, extraArgs,container]);
					};
					_local8 = true;
					break;
				};
			};
			if (((!(_local7)) && (!(_local8))))
			{
				_local10 = new Loadable();
				if (callback != null)
				{
					if (callback != null)
					{
						_local10.callbacks.push([callback, key, extraArgs,container]);
					};
				};
				_local10.shouldPrepend = shouldPrepend;
				_local10.key = url;
				_local10.priority = priority;
				_local10.loadState = UNLOADED;
				_local10.useLocalCache=useCache;
				getInstance().queue.push(_local10);
				getInstance().queue.sortOn("priority", Array.NUMERIC);
			};
		}
		
		
		private function checkQueue(_arg1:TimerEvent=null):void
		{
			var _local2:int;
			while ((((load.length < this.concurrentLoadLimit)) && (!((getInstance().queue.length == 0)))))
			{
				_local2++;
				this.initLoadable(getInstance().queue.shift());
			};
		}
		
		
		
		private function initLoadable(_arg1:Loadable):void
		{
			var l:Loadable = _arg1;
			l.loadState = LOADING;
			var req_str:String = ((l.shouldPrepend) ? (prependImagePath + l.key) : l.key);
			
			//			if(GLOBAL._mainLoader.cfg.platform.indexOf("android")>=0)
			//			{
			//				if(!getLocal(l.key,l))
			//				{
			//					req_str =  GameSystemData.assetURL + req_str;
			//				}
			//				else
			//				{
			//					return;
			//				}
			//			}
			
			
			if(getApplicationDir(req_str,l)){
				return ;
			}
			
			
			if(_arg1.isUseCacheLoadable()){
				if(!getLocal(l.key,l))
				{
					req_str =  UrlConfig.cdnCaheImg_PreUrl + req_str;
				}
				else
				{
					return;
				}
			}
			
			
			
			//            l.loader.load(new URLRequest(req_str));
			
			l.startLoad(req_str);
			
			
			//            l.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function (_arg1:Event):void
			l.addEventListener(Event.COMPLETE, function (_arg1:Event):void
			{
				onAssetComplete(l);
			});
			//            l.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, function (_arg1:IOErrorEvent):void
			l.addEventListener(IOErrorEvent.IO_ERROR, function (_arg1:IOErrorEvent):void
			{
				onError(l);
			});
			//            l.loader.contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR, function (_arg1:IOErrorEvent):void
			l.addEventListener(IOErrorEvent.NETWORK_ERROR, function (_arg1:IOErrorEvent):void
			{
				onError(l);
			});
			load.push(l);
		}
		private function getApplicationDir(path:String,l:Loadable):Boolean{
			var file:File = File.applicationDirectory.resolvePath(path);
			if(file.spaceAvailable && file.size)
			{
				var data:ByteArray = new ByteArray();
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.READ);
				fs.readBytes(data);
				fs.close();
				l.data=data;
				l.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function (_arg1:Event):void
				{
					onAssetComplete(l);
				});
				l.loader.loadBytes(data);
				return true;
			}
			return false;
		}
		private function getLocal(path:String,l:Loadable):Boolean
		{
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			if(file.spaceAvailable && file.size)
			{
				var data:ByteArray = new ByteArray();
				var fs:FileStream = new FileStream();
				fs.open(file,FileMode.READ);
				fs.readBytes(data);
				fs.close();
				l.data=data;
				l.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function (_arg1:Event):void
				{
					onAssetComplete(l);
				});
				l.loader.loadBytes(data);
				return true;
			}
			return false;
		}
		
		private function saveToLocal(path:String,loader:Loadable):void
		{
			var file:File = File.applicationStorageDirectory.resolvePath(path);
			if(file.spaceAvailable && file.size)
			{
				return;
			}
			var data:ByteArray=loader.data;
			//			if(loader.content is Bitmap)
			//			{
			//				if(loader.contentLoaderInfo.contentType == "image/jpeg")
			//				{
			//					var jpgEncoder:JPGEncoder = new JPGEncoder();
			//					data = jpgEncoder.encode((loader.content as Bitmap).bitmapData);
			//				}
			//				else
			//				{
			//					data = PNGEncoder.encode((loader.content as Bitmap).bitmapData);
			//				}
			//			}
			
			var fs:FileStream = new FileStream();
			fs.open(file,FileMode.WRITE);
			fs.writeBytes(data);
			fs.close();
		}
		
		private function onError(_arg1:Loadable):void
		{
			var _local2:uint;
			while (_local2 < load.length)
			{
				if (_arg1 == load[_local2])
				{
					_arg1.tries++;
					if (_arg1.tries < _arg1.tryLimit)
					{
						getInstance().queue.push(load.splice(_local2, 1)[0]);
					}
					else
					{
						_arg1.loadState = GAVE_UP;
						load.splice(_local2, 1);
					};
					return;
				};
				_local2++;
			};
		}
		
		private function onAssetComplete(_arg1:Loadable):void
		{
			_arg1.loadState = LOADED;
			var _local2:uint;
			while (_local2 < load.length)
			{
				if (_arg1 == load[_local2])
				{
					load.splice(_local2, 1);
				};
				_local2++;
			};
			//            this.cache[_arg1.key] = _arg1;
			//			if(GLOBAL._mainLoader.cfg.platform.indexOf("android")>=0)
			//			{
			//				saveToLocal(_arg1.key,_arg1);
			//			}
			
			if(_arg1.isUseCacheLoadable()){
				saveToLocal(_arg1.key,_arg1);
			}
			
			try{
				this.executeAndRemoveCallbacksOnLoadable(_arg1);
			}catch(e:Error){}
			
		}
		
		private function executeAndRemoveCallbacksOnLoadable(_arg1:Loadable):void
		{
			var _local3:Array;
			var _local4:Bitmap;
			var _local5:Function;
			var _local6:String;
			var _local7:Array;
			var _local2:Array = _arg1.callbacks.concat();
			_arg1.callbacks = [].concat();
			for each (_local3 in _local2)
			{
				_local4 = (_arg1.loader.content as Bitmap);
				_local5 = _local3[0];
				_local6 = _local3[1];
				_local7 = _local3[2];
				if(_local3[3]!=null)
				{
					if(_local4.scaleX == 1)
					{
						_local4.scaleX=_local4.scaleY=(_local3[3] as Sprite).width/_local4.width;
					}
					(_local3[3] as Sprite).addChild(_local4);
				}
				if (_local6)
				{
					if (_local7)
					{
						(_local5(_local6, _arg1.key, _local4.bitmapData, _local7));
					}
					else
					{
						(_local5(_local6, _arg1.key, _local4.bitmapData));
					};
				}
				else
				{
					if (_local7)
					{
						(_local5(_arg1.key, _local4.bitmapData, _local7));
					}
					else
					{
						(_local5(_arg1.key, _local4.bitmapData));
					};
				};
				_local4 = null;
			}
			_arg1.clear();
			_arg1 = null;
		}
		
		
	}
}//package com.cc.display



import flash.display.Loader;
import flash.errors.IOError;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;
import flash.utils.ByteArray;

class Loadable extends EventDispatcher
{
	
	public var callbacks:Array;
	public var tries:uint;
	public var loadState:uint;
	public var loader:Loader;
	
	public var key:String;
	public var tryLimit:uint = 5;
	public var shouldPrepend:Boolean = true;
	public var priority:int;
	
	public var data:ByteArray;
	
	public var useLocalCache:Boolean=false;
	
	public function Loadable():void
	{
		this.callbacks = [].concat();
		this.tries = 0;
		this.loader = new Loader();
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE,proxyComplete);
		loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,proxyIoError);
		loader.contentLoaderInfo.addEventListener(IOErrorEvent.NETWORK_ERROR,proxyIoError);
	}
	
	private function proxyComplete(evt:Event):void
	{
		var e:Event=evt.clone();
		dispatchEvent(e);
	}
	/**   判断是否确实使用缓存
	 *    如果是android  直接使用缓存机制
	 *    如果是ios 需要判断参数 判断是否使用
	 * */
	public function isUseCacheLoadable():Boolean{
		//		if(GLOBAL._mainLoader.cfg.platform.indexOf("android")>=0){
		//			return true;
		//		}
		//		return useLocalCache;
		return true;
	}
	private function proxyIoError(evt:IOErrorEvent):void
	{
		trace(evt.toString());
		var e:IOErrorEvent=evt.clone() as IOErrorEvent;
		dispatchEvent(e);
	}
	
	public function startLoad(url:String):void
	{
		//		if(GLOBAL._mainLoader.cfg.platform.indexOf("android")>=0)
		trace("imageCache load: "+url);
		if(isUseCacheLoadable())
		{
			var httpLoade:URLLoader=new URLLoader();
			httpLoade.dataFormat=URLLoaderDataFormat.BINARY;
			
			httpLoade.addEventListener(Event.COMPLETE,onComplete);
			httpLoade.addEventListener(IOErrorEvent.IO_ERROR,proxyIoError);
			
			httpLoade.load(new URLRequest(url));
		}
		else
		{
			loader.load(new URLRequest(url));
		}
	}
	
	private function onComplete(evt:Event):void
	{
		data=(evt.target as URLLoader).data;
		(evt.target as URLLoader).removeEventListener(Event.COMPLETE,onComplete);
		(evt.target as URLLoader).removeEventListener(IOErrorEvent.IO_ERROR,proxyIoError);
		loader.loadBytes(data);
		//		dispatchEvent(evt.clone());
	}
	
	public override function toString():String
	{
		return ((((("[object Loadable key:" + this.key) + ", loadState:") + this.loadState) + "]"));
	}
	
	public function clear():void
	{
		this.callbacks = null;
		this.loader.unloadAndStop();
		this.loader = null;
		if(data!=null)
		{
			data.clear();
		}
		
		data=null;
	}
	
}
