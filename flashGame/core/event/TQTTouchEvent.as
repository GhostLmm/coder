package core.event
{
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	
	public class TQTTouchEvent extends flash.events.MouseEvent
	{
		public static var TOUCH_BEGIN:String = flash.events.MouseEvent.MOUSE_DOWN;
		public static var TOUCH_END:String = flash.events.MouseEvent.MOUSE_UP;
		public static var TOUCH_MOVE:String = flash.events.MouseEvent.MOUSE_MOVE;
		public static var TOUCH_OUT:String = flash.events.MouseEvent.MOUSE_OUT;
		public static var TOUCH_OVER:String = flash.events.MouseEvent.MOUSE_OVER;
		public static var TOUCH_ROLL_OUT:String = flash.events.MouseEvent.ROLL_OUT;
		public static var TOUCH_ROLL_OVER:String = flash.events.MouseEvent.ROLL_OVER;
		public static var TOUCH_TAP:String = flash.events.MouseEvent.CLICK;
		
		public static function getTouchEventArray():Array{
			return [TOUCH_BEGIN,TOUCH_END,TOUCH_MOVE,TOUCH_OUT,TOUCH_OVER,TOUCH_ROLL_OUT,TOUCH_ROLL_OVER,TOUCH_TAP];
		}
		
		public static function init():void{
			if(DeviceType.isOnPC){
				TOUCH_BEGIN = flash.events.MouseEvent.MOUSE_DOWN;
				TOUCH_END = flash.events.MouseEvent.MOUSE_UP;
				TOUCH_MOVE = flash.events.MouseEvent.MOUSE_MOVE;
				TOUCH_OUT = flash.events.MouseEvent.MOUSE_OUT;
				TOUCH_OVER = flash.events.MouseEvent.MOUSE_OVER;
				TOUCH_ROLL_OUT = flash.events.MouseEvent.ROLL_OUT;
				TOUCH_ROLL_OVER = flash.events.MouseEvent.ROLL_OVER;
				TOUCH_TAP = flash.events.MouseEvent.CLICK;
			}else{
				TOUCH_BEGIN = TouchEvent.TOUCH_BEGIN;
				TOUCH_END = TouchEvent.TOUCH_END;
				TOUCH_MOVE = TouchEvent.TOUCH_MOVE;
				TOUCH_OUT =TouchEvent.TOUCH_OUT;
				TOUCH_OVER = TouchEvent.TOUCH_OVER;
				TOUCH_ROLL_OUT = TouchEvent.TOUCH_ROLL_OUT
				TOUCH_ROLL_OVER = TouchEvent.TOUCH_ROLL_OVER;
				TOUCH_TAP = TouchEvent.TOUCH_TAP;
			}
		}
		
		
		
		public function TQTTouchEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}