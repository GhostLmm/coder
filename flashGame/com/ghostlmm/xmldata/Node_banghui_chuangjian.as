package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_banghui_chuangjian extends Object
	{
		public var id:int;
		public var lv:int;
		public var money:int;
		public var cash:int;
		public var default_password:int;
		public var default_xuanyan:String;
		public var default_gonggao:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			lv=int(String(data.@lv));
			money=int(String(data.@money));
			cash=int(String(data.@cash));
			default_password=int(String(data.@default_password));
			default_xuanyan=String(String(data.@default_xuanyan));
			default_gonggao=String(String(data.@default_gonggao));

		}
	}
}