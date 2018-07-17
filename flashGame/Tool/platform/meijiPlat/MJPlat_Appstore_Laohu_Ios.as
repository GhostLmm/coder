package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.wanmei.tigersdkextension.TigerSDKExtension;
	
	import flash.events.Event;
	import flash.events.StatusEvent;
	
	import Tool.ApplicationInfoDesc;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;
	

	public class MJPlat_Appstore_Laohu_Ios extends Plat_Base
	{
//		private var tempOrderId:String;
//		private var tempNode:Node_chongzhi;
		public function MJPlat_Appstore_Laohu_Ios()
		{
			super();
//			if(PlatformManager.WEBIP!= "http://mjazz-pay.autopatch.173.com/" || UrlConfig.UnionAccountUrl!="http://mjazz-ver.autopatch.173.com/pre/AccountServer"){
//				throw  new Error("完美appstore官服后台配置错误！！！！！");
//			}
		}
		
		public override function get loginPlatName():String
		{
			return "gccn";
		}
		
		public override function get payPlatName():String
		{
			return "gccn";
		}
		
		public override function get onlyPlatName():String
		{
			return "gccn";
		}
		
		public override function init():void
		{
			initMySDK();
		}
		
		
		private static var appId:String = "10123";
		private static var appKey:String = "Fp75JnZEfOQ3dLIOxvM82MJoWrLHTeOA";
		private static var channelId:String = "2";
		private static var ane:TigerSDKExtension = new TigerSDKExtension();
		
		private function initMySDK():void
		{
			ane.setupAppName(ApplicationInfoDesc.NativeInfo.appName);
			ane.setupADVersion(ApplicationInfoDesc.NativeInfo.versionStr);
			ane.initSDK(appId,appKey,channelId,myListener);
			PlatformManager.log("initSDK(appId,appKey,channelId,myListener) :Init SDK, Done.");
			
			// ToolBar Config.
			ane.setLHToolBarAnimation(false);
			
			ane.setLHToolBarCanDrag(true);
			ane.setLHToolBarHide(true);
			ane.setLHToolBarToPoint(0,0);
			
			ane.setupLHToolBar();
			
			GameStatus.change_SN.add(resetToolBar);
			
			ane.setLHToolBarHide(true);
		}
		
		private function resetToolBar($status:String):void{
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
				
				if(e.level=="0"){
					PlatformManager.getInstance().showTipAfterBuy();
				}
				proccessBid();
			}
			
			if(e.code=="LogoutNotification"){
				_logout_SN.dispatch(true,{});
				//一旦有注销 就调用账号切换
//				ane.doSwitchAccount();
			}
			
			
			
			//trace("Code="+e.code+"and Level="+e.level)
			//mylabel.text="Code="+e.code+"and Level="+e.level
		}
		
		public override function login():void
		{
			ane.doLogin({});
			PlatformManager.log("doLogin(myOb)");
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
			setPlatInfo(ane.getloginUin(),ane.getSessionId());
		}
		
		public override function logout():void
		{
			ane.doLogout(0, {});
//			ane.doSwitchAccount();
			PlatformManager.log("doLogout(1,myOb)");
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
		
		private function get payServerId():int{
			if(AppstoreVerify.inVerify){
				// 测试的采用 
				return 200002;
			}
			// 正式环境的话 用 1
			return 200001;
			
//			return 10;
		}
		
		public override function pay(pid:String, bid:String):void
		{
			if (!this.checkIsLogin())
			{
				return;
			}
			proccessBid();
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null){
				trace("没有对应的 node "+pid);
			}
			_tempBid=bid;
//			tempOrderId=bid;
//			tempNode=node;
			
			var amount:int=int(node.rmb*100);
			CONFIG::PayTest{
				amount=1;
			}
				
			
			var goodsId:String=node.ios_id;
			// 购买, IAP用户支付, 注意类型
			var productInfo:Object = {
				goodId : goodsId, //** appstore 产品唯一标识，请求完成残留交易时不填，其它情况必传 */
				goodNum : 1, //** 购买产品数量，请求完成残留交易时，可为0，其它情况不能为0，默认为1 */
				serverId : payServerId, //** 待充值的服Id, 没有服可以不填 */
				areaId : 20000, //** 待充值的区Id，没有区可以不填 */
				roleId : int(GLBaseData.userId), //** 待充值的角色Id, 必填 */
				goodInfo :node.desc, //** 产品描述，必填 */
				amount : amount, //** 订单总金额，单位：分。必填 */
				appOrder : bid //** 游戏订单号，必填, 由游戏自己生成 */
			};
			trace("商品info :　"+JSON.stringify(productInfo));
			ane.doIAPPay(productInfo);
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
		
		public override function get supportLuntan():Boolean{
			return true;
		}
		public override function enterLuntan():void{
			ane.doEnterBBS();
		}
		
		public override function get osType():String{
			return Plat_Base.OS_Ios_Guanfu_Sim;
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ShowWanmeiLogo]=true;
			obj[PlatExtrFlag.HidePlatFlag]=true;
			obj[PlatExtrFlag.SixChongzhi]=true;
			return obj;
		}
	}
}