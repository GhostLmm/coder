package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_fuben_paiming extends Object
	{
		public var id:int;
		public var name:String;
		public var reward_money:int;
		public var reward_item:String;
		public var reward_item_num:String;
		public var font_color:Number;
		public var box_image:String;
		public var desc:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			name=String(String(data.@name));
			reward_money=int(String(data.@reward_money));
			reward_item=String(String(data.@reward_item));
			reward_item_num=String(String(data.@reward_item_num));
			font_color=Number(String(data.@font_color));
			box_image=String(String(data.@box_image));
			desc=String(String(data.@desc));

		}
	}
}