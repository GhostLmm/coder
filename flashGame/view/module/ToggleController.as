package view.module
{
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.ButtonInterface;
	
	public class ToggleController
	{
		private var needPass:Boolean;
		private var funcDic:Dictionary;
		public function ToggleController(_needPass:Boolean=false)
		{
			needPass=_needPass;
			funcDic=new Dictionary();
			m_btnArray=[];
		}
		private var m_btnArray:Array;
		public function registerToggle(_button:ButtonInterface,_clickFunc:Function):void
		{
			m_btnArray.push(_button);
			funcDic[_button]=_clickFunc;
			_button.addEventListener(TqtEvent.BUTTON_CLICK,clickFunc);
		}
		private function clickFunc(evt:TqtEvent):void
		{
			var clickButton:Button=evt.target.parent as Button;
			if(!clickButton.isSelected)
			{
				var func:Function=funcDic[clickButton] as Function;
				changeBtnStatus(clickButton);
				if(null!=func)
				{
					if(needPass)
					{
						func.apply(null,[clickButton]);
					}
					else
					{
						func.apply();
					}
				}
			}
//			else
//			{
//				WindowManager_New.getInstance().clear();
//			}
		}
		public function changeBtnStatus(_btn:Button):void
		{
			for each(var button:Button in m_btnArray)
			{
				if(button==_btn)
				{
					button.isSelected=true;
				}
				else
				{
					button.isSelected=false;
				}
			}
		}
		public function destory():void
		{
			var index:int;
			for(index=0;index<m_btnArray.length;index++)
			{
				var button:Button=m_btnArray[index] as Button;
				button.removeEventListener(TqtEvent.BUTTON_CLICK,clickFunc);
				funcDic[button]=null;
			}
			
			funcDic=null;
		}
	}
}