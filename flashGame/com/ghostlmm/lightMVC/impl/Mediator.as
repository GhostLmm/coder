package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ViewDispatcher;
	import com.ghostlmm.lightMVC.api.IMediator;
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.events.IEventDispatcher;
	
	public class Mediator implements IMediator
	{
		protected var _listenerProxy:ListenerAddProxy;
		protected var coreDispatcher:IEventDispatcher;
		protected var viewDispatcher:ViewDispatcher;
		public function Mediator()
		{
			_listenerProxy=new ListenerAddProxy();
			coreDispatcher=Context.getInsance().coreDispatcher;
			viewDispatcher=Context.getInsance().viewDispatcher;
		}
		
		/*
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
		
		}
		
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
		
		
		*/
		 
		
		
		public function initialize(mediatorData:Object):void
		{
		}
		
		
		
		public function destroy():void
		{
			if(_listenerProxy){
				_listenerProxy.clear();
				_listenerProxy=null;
			}
		}
		
		protected function addViewListener(target:Object,type:String,listener:Function,useCapture:Boolean=false,priority:int=0,useWeek:Boolean=false):void
		{
			_listenerProxy.addListener(target,type,listener,useCapture,priority,useCapture);
		}
	}
}