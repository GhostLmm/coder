package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_gongneng_kaiguan extends Object
	{
		public var id:int;
		public var name:String;
		public var status:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			status=int(String(data.@status));

		}
	}
}