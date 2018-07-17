package com.fish
{
	import com.fish.modules.core.CoreConfig;
	import com.fish.modules.core.events.CoreEvent;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.events.CoreViewEvent;
	import com.fish.modules.core.models.BattleModel;
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.JinkuangModel;
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.dig.Avatar;
	import com.ghostlmm.dig.DigGameControl;
	import com.ghostlmm.dig.GameConstConfig;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ModuleManager;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import flash.system.System;
	
	import core.AnimateManager;
	import core.LayerController;
	import core.PlayerGuideManager;
	import core.WindowManager;
	import core.timer.TimerManager;
	
	import snake.BattleEnterance;
	import snake.GameManager;
	import snake.viewdata.battle.GunChangeManager;
	
	import ui.jinkuang.JinkuangWindow;
	import ui.layer.MDI_UiLayer;
	import ui.layer.SceneLayer;
	import ui.widget.BitdataChache;
	
	import view.CommonControlFun;
	


	public class GameSwitchSceneController
	{
		public static var btType:String;
		
		private static var _state:int;
		
		public static function get state():int{
			return _state;
		}
		
		public static const ST_Zhucheng:int=100;
		public static const ST_Fuben:int=200;
		public static const ST_Leitai:int=300;
		public static const ST_Xuanren:int=400;
		public static const ST_Wakuang:int=500;
		
		public static const ST_Xuanren2Zhucheng:int=401;
		public static const ST_Zhucheng2Xuanren:int=104;
		
		public static const ST_Fuben2Zhucheng:int=201;
		public static const ST_Zhucheng2Fuben:int=102;
		
		public static const ST_Fuben2Fuben:int=202;
		
		public static const ST_Leitai2Zhucheng:int=301;
		public static const ST_Zhucheng2Leitai:int=103;
		
		public static const ST_Wakuang2Zhucheng:int=501;
		public static const ST_Zhucheng2Wakuang:int=105;
		
		
		public function GameSwitchSceneController()
		{
		}
		private static var _instance:GameSwitchSceneController;
		public static function getInstance():GameSwitchSceneController
		{
			if(_instance==null) _instance=new GameSwitchSceneController();
			return _instance;
		}
		public static var isInBattle:Boolean=false;
		
		public function enterBattle($battleType:String):void
		{
			GameCommand.clear();
			trace("isInBattle"+isInBattle);
			btType=$battleType;
			GunChangeManager.getInstance().startBattle();
			
			clearFlashView();
			ModuleManager.getInstance().loadmodule(CoreConfig.NAME);
//			GameManager.stopBattle();
			isInBattle=true;
			
			switch($battleType)
			{
				case CoreSwitchEvent.BT_Copy:
					var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
					BattleEnterance.enterBattleUseJsonAndPng(battleModel.getCurMap());
					break;
				case CoreSwitchEvent.BT_Leitai:
					var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
					BattleEnterance.enterBattleUseJsonAndPng(leitaiModel.getCurrentMap());
					break;
				case CoreSwitchEvent.BT_JinkuangLveduo:
					var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
					BattleEnterance.enterBattleUseJsonAndPng(jinkuangModel.getCurrentMap());
					break;
				case CoreSwitchEvent.BT_JinkuangQugan:
					var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
					BattleEnterance.enterBattleUseJsonAndPng(jinkuangModel.getCurrentMap());
					break;
			}					
		}
		
		
		/** 进入挖矿 **/
		public function enterMining():void{
			GameSwitchSceneController.btType=null;
			TopTip.showBattleWait();
			clearFlashView();
			GameManager.endBattle();
			trace("进入挖矿时间 ");
			var guankaModel:GuankaModel=Context.getInjectInstance(GuankaModel);
			guankaModel.startDigMessageCompleteSn.addOnce(onStartMesCom);
			guankaModel.readyDig();
		}
		
		private function onStartMesCom():void{
			GameConstConfig.configFormConst();
//			GameConstConfig.initOffset(0,0);
			DigGameControl.instance.init(new Avatar(),GlobalRef.root);
			DigGameControl.instance.showEnterEffect();
			ModuleManager.getInstance().loadmodule(CoreConfig.NAME);
			TopTip.hideBattleWait();
		}
		
		
		public function goFlashFromMining():void{
			TopTip.showBattleWait();
			DigGameControl.instance.destory();
			
			PlayerGuideManager.getInstance().stopGuide();
			
			var guankaModel:GuankaModel=Context.getInjectInstance(GuankaModel);
			guankaModel.endDigMessageCompleteSn.addOnce(onEndDigMsgCom);
			guankaModel.endDig();
			
		}
		
		private function onEndDigMsgCom():void{
			enterFlash();
		}
		
		
		public function clearFlashView():void
		{
			trace("清理flash 层，等待战斗");
			
			
			
			AnimateManager.clear();
			TimerManager.clear();
			
			TweenMax.killAll();
			
			
			
			WindowManager.closeAllWindow();

			
			LayerController.instance.clear();
			
			//			GlobalRef.root.removeChildren();
			
			
			BitdataChache.clear();
			//			ImageCache.clear();
			
			ModuleManager.getInstance().unLoadmodule(CoreConfig.NAME);
			
			Context.getInsance().checkMediatorClear();
			
			GameManager.endBattle();
			
			PlayerGuideManager.getInstance().stopGuide();
			
			System.gc();
		}
		
		/** 打仗完毕后的处理  **/
		public function proccessAfterBattle():void{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
			{
				var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
				if(battleModel){
					if(battleModel.hasNextMinorGuanka()){
						battleModel.goNextMinorGuanka();
					}else{
						GameSwitchSceneController.getInstance().enterFlash();
						var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
						if(guideModel && guideModel.isComplete){
							CommonControlFun.showFubemMap({});
						}
					}
				}
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)
			{
				GameSwitchSceneController.getInstance().enterFlash();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				GameSwitchSceneController.getInstance().enterFlash();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				GameSwitchSceneController.getInstance().enterFlash();
			}
		}
		
		
		public function enterFlash():void
		{
			PlayerGuideManager.getInstance().stopGuide();
			
			var tempType:String=GameSwitchSceneController.btType;
			GunChangeManager.getInstance().endBattle();
			ModuleManager.getInstance().unLoadmodule(CoreConfig.NAME);
			trace("enterFlash");
//			GameManager.stopBattle();
			isInBattle=false;
			GlobalRef.stage.frameRate=30;
			ModuleManager.getInstance().loadmodule(CoreConfig.NAME);
//			clearBattleView();
			GlobalRef.scaleEnterance();
			LayerController.instance.clear();
			LayerController.instance.init(GlobalRef.root);
			Context.getInsance().coreDispatcher.dispatchEvent(new CoreEvent(CoreEvent.GameInitComplete));
			
			
		 	if(tempType==CoreSwitchEvent.BT_Copy)
			{
				/*var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
				if(guideModel && guideModel.isComplete){
					CommonControlFun.showFubemMap({});
				}*/
				
			}
			else if(tempType==CoreSwitchEvent.BT_JinkuangQugan){
				var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
				WindowManager.openOnlyWinodw(JinkuangWindow,jinkuangModel.cacheRukouData);
				jinkuangModel.quganResult();
			}else if(tempType==CoreSwitchEvent.BT_JinkuangLveduo){
				var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
				WindowManager.openOnlyWinodw(JinkuangWindow,jinkuangModel.cacheRukouData);
				jinkuangModel.lveduoResult();
			}
		}
		
		private function clearBattleView():void{
			
		}
	}
}