package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_banghui_icon extends Object
	{
		public var id:int;
		public var type:int;
		public var img_name:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			type=int(String(data.@type));
			img_name=String(String(data.@img_name));

		}
	}
}