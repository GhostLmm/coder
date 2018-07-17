package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.nd.ane.NdCommplatform;
	
	import flash.events.StatusEvent;
	import flash.events.ThrottleEvent;
	import flash.events.ThrottleType;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;
	
	public class MJPlat_91_Android extends Plat_Base
	{
		private var state:int=0;
//		private var tempbid:String;
		public function MJPlat_91_Android(){
			
		}
		
		public override function get loginPlatName():String
		{
			return "91and";
		}
		
		public override function get payPlatName():String
		{
			return "91and";
		}
		
		public override function get onlyPlatName():String
		{
			return "91and";
		}
		private var isAppForeground:Boolean = true;
		/**
		 * 回调：调用暂停页
		 */
		private function pauseHandler(evt:ThrottleEvent):void
		{
			switch (evt.state)
			{
				case ThrottleType.RESUME:
					//前台
					if(!isAppForeground) {
						NdCommplatform.getInstance().ndPause();
						isAppForeground = true;
					}
					MessageTextAppendString("pauseHandler: resume");
					break;
				case ThrottleType.PAUSE:
					//
					MessageTextAppendString("pauseHandler: pause");
					break;
				case ThrottleType.THROTTLE:
					//后台
					var b:Boolean = NdCommplatform.getInstance().ndCheckAppOnForeground();
					if(!b) {
						isAppForeground = false;
					}
					MessageTextAppendString("pauseHandler: THROTTLE, foreground:" + b.toString());
					break;
				default:
					break;
			}
		}
		public override function init():void
		{
			NdCommplatform.getInstance().addEventListener(StatusEvent.STATUS,statusHandler);	// 初始化时添加监听
			if(GlobalRef.stage)
			{
				GlobalRef.stage.addEventListener(ThrottleEvent.THROTTLE,pauseHandler);		// 添加切换到后台的监听(为了显示暂停页)
				MessageTextAppendString("stage:" + 1);
			}
			
//			NdCommplatform.getInstance().ndSetDebugMode();
			
			
			NdCommplatform.getInstance().init91SDK(113671,"33b2b547f1d63e19bdb42dd40903bf2a915b555364a525fe",0); 
			NdCommplatform.getInstance().ndSetRestartWhenSwitchAccount(true);
			
			NdCommplatform.getInstance().ndToolBarHide();
			NdCommplatform.getInstance().ndSetScreenOrientation(1);
			
			MessageTextAppendString("init91SDK");
			GameStatus.change_SN.add(onStatusChange);
		}
		
		private function onStatusChange($status:String):void{
			if(GameStatus.ST_GameOngoing==$status){
				NdCommplatform.getInstance().ndToolBarShow(1);
			}else{
				NdCommplatform.getInstance().ndToolBarHide();
			}
		}
		
		private function MessageTextAppendString(text:String):void
		{
			PlatformManager.log(text);
		}
		
		public override function login():void
		{
			if(state==1){
				NdCommplatform.getInstance().ndLogin();	
				MessageTextAppendString("NdLogin");
				state=1;
			}else{
				state=2;
			}
			
		}
		
//		public function platExit():void{
//			NdCommplatform.getInstance().ndExit();
//		}
		public override function platExit():void{
			NdCommplatform.getInstance().ndExit();
		}
		public override function get supportPlatExit():Boolean{
			return true;
		}
		public override function logout():void
		{
			// TODO Auto-generated method stub
			var res:String = NdCommplatform.getInstance().ndLogout(1);
			MessageTextAppendString("NdLogout");
			logout_SN.dispatch(true,{});
		}
		
		/*public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.ListernExitGame]=true;
			return obj;
		}*/
		
		public override function openGamecenter():void
		{
			var resCode:int = NdCommplatform.getInstance().ndEnterPlatform();
		}
		
		public override function pay(pid:String, bid:String):void
		{
			proccessBid();
//			if(tempbid){
//				payBackSingal.dispatch(true,{orderid:tempbid});
//				tempbid=null;
//			}
			this._tempBid=bid;
			// TODO Auto-generated method stub
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			var rmb:Number;
			rmb=node.rmb;
			CONFIG::PayTest{
				rmb=0.1;
			}
			
			
			var cooOrderSerial:String = bid;
			var productId:String = pid;
			
			var productName:String = node.name;
			var productPrice:Number = rmb;
			var productOrignalPrice:Number = rmb;
			var productCount:Number = 1;
			var payDescription:String = GLBaseData.userId+"/"+GLBaseData.serverId+"/"+pid;
			
			var res:int = NdCommplatform.getInstance().ndUniPayAsyn(cooOrderSerial,productId,productName,productPrice,productOrignalPrice,productCount,payDescription);
			MessageTextAppendString("NdUniPayAsyn:" + res);
		}
		
		/**
		 * 回调处理
		 */
		private function statusHandler(event:StatusEvent):void {
			
			trace("api结果："+event.code+" / "+event.level);
			if(event.code == "NdLoginFunction")
			{
				MessageTextAppendString("NdLoginFunction");
				MessageTextAppendString("账号登陆:");	
				var code:int = int(event.level);
				switch(code){
					case 0:
						PlatformManager.log("登录成功");
						
						//						var sessionid:String = NdCommplatform.getInstance().ndGetSessionId();
						//						var isLogined:Boolean = NdCommplatform.getInstance().ndIsLogin();
						//						var loginUin:String = NdCommplatform.getInstance().ndGetLoginUin();
						//						var nickName:String = NdCommplatform.getInstance().ndGetNickName();
//						_token=NdCommplatform.getInstance().ndGetSessionId();
//						_openId=NdCommplatform.getInstance().ndGetLoginUin();
						setPlatInfo(NdCommplatform.getInstance().ndGetLoginUin(),NdCommplatform.getInstance().ndGetSessionId());
						exctueLoginResult(true);
						//						login_SN.dispatch(true,{});
						
						break;
					case -12:
						PlatformManager.log("取消登录");
						
						//						logout_SN.dispatch(true,{});
						exctueLoginResult(false);
						break;
					default:
						PlatformManager.log("登录错误：" + String(code));
						exctueLoginResult(false);
						break;
				}
			}
				
			else if(event.code == "NdUniPayFunction")
			{
				MessageTextAppendString("NdUniPayFunction"); 
				MessageTextAppendString("同步购买消息:");	 
				var code_0:int = int(event.level); 
				switch(code_0){
					case 0:
						MessageTextAppendString("购买成功");
						PlatformManager.getInstance().showTipAfterBuy();
						break; 
					case -18004:
						MessageTextAppendString("取消购买");
						break; 
					default:
						MessageTextAppendString("购买失败：" + String(code_0));
						break;
				}
				try{
					_payback_SN.dispatch(true,{});
				}catch(e:Error){}
			}
				
			else if(event.code == "NdUniPayAsynFunction")
			{
				MessageTextAppendString("NdUniPayAsynFunction");
				MessageTextAppendString("异步购买:");	
				var code_1:int = int(event.level); 
				switch(code_1){
					case 0:
						MessageTextAppendString("购买成功");
						PlatformManager.getInstance().showTipAfterBuy();
						break; 
					case -18004:
						MessageTextAppendString("取消购买");
						break; 
					case -6004:
						MessageTextAppendString("直购支付，短信已经发送");
						break;
					case -4004:
						MessageTextAppendString("订单已提交");
						break; 
					default:
						MessageTextAppendString("购买失败：" + String(code_1));
						break;
				}
				try{
					proccessBid();
				}catch(e:Error){}
			}
				
			else if(event.code == "NdSearchPayResultInfoFunction")
			{
				MessageTextAppendString("searchPayResultInfoDidFinish:bSuccess:buyInfo:");					
				MessageTextAppendString("查询订单:");
				
				var xmlOrder:XML = XML(event.level);
				var responseCode_0:int = int(xmlOrder.responseCode);
				if(responseCode_0 == 0){
					MessageTextAppendString("orderSerial:" + int(xmlOrder.orderSerial));
					MessageTextAppendString("goodsId:" + String(xmlOrder.goodsId));
					MessageTextAppendString("goodsName:" + String(xmlOrder.goodsName));
					MessageTextAppendString("goodsCount:" + String(xmlOrder.goodsCount));
					MessageTextAppendString("payDescription:" + String(xmlOrder.payDescription));
				}else{
					MessageTextAppendString("订单查询失败");
				}
			}
				
			else if(event.code == "NdSetOnPlatformBackgroundFunction")
			{
				MessageTextAppendString("NdSetOnPlatformBackgroundFunction:");					
				MessageTextAppendString("退出91SDK界面"); 
			} 
				
			else if(event.code == "NdInitFunction") 
			{
				MessageTextAppendString("NdInitFunction");
				MessageTextAppendString("初始化:");	
				var code_2:int = int(event.level);
				
				switch(code_2){
					case 0:
						MessageTextAppendString("正常初始化");
						if(state==0){
							state=1;
						}
						//如果已经调用了登陆那就初始化就登陆
						if(state==2){
							NdCommplatform.getInstance().ndLogin();	
							MessageTextAppendString("NdLogin");
							state=1;
						}
						break;
					case -12:
						MessageTextAppendString("关闭应用(传入的Activity已关闭，其他的自己处理)");
						break;
					default:
						MessageTextAppendString("初始化错误：" + String(code_2)); 
						TopTip.showExitTip("初始化错误，退出游戏：" + String(code_2),Util.exitGame,Util.exitGame,false);
						
						break;
				}
			}
				
			else if(event.code == "NdPauseFunction") 
			{
				MessageTextAppendString("NdPauseFunction");
				MessageTextAppendString("关闭暂停页");
			}
				
			else if(event.code == "NdExitFunction") 
			{
				Util.exitGame();
				MessageTextAppendString("NdExitFunction");
				MessageTextAppendString("退出应用");
			}
				
			else if(event.code == "NdSetOnSwitchAccountListenerFunction")
			{
				MessageTextAppendString("NdSetOnSwitchAccountListenerFunction");
				MessageTextAppendString("切换账号");
				
				accountSwitch_SN.dispatch(true,{});
			}
				
			else 
			{
				MessageTextAppendString(event.code + "\n" +  event.level);
			}
		}
		
		public override function get osType():String{
			return Plat_Base.OS_And_Guonei;
		}
		
	}
}