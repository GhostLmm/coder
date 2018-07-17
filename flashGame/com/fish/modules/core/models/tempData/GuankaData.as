package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_dig_map;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class GuankaData
	{
		public function GuankaData()
		{
		}
		
		public var node:Node_dig_map;
		public var layers:int;
		public var startLayer:int;
		public var endLayer:int;
		public var bossNode:Node_monster_type;
		public var bossWidth:int;
		public var bossHeight:int;
		
		public function init(guankaId:int):void{
			node=XMLDataManager.getDig_mapById(guankaId);
			/*var layer:Array=JSON.parse(node.qujian) as Array;
			startLayer=int(layer[0]);
			endLayer=int(layer[1]);
			layers=endLayer+1-startLayer;
			
			var nodeMonser:Node_monster=XMLDataManager.getMonsterById(node.monster_view);
			bossNode=XMLDataManager.getMonster_typeById(nodeMonser.appearance);
			
			var bossSize:Array=JSON.parse(node.widthheight) as Array;
			bossWidth=bossSize[0];
			bossHeight=bossSize[1];*/
		}
		
	}
}