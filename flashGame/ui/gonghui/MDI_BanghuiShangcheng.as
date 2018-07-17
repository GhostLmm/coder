package ui.gonghui
{
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_banghui_jianzhulvup;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.GameTime;
	import util.Util;
	
	import view.module.ToggleController;
	
	public class MDI_BanghuiShangcheng extends Mediator
	{
		public static const Label_Zhenpin:int=1;
		public static const Label_Daoju:int=0;
		[Inject]
		public var window:BanghuiShangchengWindow;
		
		private var zhenpinPanel:Panel_Zhenpin_Banghuishangcheng;
		private var daojuPanel:Panel_Daoju_Banghuishangcheng;
		
		private var timerModel:TimerModel;
		private var gonghuiModel:GonghuiModel;
		
		public function MDI_BanghuiShangcheng()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private var toggleController:ToggleController;
		private function initModule():void
		{
			toggleController=new ToggleController();
			timerModel=Context.getInjectInstance(TimerModel);
			gonghuiModel=Context.getInjectInstance(GonghuiModel);
		}
		private function registerEvent():void
		{
			timerModel.secondTimer_SN.add(onTick);
			gonghuiModel.GonghuiInfo_SN.add(setBasicShow);
			gonghuiModel.GonghuiSelf_SN.add(setBasicShow);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			toggleController.registerToggle(window._btn_daoju,onDaojuClicked);
			toggleController.registerToggle(window._btn_zhenpin,onZhenpinClicked);
		}
		private function onTick():void
		{
			var gameTime:GameTime=new GameTime(gonghuiModel.gonghuiVo.zhenpingRefreshTime-timerModel.serverTime);
			if(gameTime.miliSecond<0){
				gameTime.setMiliSeconds(0);
			}
			window._fnt_daojishi.text=gameTime.toString3();
		}
		private function onDaojuClicked(evt:Event=null):void
		{
			changeShowPanel(Label_Daoju);
		}
		private function onZhenpinClicked(evt:Event=null):void
		{
			changeShowPanel(Label_Zhenpin);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private var m_currentLabel:int=0;
		private function setShow():void
		{
			if(null!=window._params)
			{
				m_currentLabel=int(window._params);
			}
			else
			{
				m_currentLabel=Label_Zhenpin;
			}
			changeShowPanel(m_currentLabel);
			setBasicShow();
			onTick();
		}
		private function setBasicShow():void
		{
			window._fnt_dangqiangongxian.text=gonghuiModel.myBanghuiData.curGongxian.toString();
			window._fnt_shangchenglv.text=Util.getLanguage("帮会等级显示",gonghuiModel.gonghuiVo.shangchengLevel);
			
			var datingNode:Node_banghui_jianzhulvup=GonghuiModel.getJianzhuLevelXmlByLevel(gonghuiModel.gonghuiVo.shangchengLevel);
			window._fnt_shengjisuoxu.text=datingNode.banghui_dating.toString();
			
			window._fnt_zonggongxian.text=gonghuiModel.gonghuiVo.jiangshedu.toString();
		}
		private function changeShowPanel(_labelId:int):void
		{
			clearContainer();
			destoryPanel();
			switch(_labelId)
			{
				case Label_Zhenpin:
					showZhenpinPanel();
					toggleController.changeBtnStatus(window._btn_zhenpin);
					break;
				case Label_Daoju:
					showDaojuPanel();
					toggleController.changeBtnStatus(window._btn_daoju);
					break;
			}
		}
		private function showZhenpinPanel():void
		{
			if(null==zhenpinPanel)
			{
				zhenpinPanel=new Panel_Zhenpin_Banghuishangcheng();
			}
			zhenpinPanel.panelContainer.x=window._pos_tab_liebiao.rect.x;
			zhenpinPanel.panelContainer.y=window._pos_tab_liebiao.rect.y;
			window._pos_tab_liebiao.addChild(zhenpinPanel.panelContainer);
			window._fnt_daojishi.visible=true;
			window._fnt_shuaxin_daojishi.visible=true;
		}
		private function showDaojuPanel():void
		{
			if(null==daojuPanel)
			{
				daojuPanel=new Panel_Daoju_Banghuishangcheng();
			}
			daojuPanel.panelContainer.x=window._pos_tab_liebiao.rect.x;
			daojuPanel.panelContainer.y=window._pos_tab_liebiao.rect.y;
			window._pos_tab_liebiao.addChild(daojuPanel.panelContainer);
			window._fnt_daojishi.visible=false;
			window._fnt_shuaxin_daojishi.visible=false;
		}
		private function destoryPanel():void
		{
			if(zhenpinPanel){zhenpinPanel.clear();zhenpinPanel=null;};
			if(daojuPanel){daojuPanel.clear();daojuPanel=null;};
		}
		private function clearContainer():void
		{
			if((null==window)||(null==window._pos_tab_liebiao))
			{
				return;
			}
			if(zhenpinPanel &&window._pos_tab_liebiao.contains(zhenpinPanel.panelContainer))
			{
				window._pos_tab_liebiao.removeChild(zhenpinPanel.panelContainer);
			}
			if(daojuPanel &&window._pos_tab_liebiao.contains(daojuPanel.panelContainer))
			{
				window._pos_tab_liebiao.removeChild(daojuPanel.panelContainer);
			}
		}
		public override function destroy():void
		{
			timerModel.secondTimer_SN.remove(onTick);
			timerModel=null;
			gonghuiModel.GonghuiInfo_SN.remove(setBasicShow);
			gonghuiModel.GonghuiSelf_SN.remove(setBasicShow);
			gonghuiModel=null;
			
			toggleController.destory();
			toggleController=null;
			clearContainer();
			destoryPanel();
			super.destroy();
		}
	}
}