package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_huodong_caishenxiafan extends Object
	{
		public var id:int;
		public var cost_cash:int;
		public var reward_min:int;
		public var reward_max:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			cost_cash=int(String(data.@cost_cash));
			reward_min=int(String(data.@reward_min));
			reward_max=int(String(data.@reward_max));

		}
	}
}