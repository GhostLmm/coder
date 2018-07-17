package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_mario_tile extends Object
	{
		public var id:int;
		public var name:String;
		public var image:String;
		public var type:String;
		public var effect:String;
		public var plat_type:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			image=String(String(data.@image));
			type=String(String(data.@type));
			effect=String(String(data.@effect));
			plat_type=int(String(data.@plat_type));

		}
	}
}