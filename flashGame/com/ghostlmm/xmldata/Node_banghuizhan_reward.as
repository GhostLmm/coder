package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_banghuizhan_reward extends Object
	{
		public var id:int;
		public var reward_shengwang:int;
		public var reward_money:int;
		public var reward_item:String;
		public var reward_card:String;
		public var banghuizhan_buff_percent:Number;
		public var desc:String;
		public var reward_cash:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			reward_shengwang=int(String(data.@reward_shengwang));
			reward_money=int(String(data.@reward_money));
			reward_item=String(String(data.@reward_item));
			reward_card=String(String(data.@reward_card));
			banghuizhan_buff_percent=Number(String(data.@banghuizhan_buff_percent));
			desc=String(String(data.@desc));
			reward_cash=int(String(data.@reward_cash));

		}
	}
}