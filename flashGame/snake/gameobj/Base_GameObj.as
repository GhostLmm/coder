package snake.gameobj
{	
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.events.EventDispatcher;
	
	

	public class Base_GameObj
	{
		protected var _listenerProxy:ListenerAddProxy;
		public function Base_GameObj()
		{
			_listenerProxy=new ListenerAddProxy();
			/*initModule();
			registerEvent();
			setShow();*/
		}
		/*protected function initModule():void
		{
			
		}
		protected function registerEvent():void
		{
			
		}
		protected function setShow():void
		{
			
		}*/
		/**   添加注册事件，关闭窗口会自动回收
		 * */
		protected function addTargetEvent(target:EventDispatcher,type:String,listener:Function,useCapture:Boolean=false):void
		{
			_listenerProxy.addListener(target,type,listener,useCapture);
		}
		public function destroy():void
		{
			if(_listenerProxy) {_listenerProxy.clear();_listenerProxy=null;};
		}
	}
}