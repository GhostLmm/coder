package Tool.facebook
{
	import Tool.ApplicationInfoDesc;

	public class FacebookConfig
	{
		public function FacebookConfig()
		{
		}
		
		private static const ConfigMap:Object={
			"com.sincetimes.redwarfare.enn":{
				"appId":"357255367684180",
				"shareLink":"https://www.facebook.com/appcenter/redwarfare",
				"likeLink":"https://www.facebook.com/pages/Red-Warfare/426392800741036"
			},
			"sincetimes.com.redwar.jp":{
				"appId":"289006261212870",
				"shareLink":"https://www.facebook.com/appcenter/wargamejp",
				"likeLink":"https://www.facebook.com/redwargamecommunity"
			}
			
		}
		
		private static var _mock:Boolean=false;
		private static var mockObj:Object={
			"appId":"357255367684180",
			"shareLink":"https://www.facebook.com/appcenter/redwarfare",
			"likeLink":"https://www.facebook.com/pages/Red-Warfare/426392800741036"
		}
		public static function setMock():void{
			_mock=true;
		}
		
		
		
		private static var _configObj:Object;
		public static function get configObj():Object{
			if(_configObj==null){
				if(_mock){
					_configObj=mockObj;
				}else{
					var bid:String=ApplicationInfoDesc.NativeInfo.packageId;
					bid=bid.replace("air.","");
					bid=bid.replace(".debug","");
					_configObj=ConfigMap[bid];
					if(_configObj==null){
						throw new Error("facebook没有配置  ID:"+bid);
					}
				}
				
			}
			return _configObj;
			
			
		}
		
		public static function get likeLink():String{
			return configObj.likeLink;
		}
		public static function get appId():String{
			return configObj.appId;
		}
		public static function get shareLink():String{
			return configObj.shareLink;
		}
	}
}