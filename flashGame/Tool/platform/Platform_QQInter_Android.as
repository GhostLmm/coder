package Tool.platform
{
	import Tool.platform.IPlatform;
	
	import com.nativeextension.tencentinterandroid.SNSInvalidSessionEvent;
	import com.nativeextension.tencentinterandroid.SNSLogEvent;
	import com.nativeextension.tencentinterandroid.SNSLoginEvent;
	import com.nativeextension.tencentinterandroid.SNSPermissionType;
	import com.nativeextension.tencentinterandroid.SNSSdkHelper;
	import com.nativeextension.tencentinterandroid.SNSVerifyEvent;
	import com.thor.utils.Locales;
	
	import flash.desktop.NativeApplication;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	/**    独立与qq游戏大厅的平台   qq互联
	 * */
	public class Platform_QQInter_Android extends EventDispatcher implements IPlatform
	{
		private static const ProductId:String="100616028";
		private static const SharUrl:String="http://redwarfare.sincetimes.com/redwarfare/redwarfare.htm";
		//		private static const RedirectUrl:String="http://connect";
		
//		public static function get ShareUrl():String
//		{
//			var data:String=new Date().toString();
//			return "http://redwarfare.sincetimes.com/redwarfare/redwarfare.html?"+Math.random().toString()+data;
//		}
		
		public static const LoginSuccess:String="loginSuccess";
		public static const LoginFail:String="loginFail";
		public static const LoginCancle:String="loginCancle";
		
		private var loginComFn:Function;
		private var loginFailFn:Function;
		private var _userInfo:PlatformUserInfo;
		
		private var openId:String;
		private var token:String;
		
		
		
		private var userName:String="";
		
		private static function get shareImagPerUrl():String
		{
			return EnvironmentParameter.headPicPreUrl+"feedimg/";
		}
		
		private static const ImageNum:int=5;
		private static const ImagUrlArray:Array=[
			
			];
		public function Platform_QQInter_Android()
		{	
			SNSSdkHelper.self.appId=ProductId;
			var permission:Vector.<String>=new Vector.<String>();
			permission.push(SNSPermissionType.ADD_SHARE, SNSPermissionType.GET_USER_INFO, SNSPermissionType.GET_APP_FRIENDS, SNSPermissionType.GET_SIMPLE_USERINFO);
//			permission.push(SNSPermissionType.ADD_SHARE, SNSPermissionType.GET_USER_INFO, SNSPermissionType.GET_SIMPLE_USERINFO);
			SNSSdkHelper.self.permission=permission;
			SNSSdkHelper.self.addEventListener(SNSLoginEvent.EVENT_LOGIN,onLoginResult);
			SNSSdkHelper.self.addEventListener(SNSLogEvent.EVENT_LOG,onLog);
//			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_USERINFO,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_SIMPLE_USERINFO,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_BADNETWORK,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_LOGOUT,onVerify);
			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_SHARE,onVerify);
//			SNSSdkHelper.self.addEventListener(SNSVerifyEvent.EVENT_GET_APP_FRIENDS,onVerify);
//			SNSSdkHelper.self.addEventListener(
			
			SNSSdkHelper.self.addEventListener(SNSInvalidSessionEvent.EVENT_SESSIONINVALID,onInvalidSession);
									
			_userInfo=new PlatformUserInfo();
			_userInfo.suportPlatUsername=true;
			_userInfo.suportPlatHeadpic=true;
			_userInfo.suportPlatFriendInfo=true;
		}
		/**
		 *  中途失去连接，需要重新登录
		 * */
		private function onInvalidSession(evt:SNSInvalidSessionEvent):void
		{
			
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
		
		/**  获取好友的详细信息
		 * */
		private function getFriendsDetialInfo(openIdArray:Array):void
		{
			var friends:String="";
			for each(var id:String in openIdArray)
			{
				friends+=id+",";
			}
			friends=friends.substr(0,friends.length-1);
			var extr:Object={"friends":friends};
			
			if(loginComFn!=null)
			{
				loginComFn(openId,token,"",extr);
			}
			
			loginComFn=null;
			loginFailFn=null;
		}
		
		public function onVerify(evt:SNSVerifyEvent):void
		{
			switch(evt.type)
			{
				case SNSVerifyEvent.EVENT_GET_APP_FRIENDS:
//					var openIdArray:Array=[];
//					var friendsDic:Dictionary=new Dictionary();
//					if( evt.IsSuccessful && evt.data && evt.data.hasOwnProperty("items"))
//					{
//						for each(var friendItem:Object in evt.data.items)
//						{
////							evt.data.items[0].openid="D273EC1AE39AB7A34678B7F3AC7BD4C2"
////							evt.data.items[0].figureurl_2="http://qzapp.qlogo.cn/qzapp/100616028/D273EC1AE39AB7A34678B7F3AC7BD4C2/100"
////							evt.data.items[0].nickname="茂明"
//							
//							friendsDic[friendItem.openid]=friendItem;
//							openIdArray.push(friendItem.openid);
//						}
//					}
//					_userInfo.tempFriends=friendsDic;
//					getFriendsDetialInfo(openIdArray);
					break;
				case SNSVerifyEvent.EVENT_SIMPLE_USERINFO:
					//					userName=evt.
					if(evt.IsSuccessful)
					{
						_userInfo.headPicUrl=evt.data.figureurl_2;
						_userInfo.platUserName=evt.data.nickname;
						userName=evt.data.nickname;
						if(loginComFn!=null)
						{
							loginComFn(openId,token,"",{"friends":""});
						}
//						SNSSdkHelper.self.getAppFriends();
					}
					else
					{
						if(loginFailFn!=null)
						{
							loginFailFn();
						}
					}

					
					break;

				case SNSVerifyEvent.EVENT_SHARE:
					if(evt.IsSuccessful)
					{
						dispatchEvent(new PlatformEvent(PlatformEvent.ShareSuccess));
					}
					else
					{
						dispatchEvent(new PlatformEvent(PlatformEvent.ShareFail));
					}
					break;
				/*case SNSVerifyEvent.EVENT_USERINFO:
				{
					_userInfo=new PlatformUserInfo();
//					userName=evt.
					_userInfo.headPicUrl=evt.data.figureurl_2;
					if(loginComFn!=null)
					{
						loginComFn(openId,token,_userInfo.headPicUrl);
					}
					
					//分享测试
//										share("人生就是这么完美","评论吗","详细内容");
					
					break;
				}*/
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
				
				if(loginComFn!=null)
				{
					getUserInfo();
				}
				else
				{
					showAlert();
				}
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
//			SNSSdkHelper.self.getUserInfo();
			SNSSdkHelper.self.getSimpleUserInfo();
		}
		public function get suportShare():Boolean
		{
			return true;
		}
		
		public function share(title:String,comment:String,summary:String):void
		{
			SNSSdkHelper.self.share(title,SharUrl,comment,summary,"4",getRandomImg());
			
		}
		
		private function getRandomImg():String
		{
			var rand:int= (int(1000*Math.random()) % ImageNum)  + 1;
			var iamgeUrl:String=shareImagPerUrl+"share_qqconenct_"+rand+".jpg";
			return iamgeUrl;
//			share_qqconenct_1.jpg
//			if(ImagUrlArray.length==0)
//			{
//				return null;
//			}
//			var rand:int= int(1000*Math.random()) % ImagUrlArray.length;
//			return ImagUrlArray[rand];
		}
		
		public function buyItem(itemType:String):void
		{
			
			SNSSdkHelper.self.pay();
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
			return userName;
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

		public function init():void
		{
			
		}
		
		public function getDetailItems():void
		{
			var proxy:ItemsXmlLoaderProxy=new ItemsXmlLoaderProxy();
			proxy.startLoad(this,"url");
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
		
		private function showAlert():void
		{
//			var alert:downLoadAlert = new downLoadAlert();
//			alert.x = (GameSystemData._gameSize.width - alert.width)/2;
//			alert.y = (GameSystemData._gameSize.height - alert.height)/2;
//			alert.tA.text = Locales.Get("qiehuan_info");
//			
//			
//			alert.cancelTf.text = Locales.Get("btn_quxiao");
//			alert.cancelTf.mouseEnabled = false;
//			alert.actionTf.text = Locales.Get("btn_ok");
//			alert.actionTf.mouseEnabled = false;
//			alert.bCancel.visible=false;
//			alert.cancelTf.visible=false;
//			alert.bAction.addEventListener(MouseEvent.CLICK,exitGame);
////			alert.bAction.addEventListener(MouseEvent.CLICK,goOnDownLoad);
////			alert.bCancel.addEventListener(MouseEvent.CLICK,exitGame);
//			GLOBAL._mainLoader.addChild(alert);
		}
		
		private function exitGame(evt:MouseEvent):void
		{
			NativeApplication.nativeApplication.exit();
		}
		public function get platName():String
		{
			return "qqInner";
		}
		public function get ExtrFlagObj():Object
		{
			var obj:Object={};
			obj[PlatExtrFlag.UsePlatPayPage]=true;
			return obj;
		}
	}
}