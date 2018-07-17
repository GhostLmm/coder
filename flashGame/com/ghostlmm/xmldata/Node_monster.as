package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_monster extends Object
	{
		public var id:int;
		public var name:String;
		public var atk:int;
		public var atk_up:int;
		public var def:int;
		public var def_up:int;
		public var hp:int;
		public var hp_up:int;
		public var speed:int;
		public var speed_up:int;
		public var cri:int;
		public var renxing:int;
		public var hit:int;
		public var eva:int;
		public var shuxing:int;
		public var boss:int;
		public var appearance:int;
		public var gun:int;
		public var firedertime:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			atk=int(String(data.@atk));
			atk_up=int(String(data.@atk_up));
			def=int(String(data.@def));
			def_up=int(String(data.@def_up));
			hp=int(String(data.@hp));
			hp_up=int(String(data.@hp_up));
			speed=int(String(data.@speed));
			speed_up=int(String(data.@speed_up));
			cri=int(String(data.@cri));
			renxing=int(String(data.@renxing));
			hit=int(String(data.@hit));
			eva=int(String(data.@eva));
			shuxing=int(String(data.@shuxing));
			boss=int(String(data.@boss));
			appearance=int(String(data.@appearance));
			gun=int(String(data.@gun));
			firedertime=int(String(data.@firedertime));

		}
	}
}