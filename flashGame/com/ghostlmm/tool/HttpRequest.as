package com.ghostlmm.tool
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.Communication;

	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import Tool.platform.PlatformManager;
	
	import util.Util;
	
	
	public final class HttpRequest extends Object
	{
		private static var m_instance:HttpRequest;
		private var m_httpUrl:String = "";
		private var m_timer:Timer;
		
		public function HttpRequest()
		{
			if (m_instance != null)
			{
				throw new Error("实例化单例类出错-HTTPRequest");
			}// end if
			m_timer = new Timer(1000);
			m_timer.start();
		}
		
		public function set httpUrl(url:String) : void
		{
			trace("in HTTPRequest.set httpUrl as "+url);
			m_httpUrl = url;
			return;
		}
		
		public function get httpUrl() : String
		{
			return m_httpUrl;
		}
		
		public function getRequest(url:String, args:Object, handlerFun:Function, timeout:uint = 60000, reload:Boolean = false, dataFormat:String = "text",_needMasking:Boolean=false) : void
		{
			request(URLRequestMethod.GET, url, args, handlerFun, timeout, reload, dataFormat,_needMasking);
			return;
		}
		/**  这个不是post类型的请求 
		 * */
		public function postRequest(url:String, args:Object, handlerFun:Function, timeout:uint = 60000, reload:Boolean = false, dataFormat:String = "text",_needMasking:Boolean=false) : void
		{
			request(URLRequestMethod.GET, url, args, handlerFun, timeout, reload, dataFormat,_needMasking);
			return;
		}
		/**   这个是 正在的 post请求， 以前的采用了get类型，现在没有做更改
		 * */
		public function realyPostRequest(url:String, args:Object, handlerFun:Function, timeout:uint = 60000, reload:Boolean = false, dataFormat:String = "text",_needMasking:Boolean=false) : void
		{
			request(URLRequestMethod.POST, url, args, handlerFun, timeout, reload, dataFormat,_needMasking);
			return;
		}	
		
		private function request(method:String, url:String, value:Object, handlerFun:Function, timeout:uint = 60000, reload:Boolean = false, dataFormat:String = "text",_needMasking:Boolean=false) : void
		{
			var time:int=getTimer();
			var _postData:Object;
			var isHandler:Boolean;
			var aURLRequest:URLRequest;
			var aURLLoader:URLLoader;
			var ioerrorHandler:Function;
			var httpStatusHandler:Function;
			var loadCompHandler:Function;
			var timerFn:Function;
			var timerValue:int;
			var requestNum:int;
			var _uv:URLVariables;
			var _name:String;
			var completeUrl:String;
			completeUrl = url;

			
			
			
			if(value==null) 
				value={};
			
			if (value is String)
			{
				_postData =value;
			}
			else if (value is URLVariables)
			{
				_postData = value;
			}
			else if(value is ByteArray)
			{
				_postData=value;
			}
			else
			{
				_uv = new URLVariables();
				for (var i:String in value)
				{
					// label
					_name = i;
					_uv[_name] = value[_name];
				}// end while
				//所有信息附加 验证信息
				_uv.athor=GLBaseData.author;
				_uv.aid=GLBaseData.accountId;
				_uv.sid=GLBaseData.serverId;
				_uv.loginPlat=PlatformManager.getInstance().getLoginPlatName();
				_uv.app_key=PlatformManager.APP_KEY;
				_postData=new URLVariables();
				for(var key:String in _uv){
					if(_uv[key]!=null){
						_postData[key]=_uv[key];
					}
				}
				
			}// end else if
			if(_needMasking)
			{
				Communication.addWebTick();
			}
			
			
			isHandler = false;
			aURLRequest = new URLRequest(completeUrl);
			aURLRequest.method = method;
			aURLRequest.data = _postData;
//			aURLRequest.contentType="application/x-www-form-urlencoded; charset=utf-8";
			aURLLoader = new URLLoader();
			aURLLoader.dataFormat = dataFormat;
			var clearAll:* = 
				function () : void
				{
					if(!isHandler){
						return ;
					}
					time=getTimer()-time;
					if(_needMasking)
					{
						Communication.subWebTick();
					}
					
					if(time>10000){
						trace("网络请求过长 ："+time/1000+" url: "+Util.transArgToUrl(url,_postData));
					}
					aURLLoader.close();
					m_timer.removeEventListener(TimerEvent.TIMER, timerFn);
					aURLLoader.removeEventListener(IOErrorEvent.IO_ERROR, ioerrorHandler);
					aURLLoader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
					aURLLoader.removeEventListener(Event.COMPLETE, loadCompHandler);
					return;
				}
				;
			
			ioerrorHandler = 
				function (param1:IOErrorEvent) : void
				{
					if (!isHandler)
					{
						trace(Util.transArgToUrl(url,_postData));
						handlerFun("{\"code\":\"101\",\"desc\":\"IOError\"}");
						isHandler = true;
						clearAll();
					}// end if
					
					return;
				}
				;
			httpStatusHandler = 
				function (param1:HTTPStatusEvent) : void
				{
					if (param1.status != 0 && param1.status != 200)
					{
						if (!isHandler)
						{
							trace(Util.transArgToUrl(url,_postData));
							handlerFun("{\"code\":\"102\",\"desc\":" + param1.status + "}");
							isHandler = true;
							if(_needMasking)
							{
								Communication.subWebTick();
							}
						}// end if
					}// end if
//					clearAll();
					return;
				}
				;
			loadCompHandler = 
				function (param1:Event) : void
				{
					if (!isHandler)
					{
						//网络异常时，不知干啥
						trace(Util.transArgToUrl(url,_postData)+"\n"+param1.currentTarget.data);
						PlatformManager.log(Util.transArgToUrl(url,_postData)+"\n"+param1.currentTarget.data);
						try{
							var $data:Object=JSON.parse(param1.currentTarget.data);
							if($data.ak){
								GLBaseData.author=$data.ak;
							}
						}catch(e:Error){}
						handlerFun(param1.currentTarget.data);
						isHandler = true;
						clearAll();
					}// end if
					
					return;
				}
				;
			timerFn = 
				function (param1:TimerEvent) : void
				{
					if (reload)
					{
						if (getTimer() - timerValue > timeout && requestNum == 0)
						{
							aURLLoader.load(aURLRequest);
							timerValue = getTimer();
							requestNum = 1;
						}
						else if (getTimer() - timerValue > timeout && requestNum == 1)
						{
							if (!isHandler)
							{
								trace(Util.transArgToUrl(url,_postData));
								handlerFun("{\"code\":\"103\",\"desc\":\"time out\"}");
								isHandler = true;
								clearAll();
							}// end if
							
						}// end else if
					}
					else if (getTimer() - timerValue > timeout)
					{
						if (!isHandler)
						{
							trace(Util.transArgToUrl(url,_postData));
							
							handlerFun("{\"code\":\"103\",\"desc\":\"time out\"}");
							isHandler = true;
							clearAll();
						}// end if
						
					}// end else if
					return;
				}
				;
			aURLLoader.addEventListener(IOErrorEvent.IO_ERROR, ioerrorHandler);
			aURLLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			aURLLoader.addEventListener(Event.COMPLETE, loadCompHandler);
			aURLLoader.load(aURLRequest);
			timerValue = getTimer();
			requestNum = 0;
			m_timer.addEventListener(TimerEvent.TIMER, timerFn);
			return;
		}
		
		public static function getInstance() : HttpRequest
		{
			if( m_instance == null )
			{
				m_instance = new HttpRequest();
			}
			return m_instance;
		}
		
	}
}