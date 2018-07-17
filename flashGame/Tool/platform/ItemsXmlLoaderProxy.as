package Tool.platform
{
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.XMLLoader;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**    代理 plat 加载
	 * */
	public class ItemsXmlLoaderProxy
	{
		public function ItemsXmlLoaderProxy()
		{
		}
		
		private static var itemsArray:Array;
	
		public static function decodeItemsXml(itemsXml:XML):Array
		{
			var ItemsXml:XML =itemsXml;
			var items:Array=[];
			for each(var itemXml:XML in ItemsXml.item)
			{
				var discount:Boolean=false;
				if(itemXml.@discount && int(itemXml.@discount)==1)
				{
					discount=true;
				}
				var hotSell:Boolean=false;
				if(itemXml.@hotSell && int(itemXml.@hotSell)==1)
				{
					hotSell=true;
				}
				
				var flag:int=0;
				if(itemXml.@flag)
				{
					flag=int(itemXml.@flag)
				}
				
				var line1:String="";
				if(itemXml.@line1)
				{
					line1=String(itemXml.@line1);
				}
				
				var line2:String="";
				if(itemXml.@line1)
				{
					line2=String(itemXml.@line2);
				}
				
				var line3:String="";
				if(itemXml.@line2)
				{
					line3=String(itemXml.@line3);
				}
				
				var platName:String;
				if(itemsXml.@platName)
				{
					platName=String(itemsXml.@platName);
				}
				
				items.push({"productName":String(itemXml.@productName), 
					"salePrice":String(itemXml.@salePrice),
					"itemId":String(itemXml.@itemId),
					"discount":discount,
					"flag":flag,
					"line1":line1,
					"line2":line2,
					"line3":line3,
					"platName":platName
				});
			}
			
			return items;
		}
		
		private var itemsArray:Array;
		private var _plat:IPlatform;
		private var _itemsXml:XML;
		
		public function get itemsXml():XML
		{
			return _itemsXml;
		}
		public function startLoad(plat:IPlatform,xmlUrl:String):void
		{
			_plat=plat;
			if(itemsArray==null)
			{
				var vars:Object = {name: "gooleItem", noCache: true, onComplete: xmlLoaderComplete};
				var loader:XMLLoader = new XMLLoader(xmlUrl, vars);
				loader.load();	
			}
			else
			{
				var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
				e.data=itemsArray;
				_plat.dispatchEvent(e);
			}
		}
		private function xmlLoaderComplete(evt:Event):void
		{
			var ItemsXml:XML = XML(LoaderMax.getContent("gooleItem"));
			_itemsXml=ItemsXml;
//			itemsArray=[];
			itemsArray=decodeItemsXml(ItemsXml);
			/*for each(var itemXml:XML in ItemsXml.item)
			{
				var discount:Boolean=false;
				if(itemXml.@discount && int(itemXml.@discount)==1)
				{
					discount=true;
				}
				var hotSell:Boolean=false;
				if(itemXml.@hotSell && int(itemXml.@hotSell)==1)
				{
					hotSell=true;
				}
				
				var flag:int=0;
				if(itemXml.@flag)
				{
					flag=int(itemXml.@flag)
				}
				
				var line1:String="";
				if(itemXml.@line1)
				{
					line1=String(itemXml.@line1);
				}
				
				var line2:String="";
				if(itemXml.@line1)
				{
					line2=String(itemXml.@line2);
				}
				
				var line3:String="";
				if(itemXml.@line2)
				{
					line3=String(itemXml.@line3);
				}
				
				itemsArray.push({"productName":String(itemXml.@productName), 
					"salePrice":int(itemXml.@salePrice),
					"itemId":String(itemXml.@itemId),
					"discount":discount,
					"flag":flag,
					"line1":line1,
					"line2":line2,
					"line3":line3
				});
			}*/
			
//			var temp:Array=itemArray.concat([]);
//			temp.sortOn("salePrice",Array.NUMERIC);
//			for (var index:int=0; index<temp.length; index++)
//			{
//				temp[index].image="money-"+(index+1)+".png";
//			}
			
			var e:PlatformEvent=new PlatformEvent(PlatformEvent.GetItemDetailComplete);
			e.data=itemsArray;
			_plat.dispatchEvent(e);
		}
	}
}