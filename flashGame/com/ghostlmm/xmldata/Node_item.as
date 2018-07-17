package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_item extends Object
	{
		public var id:int;
		public var duidie:int;
		public var name:String;
		public var desc:String;
		public var star:int;
		public var icon:String;
		public var vip_limit:int;
		public var buy_type:String;
		public var buy_price:int;
		public var sell_type:String;
		public var sell_price:int;
		public var type:String;
		public var tag:String;
		public var effect:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			duidie=int(String(data.@duidie));
			name=String(String(data.@name));
			desc=String(String(data.@desc));
			star=int(String(data.@star));
			icon=String(String(data.@icon));
			vip_limit=int(String(data.@vip_limit));
			buy_type=String(String(data.@buy_type));
			buy_price=int(String(data.@buy_price));
			sell_type=String(String(data.@sell_type));
			sell_price=int(String(data.@sell_price));
			type=String(String(data.@type));
			tag=String(String(data.@tag));
			effect=String(String(data.@effect));

		}
	}
}