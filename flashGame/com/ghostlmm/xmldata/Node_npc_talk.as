package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_npc_talk extends Object
	{
		public var id:int;
		public var desc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			desc=String(String(data.@desc));

		}
	}
}