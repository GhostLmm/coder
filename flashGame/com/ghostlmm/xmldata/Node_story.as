package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_story extends Object
	{
		public var id:int;
		public var copy_id:int;
		public var type:int;
		public var Order:int;
		public var dialog:String;
		public var Name:String;
		public var Position:int;
		public var Pic:int;
		public var Confirm:int;
		public var GuideTalk:int;
		public var SoundEffect:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			copy_id=int(String(data.@copy_id));
			type=int(String(data.@type));
			Order=int(String(data.@Order));
			dialog=String(String(data.@dialog));
			Name=String(String(data.@Name));
			Position=int(String(data.@Position));
			Pic=int(String(data.@Pic));
			Confirm=int(String(data.@Confirm));
			GuideTalk=int(String(data.@GuideTalk));
			SoundEffect=String(String(data.@SoundEffect));

		}
	}
}