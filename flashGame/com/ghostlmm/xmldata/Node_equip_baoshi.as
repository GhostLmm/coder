package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_equip_baoshi extends Object
	{
		public var id:int;
		public var name:String;
		public var type:int;
		public var star_limit:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			type=int(String(data.@type));
			star_limit=int(String(data.@star_limit));

		}
	}
}