package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_huodongzongpeizhi extends Object
	{
		public var id:int;
		public var type:String;
		public var plat:String;
		public var server:String;
		public var icon:String;
		public var name:String;
		public var desc:String;
		public var args:int;
		public var kaifang:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			type=String(String(data.@type));
			plat=String(String(data.@plat));
			server=String(String(data.@server));
			icon=String(String(data.@icon));
			name=String(String(data.@name));
			desc=String(String(data.@desc));
			args=int(String(data.@args));
			kaifang=int(String(data.@kaifang));

		}
	}
}