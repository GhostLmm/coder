package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_equip_star extends Object
	{
		public var id:int;
		public var type_1:String;
		public var type_2:String;
		public var type_3:String;
		public var type_4:String;
		public var type_5:String;
		public var type_6:String;
		public var type_101:String;
		public var type_102:String;
		public var type_103:String;
		public var type_104:String;
		public var type_105:String;
		public var type_106:String;
		public var type_107:String;
		public var type_108:String;
		public var type_109:String;
		public var type_110:String;
		public var type_111:String;
		public var type_112:String;
		public var type_113:String;
		public var type_114:String;
		public var type_115:String;
		public var type_116:String;
		public var type_117:String;
		public var type_118:String;
		public var type_119:String;
		public var type_120:String;
		public var type_121:String;
		public var qianghua_limit:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			type_1=String(String(data.@type_1));
			type_2=String(String(data.@type_2));
			type_3=String(String(data.@type_3));
			type_4=String(String(data.@type_4));
			type_5=String(String(data.@type_5));
			type_6=String(String(data.@type_6));
			type_101=String(String(data.@type_101));
			type_102=String(String(data.@type_102));
			type_103=String(String(data.@type_103));
			type_104=String(String(data.@type_104));
			type_105=String(String(data.@type_105));
			type_106=String(String(data.@type_106));
			type_107=String(String(data.@type_107));
			type_108=String(String(data.@type_108));
			type_109=String(String(data.@type_109));
			type_110=String(String(data.@type_110));
			type_111=String(String(data.@type_111));
			type_112=String(String(data.@type_112));
			type_113=String(String(data.@type_113));
			type_114=String(String(data.@type_114));
			type_115=String(String(data.@type_115));
			type_116=String(String(data.@type_116));
			type_117=String(String(data.@type_117));
			type_118=String(String(data.@type_118));
			type_119=String(String(data.@type_119));
			type_120=String(String(data.@type_120));
			type_121=String(String(data.@type_121));
			qianghua_limit=int(String(data.@qianghua_limit));

		}
	}
}