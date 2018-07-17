package Tool.platform
{
	import Tool.platform.IPlatform;
	
	import com.nativeextension.tencentios.SNSLogEvent;
	import com.nativeextension.tencentios.SNSLoginEvent;
	import com.nativeextension.tencentios.SNSPermissionType;
	import com.nativeextension.tencentios.SNSSdkHelper;
	import com.nativeextension.tencentios.SNSVerifyEvent;
	import com.thor.utils.Locales;
	
	import flash.desktop.NativeApplication;
	import flash.events.EventDispatcher;

	/**    独立与qq游戏大厅的平台   qq互联
	 * */
	public class PlatformQQ2 extends EventDispatcher implements IPlatform
	{
		private static const ProductId:String="100616028";
		private static const SharUrl:String="http://redwarfare.sincetimes.com/redwarfare/redwarfare.htm";
//		private static const RedirectUrl:String="http://connect";
		
		/*public static function get ShareUrl():String
		{
			return "http://www.baidu.com/s?ie=utf-8&bs=a&f=8&rsv_bp=1&rsv_spt=3&wd="+Math.random().toString()+"&inputT=0";
		}
		*/
		public static const LoginSuccess:String="loginSuccess";
		public static const LoginFail:String="loginFail";
		public static const LoginCancle:String="loginCancle";
		
		private var loginComFn:Function;
		private var loginFailFn:Function;
		private var _userInfo:PlatformUserInfo;
		
		private var openId:String;
		private var token:String;
		
		public function PlatformQQ2()
		{	
			SNSSdkHelper.self.appId=ProductId;
			var permission:Vector.<String>=new Vector.<String>();
			permission.push(SNSPermissionType.ADD_ALBUM,SNSPermissionType.ADD_ONE_BLOG,SNSPermissionType.ADD_SHARE,SNSPermissionType.ADD_TOPIC,
				SNSPermissionType.CHECK_PAGE_FANS,SNSPermissionType.GET_USER_INFO,SNSPermissionType.LIST_ALBUM,SNSPermissionType.UPLOAD_PIC);
			SNSSdkHelper.self.permission=permission;
//			SNSSdkHelper.self.redirectUrl=redirectUrl;
//			SNSSdkHelper.self.redirectUrl=redirectUrl;
			SNSSdkHelper.self.addEventListener(SNSLoginEvent.EVENT_LOGIN,onLoginResult);
			SNSSdkHelper.self.addEventListener(SNSLogEvent.EVENT_LOG,onLog);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_USERINFO,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_BADNETWORK,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_LOGOUT,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_SHARE,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_GET_APP_FRIENDS,onVerify);
			
			
			_userInfo=new PlatformUserInfo();
			_userInfo.suportPlatUsername=true;
			_userInfo.suportPlatHeadpic=true;
			_userInfo.suportPlatFriendInfo=true;
		}
		private function onLog(evt:SNSLogEvent):void
		{
			trace("qqPlatLog: "+evt.data);
		}
		
		public function get suportMoreHelp():Boolean
		{
			return true;
		}
		
		public function get platCode():String
		{
			return "qqconnect";
		}
		public function setLoginFn(_comFn:Function,_failFn:Function):void
		{
			loginComFn=_comFn;
			loginFailFn=_failFn;
		}
		
		public function onVerify(evt:SNSVerifyEvent):void
		{
			switch(evt.type)
			{
				case SNSVerifyEvent.EVENT_GET_APP_FRIENDS:
		
					break;
				case SNSVerifyEvent.EVENT_USERINFO:
				{
					if(evt.IsSuccessful)
					{
						_userInfo.headPicUrl=evt.data.figureurl_2;
						_userInfo.platUserName=evt.data.nickname;
						
						SNSSdkHelper.self.getAppFriends();
						
//						if(loginComFn!=null)
//						{
//							loginComFn(openId,token);
//						}
					}
					else
					{
						if(loginFailFn!=null)
						{
							loginFailFn();
						}
					}
					
					
					
					break;
				}
				case SNSVerifyEvent.EVENT_SHARE:
					break;
				default:
				{
					break;
				}
			}
		}
		public function login():void
		{
			SNSSdkHelper.self.login();
		}
		private function onLoginResult(evt:SNSLoginEvent):void
		{
			if(evt.result)
			{
				openId=evt.data.openId;
				token=evt.data.token;
				getUserInfo();
			}
			else
			{
				if(loginFailFn!=null)
				{
					loginFailFn();
					loginFailFn=null;
				}
			}
		}
		private function getUserInfo():void
		{
			SNSSdkHelper.self.getUserInfo();
		}
		public function get suportShare():Boolean
		{
			return true;
		}
		
		public function share(title:String,comment:String,summary:String):void
		{
			SNSSdkHelper.self.share(title,SharUrl,comment,summary,"4");
		}
		
		public function buyItem(itemType:String):void
		{
			
		}
		public function get moneyType():String
		{
			return "$";
		}
		
		public function get suportQiehuan():Boolean
		{
			return true;
		}
		
		public function zhanghaoQiehuan():void
		{
			SNSSdkHelper.self.login();
		}
		/**  平台账号名称
		 * */
		public function getPlatUserName():String
		{
			return "";
		}
		
		/**  获取客服支持1
		 * */
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_local_1");
		}
		
		/**  获取客服支持2
		 * */
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_local_2");
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
		
		
		
		public function init():void
		{
			
		}
		
		public function getDetailItems():void
		{
			
		}
	}
}