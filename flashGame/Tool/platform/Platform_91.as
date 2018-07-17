package Tool.platform
{
	import Tool.Platform_91_Ane;
	
	import com.thor.utils.Locales;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	public class Platform_91 extends EventDispatcher implements IPlatform
	{
		
		private static const ItemsUrl:String="p91Items.xml";
		private static const ItesArrayPart:Object={
			"10":{image:"money-1.png",order:1},
			"20":{image:"money-2.png",order:1},
			"998":{image:"money-6.png",order:1},
			"50":{image:"money-3.png",order:1},
			"100":{image:"money-1.png",order:1},
			"10":{image:"money-1.png",order:1}
		};

		private var itemsArray:Array;
		public function Platform_91()
		{
			Platform_91_Ane.getInstance();
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
			Platform_91_Ane.getInstance().setCallBack(_comFn,_failFn);
		}
		
		public function login():void
		{  
			Platform_91_Ane.getInstance().detectUpdate();
		}
		
		public function get platCode():String
		{
			return "p91";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String, comment:String, summary:String):void
		{
		}
		
		private function detailComplete():void
		{
			var proxy:ItemsXmlLoaderProxy=new ItemsXmlLoaderProxy();
			proxy.startLoad(this,EnvironmentParameter.xmlLoadPreUrl+ItemsUrl);
			
//			itemsArray=turnItemsToArray(Platform_91_Ane.getInstance().currentContent);
//			var evt:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
//			evt.data=itemsArray;
//			dispatchEvent(evt);			
		}
		public function getDetailItems():void
		{	
			
			Platform_91_Ane.getInstance().setGetDetailComfn(detailComplete);
			Platform_91_Ane.getInstance().getDetailsItem();
//			var evt:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
//			itemsArray=turnItemsToArray(Platform_91_Ane.getInstance().currentContent);
//			evt.data=itemsArray;
//			dispatchEvent(evt);
		}
		
		private function turnItemsToArray(obj:Object):Array
		{
			var _ta:Array=[];
			for each(var itemData:Object in obj.records)
			{
				var item:Object={"image":"money-1.png","productName":itemData.productName,"salePrice":int(itemData.salePrice),"itemId":itemData.productId};
				_ta.push(item);
				
			}
			var result:Array=_ta.reverse().concat();
			var temp:Array=_ta.concat([]);
			temp=temp.sortOn("salePrice",Array.NUMERIC);
			for (var index:int=0; index<temp.length; index++)
			{
				temp[index].image="money-"+(index+1)+".png"
			}
			return result;
		}
		
		public function get suportMoreHelp():Boolean
		{
			return false;
		}
		
		public function get moneyType():String
		{
			return "91豆";
		}
		public function getPlatUserName():String
		{
			return Platform_91_Ane.getInstance().getName();
		}
		public function buyItem(itemType:String):void
		{
			var itemobj:Object=getSourceItemdataById(itemType);
			if(itemobj!=null)
			{
				Platform_91_Ane.getInstance().buy(itemobj.productId,itemobj.productName,itemobj.salePrice,itemobj.originPrice);
			}
		}
		private function getSourceItemdataById(proId:String):Object
		{
			for each(var data:Object in Platform_91_Ane.getInstance().currentContent.records)
			{
				if(data.productId==proId)
					return data;
			}
			return null;
		}
		public function get suportQiehuan():Boolean
		{
			return true;
		}
		
		public function zhanghaoQiehuan():void
		{
			Platform_91_Ane.getInstance().show91Window();
		}
		
		public function init():void
		{
			Platform_91_Ane.getInstance().startTickToSendBuyinfo();
		}
		
		/**  获取客服支持1
		 * */
		public function getPlatKefu1():String
		{
			return Locales.Get("help_info_p91_1");
		}
		
		/**  获取客服支持2
		 * */
		public function getPlatKefu2():String
		{
			return Locales.Get("help_info_p91_2");
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
			return null;
		}
		
		/**   各个平台唯一name
		 * */
		public function get platName():String
		{
			return "p91";
		}
	}
}