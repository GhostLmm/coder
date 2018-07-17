package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.S2CHanlder;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.qihoo.paysdk.flash.extension.SdkMainEventConstants;
	import com.qihoo.paysdk.flash.extension.SdkMainExtension;
	
	import flash.desktop.NativeApplication;
	import flash.events.StatusEvent;
	
	import Tool.ApplicationInfoDesc;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;

	public class MJPlat_360_Android extends Plat_Base
	{
		/**
		 *   是否横屏
		 */
		private static const isLandscape:Boolean=false;
		
		private var mSdkMainExt:SdkMainExtension;
		private var authCode:String = null;
		private var appKey:String = null;
		
//		private var qihooUserInfo:UserInfo = null;
		
		private var refreshToken:String;
		
		private static const PayCallBackUrl:String="http://pay.wow.shanjinzhen.com/pay/pay360/360pay.jsp";
		
		private var stats:int=0;
		public function MJPlat_360_Android()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "360";
		}
		
		public override function get payPlatName():String
		{
			return "360";
		}
		
		public override function get onlyPlatName():String
		{
			return "360";
		}
		
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
		/*
		 * 防沉迷查询
		 */
		private function doSdkAntiAddictionQuery():void {
			SdkMainExtension.getInstance().doSdkAntiAddictionQuery(token, openId); //调用
		}
		
	
		
		public override function init():void{
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,onServerData);
			mSdkMainExt=new SdkMainExtension();
			
			SdkMainExtension.getInstance().addEventListener(StatusEvent.STATUS, statusHandler);
			SdkMainExtension.getInstance().doSdkInit(); //调用
			
			if(mSdkMainExt.isKeyOk()){
				PlatformManager.log("keyOk");
			}else{
				PlatformManager.log("keyError");
			}
			
			appKey = SdkMainExtension.getInstance().doGetAppInfo(SdkMainEventConstants.CODE_APP_KEY);
