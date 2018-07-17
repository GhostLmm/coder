package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_huodong_chongzhi extends Object
	{
		public var id:int;
		public var chongzhi_cash:int;
		public var item_id:String;
		public var item_num:String;
		public var reward_desc:String;
		public var cash:int;
		public var money:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			chongzhi_cash=int(String(data.@chongzhi_cash));
			item_id=String(String(data.@item_id));
			item_num=String(String(data.@item_num));
			reward_desc=String(String(data.@reward_desc));
			cash=int(String(data.@cash));
			money=int(String(data.@money));

		}
	}
}