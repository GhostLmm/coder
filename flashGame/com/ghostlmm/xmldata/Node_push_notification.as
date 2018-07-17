package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_push_notification extends Object
	{
		public var id:int;
		public var desc:String;
		public var time:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			desc=String(String(data.@desc));
			time=String(String(data.@time));

		}
	}
}