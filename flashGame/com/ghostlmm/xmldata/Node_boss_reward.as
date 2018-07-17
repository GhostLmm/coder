package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_boss_reward extends Object
	{
		public var id:int;
		public var reward_shengwang:int;
		public var reward_cash:int;
		public var reward_money:int;
		public var reward_exp:int;
		public var reward_item:String;
		public var reward_item_num:String;
		public var rank:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			reward_shengwang=int(String(data.@reward_shengwang));
			reward_cash=int(String(data.@reward_cash));
			reward_money=int(String(data.@reward_money));
			reward_exp=int(String(data.@reward_exp));
			reward_item=String(String(data.@reward_item));
			reward_item_num=String(String(data.@reward_item_num));
			rank=String(String(data.@rank));

		}
	}
}