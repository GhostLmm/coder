package Tool
{
	public class ConfigXmlLanguage
	{
		public function ConfigXmlLanguage()
		{
		}
		private static var _language:Object;
		private static var _configXML:XML;
		public static  function getLanguage(key:String):String
		{
			try{
				if(_configXML==null){
					_configXML=GLOBAL._mainLoader.cfg._data;
				}
			}catch(e:Error){
				trace(e.message);
			}
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
	}
}