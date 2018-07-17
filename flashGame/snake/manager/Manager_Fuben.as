package snake.manager
{
	import com.fish.GLBaseData;
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.MapModel;
	import com.fish.modules.core.models.ZombieModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.story.StoryManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import core.PlayerGuideManager;
	
	import snake.BattleLayer;
	import snake.GameManager;
	import snake.gameEnemys.Enemy;
	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticle_bgs.SimpleParticle_bg;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.gameobj.Player;
	import snake.guns.GunData;
	import snake.module.HpBarUtil;
	import snake.viewdata.IHeroData;

	public class Manager_Fuben extends ManagerBase
	{
		private var guideModel:GuideModel;
		private var hasPassFuben:Boolean;
		public function Manager_Fuben()
		{
			super(GameManager.MG_Fuben);
		}
		
		
		
		protected override function proccessLoadAssetCom():void{
			Music.play(Music.FightMusic);
			guideModel=Context.getInjectInstance(GuideModel);
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
			//			var gunId:int=heroModel.mainGunId;
			player.initModule(viewData,character_x,character_y);
			
			if(!guideModel.isComplete){
				PlayerGuideManager.getInstance().startGuide(BattleLayer.guideLayer);
			}
			
			var zombieModel:ZombieModel=Context.getInjectInstance(ZombieModel);
			if(zombieModel.hasAleardyData()){
				onZombieDataAleardy();
			}else{
				zombieModel.ZombieArrayChangeSN.addOnce(onZombieDataAleardy);
			}
			
			
//			canvas.showNodeInfo();
		}
		
		private function onZombieDataAleardy():void{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			
			hasPassFuben=mapModel.hasPassFuben(battleModel.cur_id2);
			if( battleModel.cur_id3==0
				&& StoryManager.instance.couldStartStory(battleModel.cur_id2,1) && !hasPassFuben){
				StoryManager.instance.storyComplete_SN.addOnce(onStoryCom);
				StoryManager.instance.startStory(battleModel.cur_id2,1,BattleLayer.storyLayer);
				game_Gui.timeMc.stopTick();
				game_Gui.visible=false;
				
			}else{
				judgeGuideAfterStory();
				enemyCreator.createEnemy();
				game_Gui.visible=true;
			}
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			TopTip.hideBattleWait();
		}
		
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(code>0 && msType==C2SEmitter.REQ_FubenStoryHandler){
				enemyCreator.createEnemy();
				game_Gui.timeMc.resumeTick();
				game_Gui.visible=true;
			}
		}
		
		
		private function judgeGuideAfterStory():void{
			if(!guideModel.isComplete){
				var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
				if(guideModel.curGuideNode.passType==GuideModel.TP_WaitStory 
					&& battleModel.cur_id2==int(guideModel.curGuideNode.passArg)){
					guideModel.goNext();
				}
			}
		}
		
		
		public function needShowEndStory(copyId:int):Boolean{
			if(StoryManager.instance.couldStartStory(copyId,2) && !hasPassFuben){
				return true;
			}
			return false;
		}
		
		public function showEndStory(copyId:int,manager:ManagerBase):void{
			StoryManager.instance.startStory(copyId,2,BattleLayer.storyLayer);
			StoryManager.instance.storyComplete_SN.addOnce(onStoryCom);
			if(game_Gui) game_Gui.visible=false;
		}
		
		private function onStoryCom(copyId:int,type:int):void{
			
			if(type==1){
				StoryManager.instance.hideStoryView();
//				judgeGuideAfterStory();
				
				C2SEmitter.fubenStoryComplete(copyId);
				
				
			}else{
				StoryManager.instance.hideStoryView();
				MapModel.showFubenResult();
			}
			
		}
		
		public override function endBattle(manager:ManagerBase):void{
			super.endBattle(manager);
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
			{
				var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
				if(battleModel){
					if(battleModel.hasNextMinorGuanka()){
						battleModel.goNextMinorGuanka();
					}
				}
			}
		}
		
		public override function removeAll():void{
			super.removeAll();
			removeWindowLayer();
			StoryManager.instance.storyComplete_SN.remove(onStoryCom);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			(Context.getInjectInstance(ZombieModel) as ZombieModel).ZombieArrayChangeSN.remove(onZombieDataAleardy);
		}
	}
}