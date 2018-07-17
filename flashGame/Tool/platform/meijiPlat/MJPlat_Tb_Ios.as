package Tool.platform.meijiPlat
{
	
	import com.adobe.crypto.MD5;
	import com.fish.GLBaseData;
	import com.fish.modules.core.S2CHanlder;
	import com.ghostlmm.tool.HttpRequest;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.tongbu.Events.TBPlatformEvents;
	import com.tongbu.TBPlatform.TBPlatform;
	
	import flash.events.StatusEvent;
	
	import Tool.GameOrientation;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;
	
//	import cn.sharesdk.ane.PlatformID;
//	import cn.sharesdk.ane.ShareMenuArrowDirection;
//	import cn.sharesdk.ane.ShareSDKExtension;
	
	public class MJPlat_Tb_Ios extends Plat_Base 
	{
		
		private var tbid:String;
		
		private var userName:String;
		
		private var orderId:String;
		
		private var request:HttpRequest;
		
		private var status:int=0;
		
//		private var shareSDK:ShareSDKExtension;
		
		private var platInitComplete:Boolean=false;
		
		public function MJPlat_Tb_Ios()
		{
			
			request=HttpRequest.getInstance();
			
//			shareSDK=new ShareSDKExtension();
			
		}
		private static var firstLoginFlag:Boolean=false;
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.PreInit]=true;
			obj[PlatExtrFlag.HidePreLoadingMovie]=firstLoginFlag;
			return obj;
		}
		
		public function preInit():void{
			// TODO Auto Generated method stub
			MessageTextAppendString("init SDK");
			TBPlatform.getInstance().TBPlatformInitSelf(140357,1,false);
			TBPlatform.getInstance().TBSetSupportIOS7(true);
			TBPlatform.getInstance().addEventListener(StatusEvent.STATUS,
				statusHandler);
			//TBPlatform.getInstance().TBSetDebugMode(1);//for debug
			TBPlatform.getInstance().TBSetAutoRotation(false);
			if(GameOrientation.getGameOrientation()==GameOrientation.UP){
				TBPlatform.getInstance().TBSetScreenOrientation(1);
			}else{
				TBPlatform.getInstance().TBSetScreenOrientation(2);
			}
			
			
			
			TBPlatform.getInstance().TBSetWelcomeTipShow(false);//显示欢迎的tips
			TBPlatform.getInstance().TBHideToolBar();
		}
		
		public override function get loginPlatName():String
		{
			return "tb";
		}
		
		public override function get payPlatName():String
		{
			return "tb";
		}
		
		public override function get onlyPlatName():String
		{
			return "tb";
		}
		
		override public function init():void
		{
			
			
			
			GameStatus.change_SN.add(onStatusChange);
			S2CHanlder.instance.initCom_SN.add(onGameComplete);
			//super.init();
			//shareSDK init
//			shareSDK.open("iosv1101");
//			shareSDK.setPlatformActionListener(onComplete, onError, onCancel);

			
		}
		private function onStatusChange($status:String):void{
			if($status==GameStatus.ST_GameOngoing){
				TBPlatform.getInstance().TBShowToolBar(1,false);
			}else{
				TBPlatform.getInstance().TBHideToolBar();
			}
		}
		
		public function onComplete(platform:int, action:String, res:Object):void {
			var json:String = (res == null ? "" : JSON.stringify(res));
			var message:String = "onComplete\nPlatform=" + platform + ", action=" + action + "\nres=" + json;
//			shareSDK.toast(message);
		}
		
		public function onCancel(platform:int, action:String):void {
			var message:String = "onCancel\nPlatform=" + platform + ", action=" + action;
//			shareSDK.toast(message);
		}
		
		public function onError(platform:int, action:String, err:Object):void {
			var json:String = (err == null ? "" : JSON.stringify(err));
			var message:String = "onError\nPlatform=" + platform + ", action=" + action + "\nres=" + json;
//			shareSDK.toast(message);
		}
		
		
		private function onGameComplete():void{
			status=0;
		}
		
		override public function login():void
		{
			if(!platInitComplete){
				Util.flow("初始化没有成功，无法登录");
				return ;
			}
			// TODO Auto Generated method stub
			MessageTextAppendString("login");
			if(!TBPlatform.getInstance().isLogined())
			TBPlatform.getInstance().TBLogin(0)
			//super.login();
		}
		
		override public function logout():void
		{
			// TODO Auto Generated method stub
			MessageTextAppendString("logout");
			if(TBPlatform.getInstance().isLogined()){
				status=1;
				TBPlatform.getInstance().TBLogout(0);
//				logout_SN.dispatch(true,{});
			}
				
			//super.logout();
		}
		
		override public function openGamecenter():void
		{
			// TODO Auto Generated method stub
			TBPlatform.getInstance().TBEnterUserCenter(0);/*进⼊入个⼈人中⼼心*/
			// TBPlatform.getInstance().TBEnterAppCenter(0); /*进⼊入游戏推荐*/
			// TBPlatform.getInstance().TBEnterAppBBS(0);/*进⼊入论坛(虚后台配置)*/
			//super.openGamecenter();
			
//			share();
		}
		
		
