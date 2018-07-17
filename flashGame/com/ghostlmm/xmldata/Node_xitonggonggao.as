package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_xitonggonggao extends Object
	{
		public var id:int;
		public var name:String;
		public var type:int;
		public var param:String;
		public var desc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			type=int(String(data.@type));
			param=String(String(data.@param));
			desc=String(String(data.@desc));

		}
	}
}