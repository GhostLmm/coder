package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_equip_ronglian extends Object
	{
		public var id:int;
		public var rongglian_num:int;
		public var jifen:String;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			rongglian_num=int(String(data.@rongglian_num));
			jifen=String(String(data.@jifen));

		}
	}
}