//		public function share():void
//		{
//			//shareSDK.getUserInfo(PlatformID.SinaWeibo);
//			var shareParams:Object = new Object();
//			shareParams.title = "ShareSDK for ANE发布";
//			shareParams.titleUrl = "http://sharesdk.cn";
//			shareParams.text = "好耶～好高兴啊～";
//			shareParams.imageUrl = "http://f1.sharesdk.cn/imgs/2014/02/26/owWpLZo_638x960.jpg";
//			shareParams.site = "ShareSDK";
//			shareParams.siteUrl = "http://sharesdk.cn";
//			var platforms:Array = new Array();
//			platforms[0] = PlatformID.SinaWeibo;
//			platforms[1] =PlatformID.WeChatTimeline;
//			platforms[2] =PlatformID.WeChatSession;
//			//platforms[3] =PlatformID.WeChatFav;
//			shareSDK.showShareMenu(platforms, shareParams, 320, 460, ShareMenuArrowDirection.Any);
//
//		}
		
		override public function get osType():String
		{
			// TODO Auto Generated method stub
			return OS_Ios_Yueyu;
		}
		
		override public function pay(pid:String, bid:String):void
		{
			if(_tempBid){
				proccessBid();
			}
			// TODO Auto Generated method stub
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return;
			
			var rmb:Number= node.rmb;
			
			CONFIG::PayTest{
				rmb=1;
			}
			
			this._tempBid=bid;
				
			var cooOrderSerial:String = bid;
			var productId:String = pid;
			
			var productName:String = node.name;
			var productPrice:Number = rmb;
			var productOrignalPrice:Number = rmb;
			var productCount:Number = 1;
			var payDescription:String = GLBaseData.userId+"/"+GLBaseData.serverId+"/"+pid;
			
			
			TBPlatform.getInstance().TBUniPayForCoin(cooOrderSerial,/*订单号*/rmb,/*⾦金额(元)*/
				productName);/*描述*/

			
			//super.pay(pid, bid);
		}
		
		private function MessageTextAppendString(text:String):void{
			PlatformManager.log(text);
		}
		
		public function getUserInfo():void
		{
			/*userID*/
			var uid:String = TBPlatform.getInstance().userID();
			tbid=uid;
//			_openId=uid;
//			/*sessionID*/
			var session:String = TBPlatform.getInstance().sessionId();
//            _token=session;
//			/*nickName*/
			var nick:String = TBPlatform.getInstance().nickName();
//			_nickName=nick;
			setPlatInfo(tbid,session,nick);
			
			MessageTextAppendString("userid is:"+uid+"\n"+"session is:"+session+"\n"+"nick is:"+nick);
			firstLoginFlag=true;
			exctueLoginResult(true);
			
			
		}
		
		
//		public override function get ExtrFlagObj():Object{
//			var obj:Object={};
//			obj[PlatExtrFlag.NoAutoLogin]=true;
//			return obj;
//		}
		
		protected function statusHandler(event:StatusEvent):void{
			
			trace("api :"+event.code+" / "+event.level);
			switch(event.code)
			{
				case TBPlatformEvents.kTBInitDidFinishNotification:
					platInitComplete=true;
					break;
				case TBPlatformEvents.kTBLoginNotification:
					//用户登陆结果通知	
					MessageTextAppendString("login success");
					var xmlLogin:XML = XML(event.level);
					trace("result:" + Boolean(xmlLogin.result));
					trace("error:" + int(xmlLogin.error));
					getUserInfo();
					//trace("result:" + Boolean(xmlLogin.result));
					//trace("error:" + int(xmlLogin.error));
					break;
				case TBPlatformEvents.kTBLeavePlatformNotification:
					//离开平台通知
					MessageTextAppendString("leave platform");

					if(status==2){
						logout_SN.dispatch(true,{});
						/*隐藏悬浮⼯工具条*/ 
						status=0;
					}
					
					
					break;
				case TBPlatformEvents.kTBUserLogoutNotification:
					//注销通知
					MessageTextAppendString("logout");
					var xmlLoginout:XML = XML(event.level);
					if(status==1){
						logout_SN.dispatch(true,{});
					}else{
						status=2;
					}
					
					break;
				case TBPlatformEvents.kTBBuyGoodsDidSuccess:
					//购买成功
					MessageTextAppendString("purchase success");
					var xmlBuySuccess:XML = XML(event.level);
					MessageTextAppendString("order:"+String(xmlBuySuccess.order));
					proccessBid();
					PlatformManager.getInstance().showTipAfterBuy();
					break;
				case TBPlatformEvents.kTBBuyGoodsDidCancelByUser:
					//购买失败
					MessageTextAppendString("purchase cancel");
					var xmlBuyFailed:XML = XML(event.level);
					MessageTextAppendString("order:"+String(xmlBuyFailed.order));
					MessageTextAppendString("result:"+String(xmlBuyFailed.result));
					break;
				case TBPlatformEvents.kTBBuyGoodsDidStartRecharge:
					//玩家推币不够，进入充值的界面
					MessageTextAppendString("recharge");
					var xmlStartRec:XML = XML(event.level);
					MessageTextAppendString("order:"+String(xmlStartRec.order));
					proccessBid();
					PlatformManager.getInstance().showTipAfterBuy();
					//trace("result:"+String(xmlBuyFailed.result));
					break;
				case TBPlatformEvents.kTBCheckOrderSuccess:
					//检查订单成功
					break;
				case TBPlatformEvents.kTBCheckOrderFailed:
					//检查订单失败
					break;
			}
			
			
		}

		
		
	}
}