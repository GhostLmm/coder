package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_skill extends Object
	{
		public var id:int;
		public var name:String;
		public var icon:String;
		public var zhanli:int;
		public var desc:String;
		public var atk:int;
		public var def:int;
		public var hp:int;
		public var speed:Number;
		public var lastTime:Number;
		public var count:int;
		public var addType:String;
		public var CD:int;
		public var type:String;
		public var sound:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			icon=String(String(data.@icon));
			zhanli=int(String(data.@zhanli));
			desc=String(String(data.@desc));
			atk=int(String(data.@atk));
			def=int(String(data.@def));
			hp=int(String(data.@hp));
			speed=Number(String(data.@speed));
			lastTime=Number(String(data.@lastTime));
			count=int(String(data.@count));
			addType=String(String(data.@addType));
			CD=int(String(data.@CD));
			type=String(String(data.@type));
			sound=String(String(data.@sound));

		}
	}
}