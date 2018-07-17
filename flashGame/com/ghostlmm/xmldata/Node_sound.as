package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_sound extends Object
	{
		public var id:int;
		public var name:String;
		public var sound:String;
		public var desc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			sound=String(String(data.@sound));
			desc=String(String(data.@desc));

		}
	}
}