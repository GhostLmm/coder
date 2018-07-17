package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_bullet extends Object
	{
		public var id:int;
		public var name:String;
		public var speed:int;
		public var fuseDuration:int;
		public var offsetX:int;
		public var offsetY:int;
		public var accelerationX:int;
		public var explodeDuration:int;
		public var flyAnim:String;
		public var boomAnim:String;
		public var type:String;
		public var effect:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			speed=int(String(data.@speed));
			fuseDuration=int(String(data.@fuseDuration));
			offsetX=int(String(data.@offsetX));
			offsetY=int(String(data.@offsetY));
			accelerationX=int(String(data.@accelerationX));
			explodeDuration=int(String(data.@explodeDuration));
			flyAnim=String(String(data.@flyAnim));
			boomAnim=String(String(data.@boomAnim));
			type=String(String(data.@type));
			effect=String(String(data.@effect));

		}
	}
}