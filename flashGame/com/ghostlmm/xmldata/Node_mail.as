package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_mail extends Object
	{
		public var id:int;
		public var image:String;
		public var type_desc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			image=String(String(data.@image));
			type_desc=String(String(data.@type_desc));

		}
	}
}