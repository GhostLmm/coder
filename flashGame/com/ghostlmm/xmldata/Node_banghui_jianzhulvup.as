package com.ghostlmm.xmldata
{

	/** 
	**/
	public class Node_banghui_jianzhulvup extends Object
	{
		public var id:int;
		public var banghui_dating:int;
		public var banghui_renshu:int;
		public var banghui_shangcheng:int;
		public var banghui_guangongmiao:int;
		public function loadData(data:XML):void
		{
			id=int(String(data.@id));
			banghui_dating=int(String(data.@banghui_dating));
			banghui_renshu=int(String(data.@banghui_renshu));
			banghui_shangcheng=int(String(data.@banghui_shangcheng));
			banghui_guangongmiao=int(String(data.@banghui_guangongmiao));

		}
	}
}