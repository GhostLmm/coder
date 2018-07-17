package com.ghostlmm.tool
{
	public class ListenerObj
	{
		private var _listenerProxy:ListenerAddProxy=new ListenerAddProxy();
		public function ListenerObj()
		{
		}
		
		public function destroy():void
		{
			if(_listenerProxy){
				_listenerProxy.clear();
				_listenerProxy=null;
			}
		}
		
		protected function addListener(target:Object,type:String,listener:Function,useCapture:Boolean=false,priority:int=0,useWeek:Boolean=false):void
		{
			_listenerProxy.addListener(target,type,listener,useCapture,priority,useCapture);
		}
		
		protected function removeListener(target:Object,type:String,listener:Function,useCapture:Boolean=false):void{
			_listenerProxy.removeListener(target,type,listener,useCapture);
		}
	}
}