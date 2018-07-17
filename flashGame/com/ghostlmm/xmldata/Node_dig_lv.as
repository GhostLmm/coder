package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_dig_lv extends Object
	{
		public var id:int;
		public var name:String;
		public var money_add:int;
		public var exp_add:int;
		public var need_lv_add:int;
		public var need_item:String;
		public var need_item_num:String;
		public var need_fuben:int;
		public var need_money:int;
		public var image:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			money_add=int(String(data.@money_add));
			exp_add=int(String(data.@exp_add));
			need_lv_add=int(String(data.@need_lv_add));
			need_item=String(String(data.@need_item));
			need_item_num=String(String(data.@need_item_num));
			need_fuben=int(String(data.@need_fuben));
			need_money=int(String(data.@need_money));
			image=String(String(data.@image));

		}
	}
}