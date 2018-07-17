package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_name extends Object
	{
		public var id:int;
		public var name1:String;
		public var name2:String;
		public var name3:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name1=String(String(data.@name1));
			name2=String(String(data.@name2));
			name3=String(String(data.@name3));

		}
	}
}