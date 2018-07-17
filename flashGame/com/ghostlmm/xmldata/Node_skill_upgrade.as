package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_skill_upgrade extends Object
	{
		public var id:int;
		public var desc:String;
		public var money_price:int;
		public var need_dian:int;
		public var value_up_3001:int;
		public var value_up_3002:int;
		public var value_up_3003:int;
		public var value_up_3004:int;
		public var value_up_3005:int;
		public var value_up_3006:int;
		public var value_up_3007:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			desc=String(String(data.@desc));
			money_price=int(String(data.@money_price));
			need_dian=int(String(data.@need_dian));
			value_up_3001=int(String(data.@value_up_3001));
			value_up_3002=int(String(data.@value_up_3002));
			value_up_3003=int(String(data.@value_up_3003));
			value_up_3004=int(String(data.@value_up_3004));
			value_up_3005=int(String(data.@value_up_3005));
			value_up_3006=int(String(data.@value_up_3006));
			value_up_3007=int(String(data.@value_up_3007));

		}
	}
}