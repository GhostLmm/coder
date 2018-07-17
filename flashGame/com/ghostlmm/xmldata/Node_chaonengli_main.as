package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_chaonengli_main extends Object
	{
		public var id:int;
		public var type:String;
		public var need_id:int;
		public var num:int;
		public var cost_item:String;
		public var cost_item_num:String;
		public var cost_star:int;
		public var cost_money:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			type=String(String(data.@type));
			need_id=int(String(data.@need_id));
			num=int(String(data.@num));
			cost_item=String(String(data.@cost_item));
			cost_item_num=String(String(data.@cost_item_num));
			cost_star=int(String(data.@cost_star));
			cost_money=int(String(data.@cost_money));

		}
	}
}