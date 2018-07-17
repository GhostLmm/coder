package snake.ui
{
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	
	public class Base_Gui extends Sprite
	{
		public function Base_Gui()
		{
			super();
			init();
		}
		private function init():void
		{
			initModule();
			registerEvent();
			setShow();
		}
		protected function initModule():void
		{
			
		}
		protected function destroyModule():void
		{
			
		}
		protected function registerEvent():void
		{
			
		}
		protected function setShow():void
		{
			
		}
		public function destroy():void
		{
			clearEvent();
			destroyModule();
			this.removeChildren();
		}
		private var _listenerArray:Array;
		/**   添加注册事件，关闭窗口会自动回收
		 * */
		protected function addTargetEvent(target:EventDispatcher,type:String,listener:Function,useCapture:Boolean=false):void
		{
			if(_listenerArray==null) _listenerArray=[];
			
			target.addEventListener(type,listener,useCapture);
			
			_listenerArray.push({target:target,type:type,listener:listener,useCapture:useCapture});
		}
		
		private function clearEvent():void
		{
			if(_listenerArray==null) return ;
			for each(var obj:Object in _listenerArray)
			{
				obj.target.removeEventListener(obj.type,obj.listener,obj.useCapture);
				delete obj["target"];
				delete obj["listener"];
			}
			_listenerArray=null;
		}
	}
}