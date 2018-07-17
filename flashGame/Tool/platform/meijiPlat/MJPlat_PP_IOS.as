package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.desktop.NativeApplication;
	import flash.events.InvokeEvent;
	
	import Tool.platform.PlatExtrFlag;
	
	import ppAne.PPAne;
	import ppAne.PPAppConfig;
	
	import ppEvents.PPCenterDidCloseEvent;
	import ppEvents.PPCenterDidShowEvent;
	import ppEvents.PPLoginEvent;
	import ppEvents.PPLogoffEvent;
	import ppEvents.PPPayEvent;

	public class MJPlat_PP_IOS extends Plat_Base
	{
	
		public function MJPlat_PP_IOS()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "pp";
		}
		
		public override function get payPlatName():String
		{
			return "pp";
		}
		
		public override function get onlyPlatName():String
		{
			return "pp";
		}
		
		public override function init():void
		{
			trace("initSDK");
			initMySDK();
		}
		
		
		private static var appId:int = 6059;
		private static var appKey:String = "5dff6a610081a61a599bb0a6324e0a44";
		private static var status:Number = 1;
		
		private function initMySDK():void
		{
			PPAne.getInstance().initSDKPlatform(appId,appKey);
			PPAne.getInstance().setOrientationMaskType(PPAppConfig.PPSDKInterfaceOrientationMaskTypeLandscape);
			PPAne.getInstance().setRechargeAmount(10);
			PPAne.getInstance().setIsOpenNSlogData(true);
//			PPAne.getInstance().
			initEvent();
//			PPAne.getInstance().initSDKPlatform(int(appId),appKey,10,true,true,true,true,"关闭充值提示语",false,false,true,true);
			//PPAne.getInstance().initSDKPlatform(1243,"7177b98da85ac0f06b7b5d3f532e593f",10,true,true,true,true,"关闭充值提示语",false,false,true,true);
			
		}
		/**
		 * 初始化事件通知 
		 * 添加关闭客户端页面你回调通知
		 * 添加关闭网页关闭回调通知
		 * 添加登录成功回调通知
		 * 添加注销回调通知
		 * 添加支付成功后回调通知【仅在余额大于所兑换道具时产生的回调】
		 */		
		public function initEvent():void{
			trace("initEvent");
			GameServerManager.instance.addEventListener(GameServerEvent.Evt_Server,onServerData);
			PPAne.getInstance().addEventListener(PPLoginEvent.PP_LOGIN_CALLBACK,ppLoginEvent);
			PPAne.getInstance().addEventListener(PPLogoffEvent.PP_LOGOFF_CALLBACK,ppLogOffEvent);
			PPAne.getInstance().addEventListener(PPPayEvent.PP_PAYRESULT_CALLBACK,ppPayEvent);
			GameStatus.change_SN.add(onGamestatusChagne);
			PPAne.getInstance().addEventListener(PPCenterDidShowEvent.PP_CENTERDIDSHOW_CALLBACK,ppCenterDidShowEvent);
			PPAne.getInstance().addEventListener(PPCenterDidCloseEvent.PP_CENTERDIDCLOSE_CALLBACK,ppCenterDidCloseEvent);
			NativeApplication.nativeApplication.addEventListener(InvokeEvent.INVOKE,
				function invokeHandler(event:InvokeEvent):void{
					if(event.arguments.length > 0){
						PPAne.getInstance().alixPayResult(event.arguments[0]); //支付宝openURL回调
					}
				});
		}
		private function onGamestatusChagne($status:String):void{
			if($status==GameStatus.ST_GameOngoing){
				PPAne.getInstance().setBuoyPosition(0,0);
			}else{
				PPAne.getInstance().setBuoyPosition(-500,-500);
			}
		}
		private function onServerData(evt:GameServerEvent):void{
			if(!evt.effect) return ;
			//			{"infoResult":{"code":0,返回的字段跟着source变}}
			if(evt.key==GameServerManager.KEY_GetUserInfo){
				if(evt.data && evt.data.checkResult && evt.data.checkResult.code==0){
					var result:Object=evt.data.checkResult;
					//					_openId=result.uid;
					//					_token=result.accessToken;
					setPlatInfo(result.userid,"");
					//					refreshToken=result.refreshToken;
					
					
					PPAne.getInstance().tokenVerifyCallBack(true);
					exctueLoginResult(true);
				}else{
					PPAne.getInstance().tokenVerifyCallBack(false);
					exctueLoginResult(false);
				}
			}
		}
		/**
		 * 兑换道具成功的回调，只有余额大于所购买道具时才响应该回调事件 
		 */		
		private function ppPayEvent(e:PPPayEvent):void
		{
			//记录回调日志
//			recordCallbackLog(formateRecord("ppPayCallback"));
			
			var paramPPPayResultCode:int = parseInt(e.data);
			if(paramPPPayResultCode == PPAppConfig.PPPayResultCodeSucceed){
				trace(e.data + "-ppPayEvent，兑换成功");
				
			}
		}
		/**
		 *登录成功回调 
		 * @param e ，
		 * String token
		 */		
		private function ppLoginEvent(e:PPLoginEvent):void
		{
			//记录回调日志
//			recordCallbackLog(formateRecord("ppLoginSuccessCallback"));
//			
			trace(e.data + "-ppLoginEvent");
			
			//在这里做token验证，token验证成功调用回调 
			
//			PPAne.getInstance().tokenVerifyCallBack(true);//token验证 成功true ||失败false
//			PPAne.getInstance().loginState();//获取登录状态
			
			GameServerManager.instance.getUserInfo(e.data);
			
//			
//			
//			centerButton.visible = true;
//			buy1Button.visible = true;
//			buy2Button.visible = true;
		}
		
		
		/**
		 * 注销事件的回调 
		 * @param e
		 * 
		 */		
		private function ppLogOffEvent(e:PPLogoffEvent):void
		{
			//记录回调日志
//			recordCallbackLog(formateRecord("ppLogOffCallback"));
//			
			trace(e.data + "-ppLogOffEvent");
			if(GameStatus==GameStatus.ST_GameOngoing){
				logout_SN.dispatch(true,{});
			}
			
//			centerButton.visible = false;
//			buy1Button.visible = false;
//			buy2Button.visible = false;
		}
		
		
		/**
		 *  用户中心显示完成回调
		 */	
		private function ppCenterDidShowEvent(e:PPCenterDidShowEvent):void
		{
			//记录回调日志
//			recordCallbackLog(formateRecord("ppCenterDidShowCallback"));
			
			trace(e.data + "-ppCenterDidShowEvent");
		}
		
		/**
		 * 用户中心关闭完成回调
		 */		
		private function ppCenterDidCloseEvent(e:PPCenterDidCloseEvent):void
		{
			//记录回调日志
//			recordCallbackLog(formateRecord("ppCenterDidCloseCallback"));
			
			trace(e.data + "-ppCenterDidCloseEvent");
		}
		
		public override function login():void{
//			PPAne.getInstance().loginState();
//			PPAne.getInstance().tokenVerifyCallBack(true);
			var loginState:int=PPAne.getInstance().loginState();
			trace("登录状态： "+loginState);
			if(loginState==0){
				PPAne.getInstance().startPPSDK();
				PPAne.getInstance().showSDKCenter();
			}else{
				PPAne.getInstance().logout();
				PPAne.getInstance().showSDKCenter();
			}
			
		}
		
		
