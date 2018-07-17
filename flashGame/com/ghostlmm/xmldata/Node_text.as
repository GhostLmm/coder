package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_text extends Object
	{
		public var id:String;
		public var language:String;
		public function loadData(data:XML):void
		{
			id=String(String(data.@id));
			language=String(String(data.@language));

		}
	}
}