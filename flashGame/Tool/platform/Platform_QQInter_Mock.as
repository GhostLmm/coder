package Tool.platform
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	
	/**   测试用的 qq平台， 可以直接在pc上测试，节约时间， 这是一个不错的开端
	 *    have a good time
	 * 
	 * */
	public class Platform_QQInter_Mock extends EventDispatcher implements IPlatform
	{
		private var _userInfo:PlatformUserInfo;
		public function Platform_QQInter_Mock()
		{
			_userInfo=new PlatformUserInfo();
			_userInfo.suportPlatUsername=true;
			_userInfo.suportPlatHeadpic=true;
			_userInfo.suportPlatFriendInfo=true;
		}
		private var comfn:Function;
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			comfn=_comFn;
		}
		
		public function login():void
		{
			_userInfo.headPicUrl="http://qzapp.qlogo.cn/qzapp/100616028/D273EC1AE39AB7A34678B7F3AC7BD4C2/100";
			_userInfo.platUserName="茂明";
			comfn("D9BF9D211298441AE5F38131CDC52C58","BB757CCC02691C844608F282000CDAD7");
		}
		
		public function get platCode():String
		{
			return "qqconnect";
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
		}
		
		public function get moneyType():String
		{
			return null;
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
			return null;
		}
		
		public function getPlatKefu1():String
		{
			return null;
		}
		
		public function getPlatKefu2():String
		{
			return null;
		}
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		
		/**  是否支持平台用户社交信息
		 * */
		public function get suportSocialInfo():Boolean
		{
			return true;
		}
		
		/**  只有支持平台用户信息的平台才可以获取平台的社交信息
		 * */
		public function getPlatformUserInfo():PlatformUserInfo
		{
			return _userInfo;
		}
	}
}