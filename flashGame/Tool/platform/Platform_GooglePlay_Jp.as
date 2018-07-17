package Tool.platform
{
	import Tool.Googlplay.GoogPlayContest;
	import Tool.Googlplay.GooglePlayPlatform;
	
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import myDisplay.window.Wnd_Zhanghao;
	
	public class Platform_GooglePlay_Jp extends EventDispatcher implements IPlatform
	{
//		private static var googleItemXmlUrl:String="http://119.161.217.85/googleItem.xml";
		private static function get googleItemXmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"googleItem.xml";
		}
		public function Platform_GooglePlay_Jp()
		{
//			GoogPlayContest.initGooglay(GoogPlayContest.GooglePlay_JP_Publickey,GoogPlayContest.BackUrl_Jp,true,GLOBAL._mainLoader.stage);
			GoogPlayContest.initGooglay(GoogPlayContest.GooglePlay_JP_Publickey,GoogPlayContest.BackUrl_Jp);
			GooglePlayPlatform.getInstance().chongzhiCompleteSingel.add(OnChonzhiComplete);
//			SNSSdkHelper.self.requestAppDriver();
		}
		/**   充值完成后台给 appTraking发通知
		 * */
		private function OnChonzhiComplete(itemId:String):void{
			
//			for each(var item:Object in 
			if(itemArray){
				for each(var item:Object in itemArray){
					if(item.itemId == itemId){
						var purchaseEvt:TrackEvent=new TrackEvent(TrackEvent.T_Purchase);
						purchaseEvt.action="purchase";
						purchaseEvt.data={};
						purchaseEvt.data.revenue=Number(item.salePrice);
						purchaseEvt.data.currency="USD";
						GLOBAL._mainLoader.dispatchEvent(purchaseEvt);
					}
				}
			}
			
			
			
		}
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		private var proxy:ItemsXmlLoaderProxy; 
		/**  获取 平台商品详细西信息
		 * */
		public function getDetailItems():void
		{
			if(proxy==null)
			{
				addEventListener(PlatformEvent.GetItemDetailComplete,onLoadComplete);
				proxy=new ItemsXmlLoaderProxy();
			}
			proxy.startLoad(this,googleItemXmlUrl);
			
		}
		private var itemArray:Array;
		private function onLoadComplete(evt:PlatformEvent):void{
			itemArray=evt.data as Array;
		}
		public function get moneyType():String
		{
			return "￥";
		}
		
		public function buyItem(itemType:String):void
		{
			GooglePlayPlatform.getInstance().buyItem(itemType);
		}
		
		/**   使用快速登录
		 * */
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			
		}
		
		public function login():void
		{
			PlatformManager.getInstance()._normalLogin();
		}
		
		public function get platCode():String
		{
			return "facebook";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		public function get suportQiehuan():Boolean
		{
			return false;
		}
		
		public function zhanghaoQiehuan():void
		{
			
		}
		
		public function init():void
		{
//			SNSSdkHelper.self.
			Wnd_Zhanghao.EmailHelpClass=BANGZHU_ITEM_JP;
		}
		
		/**  平台账号名称
		 * */
		public function getPlatUserName():String
		{
			return GLOBAL.emailStr;
		}
		public function share(title:String, comment:String, summary:String):void
		{
		}
		/**  获取客服支持1
		 * */
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_googleplay_jp_1");
		}
		
		/**  获取客服支持2
		 * */
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_googleplay_jp_2");
		}
		
		/**  是否支持平台用户社交信息
		 * */
		public function get suportSocialInfo():Boolean
		{
			return false;
		}
		
		/**  只有支持平台用户信息的平台才可以获取平台的社交信息
		 * */
		public function getPlatformUserInfo():PlatformUserInfo
		{
			return null;
		}
		
		/**   附加的标志量，用于扩展,  
		 * */
		public function get ExtrFlagObj():Object
		{
//			return null;
			var obj:Object={};
			obj[PlatExtrFlag.HideNewServer]=true;
			obj[PlatExtrFlag.EmailHelp]=true;
			obj[PlatExtrFlag.DefaultBigZoom]=true;
			return obj;
		}
		
		/**   各个平台唯一name
		 * */
		public function get platName():String
		{
			return "googleJp";
		}

	}
}