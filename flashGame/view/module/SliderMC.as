package view.module
{
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class SliderMC
	{
		private var X_Hide:int;
		private var X_Show:int;
		private var m_mc:Object;
		private var time:Number;
		private var clickMc:Object;
		private var clickFun:Function;
		
		public function SliderMC(_mc:Object,_clickMc:Object,_hideX:int,_showX:int,_timer:Number=0.5,_clickFun:Function=null)
		{
			X_Hide=_hideX;
			X_Show=_showX;
			time=_timer;
			m_mc=_mc;
			clickMc=_clickMc;
			clickFun=_clickFun;
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			
		}
		private function registerEvent():void
		{
			GlobalRef.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			clickMc.addEventListener(MouseEvent.CLICK,onMcClick);
		}
		private function onMcClick(evt:Event):void
		{
			if(null!=clickFun)
			{
				var couldClick:Boolean=clickFun.apply();
				if(!couldClick)
				{
					return;
				}
			}
			if(isHide)
			{
				show();
			}
			else
			{
				hide();
			}
		}
		private function setShow():void
		{
			m_mc.x=X_Hide;
		}
		private function onMouseUp(evt:Event):void
		{
			if(evt.target!=m_mc)
			{
				hide();
			}
//			if(!m_mc.contains(evt.target))
//			{
//				hide();
//			}
		}
		private function hide():void
		{
			if(m_mc.x>=X_Show)
			{
				TweenLite.to(m_mc,time,{x:X_Hide});
			}
		}
		private function show():void
		{
			if(m_mc.x<=X_Hide)
			{
				TweenLite.to(m_mc,time,{x:X_Show});
			}
		}
		private function get isHide():Boolean
		{
			if(m_mc.x==X_Show)
			{
				return false
			}
			return true;
		}
		public function detroy():void
		{
			TweenLite.killTweensOf(m_mc);
			GlobalRef.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			clickMc.removeEventListener(MouseEvent.CLICK,onMcClick);
			clickMc=null;
			m_mc=null;
			clickFun=null;
		}
	}
}