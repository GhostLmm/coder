package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_shortkey extends Object
	{
		public var id:int;
		public var name:String;
		public var type:String;
		public var building_key:String;
		public var icon:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			type=String(String(data.@type));
			building_key=String(String(data.@building_key));
			icon=String(String(data.@icon));

		}
	}
}