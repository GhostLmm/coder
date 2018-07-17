package Tool.platform
{
	import Tool.FileLog;
	
	import com.ghostlmm.txV3Sdk.LogEvent;
	import com.ghostlmm.txV3Sdk.LoginEvent;
	import com.ghostlmm.txV3Sdk.PlatformConfig;
	import com.ghostlmm.txV3Sdk.TXSdkHelper;
	import com.ghostlmm.txV3Sdk.TxUserInfo;
	import com.ghostlmm.txV3Sdk.UserInfoEvent;
	import com.thor.utils.Locales;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import myDisplay.WindowManager;
	import myDisplay.global.GlobalConfig;
	import myDisplay.window.Wnd_QQChongzhi;
	
	/**    腾讯大厅版本， 无线 ，  腾讯无线sdk3.0版本 
	 * */
	public class Platform_QQGameHall extends EventDispatcher implements IPlatform
	{
		private var _hasLogin:Boolean=false;
		private var _loginCom:Function;
		private var _loginFail:Function;
		
		private var _userInfo:PlatformUserInfo=new PlatformUserInfo();
		private var _openKey:String;
		
		private static const QQChongzhiWindow:String="qq_chongzhiWindow";
		public function Platform_QQGameHall()
		{

			TXSdkHelper.self.goodId=204;
			TXSdkHelper.self.inviteId="";
			
//			TXSdkHelper.self.openLog=true;
//			TXSdkHelper.self.setAppInfoForDebug("100616028","6fefbc4f6f313da57dbfa4fcbbf37e8d",com.ghostlmm.txV3Sdk.PlatformConfig.ENUM_PLATFORM_ID_QZONE_HAVE_LOGIN);
//			trace("ENUM_PLATFORM_ID_QZONE_HAVE_LOGIN: "+com.ghostlmm.txV3Sdk.PlatformConfig.ENUM_PLATFORM_ID_QZONE_HAVE_LOGIN);
//			TXSdkHelper.self.setDebug();
			
			if(GLOBAL._mainLoader.cfg.platform.indexOf("sandbox")!=-1)
			{
				TXSdkHelper.self.openLog=true;
				TXSdkHelper.self.setAppInfoForDebug("100616028","6fefbc4f6f313da57dbfa4fcbbf37e8d",com.ghostlmm.txV3Sdk.PlatformConfig.ENUM_PLATFORM_ID_QQHALL_HAVE_LOGIN);
				TXSdkHelper.self.setDebug();
			}
			else
			{
				TXSdkHelper.self.openLog=false;
			}
			
			
			TXSdkHelper.self.addEventListener(LoginEvent.Login,onLoginResult);
			TXSdkHelper.self.addEventListener( UserInfoEvent.GetSelf,onGetSelfResult);
			TXSdkHelper.self.addEventListener(UserInfoEvent.GetFriends,onGetFriendResult);
			
			TXSdkHelper.self.initPlat();
			
			WindowManager.getInstance().addNewWidowPool(QQChongzhiWindow,Wnd_QQChongzhi);
			_userInfo.suportPlatFriendInfo=false;
			_userInfo.suportPlatHeadpic=true;
			_userInfo.suportPlatUsername=true;
		}
		
		public function showChongzhi():void
		{
			WindowManager.getInstance().openWindow(QQChongzhiWindow);
		}
		
		private function onLoginResult(evt:LoginEvent):void
		{
			if(_hasLogin)
			{
				NativeApplication.nativeApplication.exit(0);
			}
			else
			{
				if(evt.success)
				{
					_userInfo.platOpenId=evt.data.openId;
					_openKey=evt.data.openKey;
					getMySelfData();
					
				}
			}
			
		}
		private function getMySelfData():void
		{
			TXSdkHelper.self.getUserInfo();
		}
		private function onGetSelfResult(evt:UserInfoEvent):void
		{
			if(evt.success)
			{
				if((evt.data as TxUserInfo).id && (evt.data as TxUserInfo).id!="")
				{
					_userInfo.platOpenId=(evt.data as TxUserInfo).id;
				}
				_userInfo.platUserName=(evt.data as TxUserInfo).name;
				_userInfo.headPicUrl=(evt.data as TxUserInfo).picUrl;
				
				FileLog.log("QQInfo",_userInfo.platOpenId+","+_userInfo.platUserName+","+_userInfo.headPicUrl);
				
			}
			if(_loginCom!=null)
			{
				var postArg:Object={};
//				"figureurl":"http://qlogo1.store.qq.com/qzone/465209208/465209208/50"
				var temp:Array=_userInfo.headPicUrl.split("/");
				if(temp.length>2){
					postArg.qq=temp[temp.length-2];
				}
				
				postArg.headpic=_userInfo.headPicUrl;
				_loginCom(_userInfo.platOpenId,_openKey,"",postArg);
				_loginCom=null;
				_loginFail=null;
			}
			_hasLogin=true;
		}
		private function onGetFriendResult(evt:UserInfoEvent):void
		{
			
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			_loginCom=_comFn;
			_loginFail=_failFn;
		}
		
		public function login():void
		{
			TXSdkHelper.self.login();
		}
		
		public function get platCode():String
		{
			return "qq";
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
			return "￥";
		}
		
		public function buyItem(itemType:String):void
		{
			TXSdkHelper.self.buy();
		}
		
		public function get suportQiehuan():Boolean
		{
			return false;
		}
		
		public function zhanghaoQiehuan():void
		{
			TXSdkHelper.self.logout();
		}
		
		public function init():void
		{
		}
		
		public function getPlatUserName():String
		{
			return _userInfo.platUserName;
		}
		
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_qq_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_qq_2");
		}
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		public function get suportSocialInfo():Boolean
		{
			return true;
		}
		
		public function getPlatformUserInfo():PlatformUserInfo
		{
			return _userInfo;
		}
		
		public function get ExtrFlagObj():Object
		{
			var obj:Object={};
			obj[PlatExtrFlag.UsePlatPayPage]=true;
			obj[PlatExtrFlag.HideLevelGiftVaule]=true;
			return obj;
		}
		
		public function get platName():String
		{
			return "qq";
		}
		
		
	}
}