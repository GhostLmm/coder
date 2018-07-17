package Tool.platform
{
	import com.nativeextension.tencent.SNSGetSelfEvent;
	import com.nativeextension.tencent.SNSLogEvent;
	import com.nativeextension.tencent.SNSLoginEvent;
	import com.nativeextension.tencent.SNSLoginType;
	import com.nativeextension.tencent.SNSPersonalFieldType;
	import com.nativeextension.tencent.SNSSdkHelper;
	import com.nativeextension.tencent.SNSTokenInvalidEvent;
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	public class PlatformQQ_android extends EventDispatcher implements IPlatform
	{
		private var _backFn:Function;
		
		private var _userInfo:PlatformUserInfo;
		private var _userId:String;
		private var _userToken:String;
		private var _userSecret:String;
		
		public function PlatformQQ_android()
		{
			
			_userInfo=new PlatformUserInfo();
			_userInfo.suportPlatFriendInfo=true;
			_userInfo.suportPlatHeadpic=true;
			_userInfo.suportPlatUsername=true;
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			_backFn=_comFn;
		}
		
		public function login():void
		{
			SNSSdkHelper.self.addEventListener(SNSLogEvent.EVENT_LOG,onLog);
			SNSSdkHelper.self.doSetDebugMode(false);
			SNSSdkHelper.self.doSetAppId("100616028");
			SNSSdkHelper.self.doSetConsumer("Dm04nqo3j6zq6Lup4T8V","6fefbc4f6f313da57dbfa4fcbbf37e8d");
			SNSSdkHelper.self.doSetAppName("红警大战","air.RedWarfare");
			SNSSdkHelper.self.addEventListener(SNSLoginEvent.EVENT_LOGIN, onLogin);
			var type:int;
			type=SNSLoginType.LOGIN_TYPE_HALL;
			SNSSdkHelper.self.doRequestLogin(type);
			SNSSdkHelper.self.addEventListener(SNSTokenInvalidEvent.EVENT_TOKEN_INVALID,onInvalid);
		}
		
		private function onLogin(evt:SNSLoginEvent):void
		{									
			if(evt.result)
			{										
					_userId = evt.data.openId;
					_userToken = evt.data.token;
					_userSecret = evt.data.secret;
					_backFn(_userId,_userToken,_userSecret)
			}
			else
			{
				SNSSdkHelper.self.doRequestReLogin(SNSLoginType.LOGIN_TYPE_HALL);
			}
		}
		
		private function checkToken():void
		{
			var vec:Vector.<String> = new Vector.<String>;			
			vec.push(SNSPersonalFieldType.FIELD_ID,SNSPersonalFieldType.FIELD_DISPLAY_NAME);
			SNSSdkHelper.self.addEventListener(SNSGetSelfEvent.EVENT_SELF,setToken);
			SNSSdkHelper.self.doGetSelf(vec);
		}
		
		private function setToken(evt:SNSGetSelfEvent):void
		{
			_backFn(_userId,_userToken,_userSecret)
		}
		
		private function onLog(evt:SNSLogEvent):void
		{
			var file:File = File.documentsDirectory.resolvePath("log.txt");
			var fs:FileStream = new FileStream();
			fs.open(file,FileMode.UPDATE);
			if(fs.bytesAvailable)
			{
				fs.readUTFBytes(fs.bytesAvailable);
			}
			fs.writeUTFBytes(evt.data + "\n");
		}
		
		private function onInvalid(evt:SNSTokenInvalidEvent):void
		{
			SNSSdkHelper.self.doRequestReLogin(SNSLoginType.LOGIN_TYPE_HALL);
		}
		
		public function get platCode():String
		{
			return "qq";
		}
		
		public function get platName():String
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
		
		public  function get ExtrFlagObj():Object
		{
			var obj:Object={};
			obj[PlatExtrFlag.DontShowQiehuan]=true;
			return obj;
		}
	}
}