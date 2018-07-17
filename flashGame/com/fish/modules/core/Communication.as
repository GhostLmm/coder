package com.fish.modules.core
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.mutou.tqt.DigC2SProto;
	import com.mutou.tqt.S2C.DigS2CProto;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import flash.utils.getTimer;
	
	import core.LayerController;
	
	import util.Util;

	public class Communication
	{
		public static const MaxSends:int=2;
		public static var postArray:Array=[];
		private static var m_timer:Timer;
		public function Communication()
		{
		}
		
		
		public static function sendInit():void
		{
			
		}

		public static const Biaozhi1:String="***********************************************************************************************";
		public static const Biaozhi2:String="-----------------------------------------------------------------------------------------------";
		public static const Biaozhi3:String="###############################################################################################";
		
		
		private static var webTick:int=0;
		
		private static function updateWaiter():void
		{
			if(webTick<=0){
				LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.hideWait();
			}else{
				LayerController.instance.webWaiterLayer && LayerController.instance.webWaiterLayer.showWait();
			}
		}
		
		public static function addWebTick():void{
			webTick++;
			updateWaiter();
		}
		public static function subWebTick():void{
			webTick--;
			updateWaiter();
		}
		
		private static function parseResult(bytes:ByteArray,c2s:DigC2SProto,needLog:Boolean):void
		{
			var message:DigS2CProto=new DigS2CProto();
//			message.readExternal(bytes);
			
			message.mergeFrom(bytes);
			if(needLog){
				Context.getInsance().logger.fatal("\n{4}\n  接受消息 rce:{0}\tcode:{1}\tlength:{5}\textr:{2}\n{3}\n{4}\n",[message.rce,message.retCode,message.extr,message,Biaozhi2,bytes.length]);
			}
			
//			Context.getInsance().logger.fatal("base64: \n{0}",[Base64.encodeByteArray(bytes)]);
			S2CHanlder.instance.processMessage(message,c2s);
		}
		
		private static function errorFun(data:String,message:DigC2SProto):void
		{
			Context.getInsance().logger.error("\n{0}\n协议 req:{1}\tid:{2}\n{3}\n{0}\n",[Biaozhi3,message.req,message.protoId,data]);
			ViewControl.onNetWrong(ErrorCode.NET_ERROR);
		}
		
		public static function sendMessage(message:DigC2SProto,_isNeedLoading:Boolean=true,_log:Boolean=true):void
		{
			//新手引导向后台发送数据
			/*if(!PlayerGuideManager.getInstance()._tutorialComplete)
			{
				message.yinDao=new XinshouYinDaoC2S();				
				message.yinDao.step=PlayerGuideManager.getInstance().getCurrentStep();
			}*/
	
			if(m_timer==null)
			{
				m_timer=new Timer(10000);
				m_timer.start();
			}
			if(_isNeedLoading)
			{
				webTick++;
			}
			updateWaiter();
			
			var bytes:ByteArray=new ByteArray();
			
//			message.writeExternal(bytes);
			
			message.writeTo(bytes);
//			trace(message);
//			trace("Base64:\n"+Base64.encodeByteArray(bytes));
			
			var log:ILogger=Context.getInsance().logger;
			log.fatal("\n{2}\n 发送协议：req:{0}\tid:{3}\tlength:{4}\n{1}\n{2}\n",[message.req,message,Biaozhi1,message.protoId,bytes.length]);
			
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
			
			var _name:String;
			var url:String=UrlConfig.serverUrl;
			var reload:Boolean=false;
			var timeout:int=30000;
			isHandler = false;
			aURLRequest = new URLRequest(UrlConfig.serverUrl);
			aURLRequest.method = URLRequestMethod.POST;
			aURLRequest.data = bytes;
			aURLLoader = new URLLoader();
			aURLLoader.dataFormat = URLLoaderDataFormat.BINARY;
			var clearAll:* = 
				function () : void
				{
					if(!isHandler){
						return ;
					}
					time=getTimer()-time;
					if(time>10000){
						trace("网络请求过长 ："+time/1000+" url: "+Util.transArgToUrl(url,_postData));
					}
					aURLLoader.close();
					m_timer.removeEventListener(TimerEvent.TIMER, timerFn);
					aURLLoader.removeEventListener(IOErrorEvent.IO_ERROR, ioerrorHandler);
					aURLLoader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
					aURLLoader.removeEventListener(Event.COMPLETE, loadCompHandler);
					if(_isNeedLoading)
					{
						webTick--;
					}
					updateWaiter();
					return;
				}
				;
			
			ioerrorHandler = 
				function (param1:IOErrorEvent) : void
				{
					if (!isHandler)
					{
						trace(Util.transArgToUrl(url,_postData));
						errorFun("{\"code\":\"101\",\"desc\":\"IOError\"}",message);
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
							errorFun("{\"code\":\"102\",\"desc\":" + param1.status + "}",message);
							isHandler = true;
							if(_isNeedLoading)
							{
								webTick--;
								updateWaiter();
							}
							
						}// end if
					}// end if
					return;
				}
				;
			loadCompHandler = 
				function (param1:Event) : void
				{
					if (!isHandler)
					{
						//网络异常时，不知干啥
						parseResult(param1.currentTarget.data,message,_log);
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
								errorFun("{\"code\":\"103\",\"desc\":\"time out\"}",message);
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
							errorFun("{\"code\":\"103\",\"desc\":\"time out\"}",message);
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
			
		}
	}
}


