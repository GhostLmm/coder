package com.ghostlmm.guide
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.ghostlmm.xmldata.Node_hero;
	
	import flash.display.Sprite;
	
	import core.LayerController;
	
	import snake.BattleEnterance;
	import snake.GameManager;
	import snake.manager.Manager_Select;

	public class GuideSelectControl
	{
		public function GuideSelectControl()
		{
		}
		
		public static var battleContainer:Sprite;
		public static var mcSelectPlayer:MC_SelectPlayer;
		public static function init():void{
			battleContainer=new Sprite();
			LayerController.instance.waitLayer.addChild(battleContainer);
			
			GameSwitchSceneController.btType=CoreSwitchEvent.BT_Select;
			GameSwitchSceneController.isInBattle=true;
			BattleEnterance.enterBattleUseJsonAndPng("level_0_2");
			
			mcSelectPlayer=new MC_SelectPlayer();
			LayerController.instance.waitLayer.addChild(mcSelectPlayer);
			mcSelectPlayer.slected_SN.add(onSlected);
		}
		
		private static function onSlected(node:Node_hero):void{
			var manager:Manager_Select=GameManager.manager as Manager_Select;
			manager.resetPlayer(node.id);
		}
		
		
		public static function destory():void{
			if(battleContainer){
				if(battleContainer.parent) battleContainer.parent.removeChild(battleContainer);
				battleContainer.removeChildren();
				battleContainer=null;
			}
			if(mcSelectPlayer){
				if(mcSelectPlayer.parent) mcSelectPlayer.parent.removeChild(mcSelectPlayer);
				mcSelectPlayer.slected_SN.remove(onSlected);
				mcSelectPlayer.destory();
				mcSelectPlayer=null;
			}
			if(GameManager.getManagerType()==GameManager.MG_Select){
				GameManager.endBattle();
			}
		}
		
		
	}
}