package snake.viewdata
{
	import com.fish.modules.core.gameVO.ZombieVO;
	import com.fish.modules.core.models.BattleModel;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_monster_type;
	
	import snake.viewdata.battle.AttackComputeData;

	/**
	 * 仅限副本使用
	 */
	public class ViewData_Zombie extends ViewData_Base implements IHeroData
	{
		public var param_cri:int;
		public var param_renxing:int;
		public var param_hit:int;
		public var param_eva:int;
		
		public var monsterNode:Node_monster;
		public var monsterTypeNode:Node_monster_type;
		public var vo:ZombieVO;
		
		public var propertyData:PropertyData;
		public var _computeData:AttackComputeData;
		
		public function get isZombie():Boolean{
			if(monsterTypeNode && monsterTypeNode.type=="zombie"){
				return true;
			}
			return false;
		}
		
		public function ViewData_Zombie()
		{
			super();
		}
		public function setData():void
		{
			setPropertyData();
			setComputeData();
		}
		public function setPropertyData():void
		{
			propertyData=new PropertyData();
			propertyData.atk=monsterNode.atk+monsterNode.atk_up*(lv-1);
			propertyData.def=monsterNode.def+monsterNode.def*(lv-1);
			propertyData.hp=monsterNode.hp+monsterNode.hp_up*(lv-1);
			propertyData.speed=monsterNode.speed+monsterNode.speed_up*(lv-1);
			
			propertyData.cri=param_cri;
			propertyData.renxing=param_renxing;
			propertyData.hit=param_hit;
			propertyData.eva=param_eva;
		}
		private function setComputeData():void
		{
			_computeData=new AttackComputeData();
			_computeData.atk=atk;
			_computeData.BaojiBase=BattleModel.BaojiBase;
			_computeData.cri_pro=BattleModel.computeCri_Pro(lv,propertyData.cri);
			_computeData.cri_pro_lvzi=0;
			_computeData.hit_pro=BattleModel.computeHit_Pro(lv,propertyData.hit);
			_computeData.hit_pro_lvzi=0;
			_computeData.nbCridamage=0;
			_computeData.nbDamage=0;
			
			_computeData.renxing_pro=BattleModel.computeCri_Pro(lv,propertyData.renxing);
			_computeData.renxing_pro_lvzi=0;
			_computeData.eva_pro=BattleModel.computeCri_Pro(lv,propertyData.eva);
			_computeData.eva_pro_lvzi=0;
			_computeData.def=propertyData.def;
			
			_computeData.gunXid=gunXid;
			_computeData.id=id;
		}
		public override function destroy():void
		{
			monsterNode=null;
			monsterTypeNode=null;
			vo=null;
			super.destroy();
		}
		public function get lv():int
		{
			if(vo)
			{
				return vo.lv;
			}
			return 1;
		}
		public function get id():int
		{
			if(vo)
			{
				return vo.id;
			}
			return 1;
		}
		public function get atk():int
		{
			return propertyData.atk;
		}
		public function get jumpHeight():int
		{
			return 10;
		}
		/**
		 * 僵尸移动速度
		 */
		public function get runSpeed():int
		{
			return propertyData.speed;
		}
		/**
		 * 生命值
		 */
		public function get maxHealth():int
		{
			return propertyData.hp;
		}
		public function get curHealth():int
		{
			return maxHealth;
		}
		public function get computeData():AttackComputeData
		{
			return _computeData;
		}
		
		public function get heapid():int
		{
			return vo.heapid;
		}
	
		public function get gunXid():int
		{
			return monsterNode.gun;
		}
		public function get fireDerTime():int
		{
			return monsterNode.firedertime;
		}
		public function get appearance():Array{
			return null;
		}
		public function get color():Array{
			return null;
		}
	}
}