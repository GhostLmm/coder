package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_banghui_shangchengzhenpin extends Object
	{
		public var id:int;
		public var name:String;
		public var item_type:String;
		public var item_id:int;
		public var item_num:int;
		public var price_type:String;
		public var price:int;
		public var limit:int;
		public var shangchen_lv:int;
		public var weight:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			item_type=String(String(data.@item_type));
			item_id=int(String(data.@item_id));
			item_num=int(String(data.@item_num));
			price_type=String(String(data.@price_type));
			price=int(String(data.@price));
			limit=int(String(data.@limit));
			shangchen_lv=int(String(data.@shangchen_lv));
			weight=int(String(data.@weight));

		}
	}
}