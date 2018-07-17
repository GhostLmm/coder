package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_heidian extends Object
	{
		public var id:int;
		public var name:String;
		public var type:String;
		public var item_id:int;
		public var item_num:int;
		public var weight:int;
		public var price_type:String;
		public var price:int;
		public var lv_limit:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			type=String(String(data.@type));
			item_id=int(String(data.@item_id));
			item_num=int(String(data.@item_num));
			weight=int(String(data.@weight));
			price_type=String(String(data.@price_type));
			price=int(String(data.@price));
			lv_limit=String(String(data.@lv_limit));

		}
	}
}