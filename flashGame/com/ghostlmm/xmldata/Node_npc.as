package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_npc extends Object
	{
		public var id:int;
		public var name:String;
		public var hero_id:int;
		public var gun_id:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			hero_id=int(String(data.@hero_id));
			gun_id=int(String(data.@gun_id));

		}
	}
}