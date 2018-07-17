package Tool.facebook
{
	import Tool.Googlplay.FacebookPlat;
	import Tool.SpecialFunction;
	import Tool.platform.PlatformManager;

	
	import com.greensock.TweenLite;
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.SharedObject;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import model.login.ServerInfo;
	
	import myDisplay.tips.TextTipManager;

	public class FacebookExtrPlat extends EventDispatcher
	{
		
		public static var suportFacebook:Boolean=true;
		
		public static function setSuportFacebook(value:Boolean):void{

			//如果是测试模式下，就不检测是否有facebook对应的ane
			CONFIG::FacebookTest{
				if(!SpecialFunction.hasClass("com.milkmangames.nativeextensions.GoViral")){
					suportFacebook=false;
					return ;
				}
			}
			suportFacebook=value;
		}
		
		public static const BindOK:String="bindOk";
		public static const BindError:String="bindError";
		
		public static const ShareOK:String="shoreOk";
		public static const ShareError:String="shareError";
		
		public static const LoginGameOK:String="loginGameOk";
		public static const LoginGameError:String="loginGameError";
		
		public static const LogoutGameOK:String="logoutGame";
		
		private var facebookPlat:Object;

		
	
		/**   游戏开始后 多少时间后显示Like信息 秒
		 * */
		private static const FirstLike:int=5*60;
//		private static const FirstLike:int=30;
		/**   like 间隔时间  毫秒
		 * */
		private static const LikeOffsetTime:Number=5*24*60*60*1000;
//		private static const LikeOffsetTime:Number=30*1000;
		
		/**  当前是以facebook账号登陆游戏
		 * */
		public static var DengluFacebook:Boolean=false;
		
		/**  是否需要绑定facebook
		 * */
		public static function needBindFacebook():Boolean{
			if(FacebookExtrPlat.suportFacebook && !FacebookExtrPlat.DengluFacebook && ServerInfo.uid!=null && ServerInfo.bindFacebook==null){
				return true;
			}
			return false;
		}
		
		public function FacebookExtrPlat()
		{
			if(suportFacebook){
				facebookPlat=FacebookAdapt.getFacebookObj();
				if(facebookPlat is FacebookPlatMock){
					FacebookConfig.setMock();
					trace("************现在是在facebookMock状态下*************");
				}
				facebookPlat.setAppId(FacebookConfig.appId);
				facebookPlat.init();
			}
		}
		
		private static var _instance:FacebookExtrPlat=new FacebookExtrPlat();
		public static function get instance():FacebookExtrPlat{
			if(_instance==null){
				_instance=new FacebookExtrPlat();
			}
			return _instance;
		}
		
		public var state:String;
		public var ST_Bind:String="bind";
		public var ST_Share:String="share";
		public var ST_LoginGame:String="loginGame";
		private var _onlyId:String;
		
		public var _so:SharedObject;
		
		public function bindFacebook(onlyId:String):void{
			if(!suportFacebook) return ;
			if(onlyId==null || onlyId==""){
				trace(" 无效 onlyId，无法绑定facebook");
				return ;
			}
			_onlyId=onlyId;
			state=ST_Bind;
			facebookPlat.login(facebookLoginCom,facebookLoginFail);
			
		}
		/**   从facebook 登录完成
		 * */
		public function setLoginWithFacebookComplete():void{
			hasLogin=true;
			DengluFacebook=true;
			setLoginFromFacebookFlag(true);
		}
		
		public var openId:String;
		public var token:String;
		public var name:String;
		
		private var hasLogin:Boolean=false;
		
		public var result:String;
		
		public function facebookLoginCom(data:Object):void{
			openId=data.openId;
			token=data.token;
			name=data.name;
			
			switch(state){
				case ST_Bind:
					bindFacebookResult();
					break;
				case ST_Share:
					facebookPlat.share(shareTitle,shareComment,shareSummary,getShareLinkUrl(),getSharePicUrl(),shareComplete,shareFailed);
					break;
				case ST_LoginGame:
//					startGame();
					dispatchEvent(new Event(LoginGameOK));
					break;
			}
			state="";
			
		}
		
		public function logout():void{
			if(!suportFacebook) return ;
			if(hasLogin){
				facebookPlat.loginOut(onLogoutCom);
			}
		}
		
		private function onLogoutCom():void{
			hasLogin=false;
			openId=null;
			name=null;
			token=null;
			DengluFacebook=false;
			setLoginFromFacebookFlag(false);
			PlatformManager.getInstance().showWaitAfterLogout();
			dispatchEvent(new Event(LogoutGameOK));
			
		}
		
		
//		private function startGame():void{
////			PlatformManager.getInstance()._normalLogin(openId,token);
//			GLOBAL._mainLoader.loginBack(openId,token);
//		}
		
		public function loginGame():void{
			if(!suportFacebook) return ;
			
			state=ST_LoginGame;
			facebookPlat.login(facebookLoginCom,facebookLoginFail);
		}
		
		
		private var shareTitle:String;
		private var shareComment:String;
		private var shareSummary:String;
		public function share(comment:String, summary:String):void
		{
			if(!suportFacebook) return ;
			shareTitle=getShareTitle();
			shareComment=comment;
			shareSummary=summary;
			if(hasLogin){
				facebookPlat.share(shareTitle,comment,summary,getShareLinkUrl(),getSharePicUrl(),shareComplete,shareFailed);
			}else{
				state=ST_Share;
				facebookPlat.login(facebookLoginCom,facebookLoginFail);
			}
		}
		
		private function getShareTitle():String{
			return Locales.Get("facebookShareTitle");
		}
		
		private function getSharePicUrl():String
		{
			var random:int=(int(Math.random()*1000)%3)+1;
			
			return EnvironmentParameter.gamePreUrl+"share/"+"share_facebook_en_"+random+".png";
//			return "https://redwar.s3.amazonaws.com/testAssets/assets/feed/share_facebook_en_1.png";
			//			return EnvironmentParameter.headPicPreUrl+"feedimg/"+"share_facebook_en_"+random+".png";
		}
		private function getShareLinkUrl():String
		{
//			return "https://www.facebook.com/appcenter/redwarfare";
			return FacebookConfig.shareLink;
		}
		private function shareComplete():void
		{
			sendShareToServer();
			dispatchEvent(new Event(ShareOK));
			
		}
		private function sendShareToServer():void{

			var arg:Object={};
			arg.u=ServerInfo.onlyId;
			arg.uid=ServerInfo.uid;
			arg.serverid=ServerInfo.getInstance().getNowServerId();
			HttpRequest.getInstance().getRequest(EnvironmentParameter.gamePreUrl+"sendFreed.php",arg,webShareResult);
			trace(EnvironmentParameter.gamePreUrl+"sendFreed.php"+ServerInfo.transGetargToString(arg));
		}
		
		private function webShareResult(data:Object):void{
			var str:String=data.toString();
			trace(str);
			if(str.indexOf("ok")!=-1){
				TextTipManager.getInstance().addTip(Locales.Get("fbShareCompleteTip"));
			}
		}
		
		
		private function shareFailed():void
		{
			dispatchEvent(new Event(ShareError));
		}
		
		private function bindFacebookResult():void{
//			post["source"]="facebook";
//			post["bind"]=ServerInfo.getInstance().onlyId;
//			post["openid"]=facebookData.openid;
//			post["token"]=facebookData.token;
			var post:Object={};
			post["source"]="facebook";
			post["bind"]=_onlyId;
			post["openid"]=openId;
			post["token"]=token;
			trace(GLOBAL.webUrl+"?"+ServerInfo.transGetargToString(post));
			HttpRequest.getInstance().postRequest(GLOBAL.webUrl,post,bindResult);
		}
		
		public function setLoginFromFacebookFlag(flag:Boolean):void{
			var so:SharedObject=SharedObject.getLocal(GLOBAL.sharePath);
			so.data.facebook=flag;
			so.flush();
		}
		
		private function bindResult(data:Object):void{
			trace(data.toString());
			
			try{
				var json:Object=JSON.parse(data.toString());
				if(json.code){
					result="error on http";
					dispatchEvent(new Event(BindError));
					return ;
				}
			}catch(e:Error){
				
			}
			var info:String=data.toString();
			
			
			if(info.indexOf("error")==-1){
				result="ok";
				hasLogin=true;
				dispatchEvent(new Event(BindOK));
				setLoginFromFacebookFlag(true);

			}else if(info=="error account already bind"){
				result=info;
				dispatchEvent(new Event(BindError));
			}
				//fecebook 没有返回
//			else if(info.indexOf("error on facebook chk null")!=-1){
//				
//			}
//				//facebook 验证不通过
//			else if(info.indexOf("error on facebook id")!=-1){
//				
//			}
			else if(info.indexOf("error on account is bound")!=-1){
				result="error on account is bound, could loading from facebook";
				dispatchEvent(new Event(BindError));
//				(PlatformManager.getInstance().platformObj as Object).bindFacebookComplete(data);
				
			}
			else{
				result=info;
				dispatchEvent(new Event(BindError));
			}
			
			
		}
		
//		http://54.235.207.153:8080/login_server.php?token=CAAF8icCrz8QBAG61bZCZAk5RHYa64gY4ra9JwaIc7v4sGKPIUVdsPdFfHz1fJMBoj4EUcDFcWfbjmZCDJtvNCgC81DNAoY6kDwR9pvc0JjEZBRiMpDoZBN9ZAERWDsy8XtaBl6QIZCsZBFx5WodAaoyGWgpfKXO345cAeCyFRD1efAZDZD&openid=100002352698161&json=true&serverid=0&source=facebook
		
		private function facebookLoginFail():void{
			result="error on facebook login";
			switch(state){
				case ST_Bind:
//					result="error on facebook login";
					dispatchEvent(new Event(BindError));
					break;
				case ST_LoginGame:
//					result="error";
					dispatchEvent(new Event(LoginGameError));
					break;
				case ST_Share:
					dispatchEvent(new Event(ShareError));
					break;
			}
			state="";
			
		}
		
		
		
		

		
//		private var _likeSo:SharedObject;
		private var _likePath:String;
		
		public function startLike():void{
			
			
			//新手引导完成，并且是facebook登陆
			if(TUTORIAL._completed && DengluFacebook && openId){
				var arg:Object={};
				arg.u=ServerInfo.onlyId;
				arg.uid=ServerInfo.uid;
				arg.serverid=ServerInfo.getInstance().getNowServerId();
				arg.type="chklike";
				HttpRequest.getInstance().getRequest(EnvironmentParameter.gamePreUrl+"sendLike.php",arg,fbCheckResult);
				trace(EnvironmentParameter.gamePreUrl+"sendLike.php"+ServerInfo.transGetargToString(arg));
			}
		}
		
		private function fbCheckResult(data:Object):void{
			if(data.toString()=="0"){
				_so=SharedObject.getLocal(GLOBAL.sharePath);
				if(_so && _so.data[openId]==null){
					_so.data[openId]=new Date().time;
					_so.flush();
				}
				
				if(_so && _so.data[openId]){
					var now:Number=(new Date()).time;
					if(now-_so.data[openId]>LikeOffsetTime){
						TweenLite.delayedCall(FirstLike,fbLike);
						trace("3分钟后弹窗")
					}
				}
				trace(data.toString()+" "+ (new Date()).time.toString()+" "+_so.data[openId]);
			}
		}
		
		private function fbLike():void{
			//新手引导完成，并且是facebook登陆
			if(TUTORIAL._completed && DengluFacebook && openId){
				
				if(_so){
					_so.data[openId]=(new Date()).time;
					_so.flush();
				}
				
				var title:String=Locales.Get("fbLike_title");
				var message:String=Locales.Get("fbLike_message");
				var confrim_desc:String=Locales.Get("fbLike_confirm_desc");
				var cancel_desc:String=Locales.Get("fbLike_cancel_desc");

				SpecialFunction.showAlert(title,message,confrim_desc,fbLikeConfirm,cancel_desc,fbLikeCancel);

			}
		}
		private function fbLikeConfirm():void{
			TweenLite.killTweensOf(fbLike);
			
			var arg:Object={};
			arg.u=ServerInfo.onlyId;
			arg.uid=ServerInfo.uid;
			arg.serverid=ServerInfo.getInstance().getNowServerId();
			arg.type="inlike";
			HttpRequest.getInstance().getRequest(EnvironmentParameter.gamePreUrl+"sendLike.php",arg,likeBack);
			trace(EnvironmentParameter.gamePreUrl+"sendLike.php"+ServerInfo.transGetargToString(arg));
			
			
			TweenLite.delayedCall(1,goFbLikeUrl);
		}
		
		private function goFbLikeUrl():void{
			navigateToURL(new URLRequest(FacebookConfig.likeLink),"_blank");
		}
		
		private function likeBack(data:Object):void{
		}
		private function fbLikeCancel():void{
		}
	}
}