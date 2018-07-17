package ui.gonghui
{
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import view.module.ToggleController;
	
	public class MDI_BanghuiChengyuan extends Mediator
	{
		public static const Label_Chengyuan:int=0;
		public static const Label_Shenhe:int=1;
		[Inject]
		public var window:BanghuiChengyuanWindow;
		
		private var chengyuanPanel:Panel_Chengyuan_ChengyuanWindow;
		private var shenhePanel:Panel_Shenhe_ChengyuanWindow;
		
		public function MDI_BanghuiChengyuan()
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
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			toggleController.registerToggle(window._btn_liebiao,onChengyuanClicked);
			toggleController.registerToggle(window._btn_chuangjian,onShenheClicked);
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function onChengyuanClicked(evt:Event=null):void
		{
			changeShowPanel(Label_Chengyuan);
		}
		private function onShenheClicked(evt:Event=null):void
		{
			changeShowPanel(Label_Shenhe);
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
				m_currentLabel=Label_Chengyuan;
			}
			changeShowPanel(m_currentLabel);
		}
		private function changeShowPanel(_labelId:int):void
		{
			clearContainer();
			destoryPanel();
			switch(_labelId)
			{
				case Label_Chengyuan:
					showChengyuanPanel();
					toggleController.changeBtnStatus(window._btn_liebiao);
					break;
				case Label_Shenhe:
					showShenhePanel();
					toggleController.changeBtnStatus(window._btn_chuangjian);
					break;
			}
		}
		private function showChengyuanPanel():void
		{
			if(null==chengyuanPanel)
			{
				chengyuanPanel=new Panel_Chengyuan_ChengyuanWindow();
			}
			chengyuanPanel.panelContainer.x=window._pos_gonghuichengyuan.rect.x;
			chengyuanPanel.panelContainer.y=window._pos_gonghuichengyuan.rect.y;
			window._pos_gonghuichengyuan.addChild(chengyuanPanel.panelContainer);
		}
		private function showShenhePanel():void
		{
			if(null==shenhePanel)
			{
				shenhePanel=new Panel_Shenhe_ChengyuanWindow();
			}
			shenhePanel.panelContainer.x=window._pos_gonghuichengyuan.rect.x;
			shenhePanel.panelContainer.y=window._pos_gonghuichengyuan.rect.y;
			window._pos_gonghuichengyuan.addChild(shenhePanel.panelContainer);
		}
		private function destoryPanel():void
		{
			if(chengyuanPanel){chengyuanPanel.clear();chengyuanPanel=null;};
			if(shenhePanel){shenhePanel.clear();shenhePanel=null;};
		}
		private function clearContainer():void
		{
			if((null==window)||(null==window._pos_gonghuichengyuan))
			{
				return;
			}
			if(chengyuanPanel &&window._pos_gonghuichengyuan.contains(chengyuanPanel.panelContainer))
			{
				window._pos_gonghuichengyuan.removeChild(chengyuanPanel.panelContainer);
			}
			if(shenhePanel &&window._pos_gonghuichengyuan.contains(shenhePanel.panelContainer))
			{
				window._pos_gonghuichengyuan.removeChild(shenhePanel.panelContainer);
			}
		}
		public override function destroy():void
		{
			toggleController.destory();
			toggleController=null;
			clearContainer();
			destoryPanel();
			super.destroy();
		}
	}
}