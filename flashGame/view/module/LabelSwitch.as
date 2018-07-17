package view.module
{	
	import org.osflash.signals.Signal;
	
	import ui.widget.Button;
	import ui.widget.Position;
	
	import view.Panel_Base;

	/**
	 * 用于一个窗口多个标签页
	 */
	public class LabelSwitch
	{
		private var pos:Position;
		private var btns:Array;
		private var panelClasses:Array;
		private var clickCheckFuncs:Array;
		
		private var toggleController:ToggleController;
		public var m_currentPanel:*;
		
		public var switch_SN:Signal=new Signal(Class);
		
		public function LabelSwitch(_pos:Position,_btns:Array,_panelClasses:Array,_clickCheckFuncs:Array=null)
		{
			pos=_pos;
			btns=_btns;
			for each(var btn:Button in btns){
				btn.setTabButton();
			}
			
			panelClasses=_panelClasses;
			clickCheckFuncs=_clickCheckFuncs;
			
			initModule();
			registerEvent();
		}
		private function initModule():void
		{
			toggleController=new ToggleController(true);
		}
		private function registerEvent():void
		{
			var index:int;
			for(index=0;index<btns.length;index++)
			{
				var btn:Button=btns[index] as Button;
				toggleController.registerToggle(btn,onButtonClicked);
			}
		}
		private function onButtonClicked(_param:*=null):void
		{
			var checkFunc:Function=getCheckFuncByButton(_param as Button) as Function;
			if(null!=checkFunc)
			{
				if(checkFunc.apply())
				{
					changeShowPanel(getPanelClassByButton(_param as Button));
				}
			}
			else
			{
				changeShowPanel(getPanelClassByButton(_param as Button));
			}
		}
		/**
		 * 传入要显示的panelClass
		 */
		public function changeShowPanel(_panelClass:Class):void
		{
			clearContainer();
			destoryPanel();
			showPanel(_panelClass);
			switch_SN.dispatch(_panelClass);
		}
		private function getPanelClassByButton(_button:Button):Class
		{
			var index:int=btns.indexOf(_button);
			return panelClasses[index] as Class;
		}
		private function getButtonByPanelClass(_panelClass:Class):Button
		{
			var index:int=panelClasses.indexOf(_panelClass);
			return btns[index] as Button;
		}
		private function getCheckFuncByButton(_button:Button):Function
		{
			var index:int=btns.indexOf(_button);
			if(clickCheckFuncs)
			{
				return clickCheckFuncs[index] as Function;
			}
			else
			{
				return null;
			}
		}
		private function showPanel(_panelClass:Class):void
		{
			m_currentPanel=new _panelClass();
			m_currentPanel.panelContainer.x=pos.rect.x;
			m_currentPanel.panelContainer.y=pos.rect.y;
			pos.addChild(m_currentPanel.panelContainer);
			toggleController.changeBtnStatus(getButtonByPanelClass(_panelClass));
		}
		
		public function update():void{
			if(m_currentPanel){
				m_currentPanel.update();
			}
		}
		
		private function clearContainer():void
		{
			if(m_currentPanel&&pos&&pos.contains(m_currentPanel.panelContainer))
			{
				pos.removeChild(m_currentPanel.panelContainer)
			}
		}
		private function destoryPanel():void
		{
			if(m_currentPanel)
			{
				m_currentPanel.clear();
				m_currentPanel=null;
			}
		}
		public function destory():void
		{
			clearContainer();
			destoryPanel();
			toggleController.destory();
			toggleController=null;
			pos=null;
			panelClasses=null;
			clickCheckFuncs=null;
			btns=null;
			switch_SN.removeAll();
		}
	}
}