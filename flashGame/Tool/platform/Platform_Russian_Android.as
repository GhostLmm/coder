package Tool.platform
{
	import Tool.Googlplay.GoogPlayContest;
	import Tool.Googlplay.GooglePlayPlatform;
	
	import com.thor.utils.Locales;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class Platform_Russian_Android extends EventDispatcher implements IPlatform
	{
		//正式key
		public static const key:String = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAlpxydqwm/a/3nn5BgAsTlcfvX62DukEUtPy2MScRf6+dOV/PvD9AsV0ocqdchj6LAB7exLxmAVz+1ZYS2AIPiWgsWhpa6C+8thuEdfdNSk9H2H7ndzS/TQFxJI2C2yFZwcKvX6DynyRIVjYfuwbOdHv09BbEbbWIFtuGSdXDrAJGf06C3MReVFZ2vm1dNlP7fP7+h3yJLWU5qCsXjrRn8jb/AOHHSdRCfdX3uzmX5hMBWiPjEoZfuzSmeZp0FvUDJ6zOTAB9PFaT6ltCgyfA3AWXDSAQ1D7ZMfJPc5AuiBmNqOuytBJhRIGliXNuuL+mUDy1RYV6c8VDxqw1wQzJyQIDAQAB";
		
		//商品xml
		public function get xmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"Rus_Android_Items.xml";
		}
		
		public function Platform_Russian_Android(target:IEventDispatcher=null)
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
			return "руб";
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
			return Locales.Get("help_info_rusAndroid_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_rusAndroid_2");
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
			return "Android_Rus";
		}
	}
}