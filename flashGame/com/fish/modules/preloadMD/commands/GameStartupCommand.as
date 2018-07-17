package com.fish.modules.preloadMD.commands
{
	import com.fish.modules.core.CoreConfig;
	import com.fish.modules.core.events.CoreEvent;
	import com.fish.modules.preloadMD.mediators.PreloadLayer;
	import com.ghostlmm.lightMVC.ModuleManager;
	import com.ghostlmm.lightMVC.api.IInjector;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.ghostlmm.lightMVC.impl.Command;
	
	import flash.events.IEventDispatcher;
	
	
	public class GameStartupCommand extends Command
	{
		[Inject]
		public var inject:IInjector;
		[Inject]
		public var log:ILogger;
		[Inject]
		public var dispatcher:IEventDispatcher;
		public function GameStartupCommand()
		{
			super();
		}
		
		private function printInsertCards():void{
//			for each(var card:Node_kapai in XMLDataManager.Node_kapaiArray){
//				trace(Util.stringFormat(
//				"insert into tqt_card(user_id,xid,team_id,level,level_exp,total_exp,wuxing,classes) values({0},{1},0,1,0,0,{2},0);",
//				"$uid",card.id,card.wuxing));
//			}
		}
		private function printInsertItems():void{
//			for each(var item:Node_item in XMLDataManager.Node_itemArray){
//				trace(Util.stringFormat("insert into tqt_item(user_id,xid,num)values({0},{1},{2});","$uid",item.id,3));
//			}
			
		}
		
		public override function excute():void
		{
			
			//warning
//			printInsertCards();
//			printInsertItems();
//			
//			return ;
			
//			log.info("开始进入游戏");
//			GameStatus.setStatus(GameStatus.ST_GameOngoing);
			
			var preloadLayer:PreloadLayer=inject.getInstance(PreloadLayer);
			ModuleManager.getInstance().registerModule(CoreConfig.NAME,CoreConfig);
//			ModuleManager.getInstance().unLoadmodule(PreloadConfig.NAME);
			ModuleManager.getInstance().loadmodule(CoreConfig.NAME);
			
//			dispatcher.dispatchEvent(new CoreEvent(CoreEvent.StartInitGame));
			SocketControl.init();
			SocketControl.start();

			
		}
	}
}