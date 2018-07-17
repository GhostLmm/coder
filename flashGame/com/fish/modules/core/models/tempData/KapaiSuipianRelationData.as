package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_item;

	public class KapaiSuipianRelationData
	{
		public function KapaiSuipianRelationData()
		{
		}
		
		public var kapaiXid:int;
		public var suipianXid:int;
		public var needNum:int;
		
		public function loadXml(node:Node_item):void
		{
			suipianXid=node.id;
			var obj:Object=JSON.parse(node.effect);
			for(var key:String in obj){
				kapaiXid=int(key);
				needNum=obj[key];
			}
		}
	}
}