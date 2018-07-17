package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_monster_type extends Object
	{
		public var id:int;
		public var movie_frame:String;
		public var colors:String;
		public var type:String;
		public var name:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			movie_frame=String(String(data.@movie_frame));
			colors=String(String(data.@colors));
			type=String(String(data.@type));
			name=String(String(data.@name));

		}
	}
}