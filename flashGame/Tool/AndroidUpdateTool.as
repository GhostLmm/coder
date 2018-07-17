package Tool
{
	import com.greensock.loading.LoaderMax;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.events.Request;

	public class AndroidUpdateTool
	{
		private static var _language:Object;
		private static var _configXML:XML;
		private static  function getLanguage(key:String):String
		{
			if(_configXML)
			{
				if(_language==null)
				{
					_language={};
					try
					{
						if(_configXML.language && _configXML.language[0].ln)
						{
							for each(var lnXml:XML in _configXML.language[0].ln)
							{
								_language[String(lnXml.@name)]=String(lnXml.@value);
							}
						}
					}catch(e:Error)
					{
						trace(" xml 解析错误: "+e.message);
					}
				}
				if(_language[key]==null) 
				{
					_language[key]=key;
					trace("configXml 中 "+key+" 没有翻译");
				}
				return _language[key];
			}
			return key;
		}
		
		private static function initConfigXml():void
		{
			if(_configXML==null)
			{
				try
				{
					_configXML=GLOBAL._mainLoader.cfg._data;
				}catch(e:Error)
				{
					var load:URLLoader=new URLLoader();
					load.dataFormat=URLLoaderDataFormat.TEXT;
					load.addEventListener(Event.COMPLETE,onXmlloadComplete);
					load.addEventListener(IOErrorEvent.IO_ERROR,onIoError);
					load.load(new URLRequest(GameSystemData.assetURL+GameSystemData.configXmlUrl));
					
				}
			}
		}
		private static function onIoError(evt:IOErrorEvent):void
		{
			trace(evt.text);
		}
		private static function onXmlloadComplete(evt:Event):void
		{
			_configXML=XML((evt.target as URLLoader).data);
			startUpdate();
		}
		
		public static function startUpdate(chongzhi:Boolean=false):void
		{
			if(EnvironmentParameter.isIos())
			{
				return ;
			}
			/**  新手引导没有完成不开启更新
			 * */
			if(!TUTORIAL._completed)
			{
				return ;
			}
			
			if(chongzhi)
			{
				var chongzhiShow:String=getLanguage("chongzhiShowUpdate");
				if(chongzhiShow=="chongzhiShowUpdate")
				{
					return ;
				}
				if(chongzhiShow!="true")
				{
					return ;
				}
			}
			
			
			initConfigXml();
			var version:String=getLanguage("version");
			var updateInfo:String=getLanguage("updateInfo");
			var updateUrl:String=getLanguage("updateUrl");
			var cancel:String=getLanguage("updateCancel");
			var ok:String=getLanguage("updateOk");
			var forceUpdate:String=getLanguage("forceUpdate");
			if(version=="version" || updateInfo=="updateInfo" || updateUrl=="updateUrl" || cancel=="updateCancel" || ok=="updateOk")
			{
				return ;
			}
			var versionId:int=ApplicationInfoDesc.handleVersionId(version);
			if(versionId>ApplicationInfoDesc.NativeInfo.versionId)
			{
				if(forceUpdate=="true")
				{
					cancel=null;
				}
				GLOBAL.confirm(updateInfo,ok,cancel,function update():void
				{
					BASE.Save();
					navigateToURL(new URLRequest(updateUrl),"_blank");
				});
			}
		}
		
	}
}