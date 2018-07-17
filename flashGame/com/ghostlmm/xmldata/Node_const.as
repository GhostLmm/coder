package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_const extends Object
	{
		public var id:String;
		public var value:Number;
		public var desc:String;
		public var string_value:String;
		public function loadData(data:XML):void
		{
			id=String(String(data.@id));
			value=Number(String(data.@value));
			desc=String(String(data.@desc));
			string_value=String(String(data.@string_value));

		}
	}
}