//			authCode = new String(this.data);
			
			
			S2CHanlder.instance.initCom_SN.add(onGameInitComplete);
			
			GameStatus.change_SN.add(onGamestatusChagne);
		}
		
		private function onGamestatusChagne($status:String):void{
//			if($status==GameStatus.ST_GameOngoing){
//				SdkMainExtension.getInstance().
//			}
		}
		public override function get supportPlatExit():Boolean{
			return true;
		}
		public override function platExit():void{
			SdkMainExtension.getInstance().doSdkQuit(isLandscape);
		}
		
		private function onGameInitComplete():void{
			doSdkAntiAddictionQuery();
		}
		
		private function onServerData(evt:GameServerEvent):void{
			
			PlatformManager.log("gameserver 请求: "+evt.url+"\n\r"+evt.json);
			if(!evt.effect) return ;
//			{"infoResult":{"code":0,返回的字段跟着source变}}
			if(evt.key==GameServerManager.KEY_GetUserInfo){
				
				
//				{"infoResult":{"avatar":"http://u1.qhimg.com/qhimg/quc/48_48/22/02/55/220255dq9816.3eceac.jpg?f=91f2aeb246beea349fa1647bfb222f84","code":0,"id":"245119756","name":"cheowen"}}
				if(evt.data && evt.data.infoResult && evt.data.infoResult.code==0){
					var result:Object=evt.data.infoResult;
//					_openId=result.uid;
//					_token=result.accessToken;
					setPlatInfo(result.id,authCode);
//					refreshToken=result.refreshToken;
					
					exctueLoginResult(true);
				}
			}
			if(evt.key==GameServerManager.KEY_GetAccessToken){
				//				{"orderResult":{"code":0,"orderId":"xxx","goodsId":"xxx"}} 
//				{"authResult":{"code":0,返回的字段跟着source变}} 
				if(evt.data && evt.data.authResult && evt.data.authResult.code==0){
					//					unipayAsyn_clickHandler(evt.data.orderResult.orderId,evt.data.orderResult.goodsId);
//					_platObj.pay(evt.data.orderResult.goodsId,evt.data.orderResult.orderId);
					PlatformManager.log("获取token成功："+evt.url+"\n\r"+evt.json);
					
//					{"code":0,"authResult":{"scope":"basic","accessToken":"850530845209dbd185eee43bf12fdd29569805f6283a41296","expiresIn":"36000","refreshToken":"850530845ef4d47fdec31134913afed658e93e5b6ce82937e"}}
//					_token=evt.data.authResult.accessToken;
//					_openId=evt.data.authResult.accessToken;
//					exctueLoginResult(true);
//					qihooUserInfo = new UserInfo;
//					qihooUserInfo.accessToken = evt.data.authResult.access_token;
//					qihooUserInfo.refreshToken = evt.data.authResult.refresh_token;
//					qihooUserInfo.expiresIn = evt.data.authResult.expires_in;
//					
//					_token=qihooUserInfo.accessToken;
//					getUserInfo();
					
				}else{
					//获取token失败
					PlatformManager.log("获取token失败："+evt.url+"\n\r"+evt.json);
					exctueLoginResult(false);
				}
				
			}
		}
		
		
		private function getUserInfo():void{
			GameServerManager.instance.getUserInfo(authCode);
		}
		
	
		public override function pay(pid:String, bid:String):void{
			
			proccessBid();
			_tempBid=bid;
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null){
				return ;
			}
			
			// 订单相关信息
			var moneyAmount:String = (node.rmb*100).toString();  // 分 最少一块钱
			CONFIG::PayTest{
				moneyAmount="100";
			}
			
			
			var exchangeRate:String = "10";
			var productName:String = node.name;
			var productId:String = pid;
			var notifyUri:String = PayCallBackUrl;
			var appName:String = ApplicationInfoDesc.NativeInfo.appName;
			var appUserName:String = GLBaseData.userName;
			var appUserId:String = GLBaseData.userId;
			var appOrderId:String = bid;
			
			// 其他字段
			var appExt1:String = "";
			var appExt2:String = "";
			
			SdkMainExtension.getInstance().doSdkPay(
				isLandscape,
				token,
				openId,
				moneyAmount,
				exchangeRate,
				productName,
				productId,
				notifyUri,
				appName,
				appUserName,
				appUserId,
				appOrderId,
				appExt1,
				appExt2); //调用
		}
		
		/**
		 * 获取AccessToken
		 */
		private function getAccessToken():void {
			
			PlatformManager.log( "正在获取AccessToken");
			
			GameServerManager.instance.getAccessToken(authCode);
		}
		
		public override function login():void{
//			getAccessToken();
			SdkMainExtension.getInstance().doSdkLogin(isLandscape); //调用
//			if(stats!=0){
//				SdkMainExtension.getInstance().doSdkLogin(isLandscape); //调用
//			}else{
//				stats=2;
//			}
			
		}
		
		public override function get supportLogout():Boolean{
			return false;
		}
		
		public override function get supportSwitchAccount():Boolean{
			return true;
		}
		public override function switchAccount():void{
			SdkMainExtension.getInstance().doSdkSwitchAcount(isLandscape);
		}
		
		public override function get supportLuntan():Boolean{
			return true;
		}
		public override function enterLuntan():void{
			SdkMainExtension.getInstance().doSdkBBS(isLandscape);
		}
		
		
		
		public override function get supportGamecenter():Boolean{
			return false;
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
			obj[PlatExtrFlag.ListernExitGame]=true;
			return obj;
		}
		public function beforeExit():void{
			SdkMainExtension.getInstance().doSdkDestroy();
		}
		/**
		 * 实名注册
		 */
		protected function doSdkRealNameRegister():void {
//			showResult("实名注册"+ getQihooUserId());
			SdkMainExtension.getInstance().doSdkRealNameRegister(isLandscape,openId); //调用
		}
		/**
		 * 回调
		 */
		private function statusHandler(event:StatusEvent):void {
			
			if(event.code == SdkMainEventConstants.STATUS_INIT) {
				PlatformManager.log("初始化完成");
				if(stats==2){
					login();
				}
				stats=1;
				
			} else if(event.code == SdkMainEventConstants.STATUS_LOGIN) {
				
				var loginAuthCode:String = event.level;
				
				if(event.level == "") {
					PlatformManager.log("登录失败!");
					exctueLoginResult(false);
					return;
				}
				
				PlatformManager.log("登录返回:" + event.level);
				
				var result1:Object = JSON.parse(event.level);
//				authCode = result1.data.code;
				
				if(result1.hasOwnProperty("error_code") && result1.error_code<0){
					PlatformManager.log("登录失败!");
					exctueLoginResult(false);
					return;
				}
				
				authCode = result1.data.access_token;
				
//				getAccessToken();
				getUserInfo();
//				this.navigator.pushView(SdkUrlLoadingView, result1.data.code);
				
			} else if(event.code == SdkMainEventConstants.STATUS_SWITCH_ACCOUNT) {
				
				if(event.level == "") {
					PlatformManager.log("切换账户失败!");
					return;
				}
				
				PlatformManager.log("切换账户返回:" + event.level);
				
				var result2:Object = JSON.parse(event.level);
				
				if(result2.hasOwnProperty("error_code") && result2.error_code<0){
					PlatformManager.log("登录失败!");
					exctueLoginResult(false);
					return;
				}
				
				authCode = result2.data.access_token;
				
				//				getAccessToken();
				getUserInfo();
				
			} else if(event.code == SdkMainEventConstants.STATUS_PAY) {
				
				PlatformManager.log("支付返回 ： " + event.level);
				var reslut3:Object=JSON.parse(event.level);
				if(reslut3.error_code=="0"){
					PlatformManager.getInstance().showTipAfterBuy();
				}
				proccessBid();
				
			} else if(event.code == SdkMainEventConstants.STATUS_QUIT) {
				
				PlatformManager.log("退出返回:" + event.level);
//				NativeApplication.nativeApplication.exit();
				
				var resultquit:Object = JSON.parse(event.level);
				if(resultquit.which == 2){
					Util.exitGame();
				}
				
			}else if(event.code==SdkMainEventConstants.STATUS_ANTI_ADDICTION_QUERY){
				var anitRe:Object=JSON.parse(event.level);
				if(anitRe.error_code.toString()=="0"){
					if(anitRe.content && anitRe.content.ret.length && anitRe.content.ret[0].status.toString()=="0"){
						//未注册实名认证，调用注册
						doSdkRealNameRegister();
					}
				}
				
			}
			
			
			
			
			
		}
		
	}
}