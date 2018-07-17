package
{
	import flash.events.Event;
	import flash.utils.getTimer;
	
	import core.event.TQTTouchEvent;
	
	import org.osflash.signals.Signal;

	public class UserOperaterMonitor
	{
		public function UserOperaterMonitor()
		{
		}
		
		public static function startMonitor($monitorTime:int,$waiterTime:int):void
		{
//			monitorTime=$monitorTime;
//			waiterTime=$waiterTime;
			monitorTime=10000;
			waiterTime=10000;
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouch);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_END,onTouch);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_MOVE,onTouch);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_OUT,onTouch);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_OVER,onTouch);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_ROLL_OUT,onTouch);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_ROLL_OVER,onTouch);
			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_TAP,onTouch);
			GlobalRef.stage.addEventListener(Event.ENTER_FRAME,onFrame);
//			GlobalRef.stage.addEventListener(Event.DEACTIVATE,onDeActivate);
//			GlobalRef.stage.addEventListener(Event.ACTIVATE,onActive);
		}
		
		private static function onDeActivate(evt:Event):void{
			GlobalRef.stage.removeEventListener(Event.ENTER_FRAME,onFrame);
		}
		private static function onActive(evt:Event):void{
			onTouch();
			GlobalRef.stage.addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		public static const ST_Monitor:int=100;
		public static const ST_Waiter:int=200;
		public static const ST_Activate:int=300;
		
		public static var activateTime:Number;
		public static var status:int;
		
		public static var waite_SN:Signal=new Signal(int);
		public static var activate_SN:Signal=new Signal();
		public static var reMonitor_SN:Signal=new Signal();
		
		private static var monitorTime:int;
		private static var waiterTime:int;
		
		private static function onFrame(evt:Event):void{
			var now:int=getTimer();
			if(status==ST_Monitor){
				if(now-activateTime>=monitorTime){
					trace("切换到等待状态");
					activateTime=now;
					status=ST_Waiter;
					waite_SN.dispatch(now-activateTime);
					return ;
				}
			}
			if(status==ST_Waiter){
				if(now-activateTime>=waiterTime){
					trace("切换到激活状态");
					status=ST_Activate;
					activate_SN.dispatch();
					return ;
				}else{
					waite_SN.dispatch(now-activateTime);
				}
			}
			
		}
		
		private static function onTouch(evt:Event=null):void{
			activateTime=getTimer();
			if(status==ST_Waiter){
				status=ST_Monitor;
				reMonitor_SN.dispatch();
			}
			status=ST_Monitor;
			
		}
		
		public static function stopMonitor():void{
			waite_SN.removeAll();
			reMonitor_SN.removeAll();
			activate_SN.removeAll();
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouch);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_END,onTouch);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_MOVE,onTouch);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_OUT,onTouch);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_OVER,onTouch);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_ROLL_OUT,onTouch);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_ROLL_OVER,onTouch);
			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_TAP,onTouch);
			GlobalRef.stage.removeEventListener(Event.DEACTIVATE,onDeActivate);
			GlobalRef.stage.removeEventListener(Event.ACTIVATE,onActive);
		}
		
	}
}