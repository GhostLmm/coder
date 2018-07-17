package snake
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.LeitaiModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.greensock.TweenLite;
	import com.greensock.plugins.FramePlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import core.LayerController;
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	
	import snake.npcer.GameNpcer;
	import snake.npcer.LeitaiNpcer;
	import snake.npcer.PaihangbangNpcer;
	import snake.viewdata.leitai.ViewData_LeitaiPerson;
	
	import ui.leitai.Bit_PlayerInfo_Leitai;
	import ui.leitai.Mc_ChangePerson_Leitai;
	import ui.leitai.Mc_PlayerInfo_Leitai;
	import ui.paihangbang.RankingWindow;
	
	import util.Dict;
	import util.GameTime;
	import util.SwitchManager;
	import util.Util;
	
	import view.CommonControlFun;

	public class GameItemManager
	{
		public static const MaxShowNum:int=3;
		private var leitaiInfoDic:Dict;
		private var leitaiPlayerInfoDic:Dict;
		private var btnChangeInfo:Object;
		private var playerInfo:Object;
		private var paihangButton:Object;
		private var zhucheng_bg_layer1_mark8:Object;
//		private var infoMc:Mc_PlayerRankInfo_Leitai;
		private var playerInfo_LeitaiVect:Vector.<Bit_PlayerInfo_Leitai>;
		private var btn_change_leitaiPlayer:Mc_ChangePerson_Leitai;
		private var playerInfoMc:Mc_PlayerInfo_Leitai;
		private var trans:Matrix=new Matrix();
		private var tempPoint:Point=new Point();
		private var isInit:Boolean=false;
		private var npcVect:Vector.<LeitaiNpcer>=new Vector.<LeitaiNpcer>();
		private var paihangbanger:PaihangbangNpcer;
//		private var paihangDiaoxiang:PaihangbangDiaoxiang;
		public static var canvas:GameCanvas;
		
		private var leitaiRewardButton:Object;
		
		private var leitaiModel:LeitaiModel;
		private var mouseTapCheckDic:Dict;
		
		public function GameItemManager()
		{
			
		}
		private static var m_instance:GameItemManager;
		public static function getInstance():GameItemManager
		{
			if(null==m_instance)
			{
				m_instance=new GameItemManager();
			}
			return m_instance;
		}
		public function init():void
		{
			leitaiModel=Context.getInjectInstance(LeitaiModel);
			leitaiModel.leitaiVoArrayChange_SN.add(onLeitaiInfoChange);
			LayerController.instance.worldLayer.addEventListener(TQTTouchEvent.TOUCH_TAP,onTouch_TAP);
			canvas=GameManager.manager.canvas;
			initData();	
			initMc();
			initNpcer();
			initPaihangbanger();
			initLeitaiRewardButton();
			isInit=true;
		}
		private function initLeitaiRewardButton():void
		{
			
		}
		private function onTouch_TAP(evt:Event):void
		{
			if(GameManager.manager && GameManager.manager.game_Gui 
				&& GameManager.manager.game_Gui.joystick && GameManager.manager.game_Gui.joystick.grabbed){
				return ;
			}
			var x:Number=canvas.bg.mouseX;
			var y:Number=canvas.bg.mouseY;
			for each(var obj:Object in mouseTapCheckDic)
			{	
				var rec:Rectangle=createRectangle(obj);
				if(rec.contains(x,y))
				{
					trace(obj.name);
					TapFunc(obj.name);
					break;
				}
			}
		}
		private function TapFunc(_name:String):void
		{
			switch(_name)
			{
				case "btn_change_leitaiPlayer":
					changeLeitaiPlayer();
					break;
				case "paihangButton":
				case "zhucheng_bg_layer1_mark8":
					if(SwitchManager.getInstance().Switch_Paihangbang){
						WindowManager.openOnlyWinodw(RankingWindow);
					}
					
					break;
				case "leitaiButton1":
				case "leitaiButton2":
				case "leitaiButton3":
					var index:int=_name.split("leitaiButton")[1];
					changeLeitaiPerson(index);
					break;
				case "leitaiRewardButton":
				case "playerInfo":
					CommonControlFun.gotoLeitaiReward();
					break;
			}
		}
		/**
		 * 挑战玩家消耗
		 */
		private var tiaoZhanCost:int=0;
		private function changeLeitaiPerson(_index:int):void
		{
			if(_index>leitaiModel.leitaiPersonsViewData.length)
			{
				return;
			}
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);			
			tiaoZhanCost=0;
			var fight_time:GameTime=new GameTime(leitaiModel._leitaiVo.lenqueTime-timeModel.serverTime);
			var str:String;
			if(!leitaiModel.countCouldTiaozhan())
			{
				tiaoZhanCost += Math.pow(1.5,Math.ceil((leitaiModel._leitaiVo.tiaozhanCount - LeitaiModel.getLeitaiFreeFightLimit())/2));
				if(fight_time.seconds>0)
				{
					tiaoZhanCost += Math.ceil(fight_time.seconds/int(leitaiModel.getTimeToMoneyUnit()));
					str=Util.getLanguage("挑战次数不足，挑战冷却",tiaoZhanCost)
					CommonControlFun.confirmDoSth(str,confirmChangeLeitaiPerson,[_index]);
				}
				else
				{
					str=Util.getLanguage("挑战次数不足",tiaoZhanCost)
					CommonControlFun.confirmDoSth(str,confirmChangeLeitaiPerson,[_index]);
				}
			}
			else
			{
				if(fight_time.seconds > 0) 
				{
					tiaoZhanCost += Math.ceil(fight_time.seconds/int(leitaiModel.getTimeToMoneyUnit()));
					str=Util.getLanguage("挑战冷却",tiaoZhanCost)
					CommonControlFun.confirmDoSth(str,confirmChangeLeitaiPerson,[_index]);
				} else 
				{
					confirmChangeLeitaiPerson(_index);
				}
			}
			
		}
		private function confirmChangeLeitaiPerson(_index:int):void
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(!userModel.cashCouldAfford(tiaoZhanCost))
			{
				CommonControlFun.cashNotEnoughDo();
				return;
			}
			leitaiModel.changeLeitaiPerson(_index);
		}
		public static const ChangeDerTime:int=2000;
		private var lastChangeTime:int=0;
		public static const PlayAnimTime:Number=0.25;
		
		/**
		 * 擂台换一批按钮 
		 */
		public function changeLeitaiPlayer():void
		{
			if(getTimer()-lastChangeTime>=ChangeDerTime)
			{
				C2SEmitter.getLeitaiPersonList();
				lastChangeTime=getTimer();
				var mc:MovieClip=btn_change_leitaiPlayer.mc;
				mc.gotoAndStop(1);
				var totalFrame:int=mc.totalFrames;
				TweenPlugin.activate([FramePlugin]);
				TweenLite.fromTo(mc,PlayAnimTime,{frame:1},{frame:totalFrame,onComplete:function():void
				{
					mc.gotoAndStop(1);
				}});
			}
			else
			{
				Util.flow("刷新擂台过于频繁");
			}
		}
		private static function createRectangle(_obj:Object):Rectangle
		{
			var rec:Rectangle=new Rectangle(_obj.x-canvas.cameraX,_obj.y-canvas.cameraY,_obj.width,_obj.height);
			return rec;
		}
		private function onLeitaiInfoChange():void
		{
			isInit=false;
			removeAll();
			initNpcer();
			initPaihangbanger();
			isInit=true;
		}
		public function removeAll():void{
			if(npcVect){
				for each(var npc:LeitaiNpcer in npcVect){
					npc.destory();
				}
				npcVect=new Vector.<LeitaiNpcer>();
			}
//			paihangbanger=null;
		}
		private function initData():void
		{
			mouseTapCheckDic=new Dict;
			leitaiInfoDic=new Dict;
			leitaiPlayerInfoDic=new Dict;
			var mapInfo:Object=GameManager.manager.mapInfo;
			var index:int;
			if(mapInfo.hasOwnProperty("leitaiInfo"))
			{
				var leitaiInfo:Object=mapInfo["leitaiInfo"];
				for(index=1;index<=MaxShowNum;index++)
				{
					var infoName:String="leitaiInfo"+index;
					leitaiInfoDic[index]=leitaiInfo[infoName];
				}
			}
			if(mapInfo.hasOwnProperty("leitaiPlayer"))
			{
				var leitaiPlayer:Object=mapInfo["leitaiPlayer"];
				for(index=1;index<=MaxShowNum;index++)
				{
					var playerName:String="leitaiPlayer"+index;
					leitaiPlayerInfoDic[index]=leitaiPlayer[playerName];
				}
			}
			if(mapInfo.hasOwnProperty("btn_change_leitaiPlayer"))
			{
				btnChangeInfo=mapInfo["btn_change_leitaiPlayer"]["btn_change_leitaiPlayer"];
				mouseTapCheckDic[btn_change_leitaiPlayer]=btnChangeInfo;
			}
			if(mapInfo.hasOwnProperty("playerInfo"))
			{
				playerInfo=mapInfo["playerInfo"]["playerInfo"];
				mouseTapCheckDic[playerInfo]=playerInfo;
			}
			if(mapInfo.hasOwnProperty("leitaiButton"))
			{
				var leitaiButton:Object=mapInfo["leitaiButton"];
				for(index=1;index<=MaxShowNum;index++)
				{
					var btnName:String="leitaiButton"+index;
					mouseTapCheckDic[leitaiButton[btnName]]=leitaiButton[btnName];
				}
			}
			
			if(mapInfo.hasOwnProperty("paihangButton"))
			{
				paihangButton=mapInfo["paihangButton"]["paihangButton"];
				mouseTapCheckDic[paihangButton]=paihangButton;
			}
			
			if(mapInfo.hasOwnProperty("pos_building"))
			{
				zhucheng_bg_layer1_mark8=mapInfo["pos_building"]["zhucheng_bg_layer1_mark8"];
				mouseTapCheckDic[zhucheng_bg_layer1_mark8]=zhucheng_bg_layer1_mark8;
			}
			
			if(mapInfo.hasOwnProperty("leitaiRewardButton"))
			{
				leitaiRewardButton=mapInfo["leitaiRewardButton"]["leitaiRewardButton"];
				mouseTapCheckDic[leitaiRewardButton]=leitaiRewardButton;
			}
		}
		public function logic():void
		{
			if(!isInit)
			{
				return;
			}
			npcerLogic();
		}
		private function npcerLogic():void
		{
			for each(var npc:GameNpcer in npcVect){
				npc.logic();
			}
			if(paihangbanger)
			{
				paihangbanger.logic();
			}
		}
		private function initMc():void
		{
//			infoMc=new Mc_PlayerRankInfo_Leitai();
			playerInfo_LeitaiVect=new Vector.<Bit_PlayerInfo_Leitai>();
			playerInfo_LeitaiVect.push(new Bit_PlayerInfo_Leitai(),new Bit_PlayerInfo_Leitai(),new Bit_PlayerInfo_Leitai() );
			btn_change_leitaiPlayer=new Mc_ChangePerson_Leitai();
			btn_change_leitaiPlayer.mc.stop();
			playerInfoMc=new Mc_PlayerInfo_Leitai();
		}
		private function initNpcer():void
		{
			npcVect=new Vector.<LeitaiNpcer>();
			var maxLeitaiPersion:int=leitaiModel.leitaiPersonsViewData.length;
			var index:int;
			for(index=1;index<=MaxShowNum&&index<=maxLeitaiPersion;index++)
			{
				var pInfo:Object=leitaiPlayerInfoDic[index];
				addNpc(leitaiModel.leitaiPersonsViewData[index-1],pInfo.x,pInfo.y);
			}
		}
		
		private function clearPaihangbanger():void{
			if(paihangbanger){
				paihangbanger.destory();
				paihangbanger=null;
			}
		}
		private function initPaihangbanger():void
		{
//			if(paihangDiaoxiang==null){
//				paihangDiaoxiang=new PaihangbangDiaoxiang();
//			}
//			paihangDiaoxiang.loadPersionData(GameVOManager.getInstance().paihangbangpersion,zhucheng_bg_layer1_mark8.x+70,zhucheng_bg_layer1_mark8.y);
			
			
			
			if(null!=GameVOManager.getInstance().paihangbangpersion)
			{
				clearPaihangbanger();
				paihangbanger=new PaihangbangNpcer();
				paihangbanger.initFromLeitaiViewData(GameVOManager.getInstance().paihangbangpersion,zhucheng_bg_layer1_mark8.x+70,zhucheng_bg_layer1_mark8.y+5);
			}else{
				clearPaihangbanger();
			}
			
		}
		
		private function destroyMc():void
		{
//			if(infoMc){infoMc.destory();infoMc=null;};
//			if(paihangDiaoxiang) {paihangDiaoxiang.destory();paihangDiaoxiang=null;}
			if(playerInfo_LeitaiVect){
				for each(var bitInfo:Bit_PlayerInfo_Leitai in playerInfo_LeitaiVect){
					bitInfo.destory();
				}
				playerInfo_LeitaiVect=null;
			}
			
			if(btn_change_leitaiPlayer){btn_change_leitaiPlayer.destory();btn_change_leitaiPlayer=null;};
			if(playerInfoMc){playerInfoMc.destory();playerInfoMc=null;};
		}
		public function render():void
		{
			if(isInit==false)
			{
				return;
			}
			renderLeitaiInfo();
			renderBtnChange();
			renderPlayerInfo();
			
			renderPaihangbang();
			renderNpcer();
		}
		private function renderPaihangbang():void{
			/*if(paihangDiaoxiang && paihangDiaoxiang.active){
				if( (paihangDiaoxiang.x-canvas.cameraX) > -200 && (paihangDiaoxiang.x-canvas.cameraX)<(canvas.screenWidth + 200) ){
					if( (paihangDiaoxiang.y-canvas.cameraY) > -200 && (paihangDiaoxiang.y-canvas.cameraY) < (canvas.screenHeight + 200) ){
						//						tempPoint.x=
						tempPoint.x=paihangDiaoxiang.x-canvas.cameraX+paihangDiaoxiang._bound.x;
						tempPoint.y=paihangDiaoxiang.x-canvas.cameraY+paihangDiaoxiang._bound.y;
						canvas.bm.copyPixels(paihangDiaoxiang.bitdata,paihangDiaoxiang.bitdata.rect,tempPoint);
						
						tempPoint.x=paihangDiaoxiang.x-paihangDiaoxiang.playerInfo.bitdata.width/2-canvas.cameraX;
						tempPoint.y=paihangDiaoxiang.y-canvas.cameraY;
						canvas.bm.copyPixels(paihangDiaoxiang.playerInfo.bitdata,paihangDiaoxiang.playerInfo.bitdata.rect,tempPoint,null,null,true);
					}
				}
			}*/
		}
		public function addNpc(viewData:ViewData_LeitaiPerson,_x:Number,_y:Number):void{
			var npc:LeitaiNpcer=new LeitaiNpcer();
//			npc.initData(id,_x,_y);	
			npc.initFromLeitaiViewData(viewData,_x,_y);
			npcVect.push(npc);
		}
		private function renderNpcer():void
		{
			for each(var npc:GameNpcer in npcVect){
				npc.render();
			}
			if(paihangbanger)
			{
				paihangbanger.render();
			}
		}
		private function renderPlayerInfo():void
		{
			if( (playerInfo.x-canvas.cameraX) > -200 && (playerInfo.x-canvas.cameraX)<(canvas.screenWidth + 200) ){
				if( (playerInfo.y-canvas.cameraY) > -200 && (playerInfo.y-canvas.cameraY) < (canvas.screenHeight + 200) ){
					trans.createBox(1, 1,0, playerInfo.x- canvas.cameraX, playerInfo.y- canvas.cameraY);
					canvas.bm.draw(playerInfoMc,trans);
				}
			}
			
		}
		private function renderBtnChange():void
		{
			if( (btnChangeInfo.x-canvas.cameraX) > -200 && (btnChangeInfo.x-canvas.cameraX)<(canvas.screenWidth + 200) ){
				if( (btnChangeInfo.y-canvas.cameraY) > -200 && (btnChangeInfo.y-canvas.cameraY) < (canvas.screenHeight + 200) ){
					trans.createBox(1, 1,0, btnChangeInfo.x- canvas.cameraX, btnChangeInfo.y- canvas.cameraY);
					canvas.bm.draw(btn_change_leitaiPlayer.mc,trans);
				}
			}
		}
		private function renderLeitaiInfo():void
		{
			var index:int;
			for(index=1;index<=npcVect.length;index++)
			{
				var leitaiInfo:Object=leitaiInfoDic[index];
				var leitaiView:ViewData_LeitaiPerson=leitaiModel.getLeitaiInfoByIndex(index);
//				infoMc._fnt_paiming_num.text=leitaiView.leitaiRank.toString();
//				infoMc._fnt_zhanli_num.text=leitaiView.fightPoint.toString();
				var bitPlayerInfo:Bit_PlayerInfo_Leitai=playerInfo_LeitaiVect[index-1];
				bitPlayerInfo.setData(leitaiView);
				tempPoint.x=leitaiInfo.x-canvas.cameraX+bitPlayerInfo._bound.x;
				tempPoint.y=leitaiInfo.y-canvas.cameraY+bitPlayerInfo._bound.y;
				
				if( (leitaiInfo.x-canvas.cameraX) > -200 && (leitaiInfo.x-canvas.cameraX)<(canvas.screenWidth + 200) ){
					if( (leitaiInfo.y-canvas.cameraY) > -200 && (leitaiInfo.y-canvas.cameraY) < (canvas.screenHeight + 200) ){
//						tempPoint.x=
						canvas.bm.copyPixels(bitPlayerInfo.bitdata,bitPlayerInfo.bitdata.rect,tempPoint,null,null,true);
					}
				}
				
//				trans.createBox(1, 1,0, leitaiInfo.x- canvas.cameraX, leitaiInfo.y- canvas.cameraY);
//				canvas.bm.draw(infoMc,trans);
			}
		}
		public function destroy():void
		{
			isInit=false;
			leitaiModel.leitaiVoArrayChange_SN.remove(onLeitaiInfoChange);
			leitaiModel=null;
			TweenLite.killTweensOf(btn_change_leitaiPlayer.mc);
			destroyMc();
			leitaiInfoDic=null;
			leitaiPlayerInfoDic=null;
			removeAll();
			npcVect=null;
		}
		
	}
}