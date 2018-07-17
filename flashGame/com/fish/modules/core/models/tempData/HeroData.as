package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.HeroVO;
	import com.fish.modules.core.models.EquipModel;
	import com.ghostlmm.lightMVC.Context;

	public class HeroData
	{
		private var needUpdate:Boolean=true;
		/** 第一个是枪， 其他的按照顺序的装备  **/
		private var weaponDataList:Array;
		
		public var hid:int;
		public var vo:HeroVO;
		
		public function HeroData()
		{
		}
		
		public function initVo($vo:HeroVO):void{
			vo=$vo;
			hid=vo.id;
		}
	
		
		public function getEquipDataList():Array{
			update();
			return weaponDataList;
		}
		
		public function getHeroFightingCap():int{
			update();
			return 100;
		}
		
		private function update():void{
			if(needUpdate){
				
				weaponDataList=new Array(7);
				var equipModel:EquipModel = Context.getInjectInstance(EquipModel);
				var armyArray:Array=equipModel.getArmyEquipDatas();
				for each(var equip:EquipData in armyArray){
					if(equip.euipVo.heroId==hid){
						if(equip.node.type>6){
							weaponDataList[0]=equip;
						}else{
							weaponDataList[equip.node.type]=equip;
						}
					}
				}
				
				needUpdate=false;
			}
		}
	}
}