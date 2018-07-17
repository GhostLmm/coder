package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_task extends Object
	{
		public var id:int;
		public var need_lv:int;
		public var need_id:int;
		public var task_name:String;
		public var desc:String;
		public var guide_value:String;
		public var guide_type:String;
		public var bonus_money:int;
		public var bouns_exp:int;
		public var bouns_cash:int;
		public var bouns_item_id:String;
		public var bouns_item_num:String;
		public var icon:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			need_lv=int(String(data.@need_lv));
			need_id=int(String(data.@need_id));
			task_name=String(String(data.@task_name));
			desc=String(String(data.@desc));
			guide_value=String(String(data.@guide_value));
			guide_type=String(String(data.@guide_type));
			bonus_money=int(String(data.@bonus_money));
			bouns_exp=int(String(data.@bouns_exp));
			bouns_cash=int(String(data.@bouns_cash));
			bouns_item_id=String(String(data.@bouns_item_id));
			bouns_item_num=String(String(data.@bouns_item_num));
			icon=String(String(data.@icon));

		}
	}
}