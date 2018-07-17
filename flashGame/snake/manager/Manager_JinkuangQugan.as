package snake.manager
{
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.HeroModel;
	import com.ghostlmm.lightMVC.Context;
	
	import snake.GameManager;
	import snake.gameEnemys.Enemy;
	import snake.gameobj.Player;
	import snake.viewdata.IHeroData;

	public class Manager_JinkuangQugan extends ManagerBase
	{
		public function Manager_JinkuangQugan()
		{
			super(GameManager.MG_JinkuangQugan);
		}
		protected override function proccessLoadAssetCom():void{
			if(FuncSwitchManager.Horizontal_Switch)
			{
				addGui();
			}
			addWindowLayer();
			player=new Player();
			var character_x:Number;
			var character_y:Number;
			character_x=level.characterStartPoint.x;  
			character_y=level.characterStartPoint.y;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			var viewData:IHeroData=battleModel.getMyHeroData();
			player.initModule(viewData,character_x,character_y);
			Enemy.addLeitaiPlayer();
			TopTip.hideBattleWait();
		}
		public override function removeAll():void{
			super.removeAll();
			removeWindowLayer();
		}
	}
}