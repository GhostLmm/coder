package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_huodong extends Object
	{
		public var id:int;
		public var priority:int;
		public var type:String;
		public var name:String;
		public var desc:String;
		public var time:int;
		public var kaifu:int;
		public var icon:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			priority=int(String(data.@priority));
			type=String(String(data.@type));
			name=String(String(data.@name));
			desc=String(String(data.@desc));
			time=int(String(data.@time));
			kaifu=int(String(data.@kaifu));
			icon=String(String(data.@icon));

		}
	}
}