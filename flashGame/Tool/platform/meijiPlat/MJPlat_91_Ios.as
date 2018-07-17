package Tool.platform.meijiPlat
{
	import com.fish.GLBaseData;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.nd.complatform.NdComPlatform;
	import com.nd.complatform.NdComPlatformEvents;
	
	import flash.events.Event;
	import flash.events.StatusEvent;
	
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	import util.Util;

	public class MJPlat_91_Ios extends Plat_Base
	{
		
		private var loginStatus:int=1;
		public function MJPlat_91_Ios()
		{
			super();
		}
		
		public override function get loginPlatName():String
		{
			return "91";
		}
		
		public override function get payPlatName():String
		{
			return "91";
		}
		
		public override function get onlyPlatName():String
		{
			return "91";
		}
		
		public function preInit():void{
			//初始化参数说明：appid,appkey,验证等级（0表示严格，1表示普通）
			trace(GlobalRef.stage.deviceOrientation);
			NdComPlatform.getInstance().NdSetScreenOrientation(1);
			MessageTextAppendString("NdSetScreenOrientation");
			
			NdComPlatform.getInstance().NdSetAutoRotation(false);
			MessageTextAppendString("NdSetAutoRotation");
			NdComPlatform.getInstance().NdHideToolBar();
			//			NdComPlatform.getInstance().NdShowToolBar(1);
			MessageTextAppendString("NdHideToolBar:");
			
			// deubug
//			NdComPlatform.getInstance().NdSetDebugMode(0);
			NdComPlatform.getInstance().addEventListener(StatusEvent.STATUS, statusHandler);
			var res:int = NdComPlatform.getInstance().NdInitSDK(113670,"b338589afb1cb6783238076a59c3b7f2231688e0e533b7cd",0);
			
			//			if(res<=0){
			//				return ;
			//			}
//			NdComPlatform.getInstance().
			trace("返回" +res);
		}
		
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.PreInit]=true;
			obj[PlatExtrFlag.NotAutoLogin]=true;
			return obj;
		}
		
		public override function init():void{
			GameStatus.change_SN.add(onChageGameStatus);
			if(GlobalRef.stage)
			{
				GlobalRef.stage.addEventListener(Event.DEACTIVATE,pauseHandler);
				MessageTextAppendString("stage:" + 1);
			}
			
		}
		private function pauseHandler(evt:Event):void
		{
			NdComPlatform.getInstance().NdPause();
			MessageTextAppendString("pauseHandler:" + 1);
		}
		
		private function onChageGameStatus($status:String):void{
			if($status==GameStatus.ST_GameOngoing){
				NdComPlatform.getInstance().NdShowToolBar(1);
			}else{
				NdComPlatform.getInstance().NdHideToolBar();
			}
		}
		
		private function MessageTextAppendString(text:String):void{
			PlatformManager.log(text);
		}
		
		public override function login():void
		{
			var res:int = NdComPlatform.getInstance().NdLogin(0);	
			MessageTextAppendString("NdLogin:" + res);
		}
		public override function logout():void
		{
//			NdComPlatform.getInstance().
			var res:int = NdComPlatform.getInstance().NdLogout(1);
			MessageTextAppendString("NdLogout:" + res);
			logout_SN.dispatch(true,{});
		}
		
		public override function openGamecenter():void
		{
			NdComPlatform.getInstance().NdEnterPlatform(0);
//			NdComPlatform.getInstance().NdEnterUserSetting(0);
//			NdCommplatform.getInstance().ndEnterPlatform();
//			NdComPlatform.getInstance().NdEnterAppCenter(0);
			MessageTextAppendString("NdEnterAppCenter");
		}
		
		public override function get supportLuntan():Boolean{
			return true;
		}
		public override function enterLuntan():void{
			NdComPlatform.getInstance().NdEnterAppBBS(0);
		}
		
		public override function get osType():String{
			
			return OS_Ios_Yueyu;
		}
		
			
		public override function pay(pid:String, bid:String):void
		{
			// TODO Auto-generated method stub
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
//			var rmb:Number=0.1;
			var rmb:Number= node.rmb;
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
			var res:int = NdComPlatform.getInstance().NdUniPayAsyn(cooOrderSerial,productId,productName,productPrice,productOrignalPrice,productCount,payDescription);
			MessageTextAppendString("NdUniPayAsyn:" + res);
		}
		
		private function statusHandler(event:StatusEvent):void
		{
			trace("api返回: "+event.code+" / "+event.level);
			if(NdComPlatformEvents.kNdCPInitDidFinishNotification==event.code){
				
			}else if(event.code == NdComPlatformEvents.kNdCPLoginNotification)
			{
				MessageTextAppendString("登录消息:" + NdComPlatformEvents.kNdCPLoginNotification);
				
				var xmlLogin:XML = XML(event.level);
				MessageTextAppendString("result:" + Boolean(xmlLogin.result));
				MessageTextAppendString("error:" + int(xmlLogin.error));	
				
				if(Boolean(xmlLogin.result)){
					var token:String = NdComPlatform.getInstance().sessionId();
					var isLogined:Boolean = NdComPlatform.getInstance().isLogined();
					var isAutoLogin:Boolean = NdComPlatform.getInstance().isAutoLogin();
					var openId:String = NdComPlatform.getInstance().loginUin();
					var nickName:String = NdComPlatform.getInstance().nickName();
					
					if(isLogined){
						setPlatInfo(openId,token,nickName);
						MessageTextAppendString("sessionId:"+ token + "\n" + "isLogined:" + isLogined + "\n" 
							+ "isAutoLogin:" + isAutoLogin + "\n" + "loginUin:"+ openId + "\n" + "nickName:" + nickName);
						if(GameStatus.status==GameStatus.ST_GameOngoing){
							loginStatus=2;
						}
						if(loginStatus==2){
							
						}else{
							loginStatus=1;
							exctueLoginResult(true);
						}
						
					}else{
						//退出
						trace("注销游戏");
					}
					
				}else{
					exctueLoginResult(false);
				}
				
			}
			else if(event.code == NdComPlatformEvents.kNdCPBuyResultNotification)
			{
				MessageTextAppendString("支付消息:" + NdComPlatformEvents.kNdCPBuyResultNotification);	
				
				var xmlBuy:XML = XML(event.level);				
				MessageTextAppendString("result:" + Boolean(xmlBuy.result));
				MessageTextAppendString("error:" + int(xmlBuy.error));
				MessageTextAppendString("cooOrderSerial:" + String(xmlBuy.cooOrderSerial));
				MessageTextAppendString("productId:" + String(xmlBuy.productId));
				MessageTextAppendString("productName:" + String(xmlBuy.productName));
				MessageTextAppendString("productPrice:" + Number(xmlBuy.productPrice));
				MessageTextAppendString("productOrignalPrice:" + Number(xmlBuy.productOrignalPrice));
				MessageTextAppendString("productCount:" + uint(xmlBuy.productCount));
				MessageTextAppendString("payDescription:" + String(xmlBuy.payDescription));
				
				if(Boolean(xmlBuy.result)){
//					PlatformManager.getInstance().showTipAfterBuy();
				}
				try{
					
					var bid:String=String(xmlBuy.cooOrderSerial);
					_payback_SN.dispatch(true,{orderid:bid});
					
				}catch(e:Error){}
				
			}
			else if(event.code == NdComPlatformEvents.kNdCPLeavePlatformNotification)
			{
				MessageTextAppendString("离开平台消息:" + NdComPlatformEvents.kNdCPLeavePlatformNotification);	
				if(GameStatus.status==GameStatus.ST_GameOngoing){
					if(!NdComPlatform.getInstance().isLogined()){
						trace("注销后");
						logout_SN.dispatch(true,{});
					}else{
						if(loginStatus==2){
							loginStatus=1;
							exctueLoginResult(true);
						}
					}
				}
				
			}
			else if(event.code == NdComPlatformEvents.kNdCPSessionInvalidNotification)
			{
				MessageTextAppendString("会话过期消息:" + NdComPlatformEvents.kNdCPSessionInvalidNotification);	
			}
			else if(event.code == NdComPlatformEvents.kSearchPayResultInfoDidFinish)
			{
				MessageTextAppendString("查询订单消息:" + NdComPlatformEvents.kSearchPayResultInfoDidFinish);
				
				var xmlOrder:XML = XML(event.level);				
				MessageTextAppendString("result:" + Boolean(xmlOrder.result));
				MessageTextAppendString("error:" + int(xmlOrder.error));
				MessageTextAppendString("cooOrderSerial:" + String(xmlOrder.cooOrderSerial));
				MessageTextAppendString("productId:" + String(xmlOrder.productId));
				MessageTextAppendString("productName:" + String(xmlOrder.productName));
				MessageTextAppendString("productPrice:" + Number(xmlOrder.productPrice));
				MessageTextAppendString("productOrignalPrice:" + Number(xmlOrder.productOrignalPrice));
				MessageTextAppendString("productCount:" + uint(xmlOrder.productCount));
				MessageTextAppendString("payDescription:" + String(xmlOrder.payDescription));
			}
			else if(event.code == NdComPlatformEvents.kGetPortraitPathDidFinish)
			{
				MessageTextAppendString("获取头像路径消息:" + NdComPlatformEvents.kGetPortraitPathDidFinish);
				
				var xmlPortrait:XML = XML(event.level);
				MessageTextAppendString("error:" + int(xmlPortrait.error));
				MessageTextAppendString("uin:" + String(xmlPortrait.uin));
				MessageTextAppendString("portraitPath:" + String(xmlPortrait.portraitPath));
				MessageTextAppendString("checkSum:" + String(xmlPortrait.checkSum));
			}
			else if(event.code == NdComPlatformEvents.kGetAppIconPathDidFinish)
			{
				MessageTextAppendString("获取应用图标消息:" + NdComPlatformEvents.kGetAppIconPathDidFinish);
				
				var xmlIcon:XML = XML(event.level);
				MessageTextAppendString("error:" + int(xmlIcon.error));
				MessageTextAppendString("appId:" + String(xmlIcon.appId));
				MessageTextAppendString("iconPath:" + String(xmlIcon.iconPath));
				MessageTextAppendString("checkSum:" + String(xmlIcon.checkSum));
			}
			else 
			{
				MessageTextAppendString(event.code);
				MessageTextAppendString(event.level);
			}
		}
		
	}
}