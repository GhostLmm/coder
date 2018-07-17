package core
{
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.GuideModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.TaskData;
	import com.ghostlmm.dig.DigGameControl;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.story.StoryManager;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_xinshouyindao;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import snake.GameManager;
	import snake.gameobj.Player;
	
	import ui.bag.BagEquipItem;
	import ui.bag.BagWindow;
	import ui.bag.Bag_Equip_Panel;
	import ui.choujiang.ChoujiangXuanzeWindow;
	import ui.choujiang.DanchouWindow;
	import ui.choujiang.JingxuanWindow;
	import ui.dig.DigJiashuTipWindow;
	import ui.dig.DigRewardWindow;
	import ui.equip.EquipBianqiangPanel;
	import ui.equip.EquipCaozuoWindow;
	import ui.equip.EquipChuandaiWindow;
	import ui.equip.EquipOpenWindow;
	import ui.fuben.FubenChakanWindow;
	import ui.gun.GenghuanqiangzhiWindow;
	import ui.gun.Item_GenghuanQiangzhi;
	import ui.layer.MDI_NewWorld;
	import ui.map.MapScene;
	import ui.mc.GuideMc;
	import ui.mc.JiantouMc;
	import ui.mc.YuanquanMc;
	import ui.task.Item_BaseTask;
	import ui.task.MDI_Task;
	import ui.task.TaskWindow;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	

	public class PlayerGuideManager
	{
	
		private var isGuilding:Boolean=false;
		private var timer:Timer;
		private var guideModel:GuideModel;
		private var container:Sprite;
		private var isActive:Boolean=false;
		
		private var targetTime:Number;
		
		private var enterPortalFlag:Boolean;
		
		private var mcDragFlag:Boolean=false;
		
		private function get currentStep():int{
			return guideModel.curGuideNode.id;
		}
		
		public function PlayerGuideManager()
		{
		}
		public function setCurrentStep():void
		{
			setComplete();
			SeconndEscape();
		}
		private function SeconndEscape():void
		{
		}
		private function setComplete():void
		{
			/*if(checkIfComplete())
			{
				_tutorialComplete=true;
			}
			else
			{
				_tutorialComplete=false;
			}*/
		}
		
		private function checkIfComplete():Boolean
		{
			var lastXml:Node_xinshouyindao=XMLDataManager.Node_xinshouyindaoArray[XMLDataManager.Node_xinshouyindaoArray.length-1] as Node_xinshouyindao;
			if(currentStep>=lastXml.id)
			{
				return true;
			}
			return false;
		}
		public function getCurrentStep():int
		{
			return currentStep;
		}
		private static var m_instance:PlayerGuideManager;
		public static function getInstance():PlayerGuideManager
		{
			if(null==m_instance)
			{
				m_instance=new PlayerGuideManager;
			}
			return m_instance;
		}
		public function startGuide($conatiner:Sprite):void
		{
			if(isActive) 
				trace("WAN DAN");
			isActive=true;
			enterPortalFlag=false;
			guideModel=Context.getInjectInstance(GuideModel);
			if(!guideModel.isComplete){
				initMoudle($conatiner);
				registerEvent();
				showStep();
				
			}
			
		}
		public function stopGuide():void
		{
			isActive=false;
			removeEvent();
			destoryModule();			
		}
		private function destoryModule():void
		{
			if(_arrow)
			{
				if(_arrow.parent){
					_arrow.parent.removeChild(_arrow);
				}
				_arrow.destory();
				_arrow=null;
			}
			if(_guideMc)
			{
				if(_guideMc.parent) _guideMc.parent.removeChild(_guideMc);
				_guideMc.destory();
				_guideMc=null;
			}
			if(_yuanquan){
				if(_yuanquan.parent) {_yuanquan.parent.removeChild(_yuanquan);}
				_yuanquan.destory();
				_yuanquan=null;
			}
			StoryManager.instance.storyComplete_SN.remove(onStoryCom);
			timer=null;
			
		}
		private var _arrow:JiantouMc;
		private var _guideMc:GuideMc;
		private var _yuanquan:YuanquanMc;
		private function initMoudle($conatiner:Sprite):void
		{
			container=$conatiner;
			timer=new Timer(500);
			
			if(null==_arrow)
			{
				_arrow=new JiantouMc();
			}
			if(null==_guideMc)
			{
				_guideMc=new GuideMc();
			}
			if(null==_yuanquan){
				_yuanquan=new YuanquanMc();
			}
			_arrow.mouseChildren=false;
			_arrow.mouseEnabled=false;
			_yuanquan.mouseChildren=false;
			_yuanquan.mouseEnabled=false;
			container.addChild(_yuanquan);
			container.addChild(_guideMc);
			container.addChild(_arrow);
		}
		private function moveStep(evt:Event=null):void
		{
			setVisable();
			try {
				switch(currentStep) {
					case 1001:
						pointTo(GameManager.manager.game_Gui.joystick.display);
						break;
					case 1003:
						pointTo(GameManager.manager.game_Gui.getShotBtn());
						break;
					case 3000:
						if(LayerController.instance.uiLayer){
							var shortKeyItem:DisplayObject=LayerController.instance.uiLayer.shortKey.getItemByKey(guideModel.curGuideNode.target);
							if(shortKeyItem){
								pointTo(shortKeyItem);
							}
						}
						break;
					case 3002:
						var choujiang:ChoujiangXuanzeWindow=WindowManager.getCurrentOpenedWindowByClass(ChoujiangXuanzeWindow) as ChoujiangXuanzeWindow;
						if(choujiang && choujiang._mc_jingxuan){
							pointTo(choujiang._mc_jingxuan);
						}
						break;
					case 3003:
						var jingxuanWindow:JingxuanWindow=Context.getInjectInstance(JingxuanWindow);
						if(jingxuanWindow){
							if(jingxuanWindow._mc_chouyici){
								pointTo(jingxuanWindow._mc_chouyici);
							}
						}
						break;
					case 3004:
						var danchouWindow:DanchouWindow=Context.getInjectInstance(DanchouWindow);
						if(danchouWindow && danchouWindow._btn_fanhui){
							pointTo(danchouWindow._btn_fanhui.view);
						}
						break;
					case 3005:
						var choujiangXuanzeWindow:ChoujiangXuanzeWindow=Context.getInjectInstance(ChoujiangXuanzeWindow);
						if(choujiangXuanzeWindow && choujiangXuanzeWindow._btn_close){
							pointTo(choujiangXuanzeWindow._btn_close.view);
						}
						break;
					case 4000:
						if(LayerController.instance.uiLayer && LayerController.instance.uiLayer.rb.btn_bg){
							pointTo(LayerController.instance.uiLayer.rb.btn_bg);
						}
						break;
					case 4001:
						var bagWindow:BagWindow=Context.getInjectInstance(BagWindow);
						if(bagWindow && bagWindow.showMovieCompleteFlag && bagWindow._heroModule._btn_gunghuanzhuangbei){
							pointTo(bagWindow._heroModule._btn_gunghuanzhuangbei);
						}
						break;
					case 4002:
						var genghuanWindow:GenghuanqiangzhiWindow=Context.getInjectInstance(GenghuanqiangzhiWindow);
						if(genghuanWindow && genghuanWindow._scr_gun){
							var item:Item_GenghuanQiangzhi = genghuanWindow._scr_gun.getRealyItemByIndex(1) as Item_GenghuanQiangzhi;
							if(item && item._btn_zhuqiang){
								pointTo(item._btn_zhuqiang);
							}
						}
						break;
					/*case 4003:
						var alert:AlertWindow=WindowManager.getCurrentOpenedWindowByClass(AlertWindow) as AlertWindow;
						if(alert && alert._btn_queding){
							pointTo(alert._btn_queding);
						}
						break;*/
					case 4004:
//						var genghuan:GenghuanqiangzhiWindow=Context.getInjectInstance(GenghuanqiangzhiWindow);
//						if(genghuan && genghuan._btn_queding){
//							pointTo(genghuan._btn_queding);
//						}
						break;
					case 4005:
						var bagWindow:BagWindow=Context.getInjectInstance(BagWindow );
						if(bagWindow && bagWindow.showMovieCompleteFlag && bagWindow._btn_close){
							pointTo(bagWindow._btn_close);
						}
						break;
					
					case 5000:
						if(LayerController.instance.uiLayer && LayerController.instance.uiLayer.rb.btn_help){
							pointTo(LayerController.instance.uiLayer.rb.btn_help);
						}
						break;
					case 5100:
						var item_task:Item_BaseTask=getTaskFirstItem();
						if(item_task && item_task._btn_lingqu){
							pointTo(item_task._btn_lingqu);
						}
						break;
					case 5101:
						var commonRewardWindow:CommonRewardWindow=Context.getInjectInstance(CommonRewardWindow);
						if(commonRewardWindow && commonRewardWindow._btn_queding){
							pointTo(commonRewardWindow._btn_queding);
						}
						break;
					case 5002:
						var item_task:Item_BaseTask=getTaskFirstItem();
						if(item_task && item_task._btn_qianwang){
							pointTo(item_task._btn_qianwang);
						}
						break;
					case 5004:
						var mc:DisplayObject=getMapMC(guideModel.curGuideNode.target);
						if(mc){
							pointTo(mc,true);
						}
						break;
					case 5005:
						var fubenChakanWindow:FubenChakanWindow=Context.getInjectInstance(FubenChakanWindow);
						if(fubenChakanWindow && fubenChakanWindow._btn_tiaozhan){
							pointTo(fubenChakanWindow._btn_tiaozhan);
						}
						break;
					case 5008:
						pointTo(GameManager.manager.game_Gui.getJumpBtn());
						break;
					case 5010:
						pointTo(GameManager.manager.game_Gui.getJumpBtn());
						break;
					case 6001:
						if(LayerController.instance.uiLayer){
							var shortKeyItem:DisplayObject=LayerController.instance.uiLayer.shortKey.getItemByKey(guideModel.curGuideNode.target);
							if(shortKeyItem){
								pointTo(shortKeyItem);
							}
						}
						break;
					case 6003:
						if(DigGameControl.instance.digGuide &&
							DigGameControl.instance.digGuide.guideTip &&
							DigGameControl.instance.digGuide.guideTip.btn_start){
							pointTo(DigGameControl.instance.digGuide.guideTip.btn_start);
						}
						break;
					case 6005:
						if(DigGameControl.instance.gameLayer && 
							DigGameControl.instance.gameLayer.digInfo &&
							DigGameControl.instance.gameLayer.digInfo._btn_jiasu){
							pointTo(DigGameControl.instance.gameLayer.digInfo._btn_jiasu.view);
						}
						break;
					case 6006:
						var digTipWindow:DigJiashuTipWindow=Context.getInjectInstance(DigJiashuTipWindow);
						if(digTipWindow){
							if(digTipWindow._btn_jiasu){
								pointTo(digTipWindow._btn_jiasu);
							}
						}
						break;
					case 6007:
						var digReward:DigRewardWindow=Context.getInjectInstance(DigRewardWindow);
						if(digReward && digReward._btn_queding){
							pointTo(digReward._btn_queding);
						}
						break;
					case 6008:
						if(DigGameControl.instance.gameLayer &&
							DigGameControl.instance.gameLayer.mcHuijia){
							pointTo(DigGameControl.instance.gameLayer.mcHuijia);
						}
						break;
					case 7000:
						if(LayerController.instance.uiLayer && LayerController.instance.uiLayer.rb.btn_bg){
							pointTo(LayerController.instance.uiLayer.rb.btn_bg);
						}
						if(DigGameControl.instance.gameLayer && DigGameControl.instance.gameLayer.rbUI && DigGameControl.instance.gameLayer.rbUI.btn_bg){
							pointTo( DigGameControl.instance.gameLayer.rbUI.btn_bg);
						}
						break;
					case 7001:
						var bagWindow:BagWindow=Context.getInjectInstance(BagWindow);
						if(bagWindow && bagWindow.showMovieCompleteFlag && bagWindow.labelSwitch &&
							(bagWindow.labelSwitch.m_currentPanel is Bag_Equip_Panel)){
							var equipPanel:Bag_Equip_Panel=bagWindow.labelSwitch.m_currentPanel;
							var equipItem:BagEquipItem=equipPanel.getEquipItemByXid(guideModel.getGuideEquipId());
							if(equipItem){
								pointTo(equipItem);
							}
						}
						break;
					case 7002:
						var chuandai:EquipChuandaiWindow=Context.getInjectInstance(EquipChuandaiWindow);
						if(chuandai && chuandai._btn_chuandai){
							pointTo(chuandai._btn_chuandai);
						}
						break;
					case 7004:
						var bagWindow:BagWindow=Context.getInjectInstance(BagWindow);
						if(bagWindow && bagWindow.showMovieCompleteFlag  && bagWindow._btn_close){
							pointTo(bagWindow._btn_close);
						}
						break;
					case 7006:
						if(DigGameControl.instance.gameLayer &&
							DigGameControl.instance.gameLayer.mcHuijia){
							pointTo(DigGameControl.instance.gameLayer.mcHuijia);
						}
						break;
					case 8000:
						if(LayerController.instance.uiLayer && LayerController.instance.uiLayer.rb.btn_help){
							pointTo(LayerController.instance.uiLayer.rb.btn_help);
						}
						break;
					case 8100:
						var item_task:Item_BaseTask=getTaskFirstItem();
						if(item_task && item_task._btn_lingqu){
							pointTo(item_task._btn_lingqu);
						}
						break;
					case 8101:
						var commonRewardWindow:CommonRewardWindow=Context.getInjectInstance(CommonRewardWindow);
						if(commonRewardWindow && commonRewardWindow._btn_queding){
							pointTo(commonRewardWindow._btn_queding);
						}
						break;
					case 8002:
						var item_task:Item_BaseTask=getTaskFirstItem();
						if(item_task && item_task._btn_qianwang){
							pointTo(item_task._btn_qianwang);
						}
						break;
					case 8004:
						var mc:DisplayObject=getMapMC(guideModel.curGuideNode.target);
						if(mc){
							pointTo(mc,true);
						}
						break;
					case 8005:
						var fubenChakanWindow:FubenChakanWindow=Context.getInjectInstance(FubenChakanWindow);
						if(fubenChakanWindow && fubenChakanWindow._btn_tiaozhan){
							pointTo(fubenChakanWindow._btn_tiaozhan);
						}
						break;
					case 9000:
						if(LayerController.instance.uiLayer && LayerController.instance.uiLayer.rb.btn_bg){
							pointTo(LayerController.instance.uiLayer.rb.btn_bg);
						}
						break;
					case 9001:
						var bagWindow:BagWindow=Context.getInjectInstance(BagWindow);
						if(bagWindow && bagWindow.showMovieCompleteFlag && bagWindow._heroModule){
							var node_equip:Node_equip=XMLDataManager.getEquipById(guideModel.getGuideEquipId());
							var partyItem:DisplayObject=bagWindow._heroModule.getPartyItemByGridId(node_equip.type);
							if(partyItem){
								pointTo(partyItem);
							}
						}
						break;
					case 9002:
						var equipOpenWindow:EquipOpenWindow=Context.getInjectInstance(EquipOpenWindow);
						if(equipOpenWindow && equipOpenWindow._btn_qianghua){
							pointTo(equipOpenWindow._btn_qianghua);
						}
						break;
					case 9003:
						var caozuoWindow:EquipCaozuoWindow=Context.getInjectInstance(EquipCaozuoWindow);
						if(caozuoWindow && caozuoWindow.showMovieCompleteFlag && caozuoWindow._labelSwitch && caozuoWindow._labelSwitch.m_currentPanel
							&& (caozuoWindow._labelSwitch.m_currentPanel is EquipBianqiangPanel) ){
							var bianqiangPanel:EquipBianqiangPanel=caozuoWindow._labelSwitch.m_currentPanel;
							if(bianqiangPanel._btn_qianghua){
								pointTo(bianqiangPanel._btn_qianghua);
							}
						}
						break;
					case 9005:
						var caozuoWindow:EquipCaozuoWindow=Context.getInjectInstance(EquipCaozuoWindow);
						if(caozuoWindow && caozuoWindow.showMovieCompleteFlag && caozuoWindow._btn_close){
							pointTo(caozuoWindow._btn_close);
						}
						break;
					case 11000:
						if(LayerController.instance.uiLayer && LayerController.instance.uiLayer.rb.btn_help){
							pointTo(LayerController.instance.uiLayer.rb.btn_help);
						}
						break;
					case 11100:
						var item_task:Item_BaseTask=getTaskFirstItem();
						if(item_task && item_task._btn_lingqu){
							pointTo(item_task._btn_lingqu);
						}
						break;
					case 11101:
						var commonRewardWindow:CommonRewardWindow=Context.getInjectInstance(CommonRewardWindow);
						if(commonRewardWindow && commonRewardWindow._btn_queding){
							pointTo(commonRewardWindow._btn_queding);
						}
						break;
					case 11002:
						var item_task:Item_BaseTask=getTaskFirstItem();
						if(item_task && item_task._btn_qianwang){
							pointTo(item_task._btn_qianwang);
						}
						break;
					case 11004:
						var mc:DisplayObject=getMapMC(guideModel.curGuideNode.target);
						if(mc){
							pointTo(mc,true);
						}
						break;
					case 11005:
						var fubenChakanWindow:FubenChakanWindow=Context.getInjectInstance(FubenChakanWindow);
						if(fubenChakanWindow && fubenChakanWindow._btn_tiaozhan){
							pointTo(fubenChakanWindow._btn_tiaozhan);
						}
						break;
					case 12000:
						if(_guideMc && _guideMc.btn_queding){
							pointTo(_guideMc.btn_queding);
						}
						break;
					
				}
			}catch(e:Error){}
			
			if(currentObj==null){
				_guideMc.visible=false;
				_arrow.visible=false;
				_yuanquan.visible=false;
			}
			
			if(guideModel.curGuideNode.passType==GuideModel.TP_TaskLogic){
				
				var taskItem:Item_BaseTask=getTaskFirstItem();
				if(taskItem){
					var taskData:TaskData=taskItem.data as TaskData;
					if(taskData.status==TaskData.ST_Complete){
						goNextStep(int(guideModel.curGuideNode.target));
						
					}else if(taskData.status==TaskData.ST_Active){
						goNextStep();
					}
				}
			}
		}
		
		
		public function getMapMC(mcName:String):DisplayObject{
			if(LayerController.instance.sceneLayer &&
				LayerController.instance.sceneLayer.curScene &&
				LayerController.instance.sceneLayer.curScene is MapScene){
				var mapScene:MapScene=LayerController.instance.sceneLayer.curScene;
				if(mapScene.curMap){
					return mapScene.curMap.getPosMc(mcName);
				}
			}
			return null;
		}
		
		private function getTaskFirstItem():Item_BaseTask{
			/*var taskWindow:TaskWindow=Context.getInjectInstance(TaskWindow);
			if(taskWindow && taskWindow.labelSwitch && taskWindow.labelSwitch.m_currentPanel
				&& taskWindow.labelSwitch.m_currentPanel is MainTaskPanel
			){
				var mainTaskPanel:MainTaskPanel=taskWindow.labelSwitch.m_currentPanel;
				if(mainTaskPanel._scroll){
					var item:Item_BaseTask=mainTaskPanel._scroll.getRealyItemByIndex(0) as Item_BaseTask;
					return item;
				}
			}
			return item;*/
			
//			var taskWindow:TaskWindow=Context.getInjectInstance(TaskWindow);
			var mdi_task:MDI_Task=Context.getInjectInstance(MDI_Task);
			if(mdi_task ){
				return mdi_task.getFirtTaskItem();
			}
			
			
			
			return null;
		}
		
		private var currentObj:DisplayObject;
		
		public function pointTo(obj:DisplayObject,isCenter:Boolean=false,offsetX:Number=0,offsetY:Number=0):void
		{
			if(isCenter){
				_arrow.pointToCenter(obj,offsetX,offsetY);
				_yuanquan.pointToCenter(obj,offsetX,offsetY);
			}else{
				_arrow.pointTo(obj);
				_yuanquan.pointTo(obj);
			}
			
			currentObj=obj;
		}
		/*private function showMc():void
		{
			_arrow.visible=true;
			_guideMc.visible=true;
			_guideMc.setButtonEnable(guideModel.curGuideNode.show>0);
//			setWarningDo();
		}*/
		/*private function setWarningDo():void
		{
			if(_warning)
			{
				_guideMc.setSceneVisible(true);
			}
		}*/
		private function hideMc():void
		{
			_arrow.visible=false;
			_guideMc.visible=false;
		}
		private function registerEvent():void
		{
			timer.addEventListener(TimerEvent.TIMER,moveStep);
			timer.start();
			GlobalRef.stage.addEventListener(TqtEvent.BUTTON_CLICK,onButtonClicked);
			
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_TAP,onMouseClick,true);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_BEGIN,onMouseDown,true);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_END,onMouseUp,true);
			GlobalRef.stage.addEventListener(Event.ENTER_FRAME,onEnterFrame);
			
			mcDragFlag=false;
			if(SwitchConfig.ST_GuideDrag){
				GlobalRef.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				GlobalRef.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
			}
			
			Player.PlayerHp_SN.add(onPlayerHpChange);
			StoryManager.instance.storyComplete_SN.add(onStoryCom);
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		
		private function onKeyDown(evt:KeyboardEvent):void{
			if(mcDragFlag) return ;
			if(evt.keyCode==Keyboard.CONTROL){
				mcDragFlag=true;
			}
		}
		private function onKeyUp(evt:KeyboardEvent):void{
			if(mcDragFlag){
				if(guideModel && _guideMc){
					trace("新手引导： "+guideModel.curGuideStep+"\t["+_guideMc.x+","+_guideMc.y+"]");
				}
				
				mcDragFlag=false;
			}
		}
		
		
		private function onMessage(msType:String):void{
			if(isActive && guideModel.curGuideNode.passType==GuideModel.TP_WaitMessage){
				if(msType==guideModel.curGuideNode.passArg){
					goNextStep();
				}
			}
		}
		
		public function onEnterPortal():void{
			if(isActive){
				enterPortalFlag=true;
				checkGuideProtal();
			}
		}
		
		public function onShowMap():void{
			if(isActive){
				if(guideModel.curGuideNode.passType==GuideModel.TP_WaitMap){
					goNextStep();
				}
			}
		}
		
		public function onGetEquip():void{
			if(isActive){
				if(guideModel.curGuideNode.passType==GuideModel.TP_WaitGetEquip){
					goNextStep();
				}
			}
		}
		
		
		private function checkGuideProtal():void{
			if(isActive && enterPortalFlag){
				if(guideModel.curGuideNode.passType==GuideModel.TP_EnterPortal){
					goNextStep();
				}
			}
		}
		
		private function onMouseClick(evt:Object):void
		{
			if(!getIfClickTarget(evt))
			{
				if(!_warning)
				{
					trace("停止MouseClick传递");
					if(guideModel.curGuideNode.forceClick>0){
						evt.stopImmediatePropagation();
					}
					/*if(FuncSwitchManager.getInstance().Switch_XinshouyindaoTiaoguo)
					{
						showWarning();
					}*/
				}
				else
				{
					if(guideModel.curGuideNode.forceClick>0){
						evt.stopImmediatePropagation();
					}
					
					/*if(evt.target.parent.name==_guideMc.btn_jixu.name)
					{
						stopWarning();
					}
					else if(evt.target.parent.name==_guideMc.btn_queding.name)
					{
						sendSkipTutorial();
						stopWarning();
						stopGuide();
					}*/
					sendSkipTutorial();
//					stopWarning();
					stopGuide();
				}
			}
		}
		private function sendSkipTutorial():void
		{
//			C2SEmitter.skipTutorial();
//			_tutorialComplete=true;
//			stopGuide();
		}
		public var _warning:Boolean=false;
		/*		
		public function showWarning():void
		{
			showMc();
			_warning = true;
			timer.removeEventListener(TimerEvent.TIMER,moveStep);
			setWarningDo();
			var node:Node_xinshouyindao = getTiaoguoXml();
			_guideMc.y = 0;
			_guideMc.desc = node.desc;
			_guideMc.btn_jixu.visible = true;
			_guideMc.btn_queding.visible = true;
			_arrow.pointTo(_guideMc.btn_jixu);
			LayerController.instance.windowLayer.mouseChildren=false;
			LayerController.instance.windowLayer.mouseEnabled=false;
			LayerController.instance.uiLayer.mouseChildren=false;
			LayerController.instance.uiLayer.mouseEnabled=false;
		}*/
		/*public function stopWarning():void
		{
			_warning = false;
			_guideMc.btn_jixu.visible = false;
			_guideMc.btn_queding.visible = false;
			LayerController.instance.windowLayer.mouseChildren=true;
			LayerController.instance.windowLayer.mouseEnabled=true;
			LayerController.instance.uiLayer.mouseChildren=true;
			LayerController.instance.uiLayer.mouseEnabled=true;
			showStep();
			timer.addEventListener(TimerEvent.TIMER,moveStep);
		}*/
		private function getTiaoguoXml():Node_xinshouyindao
		{
			return XMLDataManager.getXinshouyindaoById(0);
		}
		private function onMouseDown(evt:Object):void
		{
//			Util.showStageMouse();
			if(TopTip.hasShow){
				return ;
			}
			if(!getIfClickTarget(evt))
			{
				trace("停止MouseDown传递");
				if(guideModel.curGuideNode.forceClick>0){
					evt.stopImmediatePropagation();
				}
			}
		}
		private function getIfClickTarget(evt:Object):Boolean
		{
			if(hasWindowNotShield())
			{
				trace("窗口问题");
				return true;
			}
			
			if(null==currentObj)
			{
				if(guideModel.curGuideNode.forceClick>0){
					return false;
				}else{
					trace("当前要点击的东西没有");
					return true;
				}
				
			}
			var rect:Rectangle = currentObj.getRect(GlobalRef.stage);
			if((!rect.contains(evt.stageX,evt.stageY))||(_warning))
			{
				return false;
			}
			return true;
		}
		private function hasWindowNotShield():Boolean
		{
			return false;
		}
		private function onMouseUp(evt:Object):void
		{
			if(TopTip.hasShow){
				return ;
			}
			if(!getIfClickTarget(evt))
			{
				trace("停止MouseUp传递");
				if(guideModel.curGuideNode.forceClick>0){
					evt.stopImmediatePropagation();
				}
			}
		}
		private var isRight:Boolean=false;
		private function onButtonClicked(evt:TqtEvent):void
		{
			// 如果是 监听点击按钮的事件  
			if(!isActive) return;
			if(guideModel.curGuideNode.passType==GuideModel.TP_ClickBtn){
				trace("当前发出的data&&&&"+evt.data);			
				isRight=false;
				var currentStepName:String=getStepBtnName();
				trace("当前发出的name&&&&"+currentStepName);
				//			if(null==currentStepName)
				//			{
				//				return;
				//			}
				if(currentStepName==evt.data)
				{
					isRight=true;
					//				currentStep++;
					//				currentStep=getCurrentXml().next;
					goNextStep();
				}
				else
				{
					if(guideModel.curGuideNode.forceClick>0){
						evt.stopImmediatePropagation();
					}
					
				}
			}
			
			
		}
		private function getStepBtnName():String
		{
			var result:String="";
			var xml:Node_xinshouyindao=getCurrentXml();
			if(xml)
			{
				result=xml.target;
			}
			return result;
		}
		private function getCurrentXml():Node_xinshouyindao
		{
			var xml:Node_xinshouyindao=XMLDataManager.getXinshouyindaoById(currentStep);
			return xml;
		}
		private function removeEvent():void
		{
			GlobalRef.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			GlobalRef.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
			
			GlobalRef.stage.removeEventListener(TqtEvent.BUTTON_CLICK,onButtonClicked);
			if(timer){
				timer.removeEventListener(TimerEvent.TIMER,moveStep);
				timer.stop();
			}
			
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_TAP,onMouseClick,true);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_BEGIN,onMouseDown,true);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_END,onMouseUp,true);
			GlobalRef.stage.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
			Player.PlayerHp_SN.remove(onPlayerHpChange);
			StoryManager.instance.storyComplete_SN.remove(onStoryCom);
			S2CHanlder.instance.message_SN.remove(onMessage);
		}
		
		private function onPlayerHpChange():void{
			if(isActive){
				if(guideModel.curGuideNode.passType==GuideModel.TP_Hurt){
					goNextStep();
				}
			}
		}
		
		public function onFunbenSuccess(fubenId:int):void{
			if(isActive){
				if(guideModel.curGuideNode.passType==GuideModel.TP_WaitSuccess){
					goNextStep();
				}
			}
		}
		public function onFunbenFail(fubenId:int):void{
			if(isActive){
				/*if(guideModel.curGuideNode.passType==GuideModel.TP_WaitSuccess){
					guideModel.resetInterrup();
					stopGuide();
				}*/
				
				/*if(guideModel.curGuideNode.passType==GuideModel.TP_WaitSuccess ){
					trace("副本挑战结束： "+fubenId);
					if(fubenId!=XMLDataManager.Node_fubenArray[0].id){
						guideModel.resetInterrup();
						stopGuide();
					}else{
						stopGuideForFailBattle();
					}
					
				}*/
				trace("副本挑战结束： "+fubenId);
				if(fubenId!=XMLDataManager.Node_fubenArray[0].id){
					guideModel.resetInterrup();
					stopGuide();
				}else{
					stopGuideForFailBattle();
				}
				
			}
		}
		
		/** 中断新手引导 **/
		private function stopGuideForFailBattle():void{
			trace("强行结束新手引导");
			stopGuide();
			guideModel.stopGuide();
		}
		
		private function onEnterFrame(evt:Event):void
		{
			if(SwitchConfig.ST_GuideDrag && mcDragFlag){
				if(_guideMc) _guideMc.moveOffset([GlobalRef.root.mouseX-GlobalRef.width/2,GlobalRef.root.mouseY-GlobalRef.height/2]);
			}
			if(guideModel.curGuideNode.passType==GuideModel.TP_GoPos){
				if(GameManager.manager && GameManager.manager.player){
					var pass:Boolean=false;
					var px:Number=GameManager.manager.player.character_x;
					
					var facePass:Boolean=false;
					if(int(guideModel.curGuideNode.target)==0){
						facePass=true;
					}else{
						if(GameManager.manager.player.character_face==0 && int(guideModel.curGuideNode.target)==1){
							facePass=true;
						}
						if(GameManager.manager.player.character_face==1 && int(guideModel.curGuideNode.target)==-1){
							facePass=true;
						}
					}
					var pos:Array=JSON.parse(guideModel.curGuideNode.passArg) as Array;
					if(px>=pos[0] && px<=pos[1]){
						pass=true;
					}
					
					if(pass && facePass){
						goNextStep();
					}
				}
				return ;
			}
			
			if(guideModel.curGuideNode.passType==GuideModel.TP_WaitTime){
				if(TimerModel.instance.serverTime>targetTime){
					goNextStep();
				}
				return ;
			}
			
			
			if(guideModel.curGuideNode.passType==GuideModel.TP_KillAll){
				if(GameManager.manager && GameManager.manager.enemyCreator && GameManager.manager.enemyCreator.monsterLeft<=0){
					goNextStep();
				}
				return ;
			}
			
		}
		
		
		public function goNextStep(specialId:int=-1):void{
			currentObj=null;
			if(specialId==-1){
				guideModel.goNext();
			}else{
				guideModel.goSpecialStep(specialId);
			}
			
			if(guideModel.isComplete){
				stopGuide();
			}else{
				if(guideModel.curGuideNode.passType==GuideModel.TP_Interrup){
					guideModel.resetInterrup();
					stopGuide();
				}else if(guideModel.curGuideNode.passType==GuideModel.TP_InterrupForNext){
					guideModel.goNext();
					stopGuide();
				}
				else{
					showStep();
				}
			}
			
		}
		
		
		
		public function onOpenWindow(clsName:String):void{
			if(isActive && guideModel && !guideModel.isComplete){
				if(guideModel.curGuideNode.passType==GuideModel.TP_WaitWindow){
					if(guideModel.curGuideNode.target==clsName){
						goNextStep();
					}
				}
			}
		}
		
		public function onMovieComplete():void{
			if(isActive && guideModel && !guideModel.isComplete){
				if(guideModel.curGuideNode.passType==GuideModel.TP_WaitMovie){
					goNextStep();
				}
			}
		}
		
		
		
		
		
		
		private function setVisable():void{
			var st:int=guideModel.curGuideNode.show;
			_guideMc.btn_queding.visible=(st>=1000);
			st=st%1000;
			_guideMc.visible=st>=100;
			st=st%100;
			_arrow.visible=st>=10;
			st=st%10;
			_yuanquan.visible=st>0;
			//  1111 确定按钮 、 npc对话框、 箭头 、  光圈
		}
		
		private function showStep():void
		{
			
			if(null==guideModel.curGuideNode)
			{
				stopGuide();
				setComplete();
				return;
			}
			
			
			
			//  百位  是否有 确定按钮  十位 是否有人物窗口  各位 是否显示箭头
			var tmp:Array=[0,0];
			try{
				tmp=JSON.parse(guideModel.curGuideNode.npcOffset) as Array;
			}catch(e:Error){}
			
			_guideMc.moveOffset(tmp);
			
			if(guideModel.curGuideNode.passType==GuideModel.TP_WaitTime){
				targetTime=TimerModel.instance.serverTime+int(guideModel.curGuideNode.passArg)*1000;
			}
			
			setVisable();
			_guideMc.desc = guideModel.curGuideNode.desc;
			
			if(guideModel.curGuideNode.passType==GuideModel.TP_EquipJudge){
				// 如果是武器判定的话
				wakuangEquipjudge();
			}
			if(guideModel.curGuideNode.passType==GuideModel.TP_IsInmining){
				inMiningJudge();
				
			}
			if(guideModel.curGuideNode.passType==GuideModel.TP_ShowStory){
				StoryManager.instance.startStory(int(guideModel.curGuideNode.target),StoryManager.Type_Guide,LayerController.instance.storyLayer);
				
				goNextStep();
			}
			moveStep();
			
			if(guideModel.curGuideNode.stopBattle==1){
				GameManager.guideStopFlag=true;
			}else{
				GameManager.guideStopFlag=false;
			}
			
//			checkGuideProtal();
		}
		
		
		private function inMiningJudge():void{
			if(Context.getInjectInstance(MDI_NewWorld) == null){
				// 在挖矿中
				goNextStep();
			}else{
				goNextStep(guideModel.curGuideNode.interruptNext);
			}
		}
		
		private function wakuangEquipjudge():void{
//			goNextStep();
//			return ;
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
//			equipModel.getEquipById(
			var hasEquip:Boolean=false;
			var xid:int=guideModel.getGuideEquipId();
			for each(var equipData:EquipData in equipModel.getNotArmyEquipDatas()){
				if(equipData.xid==xid){
					hasEquip=true;
					break;
				}
			}
			if(hasEquip){
				goNextStep(int(guideModel.curGuideNode.passArg));
			}else{
				goNextStep();
			}
		}
		
		private function onStoryCom(cid:int,type:int):void{
			if(isActive && guideModel.curGuideNode.passType==GuideModel.TP_WaitStory){
				if(type==int(guideModel.curGuideNode.passArg) &&  int(guideModel.curGuideNode.target) == cid  ){
					goNextStep();
				}
			}
		}
		
		public function createFadeButtonClick(_str:String):void
		{
			if(!isActive) return ;
			trace("当前进行新手引导步骤"+currentStep);
			if(!guideModel.isComplete)
			{
				trace("当前进行新手引导步骤"+currentStep);
				trace("事件类型"+_str);
				GlobalRef.stage.dispatchEvent(new TqtEvent(TqtEvent.BUTTON_CLICK,_str));
			}
		}
		public function PlayerGuideShield():void
		{
			if(!guideModel.isComplete)
			{
				stopGuide();
			}
		}
		public function PlayerGuideOpen():void
		{
			
		}
	
		
		
		
		
	}
}