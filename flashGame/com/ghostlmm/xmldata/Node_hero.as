package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_hero extends Object
	{
		public var id:int;
		public var touxiang:String;
		public var name:String;
		public var talk:String;
		public var atk:int;
		public var atk_up:int;
		public var def:int;
		public var def_up:int;
		public var hp:int;
		public var hp_up:int;
		public var speed:int;
		public var speed_up:int;
		public var fireRate:int;
		public var jumpHeight:int;
		public var cri:int;
		public var renxing:int;
		public var hit:int;
		public var eva:int;
		public var shuxing:int;
		public var skills:String;
		public var imageType:int;
		public var initGunId:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			touxiang=String(String(data.@touxiang));
			name=String(String(data.@name));
			talk=String(String(data.@talk));
			atk=int(String(data.@atk));
			atk_up=int(String(data.@atk_up));
			def=int(String(data.@def));
			def_up=int(String(data.@def_up));
			hp=int(String(data.@hp));
			hp_up=int(String(data.@hp_up));
			speed=int(String(data.@speed));
			speed_up=int(String(data.@speed_up));
			fireRate=int(String(data.@fireRate));
			jumpHeight=int(String(data.@jumpHeight));
			cri=int(String(data.@cri));
			renxing=int(String(data.@renxing));
			hit=int(String(data.@hit));
			eva=int(String(data.@eva));
			shuxing=int(String(data.@shuxing));
			skills=String(String(data.@skills));
			imageType=int(String(data.@imageType));
			initGunId=int(String(data.@initGunId));

		}
	}
}