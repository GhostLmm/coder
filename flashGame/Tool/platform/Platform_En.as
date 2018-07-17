package Tool.platform
{
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Platform_En extends EventDispatcher implements IPlatform
	{
		public function Platform_En()
		{
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
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		public function getDetailItems():void
		{
		}
		
		public function get moneyType():String
		{
			return "$";
		}
		
		public function buyItem(itemType:String):void
		{
			
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
			return Locales.Get("help_info_en_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_en_2");
		}
		
		
	
	}
}