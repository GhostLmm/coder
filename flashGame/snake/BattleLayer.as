package snake
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.Sprite;
	
	import snake.effect.ClearOut;
	import snake.gameEnemys.EnemyCreator;

	public class BattleLayer
	{
		public function BattleLayer()
		{
		}
		
		
		public static var mainLayer:Sprite;
		public static var uiLayer:Sprite;
		public static var storyLayer:Sprite;
		public static var windowLayer:Sprite;
		public static var guideLayer:Sprite;
		public static var effectLayer:Sprite;
		
		
		private static var clearOutMovie:ClearOut;
		public static function initLayer(container:Sprite):void{
			mainLayer=new Sprite();
			mainLayer.name="mainLayer";
			uiLayer=new Sprite();
			uiLayer.name="uiLayer";
			windowLayer=new Sprite();
			windowLayer.name="windowLayer";
			storyLayer=new Sprite();
			storyLayer.name="storyLayer";
			guideLayer=new Sprite();
			guideLayer.name="guideLayer";
			effectLayer=new Sprite();
			effectLayer.name="effectLayer";
			mainLayer.mouseChildren=false;
			mainLayer.mouseEnabled=false;
			effectLayer.mouseChildren=false;
			effectLayer.mouseEnabled=false;
			guideLayer.mouseChildren=false;
			guideLayer.mouseEnabled=false;
			
			container.addChild(mainLayer);
			container.addChild(uiLayer);
			container.addChild(storyLayer);
			container.addChild(windowLayer);
			container.addChild(guideLayer);
			container.addChild(effectLayer);
			
			EnemyCreator.EnemyLeft_SN.add(onEnemyDie);
		}
		
		private static function clearClearoutMovie():void{
			if(clearOutMovie){
				clearOutMovie.destory();
				clearOutMovie=null;
			}
		}
		
		private static function onEnemyDie():void{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			if(battleModel.hasNextMinorGuanka() && GameManager.manager.enemyCreator && GameManager.manager.enemyCreator.monsterLeft<=0){
				if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy ){
					clearClearoutMovie();
					clearOutMovie=new ClearOut();
					clearOutMovie.startShow(BattleLayer.effectLayer);
				}
			}
		}
		private static function removeLyaer(layer:Sprite):void{
			if(layer){
				layer.removeChildren();
				if(layer.parent){
					layer.parent.removeChild(layer);
				}
			}
		}
		
		public static function onEnterPortal():void{
			if(clearOutMovie){
				clearOutMovie.stopShow();
				clearOutMovie.destory();
				clearOutMovie=null;
			}
		}
		
		public static function destory():void{
			removeLyaer(mainLayer);
			removeLyaer(uiLayer);
			removeLyaer(windowLayer);
			removeLyaer(effectLayer);
			removeLyaer(guideLayer);
			removeLyaer(storyLayer);
			EnemyCreator.EnemyLeft_SN.remove(onEnemyDie);
			clearClearoutMovie();
		}
	}
}