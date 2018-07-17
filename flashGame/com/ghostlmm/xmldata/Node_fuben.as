package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_fuben extends Object
	{
		public var id:int;
		public var name:String;
		public var need_fuben:int;
		public var fuben_map:int;
		public var story_id:int;
		public var cost_tili:int;
		public var limit_num:int;
		public var reward_cash:int;
		public var star1:int;
		public var star2:int;
		public var star3:int;
		public var reward_money:int;
		public var reward_exp:int;
		public var reward_item:String;
		public var reward_item_num:String;
		public var reward_item_pro:String;
		public var map:String;
		public var monster:String;
		public var biaozhi:String;
		public var monster_lv:int;
		public var map_texture:String;
		public var guanming_money:int;
		public var guanming_cash:int;
		public var guanming_star:int;
		public var guanming_item:String;
		public var guanming_item_num:String;
		public var cri:int;
		public var renxing:int;
		public var hit:int;
		public var eva:int;
		public var time:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			need_fuben=int(String(data.@need_fuben));
			fuben_map=int(String(data.@fuben_map));
			story_id=int(String(data.@story_id));
			cost_tili=int(String(data.@cost_tili));
			limit_num=int(String(data.@limit_num));
			reward_cash=int(String(data.@reward_cash));
			star1=int(String(data.@star1));
			star2=int(String(data.@star2));
			star3=int(String(data.@star3));
			reward_money=int(String(data.@reward_money));
			reward_exp=int(String(data.@reward_exp));
			reward_item=String(String(data.@reward_item));
			reward_item_num=String(String(data.@reward_item_num));
			reward_item_pro=String(String(data.@reward_item_pro));
			map=String(String(data.@map));
			monster=String(String(data.@monster));
			biaozhi=String(String(data.@biaozhi));
			monster_lv=int(String(data.@monster_lv));
			map_texture=String(String(data.@map_texture));
			guanming_money=int(String(data.@guanming_money));
			guanming_cash=int(String(data.@guanming_cash));
			guanming_star=int(String(data.@guanming_star));
			guanming_item=String(String(data.@guanming_item));
			guanming_item_num=String(String(data.@guanming_item_num));
			cri=int(String(data.@cri));
			renxing=int(String(data.@renxing));
			hit=int(String(data.@hit));
			eva=int(String(data.@eva));
			time=int(String(data.@time));

		}
	}
}