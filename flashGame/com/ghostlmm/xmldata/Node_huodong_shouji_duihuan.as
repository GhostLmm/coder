package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_huodong_shouji_duihuan extends Object
	{
		public var id:int;
		public var shouji_id:int;
		public var shouji_name:String;
		public var shouji_num:int;
		public var duihuan_id:int;
		public var duihuan_type:String;
		public var duihuan_name:String;
		public var duihuan_num:int;
		public var shouji_wupin:int;
		public var active:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			shouji_id=int(String(data.@shouji_id));
			shouji_name=String(String(data.@shouji_name));
			shouji_num=int(String(data.@shouji_num));
			duihuan_id=int(String(data.@duihuan_id));
			duihuan_type=String(String(data.@duihuan_type));
			duihuan_name=String(String(data.@duihuan_name));
			duihuan_num=int(String(data.@duihuan_num));
			shouji_wupin=int(String(data.@shouji_wupin));
			active=int(String(data.@active));

		}
	}
}