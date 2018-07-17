package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_canbai extends Object
	{
		public var id:int;
		public var day:int;
		public var desc:String;
		public var item:int;
		public var equip:int;
		public var reward_money:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			day=int(String(data.@day));
			desc=String(String(data.@desc));
			item=int(String(data.@item));
			equip=int(String(data.@equip));
			reward_money=int(String(data.@reward_money));

		}
	}
}