//		/**
//		 * 兑换道具成功的回调，只有余额大于所购买道具时才响应该回调事件  
//		 * @param e
//		 * 
//		 */		
//		/**
//		 * 兑换道具成功的回调，只有余额大于所购买道具时才响应该回调事件 
//		 */		
//		private function ppPayEvent(e:PPPayEvent):void
//		{
//			//记录回调日志
////			recordCallbackLog(formateRecord("ppPayCallback"));
//			
//			var paramPPPayResultCode:int = parseInt(e.data);
//			if(paramPPPayResultCode == PPAppConfig.PPPayResultCodeSucceed){
//				trace(e.data + "-ppPayEvent，兑换成功");	
//			}else{
//				
//			}
//		}
//			
//			
////			if(paramPPPayResultCode == PPAppConfig.PPPayResultCodeSucceed){
////				
////				PlatformManager.getInstance().showTipAfterBuy();
////			}
////			proccessBid();
//		}
//		public override function login():void
//		{
//			trace("login");
//			if(status !=2)
//			PPAne.getInstance().showLoginView();
//			if(status == 2)
//			{
//			   status = 1;
//			}
//		}
		public override function openGamecenter():void
		{
			trace("openGameCenter");
			PPAne.getInstance().showSDKCenter();
		}
		public override function logout():void{
			trace("logout");
			//PPAne.getInstance().PPlogout();
			PPAne.getInstance().logout();
//			logout_SN.dispatch(true,{});
		}
		public override function pay(pid:String, bid:String):void
		{	
			proccessBid();
			
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null){
				trace("没有对应的 node "+pid);
			}
			_tempBid=bid;

			var price:Number=node.rmb;
			
			
			CONFIG::PayTest{
				price=1;
			}
			
			var billNum:String=bid;
			var billTitle:String=node.name;
			var roleId:String=GLBaseData.userId;
			var zongId:int=0;
			PPAne.getInstance().exchangeGoods(price,billNum,billTitle,roleId,zongId);
		}
//		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.IgnoreCheckSession]=true;
			return obj;
		}
		
		public override function get supportGamecenter():Boolean
		{
			return true;
		}
		public override function get supportLogout():Boolean
		{
			return true;
		}
		public override function get supportPlatAccount():Boolean
		{
			return true;
		}
		public override function get osType():String
		{
			return Plat_Base.OS_Ios_Yueyu;
		}
	}
}