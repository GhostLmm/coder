package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_jinkuang extends Object
	{
		public var id:int;
		public var name:String;
		public var star:int;
		public var chanliang:int;
		public var image:String;
		public var zhu:int;
		public var vip_limit:int;
		public var fushu:String;
		public var type:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			star=int(String(data.@star));
			chanliang=int(String(data.@chanliang));
			image=String(String(data.@image));
			zhu=int(String(data.@zhu));
			vip_limit=int(String(data.@vip_limit));
			fushu=String(String(data.@fushu));
			type=int(String(data.@type));

		}
	}
}