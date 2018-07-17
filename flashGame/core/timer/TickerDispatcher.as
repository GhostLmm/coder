package core.timer
{
	import core.event.TqtEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;
	
	
	
	public class TickerDispatcher extends EventDispatcher
	{
		private static var _instance:TickerDispatcher;
		private static function get instance():TickerDispatcher
		{
			if(_instance == null) {
				_instance = new TickerDispatcher;
			}
			return _instance;
		}
		
		private static var _time:int;
		public static function init():void
		{
			_time = getTimer();
			GlobalRef.stage.addEventListener(Event.ENTER_FRAME,onEnterFrame,false,0,true);			
		}
		
		private static function onEnterFrame(evt:Event):void
		{
			var time:int = getTimer();
			instance.dispatchEvent(new TqtEvent(TqtEvent.TICKER_FRAME,time-_time));
			_time = time;
		}
		
		public static function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			instance.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
	}
}