package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_banghui_juanxian extends Object
	{
		public var id:int;
		public var title:String;
		public var cost:int;
		public var type:String;
		public var get_banghuijianshe:int;
		public var get_gerengongxian:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			title=String(String(data.@title));
			cost=int(String(data.@cost));
			type=String(String(data.@type));
			get_banghuijianshe=int(String(data.@get_banghuijianshe));
			get_gerengongxian=int(String(data.@get_gerengongxian));

		}
	}
}