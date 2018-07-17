package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_equip_type extends Object
	{
		public var id:int;
		public var name:String;
		public var icon:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			icon=String(String(data.@icon));

		}
	}
}