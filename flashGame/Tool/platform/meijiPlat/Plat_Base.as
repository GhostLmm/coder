package Tool.platform.meijiPlat
{
	import com.fish.modules.core.S2CHanlder;
	
	import Tool.platform.PlatformManager;
	
	import org.osflash.signals.Signal;
	
	public class Plat_Base implements IMJPlatform
	{
		protected var _payback_SN:Signal=new Signal(Boolean,Object);
		protected var _logout_SN:Signal=new Signal(Boolean,Object);
		protected var _login_SN:Signal=new Signal(Boolean,Object);
		protected var _accountSwitch_SN:Signal=new Signal(Boolean,Object);
		
		protected var _loginCom:Function;
		protected var _loginFail:Function;
		
		private var _token:String;
		private var _openId:String;
		private var _nickName:String;
		
		protected var _tempBid:String;
		
		private var _gameInitFlag:Boolean=false;
		
		/**
		 * ios 越狱
		 */
		public static const OS_Ios_Yueyu:String="1";
		/**
		 *  国内android
		 */
		public static const OS_And_Guonei:String="2";
		/**
		 *  IOS官服简体
		 */
		public static const OS_Ios_Guanfu_Sim:String="3";
		/**
		 * IOS官服繁体	
		 */
		public static const OS_Ios_Gaunfu_Fanti:String="4";
		
		public function Plat_Base()
		{
			S2CHanlder.instance.initCom_SN.addOnce(setInitFlag);
			
		}
		
		private function setInitFlag():void{
			_gameInitFlag=true;
		}
		
		protected function clearLoginFunction():void
		{
			PlatformManager.log("clearLoginFunction");
			_loginCom=null;
			_loginFail=null;
		}
		
		/**
		 *   设置 平台账号信息
		 */
		protected function setPlatInfo($openId:String,$token:String,$nickName:String=null):void{
//			if(_gameInitFlag){
//				//如果游戏已经开始过
//				if($openId!=_openId){
//					//切换账号了
//					trace("注意  切换账号");
//					_accountSwitch_SN.dispatch(true,{});
//					return;
//				}
//			}
			_openId=$openId;
			_token=$token;
			_nickName=$nickName;

		}
		
		protected function exctueLoginResult(success:Boolean=true):void
		{
			var tempCom:Function=_loginCom;
			var tempFail:Function=_loginFail;
			clearLoginFunction();
			PlatformManager.log("exctueLoginResult 84");
			if(success){
				var data:Object={};
				data.uid=_openId;
				data.session=_token;
				data.nike="";
				PlatformManager.log("exctueLoginResult 89");
				if(tempCom!=null){
					tempCom(data);
					PlatformManager.log("exctueLoginResult 92");
				}
				_login_SN.dispatch(true,{});
			}else{
				if(tempFail!=null){
					tempFail();
				}
				_login_SN.dispatch(false,{});
			}
		}
		
		protected function proccessBid():void
		{
			if(_tempBid!=null){
				payBackSingal.dispatch(true,{orderid:_tempBid});
				_tempBid=null;
			}
		}
		
		public function get loginPlatName():String
		{
			throw new Error("请实现接口");
			return null;
		}
		
		public function get payPlatName():String
		{
			throw new Error("请实现接口");
			return null;
		}
		
		public function get onlyPlatName():String
		{
			throw new Error("请实现接口");
			return null;
		}
		
		public function get ExtrFlagObj():Object
		{
			return null;
		}
		
		public function get supportBindAccount():Boolean
		{
			return false;
		}
		
		public function get supportPlatAccount():Boolean
		{
			return true;
		}
		
		public function get supportLogout():Boolean
		{
			return false;
		}
		
		public function logout():void
		{
			throw new Error("请实现接口");
		}
		
		public function get supportGamecenter():Boolean
		{
			
			return false;
		}
		
		public function openGamecenter():void
		{
			throw new Error("请实现接口");
		}
		
		public function get logout_SN():Signal
		{
			return _logout_SN;
		}
		
		public function get login_SN():Signal
		{
			return _login_SN;
		}
		public function get accountSwitch_SN():Signal{
			return _accountSwitch_SN;
		}
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			PlatformManager.log("setLoginFn");
			_loginCom=_comFn;
			_loginFail=_failFn;
		}
		
	
		
		public function login():void
		{
			throw new Error("请实现接口");
		}
		
		public function pay(pid:String, bid:String):void
		{
			throw new Error("请实现接口");
		}
		
		public function get payBackSingal():Signal
		{
			return _payback_SN;
		}
		
		public function init():void
		{
			throw new Error("请实现接口");
		}
		
		public function get supportGameconfig():Boolean
		{
			return false;
		}
		
		public function get openId():String
		{
			return _openId;
		}
		
		public function get token():String
		{
			return _token;
		}
		public function get nickName():String
		{
			return _nickName;
		}
		public function get osType():String{
			throw new Error("请实现接口");
			return OS_And_Guonei;
		}
		
		/**   是否支持需要平台闪屏
		 * */
		public function get supportPlatSplash():Boolean{
			return false;
		}
		/**
		 *  平台闪屏图片
		 */
		public function get platSplashPicClass():Class{
			return null;
		}
		/**
		 *   闪屏其他的参数
		 */
		public function get platSplashArg():Object{
			return null;
		}
		/**
		 *   是否支持账号切换
		 */
		public function get supportSwitchAccount():Boolean{
			return false;
		}
		/**
		 *   切换账号
		 */
		public function switchAccount():void{
			throw new Error("请在之类显现接口");
		}
		
		/**
		 *  是否支持论坛入口
		 */
		public function get supportLuntan():Boolean{
			return false;
		}
		
		/**
		 *   进入论坛
		 */
		public function enterLuntan():void{
			throw new Error("请在之类显现接口");
		}
		
		/**
		 *   支持平台退出功能
		 */
		public function get supportPlatExit():Boolean{
			return false;
		}
		/**
		 *   平台退出
		 */
		public function platExit():void{
			throw new Error("请在之类显现接口");
		}
		/**
		 * 是否支持分享（默认支持）
		 */
		public function get supportShare():Boolean
		{
			return true;
		}
	}
}