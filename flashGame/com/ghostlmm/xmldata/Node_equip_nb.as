package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_equip_nb extends Object
	{
		public var id:int;
		public var next_id:int;
		public var type:String;
		public var num:String;
		public var exp:int;
		public var need_exp:int;
		public var need_money:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			next_id=int(String(data.@next_id));
			type=String(String(data.@type));
			num=String(String(data.@num));
			exp=int(String(data.@exp));
			need_exp=int(String(data.@need_exp));
			need_money=int(String(data.@need_money));

		}
	}
}