package snake.viewdata.leitai
{
	import com.fish.modules.core.gameVO.LeitaipersionVO;
	
	import snake.GameUtil;
	import snake.viewdata.ViewData_Base;
	
	public class ViewData_LeitaiPerson extends ViewData_Base
	{
		public var vo:LeitaipersionVO;
		
		public function ViewData_LeitaiPerson()
		{
			super();
		}
		public function get leitaiRank():int
		{
			return vo.userRank;
		}
		public function get userId():int
		{
			return vo.uid;
		}
		public function get movieFrame():Array
		{
			return JSON.parse(vo.userMovieFrame) as Array;
		}
		public function get Colors():Array
		{
			return GameUtil.turnArryStringToUint(vo.userColors) as Array;
		}
		public function get userName():String
		{
			return vo.userName;
		}
		private var randomId:int=0;
		public function get gunId():int
		{
			return vo.userGunId;
		}
		public function get fightPoint():int
		{
			return vo.fightPoint;
		}
	}
}