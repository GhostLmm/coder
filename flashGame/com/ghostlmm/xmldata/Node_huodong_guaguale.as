package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_huodong_guaguale extends Object
	{
		public var id:int;
		public var item_type:int;
		public var reward_type:String;
		public var item_id:int;
		public var item_num:int;
		public var cash:int;
		public var money:int;
		public var drop_weight:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			item_type=int(String(data.@item_type));
			reward_type=String(String(data.@reward_type));
			item_id=int(String(data.@item_id));
			item_num=int(String(data.@item_num));
			cash=int(String(data.@cash));
			money=int(String(data.@money));
			drop_weight=int(String(data.@drop_weight));

		}
	}
}