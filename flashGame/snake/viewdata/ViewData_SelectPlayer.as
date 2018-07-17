package snake.viewdata
{
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.GameUtil;
	import snake.viewdata.battle.AttackComputeData;
	
	public class ViewData_SelectPlayer extends ViewData_Base implements IHeroData
	{
		public var playerNode:Node_hero;
		private var _gunId:int
		public function ViewData_SelectPlayer(_param:Object=null)
		{
			super(_param);
		}
		
		public function initData(heroId:int,$gunId:int=-1):void{
			playerNode=XMLDataManager.getHeroById(heroId);
			if($gunId==-1){
				$gunId=playerNode.initGunId;
			}
			_gunId=$gunId;
		}
		
		public function get lv():int
		{
			return 1;
		}
		/**
		 * 生命值s
		 */
		public function get maxHealth():int
		{
			return playerNode.hp+playerNode.hp_up*(lv-1);
		}	
		public function get curHealth():int
		{
			return maxHealth;
		}
		public function get runSpeed():int
		{
			return (playerNode.speed+playerNode.speed_up*(lv-1));
		}
		public function get jumpHeight():int
		{
			return playerNode.jumpHeight;
		}
		public function get atk():int
		{
			return playerNode.atk+playerNode.atk_up*(lv-1);
		}
		public function get id():int
		{
			return 1;
		}
		public function get computeData():AttackComputeData
		{
			return null;
		}
		public function get gunXid():int
		{
			return _gunId;
		}
		public function get fireDerTime():int
		{
			return 10;
		}
		
		public function get appearance():Array{
//			return null;
			return JSON.parse(XMLDataManager.getMonster_typeById( playerNode.imageType).movie_frame) as Array;
		}
		public function get color():Array{
//			return null;
			return GameUtil.turnArryStringToUint(XMLDataManager.getMonster_typeById( playerNode.imageType).colors);
		}
	}
}