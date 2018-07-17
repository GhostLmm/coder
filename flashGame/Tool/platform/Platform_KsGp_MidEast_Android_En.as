package Tool.platform
{
	import Tool.Googlplay.GoogPlayContest;
	import Tool.Googlplay.GooglePlayPlatform;
	
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**   中东英文版  ， 快速登录
	 * */
	public class Platform_KsGp_MidEast_Android_En extends EventDispatcher implements IPlatform
	{
		public function get xmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"ME_FbGp_En_Items.xml";
		}
		/**  快速登录
		 * */
		public function Platform_KsGp_MidEast_Android_En()
		{
			GoogPlayContest.initGooglay(GoogPlayContest.PKey_FbGp_MidEast_En,GoogPlayContest.BackUrl_Facebook_En);
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
			return GLOBAL.emailStr;
		}
		
		public function getPlatKefu1():String
		{
			return "";
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_appstoreFB_2");;
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
		/**   各个平台唯一name
		 * */
		public function get platName():String
		{
			return "Arab_Gp_En";
		}
		
	}
}