package Tool.platform
{
	import Tool.FileLog;
	
	import com.ghostlmm.minugame.MinuGameEvent;
	import com.ghostlmm.minugame.MinuGameSdkHelper;
	import com.ghostlmm.minugame.MinuGameType;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import myDisplay.window.Wnd_Chongzhi_New;
	
	public class Platform_Minu_Android extends EventDispatcher implements IPlatform
	{
		
		private var appid:int = 16533;
		private var appkey:String = "6127edf4-469e-c634-d12f-51e3c2a8cc00";

		private var minuPayXml:String="xiomiPay.xml";
		
		private var _loginCom:Function;
		private var _loginFail:Function;
		
		private var itemArray:Array;
		public function Platform_Minu_Android()
		{
//			MinuGameSdkHelper.instance.
			MinuGameSdkHelper.instance.init(appid,appkey,false);
			MinuGameSdkHelper.instance.addEventListener(MinuGameEvent.MINU_GAME_EVENT,onStatus);
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			_loginCom=_comFn;
			_loginFail=_failFn;
		}
		
		public function login():void
		{
			MinuGameSdkHelper.instance.login();
		}
		
		public function get platCode():String
		{
			return "xiaomi";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		
		public function get moneyType():String
		{
			return "米币";
		}
		
		public function buyItem(itemType:String):void
		{
			var obj:Object=getItemDetailById(itemType);
			if(obj==null)
			{
				return ;
			}
//			MinuGameSdkHelper.instance.payOnline(new Date().toString(),"test",1);
			var id:String=createBillId(obj);
			MinuGameSdkHelper.instance.payOnline(id,obj.productName,int(obj.salePrice));
			FileLog.log("pay",id+obj.productName+int(obj.salePrice));
		}
		public function getDetailItems():void
		{
			//			var proxy:ItemsXmlLoaderProxy=new ItemsXmlLoaderProxy();
			//			proxy.startLoad(this,DetailXmlUrl);
			var vars:Object = {name: "gooleItem", noCache: true, onComplete: xmlLoaderComplete};
			var loader:XMLLoader = new XMLLoader(EnvironmentParameter.gamePreUrl+minuPayXml, vars);
			loader.load();
		}
		
		private function xmlLoaderComplete(evt:LoaderEvent):void
		{
			itemArray=ItemsXmlLoaderProxy.decodeItemsXml(LoaderMax.getContent("gooleItem"));
			var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
			e.data=itemArray;
			dispatchEvent(e);
		}
		private function getItemDetailById(itemID:String):Object
		{
			for each(var obj:Object in itemArray)
			{
				if(obj.itemId==itemID)
				{
					return obj;
				}
			}
			return null;
		}
		private function createBillId(obj:Object):String
		{
			var date:Date=new Date();
			return BASE._userID+"_"+BASE._myOnlyUid+"_"+date.fullYear+((date.month+1)<10?"0":"")+""+(date.month+1)
				+(date.date<10?"0":"")+""+date.date+(date.hours<10?"0":"")+""
				+date.hours+(date.minutes<10?"0":"")+""+date.minutes+(date.seconds<10?"0":"")+
				""+date.seconds+""+date.milliseconds+"_"+Math.ceil(Math.random()*1000000000)
				+"_"+obj.itemId;
		}
		
		public function get suportQiehuan():Boolean
		{
			return true;
		}
		
		public function zhanghaoQiehuan():void
		{
			MinuGameSdkHelper.instance.loginOut();
		}
		
		public function init():void
		{
		}
		
		public function getPlatUserName():String
		{
			return GLOBAL.emailStr;
		}
		
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_minu_1");;
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_minu_2");
		}
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		public function get suportSocialInfo():Boolean
		{
			return false;
		}
		
		public function getPlatformUserInfo():PlatformUserInfo
		{
			return null;
		}
		
		public function get ExtrFlagObj():Object
		{
			return null;
		}
		
		public function get platName():String
		{
			return "xiaomi";
		}
		
		protected function onStatus(e:MinuGameEvent):void
		{
			var data:Object;
			switch(e.data.code)
			{
				case MinuGameType.loginResult:
					data =JSON.parse(e.data.level);
					if(data.success)
					{
//						testContainer.log("登录成功！  UID :" + data.uid + ", Session :" + data.session );
						if(_loginCom!=null){
							_loginCom(data.uid,data.session);
						}
					}
					else
					{
						if(_loginFail!=null){
							_loginFail();
						}
					}
					break;
				case MinuGameType.payOnlineResult:
					data =JSON.parse(e.data.level);
					if(data.success)
					{
						
					}
					else
					{
//						testContainer.log("支付失败！ ");
					}
					Wnd_Chongzhi_New.stopWaitForBuy();
					break;
				case MinuGameType.loginOutResult:
					data =JSON.parse(e.data.level);
					if(data.success)
					{
//						login();
					}
					else
					{
//						testContainer.log("注销失败！ ");
					}
					break;
				case MinuGameType.native:
//					testContainer.log(e.data.level);
					trace(e.data.level);
					break;
				case MinuGameType.error:
//					testContainer.log(e.data.level);
					trace(e.data.level);
					break;
			}
		}
		

	}
}