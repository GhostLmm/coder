package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_tile extends Object
	{
		public var id:int;
		public var name:String;
		public var image:String;
		public var has_background:int;
		public var could_drill:int;
		public var could_eat:int;
		public var type:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			image=String(String(data.@image));
			has_background=int(String(data.@has_background));
			could_drill=int(String(data.@could_drill));
			could_eat=int(String(data.@could_eat));
			type=String(String(data.@type));

		}
	}
}