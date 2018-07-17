package Tool.platform
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	import com.nativeextension.pppaysdk.SNSPayEvent;
	import com.nativeextension.pppaysdk.SNSPayType;
	import com.nativeextension.pppaysdk.SNSSdkHelper;
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Platform_pp extends EventDispatcher implements IPlatform
	{
//		private static const DetailXmlUrl:String="http://119.161.217.85/ppItem.xml";
		private static function get DetailXmlUrl():String
		{
			return EnvironmentParameter.xmlLoadPreUrl+"ppItem.xml";
		}
		private static const PPRedwarId:int=125;
		
		private var itemArray:Array=[];
		public function Platform_pp()
		{
		}
		
		public function get suportMoreHelp():Boolean
		{
			return true;
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
		}
		
		public function login():void
		{
			PlatformManager.getInstance()._normalLogin();
		}
		
		public function get platCode():String
		{
			return "pp";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		public function getDetailItems():void
		{
//			var proxy:ItemsXmlLoaderProxy=new ItemsXmlLoaderProxy();
//			proxy.startLoad(this,DetailXmlUrl);
			var vars:Object = {name: "gooleItem", noCache: true, onComplete: xmlLoaderComplete};
			var loader:XMLLoader = new XMLLoader(DetailXmlUrl, vars);
			loader.load();
		}
		
		private function xmlLoaderComplete(evt:LoaderEvent):void
		{
//			var itemXmls:XML = XML(LoaderMax.getContent("gooleItem"));
//			itemArray=[];
//			for each(var itemXml:XML in itemXmls.item)
//			{
//				var discount:Boolean=false;
//				if(itemXml.@discount && int(itemXml.@discount)==1)
//				{
//					discount=true;
//				}
//				var hotSell:Boolean=false;
//				if(itemXml.@hotSell && int(itemXml.@hotSell)==1)
//				{
//					hotSell=true;
//				}
//				
//				itemArray.push({"productName":String(itemXml.@productName), 
//					"salePrice":int(itemXml.@salePrice),
//					"itemId":String(itemXml.@itemId),
//					"discount":discount,
//					"hotSell":hotSell
//					});
//			}
//			
//			var temp:Array=itemArray.concat([]);
//			temp.sortOn("salePrice",Array.NUMERIC);
//			for (var index:int=0; index<temp.length; index++)
//			{
//				temp[index].image="money-"+(index+1)+".png";
//			}
			itemArray=ItemsXmlLoaderProxy.decodeItemsXml(LoaderMax.getContent("gooleItem"));
			var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
			e.data=itemArray;
			dispatchEvent(e);
		}
		
		
		public function get moneyType():String
		{
			return "￥";
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
		public function buyItem(itemType:String):void
		{
			var obj:Object=getItemDetailById(itemType);
			if(obj==null)
			{
				return ;
			}
			
			SNSSdkHelper.self.payByPost(SNSPayType.WUXIANZHIFU,obj.salePrice,BASE._userID+","+BASE._myOnlyUid,createBillId(obj));
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
			SNSSdkHelper.self.gameId=PPRedwarId;
			SNSSdkHelper.self.addEventListener(SNSPayEvent.EVENT_PAY,onPayComplete);
		}
		
		private function onPayComplete(evt:SNSPayEvent):void
		{
			
		}
		
		public function getPlatUserName():String
		{
			return GLOBAL.emailStr;
		}
		
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_local_1");
		}
		
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_local_2");
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
		
		public function get platName():String
		{
			return "pp";
		}
		public function get ExtrFlagObj():Object
		{
			return null;
		}
	}
}