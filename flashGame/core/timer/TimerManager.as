package core.timer
{
	import core.event.TqtEvent;
	
	import util.Queue;

	public class TimerManager
	{
		private static var _instance:TimerManager;
		private static function get instance():TimerManager
		{
			if(_instance == null) {
				_instance = new TimerManager;
			}
			return _instance;
		}
		
		private var _timerList:Queue;
		
		public static function init():void
		{
			instance._timerList = new Queue;
			TickerDispatcher.init();
			TickerDispatcher.addEventListener(TqtEvent.TICKER_FRAME,onTick,false,0,true);
		}
		
		protected static function onTick(evt:TqtEvent):void
		{
			var time_delta:int = evt.data;
			var remove_queue:Queue = new Queue;
			var timer:Timer;
			for each(timer in instance._timerList) {
				timer.duration += time_delta;
				if(timer.duration > timer.time) {
					timer.onTimeup(time_delta);
					if(timer.loop) {
						timer.duration = timer.duration % timer.time;
					} else {
						remove_queue.push(timer);
					}
				}
			}
			
			for each(timer in remove_queue) {
				removeTimer(timer);
			}
		}
		
		public static function regesiterTimer(timer:Timer):void
		{
			instance._timerList.push(timer);
		}
		
		public static function removeTimer(timer:Timer):void
		{
			instance._timerList.remove(timer);
		}
		public static function clear():void
		{
			for each(var timer:Timer in instance._timerList) {
				removeTimer(timer);
				timer.destory();
				timer=null;
			}
			instance._timerList=new Queue;
		}
	}
}