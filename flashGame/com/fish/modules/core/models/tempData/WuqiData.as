package com.fish.modules.core.models.tempData
{
	import com.ghostlmm.xmldata.Node_gun;

	public class WuqiData extends EquipData
	{
		public function WuqiData()
		{
		}
		
		public var node_gun:Node_gun;
		
		public var gunId:int;
		/** 是否已经拥有 **/
		public function hasOwn():Boolean{
			return euipVo!=null;
		}
		
		public function initGunNode(gunNode:Node_gun):void{
			node_gun=gunNode;
			gunId=node_gun.id;
		}
		
		public var gunState:int=0;
		
		public static const ST_Unload:int=3;
		public static const ST_Main:int=1;
//		public static const ST_Minor:int=2;
		
		public function isMainGun():Boolean{
			return gunState==ST_Main;
		}
//		public function isMinorGun():Boolean{
//			return gunState==ST_Minor;
//		}
		
		
		
		
		public function initFormEquipData(equipData:EquipData):void{
			initVo(equipData.euipVo);
		}
		
		public function destory():void{
			
		}
	}
	
}