package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.mimugame.MinuGameSdkHelper;
	import com.ghostlmm.mimugame.MinuLoginEvent;
	import com.ghostlmm.mimugame.MinuLogoutEvent;
	import com.ghostlmm.mimugame.MinuPayEvent;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import Tool.FileLog;
	import Tool.platform.PlatformManager;

	public class MJPlat_Xiaomi_Android extends Plat_Base
	{
		public static const App_Id:String="2882303761517244564";
		public static const App_Key:String="5601724468564";
		public static const App_Secret_Key:String="V71AQ9ACFouPcJtuqUp6AA==";
		
		public function MJPlat_Xiaomi_Android()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "xmand";
		}
		
		public override function get payPlatName():String
		{
			return "xmand";
		}
		
		public override function get onlyPlatName():String
		{
			return "xmand";
		}
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
		public override function logout():void{
			MinuGameSdkHelper.instance.logout();
		}
		public override function get supportLogout():Boolean{
			return true;
		}
		
		public override function openGamecenter():void{
			MinuGameSdkHelper.instance.openGameCenter();
		}
		public override function get supportGamecenter():Boolean{
			return true;
		}
		
		public override function login():void
		{
//			MinuGameSdkHelper.instance.
			MinuGameSdkHelper.instance.login();
			
		}
		
		
		
		public override function pay(pid:String, bid:String):void
		{
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			
			var info:Object={};
			info.uid=GLBaseData.userId;
			info.pid=pid;
			info.sid=GLBaseData.serverId;
			//warning
//			var mibi:int=1;
			var mibi:int=node.rmb;
			CONFIG::PayTest{
				mibi=1;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			MinuGameSdkHelper.instance.pay(bid,JSON.stringify(info),mibi,GLBaseData.userId,GLBaseData.serverId,
				GLBaseData.userName,userModel.userVo.vipLevel.toString(),userModel.userVo.userLevel.toString(),userModel.userVo.userCash.toString(),"no");
		}
		
		public override function init():void
		{
			// 小米 项目 id 23046  key a5c6aff0-f7e3-9fb2-e351-52d8987086b3  2882303761517244564
//			MinuGameSdkHelper.instance.init("24626","87c0a9c8-25b8-4509-031f-5339102e242d",0,true);
			MinuGameSdkHelper.instance.init(App_Id,App_Key,0,true);
			MinuGameSdkHelper.instance.addEventListener(MinuLoginEvent.LoginResult,onLogin);
			MinuGameSdkHelper.instance.addEventListener( MinuLogoutEvent.LogoutResult,onLogut);
			MinuGameSdkHelper.instance.addEventListener( MinuPayEvent.PayResult,onPay);
		}
		public function onLogin(evt:MinuLoginEvent):void{
			FileLog.log("MINU",evt.json);
			
			if(evt.success){
				
//				_openId=evt.uid;
//				_token=evt.session;
//				_nickName=evt.nike;
				setPlatInfo(evt.uid,evt.session,evt.nike);
				exctueLoginResult(true);
			}else{
				exctueLoginResult(false);
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
			if(evt.success){
				PlatformManager.getInstance().showTipAfterBuy();
			}
			
			payBackSingal.dispatch(evt.success,data);
		}
		
		
	}
}