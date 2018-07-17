package ui.battle
{
	import com.fish.modules.core.models.RewardsPackData;

	public class BattleResultWindowData
	{
		/*public var reward_rongyu:int;
		public var reward_money:int;
		public var reward_exp:int;
		public var rewardItemArray:Array=[];
		public var stars:Array;*/
		public var packData:RewardsPackData=new RewardsPackData();
		public var oldStarNum:int;
		public var newStarNum:int;
		public var killTime:int;
		public var life:int;
		
		public var type:String;
		
		public function BattleResultWindowData()
		{
			
		}
		
	}
}