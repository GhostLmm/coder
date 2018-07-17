package Tool.Googlplay
{
	import com.milkmangames.nativeextensions.GVFacebookFriend;
	import com.milkmangames.nativeextensions.GoViral;
	import com.milkmangames.nativeextensions.events.GVFacebookEvent;

	public class FacebookPlat
	{
		private var _argObj:Object={};
		private static var _instance:FacebookPlat;
		
		private var _shareCom:Function;
		private var _shareFail:Function;
		private var _loginOutCom:Function;
		
//		private static const ShareLinkUrl:String="";
		
//		private function getSharePicUrl():String
//		{
//			return "";
//		}
		public static function getInstance():FacebookPlat
		{
			if(_instance==null) _instance=new FacebookPlat();
			return _instance;
		}
		
		public function setAppId(id:String):void
		{
			AppID=id;
		}
			
		
		/**日本 的facebook appid
		 * */
		public static const FaceBookID_JP_Googleplay:String="289006261212870";

		/**   英文版本的 facebookId iphone
		 * */
		public static const FaceBookID_EN_AppStore_Iphone:String="357255367684180";
		
		/**   英文版 facebookId Ipad
		 * */
		public static const FaceBookID_EN_Appstore_Ipad:String="418406061559748";
		
		/**   英文 版  facebookId Android  自己的版本
		 * */
		public static const FaceBookID_EN_Googleplay_Android:String="357255367684180";
		
		/**   中东 的 facebookId  Android ，英文的，其他平台代理发布
		 * */
		public static const FaceBookID_EN_FbGp_MEAndroid:String="252032094923251";
		
		//日本 的facebook appid
		private var AppID:String="289006261212870";
		private var loginComplete:Function;
		private var loginFail:Function;
		
		public function init():void
		{
			if (!GoViral.isSupported())
			{
				
			}
			else
			{
				GoViral.create();
				GoViral.goViral.initFacebook(AppID);
				registerListern();
			}
			
		}
		private function registerListern():void
		{
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGGED_IN,onFacebookEvent);
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGGED_OUT,onFacebookEvent);
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGIN_CANCELED,onFacebookEvent);
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGIN_FAILED,onFacebookEvent);
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_REQUEST_FAILED,onFacebookEvent);
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_REQUEST_RESPONSE,onFacebookEvent);
			
			//分享
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_DIALOG_CANCELED,onFacebookEvent);
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_DIALOG_FAILED,onFacebookEvent);
			GoViral.goViral.addEventListener(GVFacebookEvent.FB_DIALOG_FINISHED,onFacebookEvent);
			
			
		}
		private function onFacebookEvent(e:GVFacebookEvent):void
		{
 			switch(e.type)
			{
				case GVFacebookEvent.FB_LOGGED_IN:
					GoViral.goViral.requestMyFacebookProfile();
					
					break;
				case GVFacebookEvent.FB_LOGGED_OUT:
					if(_loginOutCom!=null)
					{
						_loginOutCom();
					}
					break;
				case GVFacebookEvent.FB_REQUEST_RESPONSE:
					if(e.graphPath=="me/permissions")
					{
						var urlDecode:UrlDecode=new UrlDecode(e.data.paging.next);
						
						var token:String=urlDecode.arg["access_token"];
						
						_argObj.token=token;
						
						if(loginComplete!=null)
						{
							loginComplete(_argObj);
						}
						loginComplete=null;
						loginFail=null;
						trace("the token is "+token);
					}
					if (e.graphPath=="me")
					{
						//						e.data.id e.data.name
						var myProfile:GVFacebookFriend=e.friends[0];
						_argObj.openId=e.data.id;
						_argObj.name=e.data.name;
						_argObj.secret="noSecret";
						GoViral.goViral.facebookGraphRequest("me/permissions");
					}
					break;
				case GVFacebookEvent.FB_LOGIN_CANCELED:
					loginFail();
					break;
				case GVFacebookEvent.FB_LOGIN_FAILED:
					loginFail();
					break;
				
				case GVFacebookEvent.FB_DIALOG_FINISHED:
					trace("分享完成");
					if(_shareCom!=null)
					{
						_shareCom();
					}
					break;
				case GVFacebookEvent.FB_DIALOG_CANCELED:
					trace("分享失败");
					if(_shareFail!=null)
					{
						_shareFail();
					}
					break;
				case GVFacebookEvent.FB_DIALOG_FAILED:
					trace("分享失败");
					if(_shareFail!=null)
					{
						_shareFail();
					}
					break;
			}
		}
		public function loginOut(louginOutComplete:Function):void
		{
			_loginOutCom=louginOutComplete;
			GoViral.goViral.logoutFacebook();
		}
		
		public function login(_complete:Function,_fail:Function):void
		{
			loginComplete=_complete;
			loginFail=_fail;
			if(!GoViral.goViral.isFacebookAuthenticated())
			{
				trace("**************facebook版本号 "+GoViral.VERSION+"***************");
				if(GoViral.VERSION=="3.0.3"){
					GoViral.goViral.authenticateWithFacebook("user_likes,user_photos");
				}else{
					GoViral.goViral.authenticateWithFacebook("user_likes,user_photos,publish_stream");
				}
			}
			else
			{
				GoViral.goViral.requestMyFacebookProfile();
			}
		}
		
		public function share(title:String, comment:String, summary:String,link:String,picUrl:String,shareCom:Function,shareFail:Function):void
		{
			_shareCom=shareCom;
			_shareFail=shareFail;
			GoViral.goViral.showFacebookFeedDialog(
				title,
				comment,
				"message",
				summary,
				link,
				picUrl
			);
		}
	}
}