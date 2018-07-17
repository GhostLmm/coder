package game.viewdata
{
	import com.fish.modules.core.gameVO.SkillVO;
	import com.fish.modules.core.models.SkillModel;
	import com.ghostlmm.xmldata.Node_skill;
	import com.ghostlmm.xmldata.Node_skill_upgrade;

	public class ViewData_Skill extends ViewData_Base
	{
		public var skillNode:Node_skill;
		public var skillUpgradeNode:Node_skill_upgrade;
		public var vo:SkillVO;
		
		public function ViewData_Skill()
		{
			super();
		}
		public function get lv():Number
		{
			return vo.level;
		}
		public function get id():Number
		{
			return vo.id;
		}
		public function get atk():Number
		{
			if(addType=="atk")
			{
				return skillNode.atk+addValue;
			}
			else
			{
				return skillNode.atk;
			}
		}
		
		public function get def():Number
		{
			if(addType=="def")
			{
				return skillNode.def+addValue;
			}
			else
			{
				return skillNode.def;
			}
		}
		
		public function get hp():Number
		{
			if(addType=="hp")
			{
				return skillNode.hp+addValue;
			}
			else
			{
				return skillNode.hp;
			}
		}
		
		public function get speed():Number
		{
			if(addType=="speed")
			{
				return skillNode.speed+addValue;
			}
			else
			{
				return skillNode.speed;
			}
		}
		
		public function get lastTime():Number
		{
			if(addType=="lastTime")
			{
				return skillNode.lastTime+addValue;
			}
			else
			{
				return skillNode.lastTime;
			}
		}
		
		public function get count():Number
		{
			return skillNode.count;
		}
		
		public function get addType():String
		{
			return skillNode.addType;
		}
		
		public function get type():String
		{
			return skillNode.type;
		}
		
		public function get CD():Number
		{
			return skillNode.CD;
		}
		/**
		 * 总共增加的属性
		 */
		public function get addValue():Number
		{
			return SkillModel.getSkillUpgradeAdd(skillNode,lv);
		}
	}
}