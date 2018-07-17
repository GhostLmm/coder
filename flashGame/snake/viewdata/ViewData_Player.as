package snake.viewdata
{
	import com.fish.modules.core.gameVO.HeroVO;
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import snake.GameUtil;
	import snake.viewdata.battle.AttackComputeData;

	public class ViewData_Player extends ViewData_Base implements IHeroData
	{
		public var playerNode:Node_hero;
		public var vo:HeroVO;
		
		public function ViewData_Player()
		{
			super();
		}
		public function get lv():int
		{
			return vo.level;
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
			return vo.id;
		}
		public function get computeData():AttackComputeData
		{
			return null;
		}
		public function get gunXid():int
		{
			return vo.gunId;
		}
		public function get fireDerTime():int
		{
			return 10;
		}
		
		private var _appearance:String;
		private var _color:String;
		
		public function setAppearanceAndColor($appearance:String,$color:String):void{
			_appearance=$appearance;
			_color=$color;
		}
		
		public function get appearance():Array{
			//			return null;
			if(_appearance){
				return JSON.parse(_appearance) as Array;
			}
			return JSON.parse(XMLDataManager.getMonster_typeById( playerNode.imageType).movie_frame) as Array;
		}
		public function get color():Array{
			//			return null;
			if(_color){
				return GameUtil.turnArryStringToUint(_color);
			}
			return GameUtil.turnArryStringToUint(XMLDataManager.getMonster_typeById( playerNode.imageType).colors);
		}
	}
}