package Tool.platform
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	

	
	public class Platform_Kuaishudenglu extends EventDispatcher implements IPlatform
	{

		private static var ItemsXml:XML=
			<itemInfo>
				<item flag="0" discount="0" line3="100" line2="+送る0" line1="金貨10" itemId="redwar.10" productName="金貨10" salePrice="100"/>
				<item flag="0" discount="1" line3="25" line2="+送る8" line1="金貨17" itemId="redwar.25" productName="金貨25" salePrice="170"/> 
				<item flag="1" discount="1" line3="100" line2="+送る55" line1="金貨45" itemId="redwar.100" productName="金貨100" salePrice="450"/> 
				<item flag="0" discount="1" line3="250" line2="+送る165" line1="金貨85" itemId="redwar.250" productName="金貨250" salePrice="850"/> 
				<item flag="0" discount="1" line3="1000" line2="+送る740" line1="金貨260" itemId="redwar.1000" productName="金貨1000" salePrice="2600"/> 
				<item flag="2" discount="1" line3="4000" line2="+送る3200" line1="金貨800" itemId="redwar.4000" productName="金貨4000" salePrice="8000"/> 
			</itemInfo>;
		/*private static var ItemsXml:XML=
			<itemInfo>
				<item itemId="redwar12988" productName="勋章12988" salePrice="998" line1="勋章100" line2="+赠 18" line3="118" discount="1" flag="0"/>
				<item itemId="redwar248" productName="勋章248" salePrice="20" line1="勋章100" line2="+赠 18" line3="118" discount="1" flag="1"/>
				<item itemId="redwar12988" productName="勋章12988" salePrice="998" line1="勋章100" line2="+赠 18" line3="118" discount="1" flag="0"/>
				<item itemId="redwar638" productName="勋章638" salePrice="50" line1="勋章100" line2="+赠 18" line3="118" discount="1" flag="1"/>
				<item itemId="redwar1288" productName="勋章1288" salePrice="100" line1="勋章100" line2="+赠 18" line3="118" discount="1" flag="2"/>
				<item itemId="redwar3888" productName="勋章3888" salePrice="300"  line1="勋章100" line2="+赠 18" line3="118" discount="1" flag="1"/>
			</itemInfo>;*/
			
			
		
		public function Platform_Kuaishudenglu()
		{
		}
		
		public function setLoginFn(_comFn:Function, _failFn:Function):void
		{
		}
		
		public function get suportMoreHelp():Boolean
		{
			return true;
		}
		
		
		public function getDetailItems():void
		{
			var itemArray:Array=ItemsXmlLoaderProxy.decodeItemsXml(ItemsXml);
//			for each(var itemXml:XML in ItemsXml.item)
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
//					"flag":int(itemXml.@flag),
//					"line1":String(itemXml.@line1),
//					"line2":String(itemXml.@line2),
//					"line3":String(itemXml.@line3)
//					});
//			}
//			
//			var temp:Array=itemArray.concat([]);
//			temp.sortOn("salePrice",Array.NUMERIC);
//			for (var index:int=0; index<temp.length; index++)
//			{
//				temp[index].image="money-"+(index+1)+".png";
//			}
			
			var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
			e.data=itemArray;
			dispatchEvent(e);

		}
		public function get moneyType():String
		{
			return "人民币";
		}
		
		public function buyItem(itemType:String):void
		{
//			TextTipManager.getInstance().addTip("充值了 ， "+itemType);
		}
		public function login():void
		{
			PlatformManager.getInstance()._normalLogin();
		}
		
		public function get platCode():String
		{
			return "facebook";
//			return "qq";
		}
		
		public function get suportShare():Boolean
		{
			return false;
		}
		
		public function share(title:String,comment:String,summary:String):void
		{
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
			
		}		
		/**  平台账号名称
		 * */
		public function getPlatUserName():String
		{
//			return GLOBAL.emailStr;
			return "";
		}
		
		public function getPlatKefu1():String
		{
//			return Locales.Get("help_info_local_1");
			return "";
		}
		
		public function getPlatKefu2():String
		{
//			return Locales.Get("help_info_local_2");
			return "";
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
		
		public function get ExtrFlagObj():Object
		{
			var obj:Object={};
			obj[PlatExtrFlag.HideLevelGiftVaule]=true;
			return obj;
		}
		
		public function get platName():String
		{
			return "test";
		}
	}
}