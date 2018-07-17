package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_dig_item extends Object
	{
		public var id:int;
		public var type:String;
		public var type_id:int;
		public var qujian:String;
		public var max:int;
		public var shuaxin_jiange:String;
		public var huode_jiange:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			type=String(String(data.@type));
			type_id=int(String(data.@type_id));
			qujian=String(String(data.@qujian));
			max=int(String(data.@max));
			shuaxin_jiange=String(String(data.@shuaxin_jiange));
			huode_jiange=String(String(data.@huode_jiange));

		}
	}
}