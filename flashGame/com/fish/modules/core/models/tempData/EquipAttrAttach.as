package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.ResourceConst;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class EquipAttrAttach
	{
		public function EquipAttrAttach()
		{
		}
		
		public var attr:String;
		public var value:int;
		public var derValue:int;
		
		
		public static const AttrNames:Array=["atk","def","hp","cri","renxing","hit","eva","speed"];
		
		
		/** 获取装备拥有的属性  **/
		public static function getAttrArray(type:String,xid:int):Array{
			var $node:*;
			if(type==ResourceConst.R_item){
				$node=XMLDataManager.getEquipById(xid);
			}
			if(type==ResourceConst.R_baoshi){
				$node=XMLDataManager.getBaoshiById(xid);
			}
			if(type==ResourceConst.R_equip){
				$node=XMLDataManager.getEquipById(xid);
			}
			
			var baseAttrArray:Array=[];
			for each(var attr:String in EquipAttrAttach.AttrNames){
				if($node.hasOwnProperty(attr) && $node[attr]>0){
					baseAttrArray.push(attr);
				}
			}
			return baseAttrArray;
		}
	}
}