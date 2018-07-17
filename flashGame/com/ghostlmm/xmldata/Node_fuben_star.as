package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_fuben_star extends Object
	{
		public var id:int;
		public var desc:String;
		public var num:Number;
		public var type:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			desc=String(String(data.@desc));
			num=Number(String(data.@num));
			type=int(String(data.@type));

		}
	}
}