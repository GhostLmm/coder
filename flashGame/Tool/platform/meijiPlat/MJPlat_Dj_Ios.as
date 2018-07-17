package Tool.platform.meijiPlat
{
	import com.adobe.crypto.MD5;
	import com.fish.GLBaseData;
	import com.ghostlmm.tool.HttpRequest;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.nuaa.ane.CallbackEvent;
	import com.nuaa.ane.Constants;
	import com.nuaa.ane.TestApi;
	
	import flash.desktop.NativeApplication;
	import flash.events.InvokeEvent;
	
	import Tool.GameOrientation;
	import Tool.platform.PlatExtrFlag;
	import Tool.platform.PlatformManager;
	
	public class MJPlat_Dj_Ios extends Plat_Base
	{
		
		
		private var djid:String;
		
		private var userName:String;
		
		private var token:String;
		
		private var orderId:String;
		
		private var request:HttpRequest;
		
		private var sdkApi:TestApi;
		
		
//		private var status:int=1;
		
		public function MJPlat_Dj_Ios()
		{
			sdkApi=new TestApi();
			
			request=HttpRequest.getInstance();
			
		}
		
		public override function get loginPlatName():String
		{
			return "dl";
		}
		
		public override function get payPlatName():String
		{
			return "dl";
		}
		
		public override function get onlyPlatName():String
		{
			return "dl";
		}
		
		override public function init():void
		{
			// TODO Auto Generated method stub
			MessageTextAppendString("init AS");
			sdkApi.initSDK(true,"1385","rnCzTkOP","458","798","DJPlatformSDK3.0");
			
			
			//super.init();
		}
		
		private function MessageTextAppendString(text:String):void{
			
			PlatformManager.log(text);
		}
		
		override public function login():void
		{
			// TODO Auto Generated method stub
			
			var orientation:String=GameOrientation.getGameOrientation();
			switch(orientation)
			{
				case "up":
					sdkApi.setOrientation(0);
					break;
				case "down":
					sdkApi.setOrientation(4);
					break;
				case "left":
					break;
				case "right":
					break;
			}
			MessageTextAppendString("login AS");
			sdkApi.login();  
			sdkApi.addEventListener(Constants.EVENT_TYPE_DJGameSDKCallback, loginCallback);
			trace("login");

		}
		
		public function loginCallback(event:CallbackEvent):void
		{
			
			MessageTextAppendString("received callback event: " + event.toString());
			var callbackType:String = event.callbackType;
			var code:int = event.code;
			var data:Object = event.data;
			
			if(callbackType =="kDJPlatformLoginResultNotification" && code == 1)
			{
				//login success
				
				djid=sdkApi.getMemberId();
				
				token=sdkApi.getToken();
				
				MessageTextAppendString(djid);
				
				MessageTextAppendString(token);
				
				userName=sdkApi.getMemberId();
				
				MessageTextAppendString("login success"+djid);
				

				setPlatInfo(djid,token,userName);
				fistLoginFlag=true;
				exctueLoginResult(true);
				
				
			}
//			if(callbackType =="kDJPlatformCloseNotification")
//			{
//			   MessageTextAppendString("kDJPlatformCloseNotification");
//			
//			   
//				logout_SN.dispatch(true,{});
//
//			}
			
			if(callbackType =="kDJPlatformLoginResultNotification" && code == 0)
			{
				//login cancel
				
 
				
			}
			
			else if(callbackType =="kDJPlatformLogoutResultNotification" && code == 1)
			{
				//login out
				MessageTextAppendString("login out");
				logout_SN.dispatch(true,{});
				
				
				
			}
			else  if(callbackType =="kDJPlatformLogoutResultNotification" && code == 0)
			{
				//login out cancel
				MessageTextAppendString("login out cancel");
				

				
			}
			
			
		}

		override public function logout():void
		{
			// TODO Auto Generated method stub
//			status=2;
			MessageTextAppendString("logout AS");
			sdkApi.logout();
//			logout_SN.dispatch(true,{});
			//super.logout();
		}
		
		override public function openGamecenter():void
		{
			// TODO Auto Generated method stub
			MessageTextAppendString("enterUserCenter AS");
			
			sdkApi.enterUserCenter();
			//super.openGamecenter();
		}
		
		override public function get osType():String
		{
			// TODO Auto Generated method stub
			return OS_Ios_Yueyu;
		}
		
		override public function pay(pid:String, bid:String):void
		{
			// TODO Auto Generated method stub
			MessageTextAppendString("pay AS"+bid);
			
			var node:Node_chongzhi=XMLDataManager.getChongzhiById(int(pid));
			if(node==null) return;
			
			_tempBid=bid;
			
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

			sdkApi.pay(cooOrderSerial,productName,rmb,cooOrderSerial);
			sdkApi.addEventListener(Constants.EVENT_TYPE_DJGameSDKCallback, payCallback);
			//super.pay(pid, bid);
		}
		
		private static var fistLoginFlag:Boolean=false;
		public override function get ExtrFlagObj():Object{
			var obj:Object={};
			obj[PlatExtrFlag.HidePreLoadingMovie]=fistLoginFlag;
			return obj;
		}
		
		public function payCallback(event:CallbackEvent):void
		{
		
			MessageTextAppendString("received callback event: " + event.toString());
			var callbackType:String = event.callbackType;
			var code:int = event.code;
			var data:Object = event.data;
			
			if(callbackType =="kDJPlatformPaymentResultNotification" && code == 1)
			{
			   //购买成功
				proccessBid();
				PlatformManager.getInstance().showTipAfterBuy();
			
			}
		
		
		}
		
		
		
	}
}