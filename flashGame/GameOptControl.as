package
{	
	import com.ghostlmm.tool.WheelControl;
	import com.greensock.TweenLite;
	
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import org.osflash.signals.Signal;

	public class GameOptControl
	{
		public var Jump_SN:Signal=new Signal();
		public var isDispatchEvent:Boolean=false;
		private static var instance:GameOptControl;
		public function GameOptControl()
		{
			init();
		}
		public static function getInstance():GameOptControl
		{
			if(null==instance)
			{
				instance=new GameOptControl();
			}
			return instance;
		}
		public function startControl():void
		{
			isDispatchEvent=true;
		}
		public function stopControl():void
		{
			isDispatchEvent=false;
		}
		private function init():void
		{
			WheelControl.changeDir_SN.add(onDerection);
			WheelControl.swipUp_SN.add(onSwipUp);
		}
		public function destroy():void
		{
			WheelControl.changeDir_SN.remove(onDerection);
			WheelControl.swipUp_SN.remove(onSwipUp);
		}
		private function onSwipUp():void
		{
			Jump_SN.dispatch();
			sendKeyBoardClicked(Keyboard.W,0.5);
		}
		private var currentDerection:String=WheelControl.DIR_None;
		private function onDerection():void
		{
			var di:String=WheelControl.direction;
			if(di==WheelControl.DIR_Left)
			{
				sendKeyDown(Keyboard.A);
				currentDerection=WheelControl.direction;
			}
			else if(di==WheelControl.DIR_Right)
			{
				sendKeyDown(Keyboard.D);
				currentDerection=WheelControl.direction;
			}
			else
			{
				sendKeyUp(Keyboard.D);
				sendKeyUp(Keyboard.A);
			}
			
		}
		public static function sendKeyUp(_value:uint,time:Number=0.1):void
		{
			var func:Function=function():void
			{
				var event:KeyboardEvent;
				event = new KeyboardEvent(KeyboardEvent.KEY_UP);
				event.keyCode = _value;		
				GlobalRef.stage.dispatchEvent(event);
			};
			TweenLite.delayedCall(time,func);
		}
		
		public static function sendKeyDown(_value:uint):void
		{
			var event:KeyboardEvent;
			event = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
			event.keyCode = _value;
			GlobalRef.stage.dispatchEvent(event);
		}
		
		public static function sendKeyBoardClicked(_value:uint,time:Number=0.1):void
		{
			sendKeyDown(_value);
			sendKeyUp(_value,time);
		}
		public static function sendMouseDown():void
		{
			
		}
		public static function sendMouseUp():void
		{
			
		}
	}
}