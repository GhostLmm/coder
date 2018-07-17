package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.CopyVO;
	import com.ghostlmm.xmldata.Node_fuben_map;
	
	import flash.utils.Dictionary;

	public class FubenMapData
	{
		
		public var node:Node_fuben_map;
		public var voDic:Dictionary;
		public var fubenNodeArray:Array;
		public var levelActive:Boolean;
		public function FubenMapData(_node:Node_fuben_map)
		{
			node=_node;
			voDic=new Dictionary();
			fubenNodeArray=[];
		}
		
		public function addVo(vo:CopyVO):void{
			voDic[vo.xid]=vo;
		}
		
		
		
	}
}