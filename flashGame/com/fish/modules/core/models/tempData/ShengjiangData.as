package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_kapai;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_yingxiong_tiaozhan;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class ShengjiangData
	{
		public function ShengjiangData(node:Node_yingxiong_tiaozhan)
		{
			tiaozhanNode=node;
			cardNode=XMLDataManager.getKapaiById(tiaozhanNode.card);
			monsterNode=XMLDataManager.getMonsterById(tiaozhanNode.monster);
			
			dropItem1={"xid":tiaozhanNode.item1_id,"num":tiaozhanNode.item1_num,"key":"item"};
			dropItemArray=[];
			var ids:Array=JSON.parse(tiaozhanNode.item2_id) as Array;
			var nums:Array=JSON.parse(tiaozhanNode.item2_num) as Array;
			for (var index:int=0; index<ids.length; index++){
				var id:int=ids[index];
				var num:int=nums[index];
				var obj:Object={"key":"item","xid":id,"num":num};
				dropItemArray.push(obj);
			}
		}
		
		public var dropItem1:Object;
		public var dropItemArray:Array;
		
		public var tiaozhanNode:Node_yingxiong_tiaozhan;
		public var cardNode:Node_kapai;
		public var monsterNode:Node_monster;
		
		public var couldTiaozan:Boolean=false;
	}
}