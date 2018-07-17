package core.timer
{
	public class Timer
	{
		private var _time:int;
		private var _duration:int;
		private var _loop:Boolean;
		private var _onTimeup:Function;
		
		public function Timer(time:int,loop:Boolean,onTimeup:Function)
		{
			_time = time;
			_loop = loop;
			_onTimeup = onTimeup;
		}

		public function get time():int
		{
			return _time;
		}

		public function get loop():Boolean
		{
			return _loop;
		}
		
		
		public function get onTimeup():Function
		{
			return _onTimeup;
		}

		public function get duration():int
		{
			return _duration;
		}

		public function set duration(value:int):void
		{
			_duration = value;
		}
		public function destory():void
		{
			_onTimeup=null;
		}
	}
}