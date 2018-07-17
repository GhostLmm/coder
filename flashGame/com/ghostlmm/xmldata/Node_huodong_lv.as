package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_huodong_lv extends Object
	{
		public var id:int;
		public var lv:int;
		public var item_id:String;
		public var item_num:String;
		public var cash:int;
		public var money:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			lv=int(String(data.@lv));
			item_id=String(String(data.@item_id));
			item_num=String(String(data.@item_num));
			cash=int(String(data.@cash));
			money=int(String(data.@money));

		}
	}
}