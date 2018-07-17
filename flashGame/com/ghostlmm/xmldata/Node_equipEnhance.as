package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_equipEnhance extends Object
	{
		public var id:int;
		public var desc:Number;
		public var money_price:int;
		public var shitou_price:int;
		public var qianghua_success:Number;
		public var baodi:int;
		public var need_lv:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			desc=Number(String(data.@desc));
			money_price=int(String(data.@money_price));
			shitou_price=int(String(data.@shitou_price));
			qianghua_success=Number(String(data.@qianghua_success));
			baodi=int(String(data.@baodi));
			need_lv=int(String(data.@need_lv));

		}
	}
}