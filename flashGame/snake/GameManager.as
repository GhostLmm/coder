package snake
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import core.PlayerGuideManager;
	
	import org.osflash.signals.Signal;
	
	import snake.manager.ManagerBase;
	import snake.manager.Manager_Fuben;
	import snake.manager.Manager_JinkuangLvduo;
	import snake.manager.Manager_JinkuangQugan;
	import snake.manager.Manager_Leitai;
	import snake.manager.Manager_Select;
	import snake.manager.Manager_Zhucheng;
	
	import ui.leitai.Mc_LeitaiMovie;

	public class GameManager
	{
		public function GameManager()
		{
		}
		
		public static const MG_Fuben:String="fuben";
		public static const MG_Leitai:String="leitai";
		public static const MG_Select:String="select";
		public static const MG_Zhucheng:String="zhucheng";
		
		public static const MG_JinkuangLvduo:String="jinkuanglvduo";
		public static const MG_JinkuangQugan:String="jinkuangqugan";
		
		public static var render_SN:Signal=new Signal(Number,Number);
		public static var battleInitCom_SN:Signal=new Signal();
		

//		public static var player:Player;
		
		
		public static var manager:ManagerBase;
		
		public static function getManagerType():String{
			if(manager) return manager.type;
			return null;
		}

		public static function startZhucheng($texture:BitmapData,$mapInfo:Object,$container:Sprite):void{
			if(manager){
				throw new Error("没有回收manager，这是不允许的 "+manager);
			}
			manager=new Manager_Zhucheng();
			manager.loadTexture($texture,$mapInfo,$container,false);
			manager.start();
		}
		
		
		

		public static function startWithMapInfo($mapbit:BitmapData,$mapInfo:Object,$container:Sprite):void{
			if(manager){
				throw new Error("没有回收manager，这是不允许的 "+manager);
			}
			manager=new Manager_Fuben();
			manager.loadMapbit($mapbit,$mapInfo,$container,true);
			manager.initEnemyCreator();
			manager.start();
		}
		public static function startLeitaiWithMapInfo($mapbit:BitmapData,$mapInfo:Object,$container:Sprite):void{
			if(manager){
				throw new Error("没有回收manager，这是不允许的 "+manager);
			}
			manager=new Manager_Leitai();
			manager.loadMapbit($mapbit,$mapInfo,$container,true);
			manager.start();	
		}
		
		public static function startSelectWithMapInfo($mapbit:BitmapData,$mapInfo:Object,$container:Sprite):void{
			if(manager){
				throw new Error("没有回收manager，这是不允许的 "+manager);
			}
			manager=new Manager_Select();
			manager.loadMapbit($mapbit,$mapInfo,$container,true);
			manager.start();
		}
		/**
		 * 金矿掠夺
		 */
		public static function startJinkuangLvduoWithMapInfo($mapbit:BitmapData,$mapInfo:Object,$container:Sprite):void{
			if(manager){
				throw new Error("没有回收manager，这是不允许的 "+manager);
			}
			manager=new Manager_JinkuangLvduo();
			manager.loadMapbit($mapbit,$mapInfo,$container,true);
			manager.start();
		}
		
		/**
		 * 金矿驱赶
		 */
		public static function startJinkuangQuganWithMapInfo($mapbit:BitmapData,$mapInfo:Object,$container:Sprite):void{
			if(manager){
				throw new Error("没有回收manager，这是不允许的 "+manager);
			}
			manager=new Manager_JinkuangQugan();
			manager.loadMapbit($mapbit,$mapInfo,$container,true);
			manager.start();
		}
		
		public static function endBattle():void{
			if(manager){
				manager.endBattle(manager);
				
			}
		}
		
		public static var guideStopFlag:Boolean=false;;

		public static function pause():void{
			
			if(manager) manager.canvas.setPauseFlag(true);
		}
		public static function resume():void{
			if(manager) manager.canvas.setPauseFlag(false);
		}
		
		public static function get pauseFlag():Boolean{
			if(manager) return manager.canvas.pauseFlag;
			return true;
		}
		
		public static function stopBattle():void{
//			stage.removeEventListener(KeyboardEvent.KEY_UP,keyUp);
//			stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyDown);
//			stage.removeEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		/** 显示结尾剧情  **/
		public static function showEndStory(copyId:int):void{
			if(manager && manager is Manager_Fuben){
				(manager as Manager_Fuben).showEndStory(copyId,manager);
			}
		}
		
		public static function needShowEndStory(copyId:int):Boolean{
			if(manager && manager is Manager_Fuben){
				return (manager as Manager_Fuben).needShowEndStory(copyId);
			}else{
				return false;
			}
		}
		
		
		
		private static var mcLeitai:Mc_LeitaiMovie;
		private static function addLeitaiMovie():void
		{
			if(null!=mcLeitai)
			{
				mcLeitai.destory();
			}
			mcLeitai=new Mc_LeitaiMovie();
			mcLeitai.x=GlobalRef.width/2;
			mcLeitai.y=GlobalRef.height/2;
			BattleLayer.effectLayer.addChild(mcLeitai);
			setTimeout(removeLeitaiMovie,2700);
		}
		private static function removeLeitaiMovie():void
		{
			if(null==mcLeitai)
			{
				return;
			}
			if(mcLeitai.parent)
			{
				mcLeitai.parent.removeChild(mcLeitai);
				mcLeitai.destory();
				mcLeitai=null;
			}
		}
		
		
	
	}
}