package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_chongzhi;

	public class ChongzhiData
	{
		public function ChongzhiData()
		{
		}
		
		public var node:Node_chongzhi;
		public var count:int;
		public var state:int;
		
		public function initFromNode($node:Node_chongzhi):void{
			node=$node;
		}
	}
}