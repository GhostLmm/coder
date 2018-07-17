package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_xinshouyindao extends Object
	{
		public var id:int;
		public var target:String;
		public var stopBattle:int;
		public var passArg:String;
		public var passType:String;
		public var interruptNext:int;
		public var npcOffset:String;
		public var next:int;
		public var show:int;
		public var forceClick:int;
		public var description:String;
		public var desc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			target=String(String(data.@target));
			stopBattle=int(String(data.@stopBattle));
			passArg=String(String(data.@passArg));
			passType=String(String(data.@passType));
			interruptNext=int(String(data.@interruptNext));
			npcOffset=String(String(data.@npcOffset));
			next=int(String(data.@next));
			show=int(String(data.@show));
			forceClick=int(String(data.@forceClick));
			description=String(String(data.@description));
			desc=String(String(data.@desc));

		}
	}
}