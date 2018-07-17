package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_expression extends Object
	{
		public var id:String;
		public var expression:String;
		public var desc:String;
		public function loadData(data:XML):void
		{
			id=String(String(data.@id));
			expression=String(String(data.@expression));
			desc=String(String(data.@desc));

		}
	}
}