package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_jinkuangrukou extends Object
	{
		public var id:int;
		public var name:String;
		public var desc:String;
		public var type:int;
		public var image:String;
		public var rank:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			desc=String(String(data.@desc));
			type=int(String(data.@type));
			image=String(String(data.@image));
			rank=String(String(data.@rank));

		}
	}
}