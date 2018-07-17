package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_fuben_map extends Object
	{
		public var id:int;
		public var name:String;
		public var need_lv:int;
		public var need_map:int;
		public var image:String;
		public var mc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			need_lv=int(String(data.@need_lv));
			need_map=int(String(data.@need_map));
			image=String(String(data.@image));
			mc=String(String(data.@mc));

		}
	}
}