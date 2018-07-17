package Tool.platform
{
	import Tool.Googlplay.GoogPlayContest;
	import Tool.Googlplay.GooglePlayPlatform;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Platform_Thai_Android extends EventDispatcher implements IPlatform
	{
		//正式key
		public static const key:String = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAq2NV/GQrNW5xY0sUnm3GiMeoQP+YeXwKULWJViK7wtjK+v958W7BaAUTSmcjq/13xCjM72bPF9QpPbaW4/gMtOHMSLk9fzj4DQ/ZiRx7IIjRFdUvsuuS308SnvuTLsdq/WXrWAALFFH+d/1hsPYHn2NfE25rmDnRBfFZbxo/l8lqf7jInrphSWo/rXPAploo9ugzdy8KpJ7qf/DQ/DrwitOlz8l84SX4Qd9hmNKs7+JRnCu8qtX9364Z5gycco+xwc1WOQkEk4GPOsy1+Zn49O5gICP2nrB6BhVVMyQT3KH0fOJq89GUVUie99KY4+SlCxHIg4tbweTloM+ylszFAwIDAQAB";
		//商品xml
		public function get xmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"Thai_Android_Items.xml";
		}
		
		/** 
		 * 快速登入
		 */		
		public function Platform_Thai_Android()
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
			return "$";
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
			return "help_info_thaiAndroid_1";
		}
		
		public function getPlatKefu2():String
		{
			return "help_info_thaiAndroid_2";
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
			return "Android_Thai";
		}
	}
}