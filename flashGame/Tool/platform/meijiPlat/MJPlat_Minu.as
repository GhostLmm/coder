package Tool.platform.meijiPlat
{
	import Tool.FileLog;
	
	import com.fish.GLBaseData;
	import com.ghostlmm.mimugame.MinuGameSdkHelper;
	import com.ghostlmm.mimugame.MinuLoginEvent;
	import com.ghostlmm.mimugame.MinuLogoutEvent;
	import com.ghostlmm.mimugame.MinuPayEvent;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	public class MJPlat_Minu implements IMJPlatform
	{
		private var _loginCom:Function;
		private var _loginFail:Function;
		private var _payback_SN:Signal=new Signal(Boolean,Object);
		private var _logout_SN:Signal=new Signal(Boolean,Object);
		
		public function MJPlat_Minu()
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
			MinuGameSdkHelper.instance.logout();
		}
		
		public function get supportGamecenter():Boolean{
			return true;
		}
		public function openGamecenter():void{
			MinuGameSdkHelper.instance.openGameCenter();
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
			MinuGameSdkHelper.instance.login();
		}
		
		public function pay(pid:int, bid:String):void
		{
			var info:Object={};
			info.uid=GLBaseData.userId;
			info.pid=pid;
			info.sid=GLBaseData.serverId;
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
			MinuGameSdkHelper.instance.pay(bid,JSON.stringify(info),node.rmb,GLBaseData.userId,GLBaseData.serverId,
				GLBaseData.userName,"vi0","12","1000","ss3");
		}
		
		public function get payBackSingal():Signal
		{
			return _payback_SN;
		}
		
		public function init():void
		{
			// 小米 项目 id 23046  key a5c6aff0-f7e3-9fb2-e351-52d8987086b3 
			MinuGameSdkHelper.instance.init(23046,"a5c6aff0-f7e3-9fb2-e351-52d8987086b3",true);
			MinuGameSdkHelper.instance.addEventListener(MinuLoginEvent.LoginResult,onLogin);
			MinuGameSdkHelper.instance.addEventListener( MinuLogoutEvent.LogoutResult,onLogut);
			MinuGameSdkHelper.instance.addEventListener( MinuPayEvent.PayResult,onPay);
		}
		private function clearLoginFunction():void
		{
			_loginCom=null;
			_loginFail=null;
		}
		public function onLogin(evt:MinuLoginEvent):void{
			FileLog.log("MINU",evt.json);
			var tempCom:Function=_loginCom;
			var tempFail:Function=_loginFail;
			clearLoginFunction();
			if(evt.success){
				var data:Object={};
				data.uid=evt.uid;
				data.session=evt.session;
				data.nike=evt.nike;
				if(tempCom!=null){
					tempCom(data);
				}
			}else{
				if(tempFail!=null){
					tempFail();
				}
			}
		}
		public function onLogut(evt:MinuLogoutEvent):void
		{
			FileLog.log("MINU",evt.json);
			logout_SN.dispatch(evt.success,null);
		}
		private function onPay(evt:MinuPayEvent):void{
			FileLog.log("MINU",evt.json);
			var data:Object={};
			data.orderid=evt.orderId;
			payBackSingal.dispatch(evt.success,data);
		}
		
		public function get supportPlatAccount():Boolean{
			return true;
		}
		
		public function get supportGameconfig():Boolean{
			return false;
		}
		
		
	}
}