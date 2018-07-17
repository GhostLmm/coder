package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_fuben_monster_heap extends Object
	{
		public var id:int;
		public var monster_id:String;
		public var monster_num:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			monster_id=String(String(data.@monster_id));
			monster_num=String(String(data.@monster_num));

		}
	}
}