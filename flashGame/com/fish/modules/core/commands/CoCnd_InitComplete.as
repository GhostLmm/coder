package com.fish.modules.core.commands
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.preloadMD.PreloadConfig;
	import com.fish.modules.preloadMD.mediators.PreloadLayer;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ModuleManager;
	import com.ghostlmm.lightMVC.api.IInjector;
	import com.ghostlmm.lightMVC.impl.Command;
	import com.ghostlmm.lightMVC.impl.ViewAssemble;
	import com.greensock.TweenLite;
	
	import core.LayerController;
	import core.PlayerGuideManager;
	
	import ui.window.Wnd_Announcement;
	
	import util.SwitchManager;
	import util.Util;
	
	public class CoCnd_InitComplete extends Command
	{
		[Inject]
		public var inject:IInjector;
		[Inject]
		public var timerModel:TimerModel;
		public function CoCnd_InitComplete()
		{
			super();
		}
		
		public override function excute():void
		{
			
//			SceneManager.getInstance().showScene(SceneManager.SN_Donfu);
//			
//			var uilayer:UILayer=new UILayer();
//			uilayer.setLayer(LayerControl.uiLayer);
//			uilayer.init();
//			ViewAssemble.bindMediator(uilayer);
			
//			LayerController.instance.init(
			
			Context.getInsance().logger.info("开始进入游戏");
			GameStatus.setStatus(GameStatus.ST_GameOngoing);
			
			Music.stopAll();
//			Music.play(Music.MC_Background,true);
			
//			LayerController.instance.stageLayer.addChild(LayerController.instance.stageLayer.dongfuScene);
//			LayerController.instance.stageLayer.dongfuScene.bindMediator();
//			ViewAssemble.bindMediator(LayerController.instance.stageLayer.dongfuScene);
//			
			ViewAssemble.bindMediator(LayerController.instance.uiLayer);
			var preloadLayer:PreloadLayer=Context.getInjectInstance(PreloadLayer);
			if(preloadLayer){
				preloadLayer.remove();
			}
			ModuleManager.getInstance().unLoadmodule(PreloadConfig.NAME);
			TweenLite.delayedCall(0.3,function():void{
				if(SwitchManager.getInstance().Switch_Gonggao)
				{
					if(!Wnd_Announcement.anounceFlag){
						Wnd_Announcement.anounceFlag=true;
						/*if(PlayerGuideManager.getInstance()._tutorialComplete){
//							WindowManager.getWindowByClass(Wnd_Announcement).open();
						}*/
					}
				}
			});
			
			
			
			GameRefreshControl.init();
			
			LayerController.instance.uiLayer.init();
			
			
			var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
			
			if(guideModel.isComplete){
				ViewAssemble.bindMediator(LayerController.instance.worldLayer);
				
				TweenLite.delayedCall(1,Util.showShouchongAfterChongzhi);
				
			}else{
				if(guideModel.isFirstGuide){
					TopTip.showBattleWait();
					guideModel.goFirstGuide();
				}else{
					PlayerGuideManager.getInstance().startGuide(LayerController.instance.guideLayer);
					ViewAssemble.bindMediator(LayerController.instance.worldLayer);
				}
			}
			
			
			
		}
	}
}