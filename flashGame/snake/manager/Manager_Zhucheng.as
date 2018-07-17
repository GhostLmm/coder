package snake.manager
{
	import com.fish.GLBaseData;
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.models.ChatModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.WalkNpcModel;
	import com.fish.modules.core.models.tempData.NpcerData;
	import com.ghostlmm.dig.GameRole;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.story.StoryManager;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Rectangle;
	
	import snake.GameItemManager;
	import snake.GameManager;
	import snake.GameRolerManager;
	import snake.gameobj.Player;
	import snake.gameobj.Player_Zhucheng;
	import snake.npcer.GameNpcer;
	import snake.viewdata.IHeroData;

	public class Manager_Zhucheng extends ManagerBase
	{
		public function Manager_Zhucheng()
		{
			super(GameManager.MG_Zhucheng);
		}
		private function onNpcerDataComplete(datas:Array):void{
			var rect:Rectangle=new Rectangle();
			rect.x=(mapInfo.view[0]+1)*50;
			rect.y=(mapInfo.view[1]+1)*50;
			rect.width=(mapInfo.view[2]-2)*50;
			rect.height=(mapInfo.view[3]-2)*50;
			for each(var npcdata:NpcerData in datas){
				GameRolerManager.instance.addNpc(npcdata,rect);
			}
		}
		
		private function onNpcerTalk(talkObj:Object):void{
			for each(var npc:GameNpcer in GameRolerManager.instance.getNpcVect()){
				if(npc.npcerData.isUser && talkObj.hasOwnProperty(npc.npcerData.uid)){
					npc.showTalk(talkObj[npc.npcerData.uid]);
				}
			}
		}
		
		protected override function proccessLoadAssetCom():void{
			GameRolerManager.instance.init();
			
			var npcModel:WalkNpcModel=(Context.getInjectInstance(WalkNpcModel) as WalkNpcModel);
			npcModel.npcerDataCom_SN.addOnce(onNpcerDataComplete);
			npcModel.npcerTalk_SN.add(onNpcerTalk);
			npcModel.startGetNpcerData();
			
			if(FuncSwitchManager.Horizontal_Switch)
			{
				addGui(true,false);
			}
			player=new Player_Zhucheng();
			var character_x:Number;
			var character_y:Number;
			if(!GameSwitchSceneController.isInBattle && GLBaseData.lastHeroPosition){
				character_x=GLBaseData.lastHeroPosition.x;
				character_y=GLBaseData.lastHeroPosition.y;
			}else{
				character_x=level.characterStartPoint.x;  
				character_y=level.characterStartPoint.y;
			}
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var viewData:IHeroData=heroModel.getHeroData();
			var gunId:int=heroModel.mainGunId;
			player.initModule(viewData,character_x,character_y,gunId);
			
			GameManager.battleInitCom_SN.dispatch();
			
			canvas.renderZhucheng();
			(Context.getInjectInstance(ChatModel) as ChatModel).sendChat_SN.add(onSendChat);
			TopTip.hideBattleWait();
		}
		
		private function onSendChat(info:String):void{
			(player as Player_Zhucheng).showTalk(info);
		}
		
		public override function removeAll():void{
			super.removeAll();
			(Context.getInjectInstance(ChatModel) as ChatModel).sendChat_SN.remove(onSendChat);
			var npcModel:WalkNpcModel=(Context.getInjectInstance(WalkNpcModel) as WalkNpcModel);
			npcModel.npcerDataCom_SN.remove(onNpcerDataComplete);
			npcModel.npcerTalk_SN.remove(onNpcerTalk);
			GameItemManager.getInstance().destroy();
		}
	}
}