package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_equip extends Object
	{
		public var id:int;
		public var type:int;
		public var lv:int;
		public var star:int;
		public var atk:int;
		public var def:int;
		public var hp:int;
		public var cri:int;
		public var renxing:int;
		public var hit:int;
		public var eva:int;
		public var name:String;
		public var icon:String;
		public var money_price:int;
		public var speed:int;
		public var desc:String;
		public var fenjie:String;
		public var sell_price:int;
		public var nb:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			type=int(String(data.@type));
			lv=int(String(data.@lv));
			star=int(String(data.@star));
			atk=int(String(data.@atk));
			def=int(String(data.@def));
			hp=int(String(data.@hp));
			cri=int(String(data.@cri));
			renxing=int(String(data.@renxing));
			hit=int(String(data.@hit));
			eva=int(String(data.@eva));
			name=String(String(data.@name));
			icon=String(String(data.@icon));
			money_price=int(String(data.@money_price));
			speed=int(String(data.@speed));
			desc=String(String(data.@desc));
			fenjie=String(String(data.@fenjie));
			sell_price=int(String(data.@sell_price));
			nb=int(String(data.@nb));

		}
	}
}