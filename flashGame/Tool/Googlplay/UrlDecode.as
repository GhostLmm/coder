package Tool.Googlplay
{
	public class UrlDecode
	{
		private var _url:String;
		public function UrlDecode(_url:String)
		{
			this._url=_url;
			_arg={}
		  	var index:int=_url.indexOf("?");
			if(index==-1)
			{
				_webHead=_url;
			}
			else
			{
				_webHead=_url.substring(0,index);
				var argString:String=_url.substring(index+1,_url.length);
				
				var temp1:Array=argString.split("&");
				for each(var objString:String in temp1)
				{
					var temp2:Array=objString.split("=");
					if(temp2.length==2)
					{
						_arg[temp2[0]]=temp2[1];
					}
				}
			}
		}
		
		private var _webHead:String;
		private var _arg:Object;
		
		public function get webHead():String
		{
			return _webHead;
		}
		
		public function get arg():Object
		{
			return _arg;
		}
		
		public function get url():String
		{
			return _url;
		}
	}
}