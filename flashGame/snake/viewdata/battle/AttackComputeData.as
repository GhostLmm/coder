package snake.viewdata.battle
{
	import snake.viewdata.ViewData_Base;
	
	public class AttackComputeData extends ViewData_Base
	{
		/**
		 * 基础攻击
		 */
		public var atk:int;
		/**
		 * 命中率
		 */
		public var hit_pro:Number=0;
		
		/**
		 * 绿字命中率
		 */
		public var hit_pro_lvzi:Number=0;
		/**
		 * 暴击率
		 */
		public var cri_pro:Number=0;
		/**
		 * 绿字暴击率
		 */
		public var cri_pro_lvzi:Number=0;
		
		public var nbDamage:Number=0;
		
		public var nbCridamage:Number=0;
		
		public var BaojiBase:Number=0;
		//以上是攻击数据
		//<----------------------------------------->
		//以下是防守用数据
		/**
		 * 韧性率
		 */
		public var renxing_pro:Number=0;
		/**
		 * 韧性率绿字
		 */
		public var renxing_pro_lvzi:Number=0;
		/**
		 * 闪避率
		 */
		public var eva_pro:Number=0;
		
		/**
		 * 闪避率绿字
		 */
		public var eva_pro_lvzi:Number=0;
		
		public var def:int;
		
		//攻防都需要数据
		public var gunXid:int;
		public var id:int;
		
		public function AttackComputeData()
		{
			super();
		}
		
	}
}