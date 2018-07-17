package ui.item
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import core.event.TqtEvent;
	
	import flash.events.EventDispatcher;
	
	import ui.mc._McBase;

	public class _ItemBase extends _McBase
	{
		protected var _listenerProxy:ListenerAddProxy;
		public function _ItemBase()
		{
			/*super(data);
			if(data is EventDispatcher) {
				data.addEventListener(TqtEvent.MODEL_DELETE,onModelDelete,false,0,true);
			}*/
		}
		protected function addViewListener(target:Object,type:String,listener:Function,useCapture:Boolean=false,priority:int=0,useWeek:Boolean=false):void
		{
			if(!_listenerProxy) _listenerProxy=new ListenerAddProxy();
			_listenerProxy.addListener(target,type,listener,useCapture,priority,useCapture);
		}
		public override function destory():void
		{
			if(_listenerProxy){
				_listenerProxy.clear();
				_listenerProxy=null;
			}
			super.destory();
		}
		/*protected function onModelDelete(evt:TqtEvent):void
		{
			dispatchEvent(evt);
		}*/
	}
}