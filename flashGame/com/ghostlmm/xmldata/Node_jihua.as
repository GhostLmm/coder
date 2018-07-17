package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_jihua extends Object
	{
		public var id:int;
		public var cash:int;
		public var name:String;
		public var lv_limit:int;
		public var desc:String;
		public var icon:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			cash=int(String(data.@cash));
			name=String(String(data.@name));
			lv_limit=int(String(data.@lv_limit));
			desc=String(String(data.@desc));
			icon=String(String(data.@icon));

		}
	}
}