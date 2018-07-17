package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_guanka extends Object
	{
		public var id:int;
		public var wupin:String;
		public var name:String;
		public var background:String;
		public var xueliang:int;
		public var boss:int;
		public var boss_layer:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			wupin=String(String(data.@wupin));
			name=String(String(data.@name));
			background=String(String(data.@background));
			xueliang=int(String(data.@xueliang));
			boss=int(String(data.@boss));
			boss_layer=int(String(data.@boss_layer));

		}
	}
}