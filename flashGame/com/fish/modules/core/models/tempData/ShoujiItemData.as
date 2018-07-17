package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.models.ItemModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_huodong_shouji_duihuan;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class ShoujiItemData
	{
		public function ShoujiItemData()
		{
		}
		
		public var node:Node_huodong_shouji_duihuan;
		
		public var sourceItemNode:Node_item;
		
		
		
		public var collect_num:int;
		
	
		public function get shouji_name():String{
			return sourceItemNode.name;
		}
//		public function get duihuan_name():String{
//			
//		}
		
		public function setData($node:Node_huodong_shouji_duihuan):void
		{
			node=$node;
			var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
			collect_num=itemModel.getItemNumById(node.shouji_id);
			sourceItemNode=XMLDataManager.getItemById(node.shouji_id);
			
		}
		
		public function calcBuqiUseCash():int{
			return node.shouji_wupin*Math.max(0,node.shouji_num-collect_num);
		}
	}
}