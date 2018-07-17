package ui.animate
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import core.AnimateManager;
	
	import flash.events.Event;
	import flash.utils.getTimer;
	
	/**
	 * animate base class
	 */
	public class _AnimateBase implements _AnimateInterface
	{
		protected var _target:*;
		protected var _duration:int;
		protected var _params:Object;
		protected var _running:Boolean;
		protected var _done:Boolean;
		protected var _time:int;
		protected var _loop:Boolean;
		
		protected var _proxy:ListenerAddProxy;
		
		public function _AnimateBase(target:*,duration:int,params:Object=null)
		{
			_proxy=new ListenerAddProxy();
			_target = target;
			_duration = duration;
			if(_duration < 0) {
				throw Error;
			}
			_params = params;
			if(_params == null) {
				_params = new Object;
			}
			_running = false;
			_done = true;
			_loop = params.hasOwnProperty("loop") && params["loop"];
		}
		
		public function get running():Boolean
		{
			return _running;
		}
		
		public function get done():Boolean
		{
			return _done;
		}
		
		public function destory():void
		{
			GlobalRef.stage.removeEventListener(Event.ENTER_FRAME,onEnterFrame,false)
			_target=null;
		}
		
		public final function run():void
		{
			_running = true;
			_done = false;
			if(_params.hasOwnProperty("onStart")) {
				_params.onStart(this);
			}
			beforeRun();
			_time = getTimer();
//			_proxy.addListener(GlobalRef.stage,Event.ENTER_FRAME,onEnterFrame,false,0,true);
			GlobalRef.stage.addEventListener(Event.ENTER_FRAME,onEnterFrame,false,0,true);
		}
		
		public final function stop():void
		{
			GlobalRef.stage.removeEventListener(Event.ENTER_FRAME,onEnterFrame,false);
			_running = false;
			_done = true;
			AnimateManager.remove(this);
			afterStop();
			if(_params.hasOwnProperty("onComplete") && _params.onComplete is Function ) {
				_params.onComplete(this);
			}
		}
		
		private final function onEnterFrame(evt:Event=null):void
		{
			if(_done||!_running) {
				return;
			}
			var time:int = getTimer() - _time;
			if(!_loop && time >= _duration) {
				stop();
				return;
			}
			
			render(round(time),progress(time));
			if(_params.hasOwnProperty("onRender")) {
				_params.onRender(this);
			}
		}
		
		protected final function round(time:int):int
		{
			return int(time / _duration);
		}
		
		protected final function progress(time:int):Number
		{
			return time%_duration/_duration;
		}
		
		protected function render(round:int,progress:Number):void
		{
		}
		
		protected function beforeRun():void
		{
		}
		
		protected function afterStop():void
		{
		}
		
		public function get relatedObjects():Array
		{
			return [_target];
		}

		public function get loop():Boolean
		{
			return _loop;
		}

		public function set loop(value:Boolean):void
		{
			_loop = value;
		}

		public function get target():*
		{
			return _target;
		}


	}
}