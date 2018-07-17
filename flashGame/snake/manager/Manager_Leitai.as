package snake.manager
{
	import com.fish.modules.core.models.HeroModel;
	import snake.gameEnemys.Enemy;
	import snake.viewdata.IHeroData;
	import snake.GameManager;
	import snake.gameobj.Player;
	import com.ghostlmm.lightMVC.Context;
	import com.fish.modules.core.models.BattleModel;

	public class Manager_Leitai extends ManagerBase
	{
		public function Manager_Leitai()
		{
			super(GameManager.MG_Leitai);
		}
		
		protected override function proccessLoadAssetCom():void{
			Music.play(Music.FightMusic);
			if(FuncSwitchManager.Horizontal_Switch)
			{
				addGui();
			}
			addWindowLayer();
			//			addLeitaiMovie();
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
			
//			canvas.showNodeInfo();
			TopTip.hideBattleWait();
		}
		
		public override function removeAll():void{
			super.removeAll();
			removeWindowLayer();
		}
	}
}