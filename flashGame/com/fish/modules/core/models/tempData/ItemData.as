package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.gameVO.ItemVO;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class ItemData
	{
		public function ItemData()
		{
		}
		
		
		public var node:Node_item;
		public var vo:ItemVO;
		public var xid:int;
		
		public function get num():int{
			if(vo==null) return 0;
			return vo.num;
		}
		
		public function initVo($vo:ItemVO):void{
			vo=$vo;
			xid=vo.xid;
			node=XMLDataManager.getItemById(xid);
			if(node==null){
				trace("没有该道具信息： "+xid);
			}
		}
		
		public function couldSell():Boolean{
			if(node==null) return false;
			return node.sell_type==ResourceConst.R_money;
		}
		
	}
}