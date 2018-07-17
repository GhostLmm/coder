package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_leitai extends Object
	{
		public var id:int;
		public var name:String;
		public var reward_rongyu:int;
		public var reward_money:int;
		public var reward_exp:int;
		public var reward_item:String;
		public var reward_item_num:String;
		public var box_cash:int;
		public var box_rongyu:int;
		public var box_money:int;
		public var box_item:String;
		public var box_item_num:String;
		public var box_font_color:Number;
		public var box_image:String;
		public var desc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			reward_rongyu=int(String(data.@reward_rongyu));
			reward_money=int(String(data.@reward_money));
			reward_exp=int(String(data.@reward_exp));
			reward_item=String(String(data.@reward_item));
			reward_item_num=String(String(data.@reward_item_num));
			box_cash=int(String(data.@box_cash));
			box_rongyu=int(String(data.@box_rongyu));
			box_money=int(String(data.@box_money));
			box_item=String(String(data.@box_item));
			box_item_num=String(String(data.@box_item_num));
			box_font_color=Number(String(data.@box_font_color));
			box_image=String(String(data.@box_image));
			desc=String(String(data.@desc));

		}
	}
}