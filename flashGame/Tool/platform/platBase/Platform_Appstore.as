package Tool.platform.platBase
{
	import Tool.Inapp_appstore.ChongzhiTool;
	import Tool.platform.IPlatform;
	import Tool.platform.PlatformEvent;
	import Tool.platform.PlatformManager;
	import Tool.platform.PlatformUserInfo;
	
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	
	//飞流版本 和 自己的appstore 公用一个
	public class Platform_Appstore extends EventDispatcher implements IPlatform
	{
		public function Platform_Appstore()
		{
			
		}
		
		protected function initChongzhiTool():void
		{
			throw new Error("子类改写");
//			ChongzhiTool.setPayXmlNameStr(PlatAdapt.feiliuItemXmlUrl);
//			ChongzhiTool.setPayUrl(PlatAdapt.backUrl);
//			ChongzhiTool.getInstance().init();
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
			return "appStore";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		public function getDetailItems():void
		{
			ChongzhiTool.getInstance().applyPrudctXml(onGetProductsCom);
		}
		
		private function onGetProductsCom(itemArray:Array):void
		{
			var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
			e.data=itemArray;
			dispatchEvent(e);
		}
		
		public function get moneyType():String
		{
			return "￥";
			
		}
		
		public function buyItem(itemType:String):void
		{
			ChongzhiTool.getInstance().buy(itemType);
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
			initChongzhiTool();
		}
		
		public function getPlatUserName():String
		{
			return GLOBAL.emailStr;
		}
		
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_local_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_local_2");
		}
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		
		/**  是否支持平台用户社交信息
		 * */
		public function get suportSocialInfo():Boolean
		{
			return false
		}
		
		/**  只有支持平台用户信息的平台才可以获取平台的社交信息
		 * */
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
			throw new Error("必须在子类中继承");
		}
	}
}