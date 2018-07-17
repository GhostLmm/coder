package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_boss extends Object
	{
		public var id:int;
		public var name:String;
		public var monster:int;
		public var monster_list:String;
		public var start_time:String;
		public var end_time:String;
		public var reward_shengwang:int;
		public var reward_cash:int;
		public var reward_money:int;
		public var reward_exp:int;
		public var reward_item:int;
		public var reward_item_num:int;
		public var desc:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			monster=int(String(data.@monster));
			monster_list=String(String(data.@monster_list));
			start_time=String(String(data.@start_time));
			end_time=String(String(data.@end_time));
			reward_shengwang=int(String(data.@reward_shengwang));
			reward_cash=int(String(data.@reward_cash));
			reward_money=int(String(data.@reward_money));
			reward_exp=int(String(data.@reward_exp));
			reward_item=int(String(data.@reward_item));
			reward_item_num=int(String(data.@reward_item_num));
			desc=int(String(data.@desc));

		}
	}
}