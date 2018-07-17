package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_choujiang extends Object
	{
		public var id:int;
		public var type:String;
		public var item_id:int;
		public var lv_limit:String;
		public var star:int;
		public var weight_1:int;
		public var weight_2:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			type=String(String(data.@type));
			item_id=int(String(data.@item_id));
			lv_limit=String(String(data.@lv_limit));
			star=int(String(data.@star));
			weight_1=int(String(data.@weight_1));
			weight_2=int(String(data.@weight_2));

		}
	}
}