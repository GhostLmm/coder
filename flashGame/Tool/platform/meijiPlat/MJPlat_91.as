package Tool.platform.meijiPlat
{
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.nd.complatform.NdComPlatform;
	import com.nd.complatform.NdComPlatformEvents;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.StatusEvent;
	
	import org.osflash.signals.Signal;
	
	public class MJPlat_91 implements IMJPlatform
	{
		private static const AppId:int=106903;
		private static const AppKey:String="521267e97f81bb366669484f839bfb39d25f21f17566a977";
		
		private var _loginCom:Function;
		private var _loginFail:Function;
		private var _payback_SN:Signal=new Signal(Boolean,Object);
		private var _logout_SN:Signal=new Signal(Boolean,Object);
		
		public function MJPlat_91()
		{
		}
		
		public function get loginPlatName():String
		{
			return "91";
		}
		
		public function get payPlatName():String
		{
			return "91";
		}
		
		public function get onlyPlatName():String
		{
			return "91";
		}
		
		
		
		
		private function statusHandler(event:StatusEvent):void
		{
			if(event.code == NdComPlatformEvents.kNdCPLoginNotification)
			{
				MessageTextAppendString("登录消息:" + NdComPlatformEvents.kNdCPLoginNotification);
				
				var xmlLogin:XML = XML(event.level);
				MessageTextAppendString("result:" + Boolean(xmlLogin.result));
				MessageTextAppendString("error:" + int(xmlLogin.error));					
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
			}
			else if(event.code == NdComPlatformEvents.kNdCPLeavePlatformNotification)
			{
				_logout_SN.dispatch(true,{})
				MessageTextAppendString("离开平台消息:" + NdComPlatformEvents.kNdCPLeavePlatformNotification);	
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
		
		private function pauseHandler(evt:Event):void
		{
			NdComPlatform.getInstance().NdPause();
			MessageTextAppendString("pauseHandler:" + 1);
		}
		
		protected function initSDK():void
		{
			
			// TODO Auto-generated method stub
			//特别说明：初始化API前一定要先设置SDK屏幕方向，SDK屏幕方向必须与游戏方向保持一致
			//本DEMO不另外编写注释，我的注释都写在另外提供的Flex项目中--ndComPlatform
			//DEMO只是简单演示，具体的API调用说明看SDK开发手册，对一些参数有疑问的看SDK的头文件
			//SDK接入流程说明：http://bbs.18183.com/thread-99382-1-1.html
			//SDK规则说明：http://bbs.18183.com/thread-529601-1-1.html
			//          和 http://bbs.18183.com/thread-529673-1-1.html
			
			
			if(GlobalRef.stage)
			{
				GlobalRef.stage.addEventListener(Event.DEACTIVATE,pauseHandler);
				MessageTextAppendString("stage:" + 1);
			}
			
			NdComPlatform.getInstance().NdSetScreenOrientation(3);
			MessageTextAppendString("NdSetScreenOrientation");
			
			NdComPlatform.getInstance().NdSetAutoRotation(true);
			MessageTextAppendString("NdSetAutoRotation");
			
			
			//初始化参数说明：appid,appkey,验证等级（0表示严格，1表示普通）
			var res:int = NdComPlatform.getInstance().NdInitSDK(106136,"c5b84677d308e0f71a1fb8a654ad465c4c456bb16e4a16fc",0);
			NdComPlatform.getInstance().addEventListener(StatusEvent.STATUS, statusHandler);
			MessageTextAppendString("NdInitSDK:"+ res);
			
		}
		
		
		
		
		private function MessageTextAppendString(s:String):void{
			trace(s);
		}
		
		public function get ExtrFlagObj():Object
		{
			return null;
		}
		
		public function get supportBindAccount():Boolean
		{
			return false;
		}
		
		public function get supportPlatAccount():Boolean
		{
			return true;
		}
		
		public function get supportLogout():Boolean
		{
			return true;
		}
		
		public function logout():void
		{
			var res:int = NdComPlatform.getInstance().NdLogout(1);
			MessageTextAppendString("NdLogout:" + res);
		}
		
		public function get supportGamecenter():Boolean
		{
			return false;
		}
		protected function openGamecenter():void
		{
			NdComPlatform.getInstance().NdEnterAppCenter(0);
			MessageTextAppendString("NdEnterAppCenter");
		}
		
		public function get logout_SN():Signal
		{
			return _logout_SN;
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			this._loginCom=_comFn;
			this._loginFail=_failFn;
		}
		
		public function login():void
		{
			var res:int = NdComPlatform.getInstance().NdLogin(0);	
			MessageTextAppendString("NdLogin:" + res);
		}
		
		protected function enterappbbs_clickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var res:int = NdComPlatform.getInstance().NdEnterAppBBS(0);
			MessageTextAppendString("NdEnterAppBBS:" + res);
		}
		
		public function pay(pid:int, bid:String):void
		{
			var cooOrderSerial:String = bid;
			var productId:String = pid.toString();
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(pid);
			var productName:String = node.name;
			
			var productPrice:Number = node.rmb;
			var productOrignalPrice:Number = node.rmb;
			var productCount:Number = 1;
			var payDescription:String = node.desc;
			var res:int = NdComPlatform.getInstance().NdUniPayAsyn(cooOrderSerial,productId,productName,productPrice,productOrignalPrice,productCount,payDescription);
			MessageTextAppendString("NdUniPayAsyn:" + res);
		}
		
		public function get payBackSingal():Signal
		{
			return _payback_SN;
		}
		
		public function init():void
		{
			initSDK();
		}
		
		public function get supportGameconfig():Boolean
		{
			return false;
		}
	}
}