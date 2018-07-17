package com.fish.modules.core
{
	import com.fish.GLBaseData;
	import com.fish.GameCommand;
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.models.ChongzhiModel;
	import com.fish.modules.core.models.GuankaModel;
	import com.fish.modules.core.models.HeroModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.preloadMD.PreloadConfig;
	import com.fish.modules.preloadMD.events.PreloadEvent;
	import com.fish.modules.preloadMD.mediators.PreloadLayer;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ModuleManager;
	import com.ghostlmm.socketCommunication.Transport;
	import com.ghostlmm.xmldata.Node_chongzhi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import Tool.chongzhiCheck.CheckItem;
	import Tool.platform.PlatformManager;
	
	import core.LayerController;
	import core.WindowManager;
	
	import snake.BattleEnterance;
	import snake.GameManager;
	
	import ui.chongzhi.ShouchongWindow;
	import ui.dig.AutoDigInfoData;
	import ui.dig.DigRewardWindow;
	import ui.layer.MDI_NewWorld;
	import ui.widget.FlowBigText;
	
	import util.Util;

//	import com.fish.view.window.WindowManager;
//	import com.fish.view.window.WindowName;

	public class ViewControl
	{
		public function ViewControl()
		{
		}
		
		
		/** 
		 *   重新进入主城初始化状态
		 */
		public static function reEnterGameStartScene():void{
			GameSwitchSceneController.btType=null;
			BattleEnterance.clear();
			GameCommand.clear();
			trace("重新进入游戏");
			Transport.CloseSocket();
//			GameStatus.setStatus(GameStatus.ST_Logining);
			
			Util.clearTopTip();
			Util.clearGame();
			Util.GC();
			var preloadLayer:PreloadLayer=Context.getInjectInstance(PreloadLayer);
			if(preloadLayer){
				preloadLayer.remove();
			}
			ModuleManager.getInstance().unLoadmodule(PreloadConfig.NAME);
			LayerController.instance.init(GlobalRef.root);
			
			ModuleManager.getInstance().loadmodule(PreloadConfig.NAME);
			ModuleManager.getInstance().loadmodule(CoreConfig.NAME);
			
			SocketControl.init();
			SocketControl.start();
			
//			XMLDataManager.reset();
//			GLBaseData.clear();
			
			
//			Context.getInsance().coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.StartPreload));
		}
		
		
		/**
		 *   重新进入游戏
		 */
		public static function reEnterGame():void{
			GameSwitchSceneController.btType=null;
			BattleEnterance.clear();
			GameCommand.clear();
			trace("重新进入游戏");
			Transport.CloseSocket();
			GameStatus.setStatus(GameStatus.ST_Logining);
			
			Util.clearTopTip();
			Util.clearGame();
			Util.GC();
			XMLDataManager.reset();
			GLBaseData.clear();
			
			var preloadLayer:PreloadLayer=Context.getInjectInstance(PreloadLayer);
			if(preloadLayer){
				preloadLayer.remove();
			}
			ModuleManager.getInstance().unLoadmodule(PreloadConfig.NAME);
			LayerController.instance.init(GlobalRef.root);
			
			ModuleManager.getInstance().loadmodule(PreloadConfig.NAME);
			Context.getInsance().coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.StartPreload));
		}

		public static function init():void
		{
			S2CHanlder.instance.message_SN.add(proccessMessageToView);
//			PaymentControl.getInstance().paySuccessSN.add(onPaySuccess);
			PlatformManager.getInstance().paySuccessSN.add(onPaySuccess);
			
			S2CHanlder.instance.authorError_SN.add(onAuthorError);
			
			S2CHanlder.instance.serverDataError_SN.add(onServerDataError);
			
			S2CHanlder.instance.serverRestart_SN.add(onServerRestart);
			
//			userModel.vipLevelChangSignal.add(onVipLevelChange);
			
			TAbDebug.debug_SN.add(debugTest);
			
			PlatformManager.getInstance().union_login_SN.add(onUnionLoginComplete);
			
			(Context.getInjectInstance(UserModel) as UserModel).levelUp_SN.add(onLevelUp);
			
			(Context.getInjectInstance(HeroModel) as HeroModel).heroAttrUpdate_SN.add(onHeroAttrChange);
			(Context.getInjectInstance(GuankaModel) as GuankaModel).wakangJieshuang_SN.add(onWakangJieshuan);
			(Context.getInjectInstance(ChongzhiModel) as ChongzhiModel).modelUpdata_SN.add(onChongzhiUpdate);
			TimerModel.instance.frame_SN.add(onFrame);
		}
		
		private static function onChongzhiUpdate():void{
			Util.showShouchongAfterChongzhi();
			Util.showChongzhiSuccessTip();
		}
		
		
		private static function onWakangJieshuan(data:AutoDigInfoData):void{
			WindowManager.openOnlyWinodw(DigRewardWindow,data);
		}
		
		private static function onHeroAttrChange(oldZhanli:int):void{
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var offset:int=heroModel.heroZhandouli-oldZhanli;
			trace("战斗力变化： \t"+offset);
			if(offset!=0){
				FlowBigText.flow(offset,FlowBigText.ST_Zhandouli);
			}
			
		}
		
		private static function onFrame(time:Number):void{
			var mdi_world:MDI_NewWorld=Context.getInjectInstance(MDI_NewWorld);
			
			if(LayerController.instance.sceneLayer && LayerController.instance.sceneLayer.curScene!=null){
				GameManager.pause();
				LayerController.instance.worldLayer.visible=false;
				if(mdi_world){
					mdi_world.stop();
				}
			}else{
				if(LayerController.instance.worldLayer) {
					LayerController.instance.worldLayer.visible=true;
				}
				if( (WindowManager.hasWindowOpen() && WindowManager.getCurrentOpenedWindowByClass(DigRewardWindow)==null)
					|| (LayerController.instance.liaotianLayer && LayerController.instance.liaotianLayer.hasShowLiaotian()) ){
					GameManager.pause();
				}else{
					GameManager.resume();
				}
				if(mdi_world){
					mdi_world.resume();
				}
			}
			
		}
		
		private static function onLevelUp(level:int):void{
//			Util.showLevelUpWindow();
		}
		
		private static function onUnionLoginComplete(success:Boolean):void{
			if(!success) return ;
			
			if(SwitchConfig.ST_UserUnionAccount==false) return ;
			
			//如果是在游戏进行中，账号重新登录的话
			if(GameStatus.status==GameStatus.ST_GameOngoing){
				trace("\n\r????????????????????????????????????????");
				trace("账号切换，清理游戏");
				trace("\n\r????????????????????????????????????????");
				GameStatus.setStatus(GameStatus.ST_SwitchAccount);
				Util.clearTopTip();
				Util.clearGame();
				Util.GC();
				XMLDataManager.reset();
				GLBaseData.clear();
				
				
				var preloadLayer:PreloadLayer=Context.getInjectInstance(PreloadLayer);
				if(preloadLayer){
					preloadLayer.remove();
				}
				ModuleManager.getInstance().unLoadmodule(PreloadConfig.NAME);
				LayerController.instance.init(GlobalRef.root);
				
//				ModuleManager.getInstance().loadmodule(PreloadConfig.NAME);
//				Context.getInsance().coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.StartPreload));
				
				ModuleManager.getInstance().loadmodule(PreloadConfig.NAME);
				Context.getInsance().coreDispatcher.dispatchEvent(new PreloadEvent(PreloadEvent.StartPreload));
				trace("切换账号 contro");
				//平台派发出登陆事件
				if(PlatformManager.getInstance().platformObj.openId!=null){
					PlatformManager.getInstance().union_login_SN.dispatch(true);
				}
				
			}
			
		}
		
		
		
		private static function debugTest(type:String,args:Array):void
		{
			if(type=="error" && args.length){
				var code:int=int(args[0]);
				onServerDataError(code);
			}
			if(type=="tip"){
//				TopTip.showExitTip(Util.getLanguage("购买月卡成功提示"));
			}
		}
		
		private static const HT_FlowText:int=1;
		private static const HT_RefreshTip:int=2;
		private static const HT_ExitGameTip:int=3;
		private static const HT_Alert:int=4;
		
		public static function onNetWrong(errorCode:int):void
		{
			onServerDataError(errorCode);
		}
		
		private static function onServerRestart():void
		{
			onServerDataError(ErrorCode.SERVER_RESTART);
		}
		
		
		
		
		public static function onAuthorError():void
		{
			//如果不在战斗场景中
//			if(!SwitchSceneController.getInstance().isInBattle)
//			{
//				var obj:Object={};
//				obj.data={msg:Util.getLanguage("author验证出错")};
//				var jingao:JinggaoWindow=WindowManager.getWindowByClass(JinggaoWindow,obj) as JinggaoWindow;
//				jingao.addEventListener(TqtEvent.ALERT_OK,Util.exitGame);
//				jingao.addEventListener(TqtEvent.ALERT_CANCEL,Util.exitGame);
//				jingao.open();
//			}
//			TopTip.showExitTip(Util.getLanguage("author验证出错"),Util.exitGame,null,false);
			onServerDataError(ErrorCode.AUTHOR_ERROR);
		}
		
		private static function onServerDataError(errorCode:int):void
		{
//			if(!SwitchSceneController.getInstance().isInBattle)
//			{
//				var obj:Object={};
//				obj.data={msg:Util.getLanguage("服务器数据出错")};
//				var jingao:JinggaoWindow=WindowManager.getWindowByClass(JinggaoWindow,obj) as JinggaoWindow;
//				jingao.addEventListener(TqtEvent.ALERT_OK,GameRefreshControl.refresh);
//				jingao.addEventListener(TqtEvent.ALERT_CANCEL,GameRefreshControl.refresh);
//				jingao.open();
//			}
			var tipKey:String;
			//			var needRefresh:Boolean=false;
			var handleType:int=0;
			
			switch(errorCode){
				case ErrorCode.USER_LEVEL_LOW:
					tipKey="error_等级不够";
					handleType=HT_FlowText;
					break;
				case ErrorCode.USER_MONEY_LOW:
					tipKey="error_铜钱不够";
					handleType=HT_FlowText;
					break;
				case ErrorCode.USER_CASH_LOW:
					tipKey="error_元宝不够";
					handleType=HT_FlowText;
					break;
				case ErrorCode.TIME_NOT_ACHIEVE:
					tipKey="error_服务器时间未到";
					handleType=HT_FlowText;
					break;
				case ErrorCode.CHIKASHU_ARCHIVE:
					tipKey="error_持卡数超过上限";
					handleType=HT_FlowText;
					break;
				case ErrorCode.YAOQIANSHU_END:
					tipKey="error_摇钱树领取完毕";
					handleType=HT_FlowText;
					break;
				case ErrorCode.INDEX_WRONG:
					break;
				case ErrorCode.TILI_FULL:
					tipKey="error_体力已满";
					handleType=HT_FlowText;
					break;
				case ErrorCode.CHANMIAN_FULL:
					tipKey="error_缠绵次数已满";
					break;
				case ErrorCode.INVALIED_OPER:
					tipKey="error_非法操作";
					handleType=HT_FlowText;
					break;
				case ErrorCode.NOT_RESOURCE:
					tipKey="error_缺少资源";
					handleType=HT_FlowText;
					break;
				case ErrorCode.SERVER_INNER_ERROR:
					tipKey="error_服务器内部错误";
					//					handleType=HT_FlowText;
					break;
				case ErrorCode.HANDLE_FAILED:
					tipKey="error_操作失败";
					handleType=HT_FlowText;
					break;
				case ErrorCode.REPEATED_OPER:
					tipKey="error_重复操作";
					handleType=HT_FlowText;
					break;
				case ErrorCode.MESSAGE_ERROR:
					break;
				case ErrorCode.FIGHT_COUNT_CRASH:
					break;
				case ErrorCode.BATTLE_USER_RANK_ERROR:
					handleType=0;
					break;
				case ErrorCode.BATTLE_LENGQUE_ZHONG:
					break;
				case ErrorCode.LEITAIBOX_TIME_NOT_ARCHIVE:
					break;
				case ErrorCode.PET_NOT_EXISTS:
					break;
				case ErrorCode.SKILL_NOT_EXISTS:
					break;
				case ErrorCode.FLAG_NOT_ENOUGH:
					break;
				case ErrorCode.BONUS_NOT_EXITS:
					break;
				case ErrorCode.KEY_NOT_ENOUGH:
					break;
				case ErrorCode.CANMAN_MAX:
					break;
				case ErrorCode.LINGQU_MAX:
					break;
				case ErrorCode.USE_TILI_ITEM_ARCHIVE:
					break;
				case ErrorCode.VIP_NOT_ARCHIVE:
					break;
				case ErrorCode.LEVEL_NOT_ARCHIVE:
					break;
				case ErrorCode.SHOULAN_NOT_ENOUGH:
					break;
				case ErrorCode.SHOULAN_LOCKED:
					break;
				case ErrorCode.ALREADY_UNLOCK:
					break;
				case ErrorCode.SHOUHUNDAN_NOT_ENOUGH:
					break;
				case ErrorCode.FRIEND_NOT_EXISTS:
					handleType=0;
					break;
				case ErrorCode.PET_NOT_IN_SHOULAN:
					break;
				case ErrorCode.ATTACH_COUNT_OVER:
					break;
				case ErrorCode.FREIEND_HAS_USED:
					break;
				case ErrorCode.YONGQI_BUY_LIMIT:
					tipKey="error_勇气购买次数限制";
					handleType=HT_Alert;
					break;
				case ErrorCode.VIP_ITEM_BUY_LIMIT:
					tipKey="error_vip购买限制";
					break;
				case ErrorCode.LINGQU_TIME_EROR:
					break;
				case ErrorCode.AUTHOR_ERROR:
					tipKey="author验证出错";
					handleType=HT_ExitGameTip;
					break;
				case ErrorCode.SERVER_RESTART:
					tipKey="error_服务器重启";
					handleType=HT_ExitGameTip;
					break;
				case ErrorCode.NET_ERROR:
					tipKey="error_网络错误";
					handleType=HT_Alert;
					break;
				case ErrorCode.Error_ServerLogic:
					tipKey="error_服务器错误";
					handleType=HT_ExitGameTip;
					break;
				
			}
			
			if(handleType==HT_FlowText){
				Util.flow(tipKey);
			}
			if(handleType==HT_RefreshTip){
				TopTip.showExitTip(Util.getLanguage(tipKey),GameRefreshControl.refresh);
			}
			
			if(handleType==HT_ExitGameTip){
				TopTip.showExitTip(Util.getLanguage(tipKey),Util.exitGame,null,false);
			}
			
			if(handleType==HT_Alert){
				TopTip.showExitTip(Util.getLanguage(tipKey));
			}
			
			
//			TopTip.showExitTip(Util.getLanguage("服务器数据出错"),GameRefreshControl.refresh);
		}
		
		
		private static function onPaySuccess(checkItem:CheckItem):void
		{
			/*C2SEmitter.refreshAfterPayment();
			
			var chongzhiNode:Node_chongzhi=XMLDataManager.getChongzhiById(checkItem.postObj.pay_id);
			
//			var descText:String;
			if(chongzhiNode.id==XMLDataManager.getConstById("yuanbaoshuItemId").value){
//				Util.flow("购买月卡成功提示");
				TopTip.showExitTip(Util.getLanguage("购买月卡成功提示"));
				return ;
			}
			//如果是首冲
			if(checkItem.souchong){
				
//				var node_init:Node_init=(Context.getInjectInstance(UserModel) as UserModel).getInitNode();
//				var data:RewardsPackDataNew = Util.createPackData(XMLDataManager.getConstById("shouchong_id").value,node_init.shouchong_kapai_id,node_init.shouchong_pet_id);

			}else{
//				Util.flow("获得充值礼包",chongzhiNode.cash);
				TopTip.showExitTip(Util.getLanguage("获得充值礼包",chongzhiNode.cash));
			}*/
			
			
		}
		
		private static function proccessMessageToView(messageType:String):void
		{
			
		}
	}
}