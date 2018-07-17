package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_daily_task extends Object
	{
		public var id:int;
		public var paixu:int;
		public var icon:String;
		public var task_name:String;
		public var desc:String;
		public var bouns_exp:int;
		public var target_num:int;
		public var guide_type:String;
		public var bonus_money:int;
		public var bouns_cash:int;
		public var bouns_item_id:String;
		public var bouns_item_num:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			paixu=int(String(data.@paixu));
			icon=String(String(data.@icon));
			task_name=String(String(data.@task_name));
			desc=String(String(data.@desc));
			bouns_exp=int(String(data.@bouns_exp));
			target_num=int(String(data.@target_num));
			guide_type=String(String(data.@guide_type));
			bonus_money=int(String(data.@bonus_money));
			bouns_cash=int(String(data.@bouns_cash));
			bouns_item_id=String(String(data.@bouns_item_id));
			bouns_item_num=String(String(data.@bouns_item_num));

		}
	}
}