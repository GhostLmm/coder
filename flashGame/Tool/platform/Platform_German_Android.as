package Tool.platform
{
	import Tool.Googlplay.GoogPlayContest;
	import Tool.Googlplay.GooglePlayPlatform;
	
	import com.thor.utils.Locales;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Platform_German_Android extends EventDispatcher implements IPlatform
	{
		
		//正式key
		public static const key:String = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsonlEPnofLJBPxUIN09TrdRCEMHX2O/oavd00sMfNd/+qo0XQ2Ip4XJYnVLtb8qDNdSd3kPBlC41DLSnFNeDIMfZWfiPum7WjfXrNS/JbAjXuObqFnR69txQ8kqp2Vlw9YS+A8ZMKsVyQd/Vs9o7Y+7UGHvB0AdlopR+9dkGypG8lu9ZnURl8Kv7b/MOQ+4mB4ONsfMt5HmVOM0anmtA3Gz7kwtZGUpwL7FTwvt3u2FU9/SPD9vrfqPb8L3uHK/B5e2A3wexSkHZIAPov9h1xfvtxTtC2tAwmpksCuLhLx6UGSYCdOZHARPdgEpm1UCD8SBIx1zKz74diswGRy5kgwIDAQAB";
		
		
		//商品xml
		public function get xmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"Ger_Android_Items.xml";
		}
		
		
		public function Platform_German_Android(target:IEventDispatcher=null)
		{
			GoogPlayContest.initGooglay(key,GoogPlayContest.BackUrl_Facebook_En);
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			
		}
		
		public function login():void
		{
			PlatformManager.getInstance()._normalLogin();
		}
		
		public function get platCode():String
		{
			return "facebook";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		private var itemsLoad:ItemsXmlLoaderProxy;
		public function getDetailItems():void
		{
			if(itemsLoad==null) itemsLoad=new ItemsXmlLoaderProxy();
			//			var itemsLoad:ItemsXmlLoaderProxy=new ItemsXmlLoaderProxy();
			itemsLoad.startLoad(this,xmlUrl);
		}
		
		public function get moneyType():String
		{
			return "€";
		}
		
		public function buyItem(itemType:String):void
		{
			GooglePlayPlatform.getInstance().buyItem(itemType) ;
		}
		
		public function get suportQiehuan():Boolean
		{
			return false;
		}
		
		public function zhanghaoQiehuan():void
		{
		}
		
		public function init():void
		{
		}
		
		public function getPlatUserName():String
		{
			return GLOBAL.emailStr;
		}
		
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_android_de_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_android_de_2");
		}
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		public function get suportSocialInfo():Boolean
		{
			return false;
		}
		
		public function getPlatformUserInfo():PlatformUserInfo
		{
			return null;
		}
		
		public function get ExtrFlagObj():Object
		{
			return null;
		}
		
		public function get platName():String
		{
			return "Android_Ger";
		}
	}
}