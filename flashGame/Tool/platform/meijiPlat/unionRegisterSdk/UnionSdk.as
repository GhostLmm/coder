package Tool.platform.meijiPlat.unionRegisterSdk
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import Tool.PersistentObj;
	import Tool.login.LoginControl;
	import Tool.login.LoginWayData;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import core.LayerController;
	
	import util.Util;
	
	public class UnionSdk extends EventDispatcher
	{
		
//		public static const ActiveFastLogin:Boolean=true;
		
		public static const NO_ACCOUNT:int = 1;
		public static const QUICK_ACCOUNT:int = 2;
		public static const BIND_ACCOUNT:int = 3;
		public static const ACCOUNT_CONFLICT:int = -2;
		public static const ACCOUNT_NOT_EXISTS:int= -3;
		
		private static const UnionSdkLocalPath:String="com.unionSdk";
		private var _perObj:PersistentObj;
		
		
		public static const LoginSuccess:String="loginSuccess";
		
		public var loginOp:String;
		
		public function UnionSdk()
		{
			_perObj=new PersistentObj(UnionSdkLocalPath);
			super();
		}
		
		private static var _instance:UnionSdk;
		public static function get instance():UnionSdk{
			if(_instance==null) _instance=new UnionSdk();
			return _instance;
		}
		
		private var _uid:String;
		
		public function get uid():String{
			return _uid;
		}
		
		private var _token:String;
		public function get token():String{
			return _token;
		}
		
		private var _loginPage:UnionDenglu;
		private var _registerPage:UnionZhuce;
		private var _fastPage:UnionFastDenglu;
		private var _accountLoginPage:UnionAccountLogin;
		
		public var macResult:int;
		private var bindAccount:String;
		/**
		 *  
		 */
		public function login():void{
			requestMacAccountInfo();
		}
		
		private function onCheckMacComplete():void{
			// 如果有本地缓存的 账号记录 就用账号登陆
			if(_perObj.getValueByKey("uid")!=null && _perObj.getValueByKey("token")!=null){
				var uid:String=_perObj.getValueByKey("uid") as String;
				var token:String=_perObj.getValueByKey("token") as String;
//				showLoginPage(uid,token);
				var evt:UnionSdkEvent=new UnionSdkEvent(UnionSdkEvent.UnionDengluOk);
				evt.uid=uid;
				evt.token=token;
//				onGoDenglu(evt);
//				onLoginOk(evt);
//				showLoginPage(uid,token);
				showAutoLoginPage(uid,token,true);
				return ;
			}
			if(macResult==BIND_ACCOUNT){
				showLoginPage(bindAccount);
			}
			if(macResult==NO_ACCOUNT){
//				if(ActiveFastLogin){
				if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
					showFastLogin(false);
				}else{
					showLoginPage();
				}
				
			}
			if(macResult==QUICK_ACCOUNT){
				Util.flow("检测到该设备使用过游客账号登录，建议绑定注册一个账号进行游戏");
//				if(ActiveFastLogin){
				if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
					showFastLogin(true);
				}else{
					showRegisterPage();
				}
				
			}
		}
		
		/** 显示快速登录界面  **/
		private function showFastLogin(autoLogin:Boolean):void{
			if(_fastPage==null){
				_fastPage=new UnionFastDenglu();
				_fastPage.x=GlobalRef.width/2;
				_fastPage.y=GlobalRef.height/2;
			}
			_fastPage.setAutoLogin(autoLogin);
			LayerController.instance.registerLayer.removeChildren();
			LayerController.instance.registerLayer.addChild(_fastPage);
		}
		
		public function init():void{
			var viewDis:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
			viewDis.addEventListener(UnionSdkEvent.UnionDengluOk,onLoginOk);
			viewDis.addEventListener(UnionSdkEvent.UnionRegisterOk,onRegisterOk);
			viewDis.addEventListener(UnionSdkEvent.UnionGoPage,onGoPage);
			viewDis.addEventListener(UnionSdkEvent.UnionClosePage,onClosePage);
			viewDis.addEventListener(UnionSdkEvent.UnionFastLoginOk,onFastLoginOk);
		}
		private function onGoPage(evt:UnionSdkEvent):void{
//			showLoginPage();
			if(evt.targetPage==UnionDenglu){
				showLoginPage();
			}
			if(evt.targetPage==UnionZhuce){
				showRegisterPage();
			}
			if(evt.targetPage==UnionFastDenglu){
				showFastLogin(false);
			}
		}
		private function onClosePage(evt:UnionSdkEvent):void{
//			showRegisterPage();
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin)){
				if(evt.inGame){
					clearPage();
					return ;
				}
				if(_perObj.getValueByKey("uid")!=null && _perObj.getValueByKey("token")!=null){
					showAutoLoginPage(_perObj.getValueByKey("uid").toString(),_perObj.getValueByKey("token").toString());
				}else{
					showFastLogin(false);
				}
				
			}else{
				showLoginPage();
			}
		}
		
		private function getMac():String{
			return PlatformManager.udid;//+"1";
		}
		
		private function onLoginOk(evt:UnionSdkEvent):void{
			var arg:Object={};
			arg.openid=evt.uid;
			arg.token=LoginControl.createToken(evt.token);
			arg.platname=PlatformManager.getInstance().getOnlyPlatName();
			arg.op=LoginControl.LoginWay_Email;
			arg.deviceToken=getMac();
			arg.os=PlatformManager.getInstance().getOsType();
			HttpRequestRepeat.getRequest(UrlConfig.UnionAccountUrl,arg, function (data:String):void{
				var json:Object;
				try{
					json=JSON.parse(data);
				}catch(e:Error){
					showCodeTip("jsonError"+arg.op);
					return ;
				}
//				{"aid":"858394487913169quick","ak":"0876a4a9-575c-4282-bca7-4e417e64e703","appurl":"http://test","appversion":"2.0.1","huodongUrl":"http://124.202.139.50:8080/pre/huodong","huodongVersion":"2.0.6","lastServerId":1,"lastopen":6,"maintainPage":"http://124.202.139.50:8080/pre/maintain/maintain.html","maintainUrl":"http://124.202.139.50:8080/pre/CheckServer","result":1,"su":"http://124.202.139.50:8080/meiji/andriod/serverlist.zip","sv":2,"welcomeUrl":"http://124.202.139.50:8080/pre/gonggao/gonggao.html","xmlUrl":"http://124.202.139.50:8080/meiji/andriod/xml.zip","xmlVersion":"2.0.4"}
				if(json.hasOwnProperty("code")){
					showCodeTip(json.code);
					showLoginPage();
				}else{
					var result:int=json.result;
					if(result==1){
						savaAccountToLocal(evt.uid,evt.token);
						_uid=evt.uid;
						_token=evt.token;
						loginOp=LoginControl.LoginWay_Email;
						LoginControl.getInstance().proccessLoginGameCallBack(json,LoginControl.LoginWay_Email,arg.openid,arg.token);
						clearPage();
						
						dispatchEvent(new UnionSdkEvent(UnionSdkEvent.LoginResult));
					}
					if(result<=0){
						Util.flow("账号或者密码输入错误！");
						showLoginPage();
					}
					
				}
			},true);
		}
		
		private function savaAccountToLocal(uid:String,token:String):void{
			_perObj.setVaule("uid",uid);
			_perObj.setVaule("token",token);
		}
		
		private function clearPage():void{
			if(_loginPage) {_loginPage.destory(); _loginPage=null;}
			if(_registerPage) {_registerPage.destory();_registerPage=null;}
			if(_fastPage) {_fastPage.destory(); _fastPage=null;}
			if(_accountLoginPage) {_accountLoginPage.destory(); _accountLoginPage=null;}
//			var viewDis:ViewDispatcher=Context.getInjectInstance(ViewDispatcher);
//			viewDis.removeEventListener(UnionSdkEvent.UnionDengluOk,onLoginOk);
//			viewDis.removeEventListener(UnionSdkEvent.UnionRegisterOk,onRegisterOk);
//			viewDis.removeEventListener(UnionSdkEvent.UnionGoPage,onGoPage);
//			viewDis.removeEventListener(UnionSdkEvent.UnionClosePage,onClosePage);
//			viewDis.removeEventListener(UnionSdkEvent.UnionFastLoginOk,onFastLoginOk);
			
			LayerController.instance.registerLayer.removeChildren();
			
		}
		
		private function onFastLoginOk(evt:UnionSdkEvent):void{
			var arg:Object={};
//			arg.openid=evt.uid;
//			arg.token=LoginControl.createToken(evt.token);
			arg.platname=PlatformManager.getInstance().getOnlyPlatName();
			arg.op=LoginControl.LoginWay_FastLogin;
			arg.deviceToken=getMac();
			arg.os=PlatformManager.getInstance().getOsType();
			
			LoginControl.getInstance().tempArg=arg;
			HttpRequestRepeat.getRequest(UrlConfig.UnionAccountUrl,arg, function (data:String):void{
				var json:Object;
				try{
					json=JSON.parse(data);
				}catch(e:Error){
					showCodeTip("jsonError"+arg.op);
					return ;
				}
				//				{"aid":"858394487913169quick","ak":"0876a4a9-575c-4282-bca7-4e417e64e703","appurl":"http://test","appversion":"2.0.1","huodongUrl":"http://124.202.139.50:8080/pre/huodong","huodongVersion":"2.0.6","lastServerId":1,"lastopen":6,"maintainPage":"http://124.202.139.50:8080/pre/maintain/maintain.html","maintainUrl":"http://124.202.139.50:8080/pre/CheckServer","result":1,"su":"http://124.202.139.50:8080/meiji/andriod/serverlist.zip","sv":2,"welcomeUrl":"http://124.202.139.50:8080/pre/gonggao/gonggao.html","xmlUrl":"http://124.202.139.50:8080/meiji/andriod/xml.zip","xmlVersion":"2.0.4"}
				if(json.hasOwnProperty("code")){
					showCodeTip(json.code);
					showLoginPage();
				}else{
					var result:int=json.result;
					if(result==1){
						savaAccountToLocal(evt.uid,evt.token);
						_uid=evt.uid;
						_token=evt.token;
						loginOp=LoginControl.LoginWay_FastLogin;
						LoginControl.getInstance().proccessLoginGameCallBack(json,LoginControl.LoginWay_FastLogin,arg.openid,arg.token);
						
						clearPage();
						dispatchEvent(new UnionSdkEvent(UnionSdkEvent.LoginResult));
					}
					if(result<=0){
						Util.flow("账号或者密码输入错误！");
						showLoginPage();
					}
					
				}
			},true);
		}
		
		private function onRegisterOk(evt:UnionSdkEvent):void{
			var arg:Object={};
			arg.openid=evt.uid;
			arg.token=LoginControl.createToken(evt.token);
			arg.platname=PlatformManager.getInstance().getOnlyPlatName();
			arg.op=LoginControl.LoginWay_Register;
			arg.deviceToken=getMac();
			arg.os=PlatformManager.getInstance().getOsType();
			LoginControl.getInstance().tempArg=arg;
			HttpRequestRepeat.getRequest(UrlConfig.UnionAccountUrl,arg,function (data:String):void{
				var json:Object;
				try{
					json=JSON.parse(data);
				}catch(e:Error){
					showCodeTip("jsonError"+arg.op);
					return ;
				}
				
				if(json.hasOwnProperty("result")){
					var result:int=json.result;
					if(result==ACCOUNT_CONFLICT){
						Util.flow("该用户名已经被注册");
						return ;
					}
					if(result==ACCOUNT_NOT_EXISTS){
						Util.flow("注册失败");
						return ;
					}
					if(result==1){
						//注册成功
						Util.flow("注册成功");
						if(!evt.inGame){
							onLoginOk(evt);
						}
						
					}
					
				}else{
					showCodeTip(json.code);
				}
				
			},true);
			
		}
		
		/**
		 *   请求该Mac下的账号信息
		 */
		private function requestMacAccountInfo():void{
			
			var arg:Object={};
//			arg.openid=openid;
//			arg.token=token;
			arg.platname=PlatformManager.getInstance().getOnlyPlatName();
			arg.op=LoginControl.AccountCheck;
			arg.deviceToken=getMac();
			arg.os=PlatformManager.getInstance().getOsType();
			
			LoginControl.getInstance().tempArg=arg;
			HttpRequestRepeat.getRequest(UrlConfig.UnionAccountUrl,arg, function (data:String):void{
//				{"ec":"已经绑定账号","openid":"500","result":3}
				var json:Object;
				try{
					json=JSON.parse(data);
				}catch(e:Error){
					showCodeTip("jsonError"+arg.op);
					return ;
				}
				if(json.hasOwnProperty("result")){
					macResult=json.result;
					bindAccount=json.openid;
					onCheckMacComplete();
				}else{
//					Util.flow("服务器访问不成功，请检查网络 "+json.code);
					showCodeTip(json.code);
				}
			},true);
//			HttpRequestRepeat.getRequest("",{},
			
//			showLoginPage();
		}
		
		private function showCodeTip(code:*):void{
			Util.flow("服务器访问不成功，请检查网络 code:  "+code);
		}
		
		private function showAutoLoginPage($account:String,$token:String,$autoLogin:Boolean=false):void{
			if(_accountLoginPage==null){
				_accountLoginPage=new UnionAccountLogin();
				_accountLoginPage.x=GlobalRef.width/2;
				_accountLoginPage.y=GlobalRef.height/2;
			}
			LayerController.instance.registerLayer.removeChildren();
			LayerController.instance.registerLayer.addChild(_accountLoginPage);
			_accountLoginPage.start($account,$token,$autoLogin);
		}
		
		/**
		 *   显示注册界面
		 */
		public function showRegisterPage():void{
			if(_registerPage==null){
				_registerPage=new UnionZhuce();
				_registerPage.x=GlobalRef.width/2;
				_registerPage.y=GlobalRef.height/2;
			}
			_registerPage.setBind(false);
			LayerController.instance.registerLayer.removeChildren();
			LayerController.instance.registerLayer.addChild(_registerPage);
		}
		
		/**
		 *   显示登录界面
		 */
		public function showLoginPage($uid:String=null,$token:String=null):void{
			if(_loginPage==null){
				_loginPage=new UnionDenglu();
				_loginPage.x=GlobalRef.width/2;
				_loginPage.y=GlobalRef.height/2;
			}
			LayerController.instance.registerLayer.removeChildren();
			LayerController.instance.registerLayer.addChild(_loginPage);
			if($uid){
				_loginPage.setAccount($uid,$token);
			}
		}
		
		public function bindAccountInGame():void{
			init();
			if(_registerPage==null){
				_registerPage=new UnionZhuce();
				_registerPage.x=GlobalRef.width/2;
				_registerPage.y=GlobalRef.height/2;
			}
			_registerPage.setBind(true);
			LayerController.instance.registerLayer.removeChildren();
			LayerController.instance.registerLayer.addChild(_registerPage);
		}
		
		public function logout():void{
			_perObj.clear();
		}
		
		
	}
}