package Tool.login
{	
	import com.fish.GLBaseData;
	import com.ghostlmm.notificationAir.NotificationManager;
	import com.ghostlmm.tool.HttpRequest;
	import com.greensock.TweenLite;
	import com.hurlant.util.Base64;
	
	import Tool.FileLog;
	import Tool.PersistentObj;
	import Tool.account.AccountControl;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	import Tool.platform.meijiPlat.IMJPlatform;
	
	import net.NetWorkInfoManager;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class LoginControl
	{
		/**账号已经存在**/
		public static const ACCOUNT_ALREADY_EXISTS:int = -1001;
		
		/**devicetoken不存在**/
		public static const DEVICE_TOKEN_NOT_EXISTS:int = -1002;
		
		/**登陆时账号或者服务器错误**/
		public static const ACCOUNT_OR_ZONE_ERROR:int = -1003;
		
		/**用户名为空,或者账号和服务器id错误**/
		public static const PARAM_ERROR:int = -1004;
		
		/**账号不存在**/
		public static const ACCOUNT_NOT_EXISTS:int = -1007;
		
		/**密码错误**/
		public static const PASSWORD_ERROR:int = -1008;
		
		/** 设备码检测  **/
		public static const AccountCheck:String="quickdevicecheck";
		/**
		 * 机器码登录
		 */
		public static const LoginWay_FastLogin:String="quickdevicelogin";
		/**
		 * 注册登录
		 */
		public static const LoginWay_Register:String="quickregisterorbind";
		/**
		 * 帐号密码登录
		 */
		public static const LoginWay_AccountLogin:String="denglu";
		
		/**   统一登录平台 登录方式
		 * */
		public static const LoginWay_Union:String="unionlogin";
		
		/**
		 *   邮箱账号登陆方式
		 */
		public static const LoginWay_Email:String="quickaccountlogin";
		
		/**  平台登录
		 * */
		public static const LoginWay_PlatLogin:String="platDenglu";
		
		public static const UserNameKey:String="UserName";
		public static const UserPasswordKey:String="password";
		
		public static const Path:String="com.Fantasy.register";
		private var localData:PersistentObj;
		
		private var m_loginWay:String;
		
		public function isLoginFromMac():Boolean
		{
			return !checkIfHasAccount();
		}
		
		public var bindComplete_SN:Signal=new Signal();
		
		public function LoginControl()
		{
			initModule();
		}
		private static var m_instance:LoginControl;
		public static function getInstance():LoginControl
		{
			if(null==m_instance)
			{
				m_instance=new LoginControl();
			}
			return m_instance;
		}
		private function initModule():void
		{
			localData=new PersistentObj(Path);
			loginWayChange_SN=new Signal(String);
			loginDataSet_SN=new Signal(String);
		}
		/**
		 * 是否已经有用户名密码
		 */
		public function checkIfHasAccount():Boolean
		{
			var account:String=localData.getValueByKey(UserNameKey) as String;
			var token:String=localData.getValueByKey(UserPasswordKey) as String;
			if((null!=account)&&(null!=token))
			{
				return true;
			}
			return false;
		}
		/**
		 * 登录接口
		 */
		public function showLoginInterface($login:Boolean=true):void
		{
			TweenLite.killDelayedCallsTo(showLoginInterface);
			if(SwitchConfig.ST_UserUnionAccount){
				//如果使用了新的 登录账号系统的
				//				PlatformManager.getInstance().startLogin(null,newPlatLoginCom,delayShowLoginInterface);
				trace("平台登录 showLoginInterface");
				PlatformManager.log("showLoginInterface 125");
				PlatformManager.getInstance().union_login_SN.addOnce(onUnionResult);
				if($login){
					PlatformManager.getInstance().newLogin();
				}
				
			}else{
				PlatformManager.log("showLoginInterface 132");
				PlatformManager.getInstance().startLogin(normalLogin,platLoginCom,delayShowLoginInterface);
			}
			
		}
		
		private function onUnionResult(success:Boolean):void
		{
			if(success){
				//				newLoginCom_SN.dispatch();
				trace("统一平台登录完成");
				var platObj:IMJPlatform=PlatformManager.getInstance().platformObj;
				var extr:Object={os:PlatformManager.getInstance().getOsType()};
				loginGame(platObj.openId,platObj.token,getMac(),platObj.onlyPlatName,LoginWay_Union,false,extr);
				
			}else{
				trace("登录失败");
				delayShowLoginInterface();
			}
		}
		
		private function delayShowLoginInterface():void
		{
			TweenLite.delayedCall(3,showLoginInterface);
		}
		
		public function normalLogin():void
		{
			if(checkIfHasAccount())
			{
				setLoginWay(LoginWay_AccountLogin);
			}
			else
			{
				setLoginWay(LoginWay_FastLogin);
			}
			login();
			showLoginUI();
		}
		
		/**  平台登录
		 * */
		public function platLoginCom(data:Object):void
		{
			PlatformManager.log("pingtai denglu : "+JSON.stringify(data));
			loginGame(null,null,getMac(),PlatformManager.getInstance().getOnlyPlatName(),PlatformManager.getInstance().getLoginPlatName(),false,data);
		}
		
		
		
		
		/**
		 *  登录
		 */
		private function login():void
		{
			var loginData:LoginWayData=new LoginWayData();
			switch(m_loginWay)
			{
				case LoginWay_FastLogin:
//					if(SwitchConfig.ST_FastLogin)
					if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin))
					{
						loginData.mac=getMac();
						break;
					}
					else
					{
						m_loginWay=LoginWay_AccountLogin
					}
				case LoginWay_AccountLogin:
					loginData.mac=getMac();
					loginData.openId=localData.getValueByKey(UserNameKey) as String;
					loginData.token=localData.getValueByKey(UserPasswordKey) as String;
					break;
			}
//			if(SwitchConfig.ST_FastLogin)
			if(PlatformManager.getInstance().getFlagByAttr(PlatExtrFlag.UseFastLogin))
			{
				loginGame(loginData.openId,loginData.token,loginData.mac,loginData.platName,m_loginWay);
			}
			else
			{
				if(null==loginData.openId)
				{
					AccountControl.getInstance().loginStep_SN.dispatch(AccountControl.Login_Step_Account_Error);
				}
				else
				{
					loginGame(loginData.openId,loginData.token,loginData.mac,loginData.platName,m_loginWay);
				}
			}
		}
		
		
		/**
		 * 登录方式
		 */
		public function get loginWay():String
		{
			return m_loginWay;
		}
		/**
		 * 设置登录方式
		 */
		public function setLoginWay(_loginWay:String):void
		{
			m_loginWay=_loginWay;
			
		}
		
		//		public var newLoginCom_SN:Signal=new Signal();
		
		public var union_plataccount_com_SN:Signal=new Signal();
		
		
		public var loginWayChange_SN:Signal;
		private function showLoginUI():void
		{		
			loginWayChange_SN.dispatch(m_loginWay);
		}
		private function get loginUrl():String
		{
			if(SwitchConfig.ST_UserUnionAccount){
				return UrlConfig.UnionAccountUrl;
			}
			return UrlConfig.accountServerUrl;
		}
		public static const LoginDataSet_Complete:String="LoginDataSet_Complete";
		public var loginDataSet_SN:Signal;
		
		public var tempArg:Object;
		public function registerPushToken(pushToken:String):void{
			if(tempArg){
				tempArg.op="jpushtoken";
				tempArg.jtoken=NotificationManager.instance.getToken();
				HttpRequest.getInstance().getRequest(loginUrl,tempArg, function (data:String):void{});
			}
		}
		
		
		/**
		 * 获取帐号信息
		 */
		public function loginGame(openid:String,token:String,_mac:String,platname:String,op:String,isBind:Boolean=false,extrarg:Object=null):void
		{
			var arg:Object={};
			arg.openid=openid;
			arg.token=token;
			arg.platname=platname;
			arg.op=op;
			
			// warning
			arg.deviceToken=_mac;
//			arg.jtoken=NotificationManager.instance.getToken();
			
			
			if(extrarg){
				for(var key:String in extrarg){
					arg[key]=extrarg[key];
				}
			}
			tempArg=arg;
			
			HttpRequest.getInstance().getRequest(loginUrl,arg, function (data:String):void
			{
				FileLog.log("LOGIN",Util.transArgToUrl(loginUrl,arg)+"\t"+data);
				trace(data);
				try
				{
					var json:Object=JSON.parse(data);
					if(json.code==101){
						CommonControlFun.showNetworkErrorTopReload(loginGame,[openid,token,_mac,platname,op,isBind,extrarg]);
					}else{
						if(json.result<=0)
						{
							Util.flow("帐号登录信息"+json.result);
							trace(Util.transArgToUrl(loginUrl,arg));
						}
						else
						{
							proccessLoginGameCallBack(json,op,openid,token,isBind);
						}
					}
					
					
				}
				catch(e:Error)
				{
					trace(e.message);	
				}
			},60000,false,"text",true);
		}
		
		public function proccessLoginGameCallBack(json:Object,op:String,openid:String=null,token:String=null,isBind:Boolean=false):void
		{
			m_loginWay=op;
			GLBaseData.accountId=json.aid;
			if(!isBind){
				GLBaseData.author=json.ak;
			}
			
			GLBaseData.setLastServerId(json.lastServerId);
			if(op!=LoginWay_FastLogin)
			{
				localData.setVaule(UserNameKey,openid);
				localData.setVaule(UserPasswordKey,token);
			}
			
			//如果是绑定操作
			if(isBind){
				GLBaseData.hasBindAccount=true;
				bindComplete_SN.dispatch();
				Util.flow("绑定成功");
				return ;
			}
			
			//如果是统一平台登录
			if(SwitchConfig.ST_UserUnionAccount && (op==LoginWay_Union || op==LoginWay_Email || op==LoginWay_FastLogin) ){
				//							loginWayChange_SN.dispatch(login);
				setUnionData(json);
				trace("统一平台登录成功");
				union_plataccount_com_SN.dispatch();
				//							loginWayChange_SN.dispatch(LoginWay_AccountLogin);
				return ;
			}
			
			if(PlatformManager.getInstance().supportPlatAccount() && op==PlatformManager.getInstance().getLoginPlatName()){
				loginWayChange_SN.dispatch(LoginWay_AccountLogin);
				return ;
			}
			
			loginDataSet_SN.dispatch(LoginDataSet_Complete);
			showLoginUI();
			if(op==LoginWay_AccountLogin)
			{
				LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_CloseDenglu);
			}
			else if(op==LoginWay_Register)
			{
				LoginUIControl.getInstance().uiMessage_SN.dispatch(LoginUIControl.UI_MSG_CloseZhuce);
				Util.flow("注册成功");
			}
			else 
			{
				
			}
		}
		
		/**  设置 统一平台登录的返回结果
		 * */
		private function setUnionData(data:Object):void
		{
			UrlConfig.serverListVersion=data.sv;
			UrlConfig.serverListZip=data.su;
			UrlConfig.xmlVersion=data.xmlVersion;
			UrlConfig.xmlZipUrl=data.xmlUrl;
			UrlConfig.maxServerId=data.lastopen;
			UrlConfig.maintainUrl=data.maintainUrl;
			UrlConfig.apkUrl=data.appurl;
			UrlConfig.apkVersion=data.appversion;
			
			UrlConfig.weihuUrl=data.maintainPage;
			//			UrlConfig.downloadUrl=data.downloadUrl;
			UrlConfig.welcomeUrl=data.welcomeUrl;
			UrlConfig.huodongXmlUrl=data.huodongUrl;
			UrlConfig.huodongXmlVersion=data.huodongVersion;
			
		/*	if(data.hasOwnProperty("payServerUrl")){
				UrlConfig.payServerUrl=data.payServerUrl;
			}*/
			
			
//			UrlConfig.cdnCaheImg_PreUrl=data.imgUrl;
			
			UrlConfig.alipayBackUrl=data.alipayBackUrl;
			
			
//			UrlConfig.serverListZip+="x";
//			UrlConfig.xmlZipUrl+="x";
//			UrlConfig.huodongXmlUrl+="x";
			
			//			UrlConfig.checkVersion();
			
			
		}
		
		
		/**
		 * 注册帐号
		 */
		public function zhuce(_openId:String,_token:String):void
		{
			var loginData:LoginWayData=new LoginWayData();
			loginData.openId=_openId;
			loginData.token=createToken(_token);
			loginData.mac=getMac();
			loginGame(loginData.openId,loginData.token,loginData.mac,loginData.platName,LoginWay_Register);
		}
		
		/**  绑定账号
		 * */
		/*public function bindAccount(_openId:String,_token:String):void
		{
			var loginData:LoginWayData=new LoginWayData();
			loginData.openId=_openId;
			loginData.token=createToken(_token);
			loginData.mac=getMac();
			loginGame(loginData.openId,loginData.token,loginData.mac,loginData.platName,LoginWay_Register,true);
		}*/
		
		/**
		 * 登录帐号
		 */
		public function denglu(_openId:String,_token:String):void
		{
			var loginData:LoginWayData=new LoginWayData();
			loginData.openId=_openId;
			loginData.token=createToken(_token);
			loginData.mac=getMac();
			loginGame(loginData.openId,loginData.token,loginData.mac,loginData.platName,LoginWay_AccountLogin);
		}
		public function getMac():String
		{
//			return NotificationManager.instance.getToken();
			var macAddress:String = NetWorkInfoManager.getInstance().getMac();
			return macAddress;
		}
		public static function createToken($openId:String):String
		{
			var re:String= Base64.encode($openId+">()<");
			return re;
		}
		public function getOpenId():String
		{
			var account:String=localData.getValueByKey(UserNameKey) as String;
			return account;
		}
		
		public function clearCache():void
		{
			localData.clear();
		}
	}
}

