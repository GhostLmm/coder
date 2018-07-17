package Tool.platform.meijiPlat
{
	import com.ghostlmm.downjoy.DownJoySdkHelper;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;

	public class MJPlat_Dangle_Android extends Plat_Base
	{
		
		public static const   APP_ID:String="2377";
		public static const   PAYMENT_KEY:String="JGv9sXYvFeL9";// 12位支付密钥,当乐分配
		public static const   MERCHANT_ID:String = "1033";
		public static const   APP_KEY:String = "AuVHARYX";
		public static const   SERVER_SEQ_NUM:String = "1001";
		
				
		public function MJPlat_Dangle_Android()
		{
			super();
		}
		
		public override function init():void
		{
			DownJoySdkHelper.instance.init(MERCHANT_ID,APP_ID,SERVER_SEQ_NUM,APP_KEY,true,0);
//			DownjoyIAPAndroid.init("458","1384","789","hJS2Z87C");
			
//			DownjoyIAPAndroid.onStatus=callBack;
			DownJoySdkHelper.instance.setOnStatus(callBack);
			NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE,onResume);
			NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE,onPause);
			GameStatus.change_SN.add(onStatusChange);
			trace("onResume");
			DownJoySdkHelper.instance.onResume();
		}
		
		private function onResume(evt:Event):void{
			trace("onResume");
			DownJoySdkHelper.instance.onResume();
		}
		private function onPause(evt:Event):void{
			trace("onPause");
			DownJoySdkHelper.instance.onPause();
			
		}
		private function onStatusChange($status:String):void{
			if(GameStatus.status==GameStatus.ST_GameOngoing){
				DownJoySdkHelper.instance.setFloatShow(true);
			}else{
				DownJoySdkHelper.instance.setFloatShow(false);
			}
		}
		
		public override function get loginPlatName():String
		{
			return "dland";
		}
		
		public override function get payPlatName():String
		{
			return "dland";
		}
		
		public override function get onlyPlatName():String
		{
			return "dland";
		}
		
		private function callBack(code:String,re:Object):void
		{
			PlatformManager.log("api返回: "+code+" / "+JSON.stringify(re));
			
			
			
			if(code=="loginResult"){
				if(re.success==true){
					setPlatInfo(re.uid,re.token,re.uname);
					exctueLoginResult(true);
				}else{
					exctueLoginResult(false);
				}
			}
			if(code=="logoutResult"){
				if(re.success==true){
					logout_SN.dispatch(true,{});
				}
			}
			if(code=="payResult"){
				if(re.success==true){
					PlatformManager.getInstance().showTipAfterBuy();
				}
				proccessBid();
			}
			
		}
		
		
		public override function login():void
		{
//			DownjoyIAPAndroid.login("1");
			DownJoySdkHelper.instance.login();
		}
		

		
		public override function pay(pid:String, bid:String):void
		{
			proccessBid();
			this._tempBid=bid;
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			
			var rmb:Number=node.rmb;
			CONFIG::PayTest{
				rmb=0.1;
			}
				
			var gamebi:String=node.name;
//			DownjoyIAPAndroid.payment(rmb,gamebi,bid);
			DownJoySdkHelper.instance.pay(rmb.toString(),node.name,bid);
		}
		
		public override function openGamecenter():void
		{
//			DownjoyIAPAndroid.openMemberCenter();
			DownJoySdkHelper.instance.openMemberCenter();
		}
		
		public override function logout():void{
//			DownjoyIAPAndroid.logout();
			DownJoySdkHelper.instance.logout();
//			logout_SN.dispatch(true,{});
		}
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		public function beforeExit():void{
			DownJoySdkHelper.instance.onDestory();
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ListernExitGame]=true;
			return obj;
		}
		
	}
}