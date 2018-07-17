package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.BaoshiVO;
	import com.fish.modules.core.models.BaoshiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class BaoshiData
	{
		public function BaoshiData()
		{
		}
		
		public var node:Node_baoshi;
		private var vo:BaoshiVO;
		public var xid:int
		public var num:int;
		
		/*public function hasNextLevel():Boolean{
			return node.jinhua_id!=0;
		}*/
		
	
		
		
		public function initVo($vo:BaoshiVO,$num:int):void{
			vo=$vo;
			node=XMLDataManager.getBaoshiById(vo.xid);
			num=$num;
			xid=vo.xid;
		}
	}
}