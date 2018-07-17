package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_fnt_img_reflect extends Object
	{
		public var id:String;
		public var image:String;
		public var biaozhi:String;
		public var size:int;
		public function loadData(data:XML):void
		{
			id=String(String(data.@id));
			image=String(String(data.@image));
			biaozhi=String(String(data.@biaozhi));
			size=int(String(data.@size));

		}
	}
}