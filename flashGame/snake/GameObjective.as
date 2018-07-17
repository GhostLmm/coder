package snake
{
	/**
	 *   游戏的过关目标 任务
	 */
	public class GameObjective
	{
		public function GameObjective()
		{
		}
		public var objective_collectables_collected:Array;
		public var objective_score_complete:Array;
		public var objective_skill_complete:Array;
		public var objective_briefcase_collected:Boolean;
		public var objective_weaponProficiency:Boolean;
		public var objective_specialKills:int;
		public var totals:Array;
		public var objectives:Array;
		public function initData():void{
			this.objective_collectables_collected = [0, 0, 0, 0];
			this.objective_score_complete = [0, 0, 0];
			this.objective_skill_complete = [0, 0];
			this.objective_briefcase_collected = false;
			this.objective_weaponProficiency = false;
			this.objective_specialKills = 0;
			this.totals = [0, 0, 0];
			this.objectives = new Array();
		}
	}
}