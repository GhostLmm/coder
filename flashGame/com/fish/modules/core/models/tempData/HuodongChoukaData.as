package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_kapai;

	public class HuodongChoukaData
	{
		public function HuodongChoukaData()
		{
		}
		public var pos:int;
		public var cardXid:int;
		public var cid:Number;
		
		public function get hasReward():Boolean{
			return cid>0;
		}
		public var cardNode:Node_kapai;
	}
}