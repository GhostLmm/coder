package Tool.platform.meijiPlat
{
	import org.osflash.signals.Signal;
	
	public class MJPlat_MinuTest implements IMJPlatform
	{
		private var _loginCom:Function;
		private var _loginFail:Function;
		private var _payback_SN:Signal=new Signal(Boolean,Object);
		private var _logout_SN:Signal=new Signal(Boolean,Object);
		public function MJPlat_MinuTest()
		{
		}
		
		public function get loginPlatName():String
		{
			return "xiaomilogin";
		}
		
		public function get payPlatName():String
		{
			return "xiaomi";
		}
		
		public function get onlyPlatName():String
		{
			return "xiaomi";
		}
		
		public function get ExtrFlagObj():Object
		{
			return null;
		}
		
		public function get supportBindAccount():Boolean
		{
			return false;
		}
		
		public function get supportLogout():Boolean{
			return true;
		}
		public function logout():void{
			
		}
		
		public function get supportGamecenter():Boolean{
			return true;
		}
		public function openGamecenter():void{
//			MinuGameSdkHelper.instance.openGameCenter();
		}
		
		public function get logout_SN():Signal
		{
			return _logout_SN;
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			this._loginCom=_comFn;
			this._loginFail=_failFn;
		}
		
		public function login():void
		{
//			MinuGameSdkHelper.instance.login();
			var data:Object={};
			data.uid="214325ssd324";
			data.session="12123";
			data.nike="sdf";
			_loginCom(data);
		}
		
		public function pay(pid:int, bid:String):void
		{
//			var info:Object={};
//			info.uid=GLBaseData.userId;
//			info.pid=pid;
//			info.sid=GLBaseData.serverId;
//			var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
//			MinuGameSdkHelper.instance.pay(bid,JSON.stringify(info),node.rmb,GLBaseData.userId,GLBaseData.serverId,
//				GLBaseData.userName,"vi0","12","1000","ss3");
		}
		
		public function get payBackSingal():Signal
		{
			return _payback_SN;
		}
		
		public function init():void
		{
			// 小米 项目 id 23046  key a5c6aff0-f7e3-9fb2-e351-52d8987086b3 
//			MinuGameSdkHelper.instance.init(23046,"a5c6aff0-f7e3-9fb2-e351-52d8987086b3",true);
//			MinuGameSdkHelper.instance.addEventListener(MinuLoginEvent.LoginResult,onLogin);
//			MinuGameSdkHelper.instance.addEventListener( MinuLogoutEvent.LogoutResult,onLogut);
//			MinuGameSdkHelper.instance.addEventListener( MinuPayEvent.PayResult,onPay);
		}
		private function clearLoginFunction():void
		{
			_loginCom=null;
			_loginFail=null;
		}
		
		public function get supportPlatAccount():Boolean{
			return true;
		}
		
		
		public function get supportGameconfig():Boolean
		{
			return false;
		}
	}
}