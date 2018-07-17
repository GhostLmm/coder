package Tool.platform.meijiPlat
{
	import Tool.login.LoginControl;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.meijiPlat.unionRegisterSdk.UnionSdk;

	public class MJPlat_Union_Register extends Plat_Base
	{
		public function MJPlat_Union_Register()
		{
			super();
		}
		public override function init():void
		{
			UnionSdk.instance.init();
		}
		public override function login():void{
			UnionSdk.instance.login();
		}
		public override function get openId():String{
			return UnionSdk.instance.uid;
		}
		public override function get token():String{
			return UnionSdk.instance.token;
		}
		public override function get loginPlatName():String
		{
			return "test";
		}
		
		public override function get payPlatName():String
		{
			return "test";
		}
		
		public override function get onlyPlatName():String
		{
			return "test";
		}
		public override function get supportLogout():Boolean{
			return true;
		}
		public override  function get osType():String{
			return OS_And_Guonei;
		}
		public override function get supportGamecenter():Boolean{
			return false;
		}
		
		
		
		public override function logout():void{
			UnionSdk.instance.logout();
			logout_SN.dispatch(true,{});
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.SpecialMacAddress]=true;
			obj[PlatExtrFlag.UseFastLogin]=true;
			obj[PlatExtrFlag.AutoLoginAfterLogout]=true;
			
			return obj;
		}
		
		public function needBindAccount():Boolean{
//			return false;
			return (UnionSdk.instance.loginOp==LoginControl.LoginWay_FastLogin 
				&& UnionSdk.instance.macResult==UnionSdk.QUICK_ACCOUNT);
		}
		
//		public override function get supportPlatAccount():Boolean{
//			return false;
//		}
		
		public function isFastLoginAccount():Boolean{
			return UnionSdk.instance.loginOp==LoginControl.LoginWay_FastLogin;
		}
		
		public function bindAccountInGame():void{
			UnionSdk.instance.bindAccountInGame();
		}
		
		public function showLoginPage():void{
			UnionSdk.instance.showLoginPage();
		}
		
		
	}
}