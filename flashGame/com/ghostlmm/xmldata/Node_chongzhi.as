package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_chongzhi extends Object
	{
		public var id:int;
		public var ios_id:String;
		public var rmb:int;
		public var cash:int;
		public var desc:String;
		public var name:String;
		public var product_id:int;
		public var tree:int;
		public var add:String;
		public var icon:String;
		public var ids:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			ios_id=String(String(data.@ios_id));
			rmb=int(String(data.@rmb));
			cash=int(String(data.@cash));
			desc=String(String(data.@desc));
			name=String(String(data.@name));
			product_id=int(String(data.@product_id));
			tree=int(String(data.@tree));
			add=String(String(data.@add));
			icon=String(String(data.@icon));
			ids=String(String(data.@ids));

		}
	}
}