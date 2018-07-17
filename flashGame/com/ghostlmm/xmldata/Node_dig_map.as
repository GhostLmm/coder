package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_dig_map extends Object
	{
		public var id:int;
		public var hang:int;
		public var money_num:int;
		public var exp_num:int;
		public var money_price:int;
		public var exp_price:int;
		public var star1:String;
		public var star2:String;
		public var star3:String;
		public var star4:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			hang=int(String(data.@hang));
			money_num=int(String(data.@money_num));
			exp_num=int(String(data.@exp_num));
			money_price=int(String(data.@money_price));
			exp_price=int(String(data.@exp_price));
			star1=String(String(data.@star1));
			star2=String(String(data.@star2));
			star3=String(String(data.@star3));
			star4=String(String(data.@star4));

		}
	}
}