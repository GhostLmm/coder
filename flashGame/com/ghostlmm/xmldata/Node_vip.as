package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_vip extends Object
	{
		public var id:int;
		public var name:String;
		public var cash_limit:int;
		public var desc1:String;
		public var desc1_tag:String;
		public var desc1_num:String;
		public var desc2:String;
		public var desc2_num:int;
		public var desc3:String;
		public var desc3_num:int;
		public var desc4:String;
		public var desc4_num:int;
		public var desc5_num:int;
		public var desc5:String;
		public var desc6:String;
		public var lv_limit:int;
		public var icon:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			cash_limit=int(String(data.@cash_limit));
			desc1=String(String(data.@desc1));
			desc1_tag=String(String(data.@desc1_tag));
			desc1_num=String(String(data.@desc1_num));
			desc2=String(String(data.@desc2));
			desc2_num=int(String(data.@desc2_num));
			desc3=String(String(data.@desc3));
			desc3_num=int(String(data.@desc3_num));
			desc4=String(String(data.@desc4));
			desc4_num=int(String(data.@desc4_num));
			desc5_num=int(String(data.@desc5_num));
			desc5=String(String(data.@desc5));
			desc6=String(String(data.@desc6));
			lv_limit=int(String(data.@lv_limit));
			icon=String(String(data.@icon));

		}
	}
}