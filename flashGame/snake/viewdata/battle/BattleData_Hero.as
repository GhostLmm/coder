package snake.viewdata.battle
{
	import com.fish.modules.core.gameVO.BattlegunVO;
	import com.fish.modules.core.gameVO.BattleheroVO;
	import com.fish.modules.core.models.BattleModel;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.GameUtil;
	import snake.viewdata.IHeroData;
	import snake.viewdata.PropertyData;
	import snake.viewdata.ViewData_Base;
	
	public class BattleData_Hero extends ViewData_Base implements IHeroData
	{
		public var isEnemy:Boolean=false;
		public static const AttrNames:Array=["atk","def","hp","cri","renxing","hit","eva","speed"];
		
		public var battleHeroVo:BattleheroVO;
		public var battleGuns:Array;
		
		public var propertyData:PropertyData;
		public var _computeData:AttackComputeData;
		
		public function BattleData_Hero(_isEnemy:Boolean=false)
		{
			super();
			isEnemy=_isEnemy;
			registerEvent();
		}
		private function registerEvent():void
		{
			if(!isEnemy)
			{
				GunChangeManager.getInstance().GunChange_SN.add(setData);
			}
		}
		private function removeEvent():void
		{
			if(!isEnemy)
			{
				GunChangeManager.getInstance().GunChange_SN.remove(setData);
			}
		}
		public function setPropertyData():void
		{
			propertyData=new PropertyData();
			var curGunVo:BattlegunVO;
			if(!isEnemy)
			{
				curGunVo=getBattleGunByXid(GunChangeManager.getInstance().currentUseGun);
			}
			else
			{
				curGunVo=getBattleGunByXid(battleHeroVo.mainGun);
			}
//			if(curGunVo==null)
//			{
//				return;
//			}
			var index:int;
			for(index=0;index<AttrNames.length;index++)
			{
				var atrName:String=AttrNames[index];
				propertyData[atrName]+=battleHeroVo[atrName];
				propertyData[atrName]+=curGunVo[atrName];
			}
		}
		public function setData():void
		{
			setPropertyData();
			setComputeData();
		}
		private function setComputeData():void
		{
			_computeData=new AttackComputeData();
			_computeData.atk=propertyData.atk;
			_computeData.BaojiBase=BattleModel.BaojiBase;
			_computeData.cri_pro=BattleModel.computeCri_Pro(battleHeroVo.level,propertyData.cri);
			_computeData.cri_pro_lvzi=battleHeroVo.nbCri;
			_computeData.hit_pro=BattleModel.computeHit_Pro(battleHeroVo.level,propertyData.hit);
			_computeData.hit_pro_lvzi=battleHeroVo.nbHit;
			_computeData.nbCridamage=battleHeroVo.nbCridamage;
			_computeData.nbDamage=battleHeroVo.nbDamage;	
			
			_computeData.renxing_pro=BattleModel.computeCri_Pro(battleHeroVo.level,propertyData.renxing);
			_computeData.renxing_pro_lvzi=battleHeroVo.nbRenxing;
			_computeData.eva_pro=BattleModel.computeCri_Pro(battleHeroVo.level,propertyData.eva);
			_computeData.eva_pro_lvzi=battleHeroVo.nbEva;
			_computeData.def=propertyData.def;
			
			if(!isEnemy)
			{
				_computeData.gunXid=GunChangeManager.getInstance().currentUseGun;
			}
			else
			{
				_computeData.gunXid=battleHeroVo.mainGun;
			}
			_computeData.id=id;
		}
		private function getBattleGunByXid(_xid:int):BattlegunVO
		{
			var index:int;
			for(index=0;index<battleGuns.length;index++)
			{
				var battleGun:BattlegunVO=battleGuns[index];
				if(battleGun.xid==_xid)
				{
					return battleGun;
				}
			}
			return null;
		}
		/**
		 * 生命值s
		 */
		public function get maxHealth():int
		{
			return propertyData.hp;
		}	
		public function get curHealth():int
		{
			return battleHeroVo.curhp;
		}
		public function get runSpeed():int
		{
			return propertyData.speed*(1+battleHeroVo.nbSpeed);
		}
		public function get jumpHeight():int
		{
			return XMLDataManager.getHeroById(battleHeroVo.xid).jumpHeight;
		}
		public function get atk():int
		{
			return propertyData.atk;
		}
		public function get computeData():AttackComputeData
		{
			return _computeData;
		}
		public function get gunXid():int
		{
			return battleHeroVo.mainGun;
		}
		public override function destroy():void
		{
			removeEvent();
			super.destroy();
		}
		public function get id():int
		{
			return battleHeroVo.id;
		}
		public function get fireDerTime():int
		{
			return 0;
		}
		
		public function get appearance():Array{
			//			return null;
			return JSON.parse(battleHeroVo.userMovieFrame) as Array;
		}
		public function get color():Array{
			//			return null;
			return GameUtil.turnArryStringToUint(battleHeroVo.userColors);
		}
	}
}