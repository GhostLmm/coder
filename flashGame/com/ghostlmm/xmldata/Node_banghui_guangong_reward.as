package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_banghui_guangong_reward extends Object
	{
		public var id:int;
		public var guangong_lv:int;
		public var title_desc:String;
		public var reward_tili:int;
		public var reward_shengwang:int;
		public var reward_tongqian:int;
		public var cost_gongxian:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			guangong_lv=int(String(data.@guangong_lv));
			title_desc=String(String(data.@title_desc));
			reward_tili=int(String(data.@reward_tili));
			reward_shengwang=int(String(data.@reward_shengwang));
			reward_tongqian=int(String(data.@reward_tongqian));
			cost_gongxian=int(String(data.@cost_gongxian));

		}
	}
}