package Tool.platform
{
	import Tool.Googlplay.GoogPlayContest;
	import Tool.Googlplay.GooglePlayPlatform;
	
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Platform_Europe_En_Gp extends EventDispatcher implements IPlatform 
	{
		public function get xmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"Europe_En_Items.xml";
		}
		
		/**  googleplay 的 public key
		 * */
		private static const PublicKey:String="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApnsP/9JGwxrj90/vsQUXcN0I/UjDEq2rlC41bMkSTjPnZfE3BzoT5H1yV+/CtdV9Lfu8qUe8mJstwdimAUP9H7GQkEJWBN4Txi7s0MRqiAvjWbak1E49NsPhOGWpaJA+MXOxp410UApm0H0OVHKKoLg6+gbpIISD9l80ZcrYdr54m9uFBeD15R+SHJ9nfu06LMK/bnuTWnxWSiuo38hgvszul0cXFTYBoE/8zKLVSJHg+Ll+2qP9YOMZTb1uK4S19A95iM5wIr4sRwR4QayRKl6GC/E+897e4jme5CaQv5XcbANNqthF7ZKe9w8UnnYJC8qMIVQaQben6hENVAIxfwIDAQAB";
		
		
		public function Platform_Europe_En_Gp()
		{
			GoogPlayContest.initGooglay(PublicKey,GoogPlayContest.BackUrl_Facebook_En);
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
			return "local";
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
			return "$";
		}
		
		public function buyItem(itemType:String):void
		{
			GooglePlayPlatform.getInstance().buyItem(itemType);
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
			return  GLOBAL.emailStr;
		}
		
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_letang_En_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_letang_En_2");
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
			return "europe_en_gp";
		}
		
		
	}
}