package snake.viewdata
{
	import com.fish.modules.core.gameVO.BattleheroVO;
	import com.fish.modules.core.gameVO.BattlepersonVO;
	
	import snake.GameUtil;

	public class ViewData_LeitaiPlayer extends ViewData_Base
	{
		public var battleHero:BattleheroVO
		public var battlePerson:BattlepersonVO;
		
		public function ViewData_LeitaiPlayer()
		{
			super();
		}
		public override function destroy():void
		{
			battleHero=null;
			battlePerson=null;
			super.destroy();
		}
		/**
		 * 攻击力
		 */
		public function get damage():int
		{
			return battleHero.atk;
		}
		/**
		 * 僵尸移动速度
		 */
		public function get speed():Number
		{
			return battleHero.speed;
		}
		/**
		 * 生命值s
		 */
		public function get health():Number
		{
			return battleHero.hp;
		}
		public function get gunId():int
		{
			return battlePerson.userGunId;
		}
		public function get moveFrame():Array
		{
			return JSON.parse(battlePerson.userMovieFrame) as Array;
		}
		public function get Colors():Array
		{
			return GameUtil.turnArryStringToUint(battlePerson.userColors) as Array;
		}
	}
}