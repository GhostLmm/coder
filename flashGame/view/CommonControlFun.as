package view
{
	import com.fish.GLBaseData;
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.ViewControl;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.ChoujiangModel;
	import com.fish.modules.core.models.FriendModel;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.net.LocalConnection;
	import flash.system.System;
	import flash.utils.Dictionary;
	
	import mx.formatters.DateFormatter;
	
	import core.LayerController;
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import snake.GameManager;
	import snake.PlayMoveGuide;
	
	import ui.AddMoneyWindow;
	import ui.battle.ExitbattleWindow;
	import ui.chaonengli.ChaonengliWindow;
	import ui.chongzhi.ChongzhiWindow;
	import ui.choujiang.ChoujiangXuanzeWindow;
	import ui.choujiang.ChoujiangfenjieWindow;
	import ui.equip.EquipCaozuoWindow;
	import ui.friend.HaoyouWindow;
	import ui.fuben.FubenCailiaoSelectWindow;
	import ui.gonghui.BanghuiMainWindow;
	import ui.gonghui.BanghuiShenqingWindow;
	import ui.gonghui.MDI_BanghuiShenqing;
	import ui.jinkuang.JinkuangRukouWindow;
	import ui.jinkuang.JinkuangWindow;
	import ui.layer.MDI_NewWorld;
	import ui.layer.SceneLayer;
	import ui.layer.UiLayer;
	import ui.leitai.LeitaiPkWindow;
	import ui.leitai.LeitaiRewardWindow;
	import ui.liaotian.LiaotianWindow;
	import ui.map.MapScene;
	import ui.paihangbang.PersondetailWindow;
	import ui.paihangbang.RankingWindow;
	import ui.shop.ShopWindow;
	import ui.window.JinggaoWindow;
	import ui.window.Wnd_Gonglve;
	import ui.window.mail.Panel_Basic_Mail;
	import ui.window.mail.Panel_Jinkuang_Mail;
	import ui.window.mail.YoujianWindow;
	
	import util.Util;
	


	public class CommonControlFun
	{
		public function CommonControlFun()
		{
		}
		public static function gotoXuanxiuWindow():void
		{
			
		}
		public static function gotoEquipQianghua():void
		{
			
		}
		/**
		 *  重新加载xml
		 */
		public static function reLoadGame():void
		{
			var desc:String=Util.getLanguage("活动配置文件需要更新，请重新加载游戏");
			var okFunc:Function=function():void
			{
				ViewControl.reEnterGame();
			}
			TopTip.showExitTip(desc,okFunc,okFunc,false);
		}
		public static function gotoZuoqiChakanWindow():void
		{
			
		}
		public static function showCopyBoxWindow():Boolean
		{
			return false;
		}
		public static function cashNotEnoughDo():void
		{
			var onChongzhiOk:Function=function():void
			{
				WindowManager.openOnlyWinodw(ChongzhiWindow);
			}
			var alert:JinggaoWindow;
			alert = new JinggaoWindow({data:{msg:Util.getLanguage("元宝数量不足，是否现在去充值")}});
			alert.addEventListener(TqtEvent.ALERT_OK,onChongzhiOk,false,0,true);
			alert.open();
		}
		
		public static function moneyNotEnoughDo():void{
			var onChongzhiOk:Function=function():void
			{
				WindowManager.openOnlyWinodw(AddMoneyWindow);
			}
			var alert:JinggaoWindow;
			alert = new JinggaoWindow({data:{msg:Util.getLanguage("money数量不足，是否现在去购买")}});
			alert.addEventListener(TqtEvent.ALERT_OK,onChongzhiOk,false,0,true);
			alert.open();
		}
		
		public static function proccessJudgeResult(re:JudgeResult):void{
			if(re.success==false){
				if(re.code==JudgeResult.CD_CashNotEnough){
					cashNotEnoughDo();
				}else if(re.code==JudgeResult.CD_UserMoneyNotEnough){
					moneyNotEnoughDo();
				}else{
					Util.flow(re.desc);
				}
			}
		}
		
		public static function showTongguanAlert():void
		{
			
		}
		public static function showLevelUpGuide():void
		{
				
		}
		public static function clearNeicun():void
		{
			try{
				System.gc();
				new LocalConnection().connect("foo");
			}catch(error : Error){
				
			}
		}
		public static function clearMaterial(container:DisplayObjectContainer):void
		{
			while(container.numChildren){
				var child:DisplayObject = container.removeChildAt(0);
				if(child){
					if(child is MovieClip){
						(child as MovieClip).stop();
					}
					if(child is Bitmap)
					{
						(child as Bitmap).bitmapData.dispose();
					}
				}
			}
		}
		public static function timeToString(_time:Number):String
		{
			var result:String="";
			var date:Date=new Date(_time);
			var dateFormate:DateFormatter=new DateFormatter();
//			dateFormate.formatString="YYYY-MM-DD JJ:NN:SS";
			dateFormate.formatString="JJ:NN:SS";
			result=dateFormate.format(date);
			trace(result);
			return result;
		}
		public static function timeToYMRHMS(_time:Number):String
		{
			var result:String="";
			var date:Date=new Date(_time);
			var dateFormate:DateFormatter=new DateFormatter();
			dateFormate.formatString="YYYY-MM-DD";
//			dateFormate.formatString="YYYY-MM-DD JJ:NN:SS";
			result=dateFormate.format(date);
			return result;
		}
		/**  打开boss window
		 * */
		public static function openBossWindow(needOpenAtkWindow:Boolean=false,bossXid:int=-1):void
		{
			
		}
		
		public static function openShengjiang():void{
			
		}
		
		/**   打开 
		 * */
		public static function openMonvWindow(fromBattle:Boolean=false):void{
			
		}
		
		
		private static var breathEffectDic:Dictionary=new Dictionary();
		public static const MaxSize:Number=1.0;
		public static const MinSize:Number=0.8;
		public static const DerTime:int=1;
		public static function setBreathEffect(_mc:DisplayObject):void
		{
			if(null!=breathEffectDic[_mc])
			{
				return;
			}
			breathEffectDic[_mc]=_mc;
			var setScaleToSmall:Function=function():void
			{
				TweenLite.fromTo(_mc,DerTime,{"scaleX":MaxSize,"scaleY":MaxSize},{"scaleX":MinSize,"scaleY":MinSize,"onComplete":setScaleToBig});
			};
			var setScaleToBig:Function=function():void
			{
				TweenLite.fromTo(_mc,DerTime,{"scaleX":MinSize,"scaleY":MinSize},{"scaleX":MaxSize,"scaleY":MaxSize,"onComplete":setScaleToSmall});
			}
			setScaleToSmall();
		}
		public static function stopBreathEffect(_mc:DisplayObject):void
		{
			if(null!=breathEffectDic[_mc])
			{
				TweenLite.killTweensOf(breathEffectDic[_mc]);
				breathEffectDic[_mc]=null;
			}
		}
		
		private static var visibleEffectDic:Dictionary=new Dictionary();
		public static const MaxVisible:Number=1.0;
		public static const MinVisible:Number=0.0;
		public static const DerTimeVisible:int=1;
		public static function setVisibleEffect(_mc:DisplayObject):void
		{
			if(null!=visibleEffectDic[_mc])
			{
				return;
			}
			visibleEffectDic[_mc]=_mc;
			var setScaleToSmall:Function=function():void
			{
				TweenLite.fromTo(_mc,DerTimeVisible,{"alpha":MaxVisible},{"alpha":MinVisible,"onComplete":setScaleToBig});
			};
			var setScaleToBig:Function=function():void
			{
				TweenLite.fromTo(_mc,DerTimeVisible,{"alpha":MinVisible},{"alpha":MaxVisible,"onComplete":setScaleToSmall});
			}
			setScaleToSmall();
		}
		public static function stopVisibleEffect(_mc:DisplayObject):void
		{
			if(null!=visibleEffectDic[_mc])
			{
				TweenLite.killTweensOf(visibleEffectDic[_mc]);
				visibleEffectDic[_mc]=null;
			}
		}
		
		
		public static function checkIfMySelf(_uid:int):Boolean
		{
			if(_uid==int(GLBaseData.userId))
			{
				return true;
			}
			return false;
		}
		
		
		/**  显示帮助
		 * */
		public static function showHelpWebpage():void{
			if(WindowManager.getCurrentOpenedWindowByClass(Wnd_Gonglve)==null){
				WindowManager.openOnlyWinodw(Wnd_Gonglve);
			}
			
		}
		public static function gotoKapaiLianhua():void
		{
			
		}
		public static function gotoMonvta():void
		{
			
		}
		public static function gotoBaibaoxiang():void
		{
			
		}
		public static function gotoShenmiShangdian():void
		{
			
		}
		public static function gotoChongzhi():void
		{
			
		}
		public static function gotoShoulan():void
		{
			
		}
		public static function gotoJiangliWindow():void
		{
			
		}

		public static function gotoBaoguo():void
		{
			
		}
		public static function gotoCaidanWindow():void
		{
			
		}
		public static function gotoMaoxiang():void
		{
			
		}
		public static function gotoNvpu(_isYaoqian:Boolean=false):void
		{
			
		}
		public static function gotoHuodongWindow():void
		{
			
		}
		public static function openBuzhenWindow():void
		{
			
		}
		/**
		 * 禁言之后的显示
		 */
		public static function JinyanDo():void
		{
			CommonControlFun.confirmDoSth(Util.getJinyanShowDesc(),null);
		}
		/**
		 * 确定做某事
		 */
		public static function confirmDoSth(_key:String,_confirm:Function,_param:Array=null):void
		{
			var onConfirmOk:Function=function():void
			{
				if(null!=_confirm)
				{
					if(null!=_param)
					{
						_confirm.apply(null,_param);
					}
					else
					{
						_confirm.apply();
					}
				}
			}
			var alert:JinggaoWindow;
			alert = new JinggaoWindow({data:{msg:Util.getLanguage(_key)}});
			alert.addEventListener(TqtEvent.ALERT_OK,onConfirmOk,false,0,true);
			alert.open();
		}
		/**
		 * 将时间转换为:5月10日 5:10
		 */
		public static function timeToMRHM(_time:Number):String
		{
			var result:String="";
			var date:Date=new Date(_time);
			var dateFormate:DateFormatter=new DateFormatter();
			var formatStr:String=Util.getLanguage("某月某日","MM","DD")+" JJ:NN";
			dateFormate.formatString=formatStr;
			result=dateFormate.format(date);
			return result;
		}
		/**
		 *  判断当前时间是否在时间段内
		 */
		public static function checkIfIsInTime(_beginTime:Number,_endTime:Number):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var _curTime:Number=timerModel.serverTime;
			if(_curTime<_beginTime)
			{
				re.success=false;
				re.code=JudgeResult.CD_Time_Nonarrival;
				return re;
			}
			if(_curTime>_endTime)
			{
				re.success=false;
				re.code=JudgeResult.CD_Time_Out;
				return re;
			}
			re.success=true;
			return re;
		}
		/**
		 * 将时间转换为年月日
		 */
		public static function timeToYMR(_time:Number):String
		{
			var result:String="";
			var date:Date=new Date(_time);
			var dateFormate:DateFormatter=new DateFormatter();
			dateFormate.formatString="YYYY.MM.DD";
			result=dateFormate.format(date);
			return result;
		}
		public static function openChaonengliWindow():void
		{
			WindowManager.openOnlyWinodw(ChaonengliWindow);
		}
		/**
		 * 打开商城
		 */
		public static function openShop():void
		{
//			openChaonengliWindow();
//			return;
			WindowManager.openOnlyWinodw(ShopWindow);
		}
		/**
		 * 进入邮件界面
		 */
		public static function gotoMail():void
		{
			PlayMoveGuide.openMail();
			
		}
		
		/** 进入挖矿 **/
		public static function enterWakuang():void{
			Context.getInsance().coreDispatcher.dispatchEvent(new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Mining}));
		}
		
		/** item不足， 进入item副本选择界面  **/
		public static function gotoGetItemMapSelectWindow(itemId:int):void{
			trace("打开副本item选择界面");
			WindowManager.openOnlyWinodw(FubenCailiaoSelectWindow,itemId);
		}
		public static function endBattle():void
		{
			if((GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)||(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
				||(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)||(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan))
			{
//				GameManager.manager.canvas.getRewardFlag=true;
				GameManager.manager.canvas.setRewardFlag();
			}
		}
		
		/** 是否在主城  **/
		public static function isInZhucheng():Boolean{
//			return Context.getInjectInstance(MDI_NewWorld);
			return GameManager.getManagerType()==GameManager.MG_Zhucheng;
		}
		
		/** 装备格子不够处理  **/
		public static function haldeEquipGridNotEnough():void{
			Util.flow("装备格子不够");
		}
		
		/** 人物走向副本 **/
		public static function gotoFuben(fubenId:int=-1):void{
			if(!isInZhucheng()) return ;
			// 如果副本打开的话 
			if(LayerController.instance && LayerController.instance.sceneLayer && LayerController.instance.sceneLayer.curScene 
				&& (LayerController.instance.sceneLayer.curScene  is MapScene) ){
				(LayerController.instance.sceneLayer.curScene as MapScene).initData({guideFuben:fubenId})
			}else{
				PlayMoveGuide.openFuben(fubenId);
			}
			
		}
		/** 人物走向祈愿塔  **/
		public static function gotoQiyuanta():void{
			if(!isInZhucheng()) return ;
			PlayMoveGuide.openQiyuan();
		}
		
		/** 人物走向挖矿 **/
		public static function gotoWakuang():void{
			if(!isInZhucheng()) return ;
			PlayMoveGuide.openWakuang();
		}
		/** 人物像排行榜走去 **/
		public static function gotoPaihangbang():void
		{
			if(!isInZhucheng()) return ;
			PlayMoveGuide.openPaihang();
		}
		
		/** 黑店购买  **/
		public static function gotoShop():void{
			if(!isInZhucheng()) return ;
			PlayMoveGuide.openShop();
		}
		
		/** 铁匠铺 **/
		public static function gotoTiejiangpu(op:String):void{
			PlayMoveGuide.openEquip(op);
		}
		
		/** 人物走向擂台  **/
		public static function gotoLeitai():void{
			
		}
		
		/** 打开强化界面  **/
		public static function gotoQianghua(gridId:int=-1):void{
			if(gridId==-1){
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{label:EquipCaozuoWindow.LB_Bianqiang});
			}else{
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{gid:gridId,label:EquipCaozuoWindow.LB_Bianqiang});
			}
			
		}
		/** 打开升星界面  **/
		public static function gotoShengxing(gridId:int=-1):void{
			if(gridId==-1){
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{label:EquipCaozuoWindow.LB_Shengxin});
			}else{
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{gid:gridId,label:EquipCaozuoWindow.LB_Shengxin});
			}
			
		}
		
		/** 打开镶嵌界面 **/
		public static function gotoXiangqian(gridId:int=-1):void{
			if(gridId==-1){
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{label:EquipCaozuoWindow.LB_Xiangqian});
			}else{
				WindowManager.openOnlyWinodw(EquipCaozuoWindow,{gid:gridId,label:EquipCaozuoWindow.LB_Xiangqian});
			}
			
		}
		
		/**
		 * 显示擂台pk的窗口
		 */
		public static function showLeitaiPkWindow():void
		{
			WindowManager.openOnlyWinodw(LeitaiPkWindow);
		}
		
		private static var funbenArgs:Object;
		/**
		 *   显示副本地图
		 */
		public static function showFubemMap($funbenArgs:Object=null):void{
			funbenArgs=$funbenArgs;
			LayerController.instance.sceneLayer.addScene(SceneLayer.Scene_Map,funbenArgs);
			/*funbenArgs=$funbenArgs;
			S2CHanlder.instance.message_SN.add(onMessage);
			var needGuid:Boolean=false;
			var guideFuben:int;
			if(funbenArgs!=null && funbenArgs.hasOwnProperty("guideFuben") ){
				needGuid=true;
				guideFuben=funbenArgs.guideFuben;
			}
			var sectionId:int;
			if(needGuid){
				sectionId=XMLDataManager.getFubenById(guideFuben).fuben_map-1;
			}else{
				sectionId=(Context.getInjectInstance(MapModel) as MapModel).getDefaultSection();
			}
			
			C2SEmitter.getBigFubenGuanming(sectionId+1);*/
		}
		
		private static function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_FubenNameGetHandler){
				LayerController.instance.sceneLayer.addScene(SceneLayer.Scene_Map,funbenArgs);
			}
		}
		
		
		public static function gotoChoujiangWindow():void
		{
//			gotoBanghui();return;
			var openXuanxiuWindow_V2:Function=function():void
			{
				WindowManager.openOnlyWinodw(ChoujiangXuanzeWindow);
			};
			var choujiangModel:ChoujiangModel=Context.getInjectInstance(ChoujiangModel);
			if(choujiangModel.hasInitVO()&&!isNaN(choujiangModel.choujiangVo.haixuanFreshTime)&&!isNaN(choujiangModel.choujiangVo.jingxuanFreshTime)){
				openXuanxiuWindow_V2();
			}else
			{
				choujiangModel.initComplete_SN.addOnce(openXuanxiuWindow_V2);
				choujiangModel.init();
			}
		}
		
		public static function gotoFriend():void
		{
			WindowManager.openOnlyWinodw(HaoyouWindow);
		}
		public static function gotoChat(type:String=null):void
		{
//			LayerController.instance.uiLayer.liaotianTwoMC.show();
//			WindowManager.openOnlyWinodw(LiaotianWindow);
			LayerController.instance.liaotianLayer.openLiaotian(type,false);
		}
		
		public static function addFriend(_name:String):void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var friendModel:FriendModel=Context.getInjectInstance(FriendModel);
			if (!userModel.friendNumCouldAfford(friendModel.CurrentHaoyouNum)) {
				Util.flow("好友已达上限");
				return;
			}
			friendModel.addFriend(_name);
		}
		public static function gotoJinkuang():void
		{
			WindowManager.openOnlyWinodw(JinkuangRukouWindow);
		}
		
		public static function confirmExitBattle():void
		{
			WindowManager.openOnlyWinodw(ExitbattleWindow);
		}
		
		public static function gotoBanghui():void
		{
			var onOptMessage:Function=function(_msgType:String,_code:int):void
			{
				if(_msgType==C2SEmitter.REQ_GetBanghuiInitHandler)
				{
					if(_code==1)
					{
						WindowManager.openOnlyWinodw(BanghuiMainWindow);
					}
					else
					{
						GonghuiModel.dealWithErrorCode(_code);
					}
				}
				if(_msgType==C2SEmitter.REQ_GetBanghuiListHandler)
				{
					if(_code==1)
					{
						var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
						if(gonghuiModel.myBanghuiData.bid>0)
						{
							S2CHanlder.instance.Opt_Message_SN.addOnce(onOptMessage);
							C2SEmitter.getBanghuiInitInfo();
						}
						else
						{
							WindowManager.openOnlyWinodw(BanghuiShenqingWindow,MDI_BanghuiShenqing.Rukou_Dongfu);
						}
					}
					else
					{
						GonghuiModel.dealWithErrorCode(_code);
					}
				}
			}
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			S2CHanlder.instance.Opt_Message_SN.addOnce(onOptMessage);
			if(gonghuiModel.areadyHaveBanghui())
			{
				C2SEmitter.getBanghuiInitInfo();
			}
			else
			{
				C2SEmitter.getBanghuiList();
			}	
		}
		
		/**
		 *  帮会创建成功后进行的操作
		 */
		public static function banghuiChuangjianSucDo():void
		{
			WindowManager.closeWindowByClass(BanghuiShenqingWindow);//关闭帮会列表窗口
			WindowManager.openOnlyWinodw(BanghuiMainWindow);
		}
		/**
		 *  帮会解散成功后进行的操作
		 */
		public static function banghuiJiesanSucDo():void
		{
			WindowManager.closeWindowByClass(BanghuiMainWindow);//关闭帮会主窗口
		}
		
		public static function gotoLeitaiReward():void
		{
			WindowManager.openOnlyWinodw(LeitaiRewardWindow);
		}
		/**
		 * 查看人物详情
		 */
		public static function showXiangqingWindow(_userId:int):void
		{
			WindowManager.openOnlyWinodw(PersondetailWindow,_userId);
		}
		/**
		 * 
		 */
		public static function openMailWindow(_panelClass:Class):void
		{
			WindowManager.openOnlyWinodw(YoujianWindow,_panelClass);
		}
		/**
		 * 显示抽奖分解窗口
		 */
		public static function showChoujiangFenjie(_equipNode:Node_equip,_timeLine:TimelineLite):void
		{
			var param:Object={};
			param["node"]=_equipNode;
			param["timeLine"]=_timeLine;
			WindowManager.openOnlyWinodw(ChoujiangfenjieWindow,param);
		}
		
		
		public static function showNetworkErrorTopReload(fn:Function,arg:Array=null):void{
			var okFn:Function=function():void{
				if(fn){
					fn.apply(null,arg);
				}
			};
			TopTip.showExitTip(Util.getLanguage("网络连接错误，请检查网络连接是否正常"),okFn,Util.exitGame,true,Util.getLanguage("重新连接"),Util.getLanguage("退出游戏"));
		}
		
		public static function showNetworkErrorTipNoReload():void{
			
			TopTip.showExitTip(Util.getLanguage("网络连接错误，请检查网络连接是否正常"),null,null,true,Util.getLanguage("确定"),null,false);
		}
	}
}