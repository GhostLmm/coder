package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_level extends Object
	{
		public var id:int;
		public var exp:int;
		public var friend:int;
		public var buy_money:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			exp=int(String(data.@exp));
			friend=int(String(data.@friend));
			buy_money=int(String(data.@buy_money));

		}
	}
}