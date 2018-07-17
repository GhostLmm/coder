package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_chaonengli extends Object
	{
		public var id:int;
		public var lv_limit:int;
		public var type:int;
		public var name:String;
		public var atk:int;
		public var def:int;
		public var hp:int;
		public var cri:int;
		public var renxing:int;
		public var hit:int;
		public var eva:int;
		public var color:int;
		public var cost_item:String;
		public var cost_item_num:String;
		public var cost_star:int;
		public var cost_money:int;
		public var gezi:String;
		public var icon:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			lv_limit=int(String(data.@lv_limit));
			type=int(String(data.@type));
			name=String(String(data.@name));
			atk=int(String(data.@atk));
			def=int(String(data.@def));
			hp=int(String(data.@hp));
			cri=int(String(data.@cri));
			renxing=int(String(data.@renxing));
			hit=int(String(data.@hit));
			eva=int(String(data.@eva));
			color=int(String(data.@color));
			cost_item=String(String(data.@cost_item));
			cost_item_num=String(String(data.@cost_item_num));
			cost_star=int(String(data.@cost_star));
			cost_money=int(String(data.@cost_money));
			gezi=String(String(data.@gezi));
			icon=String(String(data.@icon));

		}
	}
}