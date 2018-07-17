package Tool.platform
{
	import Tool.Googlplay.FacebookPlat;
	import Tool.Inapp_appstore.ChongzhiTool;
	
	import com.thor.utils.Locales;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import myDisplay.tips.TextTipManager;
	
	public class Platform_Facebook_Appstore_En extends EventDispatcher implements IPlatform
	{
		private var facebookPlat:FacebookPlat;
		private var loginComFn:Function;
		private var loginFailFn:Function;
		
		
		private var _userInfo:PlatformUserInfo;
		
		public function Platform_Facebook_Appstore_En()
		{
			ChongzhiTool.setPayUrl(ChongzhiTool.FaceBook_En_PayUrlName);
			ChongzhiTool.setPayXmlNameStr(ChongzhiTool.FaceBook_En_ItemsXmlName);
			
			facebookPlat=FacebookPlat.getInstance();
			
			facebookPlat.setAppId(getFacebookId());
			
			
			facebookPlat.init();
			
			_userInfo=new PlatformUserInfo();
			_userInfo.suportPlatUsername=true;
			_userInfo.suportPlatHeadpic=true;
			_userInfo.suportPlatFriendInfo=false;
			_userInfo.createPlatPicUrl=getPlatPicUrl;
			
			
//			ChongzhiTool.getInstance().setArg();
			ChongzhiTool.getInstance().init();
		}
		
		private static function getPlatPicUrl(openId:String):String
		{
			return "https://graph.facebook.com/"+openId+"/picture";
		}
		
		private function getFacebookId():String
		{
			if(EnvironmentParameter.PickType==EnvironmentParameter.PICK_TYPE_IPAD)
			{
				return FacebookPlat.FaceBookID_EN_Appstore_Ipad;
			}
			else
			{
				return FacebookPlat.FaceBookID_EN_AppStore_Iphone;
			}
		}
		
		private function getShareLinkUrl():String
		{
			if(EnvironmentParameter.PickType==EnvironmentParameter.PICK_TYPE_IPAD)
			{
				return "https://itunes.apple.com/us/app/red-warfare-hd/id578187103?";
			}
			else
			{
				return "https://itunes.apple.com/us/app/red-warfare/id578185424?";
			}
		}
		
		private function getSharePicUrl():String
		{
			var random:int=(int(Math.random()*1000)%5)+1;
			return EnvironmentParameter.headPicPreUrl+"feedimg/"+"share_facebook_en_"+random+".png";
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			loginComFn=_comFn;
			loginFailFn=_failFn;
		}
		
		public function login():void
		{
			facebookPlat.login(faceBookLoginCom,loginFailFn);
		}
		
		private function faceBookLoginCom(data:Object):void
		{
			if(null!=loginComFn)
			{
				_userInfo.platUserName=data.name;
				_userInfo.platOpenId=data.openId;
				_userInfo.headPicUrl=getPlatPicUrl(_userInfo.platOpenId);
				loginComFn.apply(null,[data.openId,data.token]);
			}
		}
		
		public function get platCode():String
		{
			return "facebook";
		}
		
		public function get suportShare():Boolean
		{
			return true;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
			facebookPlat.share(title,comment,summary,getShareLinkUrl(),getSharePicUrl(),shareComplete,shareFailed);
		}
		
		private function shareComplete():void
		{
			dispatchEvent(new PlatformEvent(PlatformEvent.ShareSuccess));
		}
		private function shareFailed():void
		{
			dispatchEvent(new PlatformEvent(PlatformEvent.ShareFail));
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
			return "$";
		}
		
		public function buyItem(itemType:String):void
		{
			ChongzhiTool.getInstance().buy(itemType);
		}
		
		public function get suportQiehuan():Boolean
		{
			return true;
		}
		
		public function zhanghaoQiehuan():void
		{
			facebookPlat.loginOut(loginOutCom);
		}
		
		/**  注销成功
		 * */
		private function loginOutCom():void
		{
//			TextTipManager.getInstance().addTip(Locales.Get("zhanghaoZhuxiaoInfo"));
			GLOBAL.Message(Locales.Get("qiehuan_info_facebook"));
		}
		
		private function showAlert():void
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
			return Locales.Get("help_info_appstoreFB_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_appstoreFB_2");
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
		
		/**   附加的标志量，用于扩展,  
		 * */
		public function get ExtrFlagObj():Object
		{
			return null;
		}
		
	}
}