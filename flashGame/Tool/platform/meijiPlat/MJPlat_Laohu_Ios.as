package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.wanmei.tigersdkextension.TigerSDKExtension;
	
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;

	public class MJPlat_Laohu_Ios extends Plat_Base
	{
		public function MJPlat_Laohu_Ios()
		{
			super();
		}
		public override function get loginPlatName():String
		{
			return "wm";
		}
		
		public override function get payPlatName():String
		{
			return "wm";
		}
		
		public override function get onlyPlatName():String
		{
			return "wm";
		}
		
		public override function init():void
		{
			initMySDK();
		}
//		10128	
//		lCSH8nAxpFff5XFmRERl3kAzuXBFQika
//		AtOFHWcOnBKKrUePht8Yclfow7aNq6ku

		
		private static var appId:String = "10128";
		private static var appKey:String = "lCSH8nAxpFff5XFmRERl3kAzuXBFQika";
		private static var channelId:String = "133";
		private static var ane:TigerSDKExtension = new TigerSDKExtension();
		
		private function initMySDK():void
		{
			ane.initSDK(appId,appKey,channelId,myListener);
			PlatformManager.log("initSDK(appId,appKey,channelId,myListener) :Init SDK, Done.");
			
			// ToolBar Config.
			ane.setLHToolBarAnimation(false);
			
			ane.setLHToolBarCanDrag(true);
			ane.setLHToolBarHide(true);
			ane.setLHToolBarToPoint(0,0);
			
			ane.setupLHToolBar();
			
			GameStatus.change_SN.add(onChageGameStatus);
		}
		private function onChageGameStatus($status:String):void{
			if($status==GameStatus.ST_GameOngoing){
				ane.setLHToolBarHide(false);
			}else{
				ane.setLHToolBarHide(true);
			}
		}
		private function myListener(e:StatusEvent):void
		{
			PlatformManager.log("myListener :Code=" + e.code + ", Level=" + e.level);
			
			//登录返回
			if(e.code=="LoginNotification"){
				if(e.level=="0"){
					initUserInfo();
					exctueLoginResult(true);
				}else{
					exctueLoginResult(false);
				}
			}
			
			//支付返回
			if(e.code=="IAPPayNotification"){
				
//				if(e.level=="0"){
//					PlatformManager.getInstance().showTipAfterBuy();
//				}
				proccessBid();
			}
			//支付宝返回
			if(e.code=="PayNotification"){
//				if(e.level=="1"){
//					PlatformManager.getInstance().showTipAfterBuy();
//				}
				proccessBid();
			}
			if(e.code=="LogoutNotification"){
				_logout_SN.dispatch(true,{});
			}
			
			
			
			//trace("Code="+e.code+"and Level="+e.level)
			//mylabel.text="Code="+e.code+"and Level="+e.level
		}
		
		public override function login():void
		{
			ane.doLogin({});
			PlatformManager.log("doLogin(myOb)");
		}
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ShowWanmeiLogo]=true;
			return obj;
		}
		public override function get supportGamecenter():Boolean{
			return true;
		}
		
		public override function openGamecenter():void
		{
			ane.doStartAccountHome();	
			PlatformManager.log("doStartAccountHome()");
		}
		
		private function initUserInfo():void
		{
			if (!this.checkIsLogin())
			{
				return;
			}
//			_token=ane.getSessionId();
//			_openId=ane.getloginUin();
			setPlatInfo(ane.getloginUin(),ane.getSessionId(),"");
		}
		
		public override function logout():void
		{
			ane.doLogout(0, {});
			PlatformManager.log("doLogout(0,myOb)");
		}
		
		private function getNodeByIosPid(pid:String):Node_chongzhi
		{
			for each(var node:Node_chongzhi in XMLDataManager.Node_chongzhiArray){
				if(node.ios_id==pid){
					return node;
				}
			}
			return null;
		}
		
		public override function pay(pid:String, bid:String):void
		{
			if (!this.checkIsLogin())
			{
				return;
			}
			
			proccessBid();
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return ;
			
			_tempBid=bid;
			
			//var ane:TigerSDKExtension = new TigerSDKExtension();
			var cooOrderSerial:String=bid;
			
//			var productPrice:int=1;
			var productPrice:int=node.rmb*100;
			CONFIG::PayTest{
				productPrice=1;
			}
			var payDescription:String=node.name;
			var serverId:String=GLBaseData.serverId;
			var ext:String=bid;
			
			ane.doPay(cooOrderSerial,productPrice,payDescription,serverId,ext);
//			mylabel.text="doPay(cooOrderSerial,productPrice,payDescription,serverId,ext)"				
				
				//var ane:TigerSDKExtension =new TigerSDKExtension(appId,appKey,channelId);
				//ane.doCharge(orderNo,price,description);
			//			mylabel.text = "doIAPPay(productInfo) :productInfo = " + productInfo;
		}
		public override function get supportPlatAccount():Boolean
		{
			return true;
		}
		public override function get supportLogout():Boolean
		{
			return true;
		}
		
		//checkLogin
		private function checkIsLogin():Boolean
		{
			if (ane.getLoginStatus() == "1")
			{
				return true;
			}
			else
			{
				//				mylabel.text = "您尚未登录,请先登录";
				return false;
			}
		}
		
		public override function get osType():String{
			return Plat_Base.OS_Ios_Yueyu;
		}
	}
}