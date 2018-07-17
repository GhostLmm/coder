package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_tuangou extends Object
	{
		public var id:int;
		public var item_type:String;
		public var item_id:int;
		public var weight:int;
		public var price_type:String;
		public var price:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			item_type=String(String(data.@item_type));
			item_id=int(String(data.@item_id));
			weight=int(String(data.@weight));
			price_type=String(String(data.@price_type));
			price=int(String(data.@price));

		}
	}
}