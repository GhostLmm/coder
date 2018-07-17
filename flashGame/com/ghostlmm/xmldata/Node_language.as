package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_language extends Object
	{
		public var id:String;
		public var value:String;
		public function loadData(data:XML):void
		{
			id=String(String(data.@id));
			value=String(String(data.@value));

		}
	}
}