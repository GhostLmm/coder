package Tool.platform.meijiPlat
{
	import com.ghostlmm.androidToolAne.AndroidToolHelper;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.desktop.NativeApplication;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import ane.ljsdk.GameProxy;
	import ane.ljsdk.XMExitCallback;
	import ane.ljsdk.XMPayCallback;
	import ane.ljsdk.XMUser;
	import ane.ljsdk.XMUserListener;
	
	import util.Util;
	
	public class MJPlat_Lengjin_Android extends Plat_Base implements XMUserListener, XMPayCallback, XMExitCallback
	{
		private static const callBackUrl:String="http://120.24.249.95:8080/pay/payLj/ljpay.jsp";
		public function MJPlat_Lengjin_Android()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
//			return "ljand";
			return GameProxy.getInstance().getChannelLabel();
		}
		
		public override function get payPlatName():String
		{
//			return "ljand";
			return GameProxy.getInstance().getChannelLabel();
		}
		
		public override function get onlyPlatName():String
		{
//			return "ljand";
			return GameProxy.getInstance().getChannelLabel();
		}
		
		public override function get supportLogout():Boolean{
			return true;
		}
		
		public override function init():void{
			GameProxy.getInstance().init();
			GameProxy.getInstance().setuserListener(this);
		}
		
		
		public override function login():void{
			GameProxy.getInstance().login();
		}
		public override function logout():void{
			GameProxy.getInstance().logout();
		}
		
		private function log(msg:String):void{
			AndroidToolHelper.instance.logcat("zombieGame",msg);
			GameProxy.getInstance().log("zombieGame",msg);
		}
		
		public function onLoginSuccess(user:XMUser):void
		{
			log("onLoginSuccess:\t"+user.userID+"\t"+user.token+"\t"+user.username);
			setPlatInfo(user.userID,user.token,user.username);
			exctueLoginResult(true);
		}
		
		public function onLoginFailed(reason:String):void
		{
			log("onLoginSuccess");
			exctueLoginResult(false);
		}
		
		public function onLogout():void
		{
			log("onLogout");
			logout_SN.dispatch(true,{});
		}
		
		public override function pay(pid:String, bid:String):void{
			proccessBid();
			this._tempBid=bid;
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			var rmb:Number=node.rmb;
			CONFIG::PayTest{
				rmb=1;
			}
				
			var gamebi:String=node.name;
			
			GameProxy.getInstance().pay(node.cash, "钻石", rmb, bid, callBackUrl, this);
		}
		public function logLevelUp(userId:String,userName:String,zoneId:String,zoneName:String,userLevel:int,blance:int,vip:int):void{
			var obj:Object = new Object();
			obj.roleId = userId;
			obj.roleName = userName;
			obj.roleLevel = userLevel.toString();
			obj.zoneId = zoneId;
			obj.zoneName = zoneName;
			obj.balance = blance.toString();
			obj.vip = vip.toString();
			obj.partyName = "无帮派";
			obj._id = "levelUp";
			
			GameProxy.getInstance().setExtRoleData(obj);
		}
		public function logEnterServer(userId:String,userName:String,zoneId:String,zoneName:String,userLevel:int,blance:int,vip:int):void{
			var obj:Object = new Object();
			obj.roleId = userId;
			obj.roleName = userName;
			obj.roleLevel = userLevel.toString();
			obj.zoneId = zoneId;
			obj.zoneName = zoneName;
			obj.balance = blance.toString();
			obj.vip = vip.toString();
			obj.partyName = "无帮派";
			obj._id = "enterServer";
			GameProxy.getInstance().setExtRoleData(obj);
		}
		public function logCreateRole(userId:String,userName:String,zoneId:String,zoneName:String):void{
			var obj:Object = new Object();
			obj.roleId = userId;
			obj.roleName = userName;
			obj.roleLevel = "0";
			obj.zoneId = zoneId;
			obj.zoneName = zoneName;
			obj.balance = "0";
			obj.vip = "0";
			obj.partyName = "无帮派"
			
			obj._id = "createRole";
			PlatformManager.log("logCreateRole 140");
			GameProxy.getInstance().setExtRoleData(obj);
		}
		
		
		public function onSuccess(info:String):void
		{
			PlatformManager.getInstance().showTipAfterBuy();
			proccessBid();
		}
		
		public function onFail(info:String):void
		{
			proccessBid();
		}
		
		public function onChannelExitConfirmed():void 
		{
			beforeExit();
			NativeApplication.nativeApplication.exit();
		}
		
		public function beforeExit():void{
			PlatformManager.log("beforeExit  " +162);
			GameProxy.getInstance().release();
		}
		
		public function onNoChanelExitProvided():void 
		{
			TopTip.showExitTip("是否退出游戏",Util.exitGame);
//			GameProxy.getInstance().release();
//			NativeApplication.nativeApplication.exit();
		}
		
		public override function get osType():String{
			return "2";
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ListernExitGame]=true;
			obj[PlatExtrFlag.AutoLoginAfterLogout]=true;
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
			obj[PlatExtrFlag.Lengjing]=true;
			return obj;
		}
		
		public override function get supportPlatExit():Boolean{
			return true;
		}
		public override function platExit():void{
			PlatformManager.log("platExit 191");
			GameProxy.getInstance().exit(this);
		}
	}
}