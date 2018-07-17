package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_baoshi extends Object
	{
		public var id:int;
		public var name:String;
		public var duidie:int;
		public var jinhua_id:int;
		public var jinhua_need_id:int;
		public var jinhua_base_num:int;
		public var atk:int;
		public var def:int;
		public var hp:int;
		public var speed:int;
		public var cri:int;
		public var renxing:int;
		public var hit:int;
		public var eva:int;
		public var type:int;
		public var icon:String;
		public var star:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			duidie=int(String(data.@duidie));
			jinhua_id=int(String(data.@jinhua_id));
			jinhua_need_id=int(String(data.@jinhua_need_id));
			jinhua_base_num=int(String(data.@jinhua_base_num));
			atk=int(String(data.@atk));
			def=int(String(data.@def));
			hp=int(String(data.@hp));
			speed=int(String(data.@speed));
			cri=int(String(data.@cri));
			renxing=int(String(data.@renxing));
			hit=int(String(data.@hit));
			eva=int(String(data.@eva));
			type=int(String(data.@type));
			icon=String(String(data.@icon));
			star=int(String(data.@star));

		}
	}
}