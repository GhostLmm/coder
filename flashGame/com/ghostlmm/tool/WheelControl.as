package com.ghostlmm.tool
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.ui.Keyboard;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import org.gestouch.events.GestureEvent;
	import org.gestouch.gestures.LongPressGesture;
	import org.gestouch.gestures.SwipeGesture;
	import org.gestouch.gestures.SwipeGestureDirection;
	import org.osflash.signals.Signal;

	public class WheelControl
	{
		public function WheelControl()
		{
		}
		
		public static const DIR_Left:String="left";
		public static const DIR_Right:String="right";
		public static const DIR_None:String="none";
		
		public static var target:Sprite;
		
		private static var _direction:String=DIR_None;
		public static var changeDir_SN:Signal=new Signal();
		public static var swipUp_SN:Signal=new Signal();
		
		private static var _pauseFlag:Boolean=false;
		
		public static function get direction():String{
			if(_pauseFlag){
				return DIR_None;
			}
			return _direction;
		}
		public static function set direction(value:String):void{
			if(_direction!=value){
				_direction=value;
				changeDir_SN.dispatch();
			}
		}
		private static var longPress:LongPressGesture;
		
		private static var isMulitPoint:Boolean;
		
		private static var swipGesture:SwipeGesture;
		
		public static function startControl($target:Sprite):void{
			stopControl();
			direction=DIR_None;
			target=$target;
			_pauseFlag=false;
			_touchMap={};
			
			
			trace("是否支持touch："+Multitouch.supportsTouchEvents+"\tmode:"+Multitouch.inputMode);
			if(Multitouch.inputMode==MultitouchInputMode.TOUCH_POINT){
				isMulitPoint=true;
			}else{
				isMulitPoint=false;
			}
			GlobalRef.stage.addEventListener(Event.DEACTIVATE,onDeactivate);
			
			if(isMulitPoint){
				GlobalRef.stage.addEventListener(TouchEvent.TOUCH_BEGIN,onTouchBengin);
				GlobalRef.stage.addEventListener(TouchEvent.TOUCH_END,onTouchEnd);
			}else{
				GlobalRef.stage.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
				GlobalRef.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUp);
			}
			GlobalRef.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
			GlobalRef.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
			
			swipGesture=new SwipeGesture(GlobalRef.stage);
			swipGesture.direction=SwipeGestureDirection.UP;
			swipGesture.addEventListener(GestureEvent.GESTURE_RECOGNIZED,onSwip);
			
		}
		
		private static function onSwip(evt:GestureEvent):void{
			trace("向上手势");
			swipUp_SN.dispatch();
		}
			
		
		private static var _touchMap:Object={};
		
		
		private static function traceTouchEvent(evt:TouchEvent):void{
			trace("["+evt.type+"]\tid:"+evt.touchPointID);
		}
		private static function onTouchBengin(evt:TouchEvent):void{
			if(!checkIfCould(evt))
			{
				return;
			}
			traceTouchEvent(evt);
			_touchMap[evt.touchPointID]=evt;
			updateState();
		}
		private static function onTouchEnd(evt:TouchEvent):void{
			traceTouchEvent(evt);
			delete _touchMap[evt.touchPointID];
			updateState();
		}
		private static function onTouchTap(evt:TouchEvent):void{
			traceTouchEvent(evt);
		}
		
		private static function updateState():void{
			var target:TouchEvent;
			for each(var touch:TouchEvent in _touchMap){
				if(target==null){
					target=touch;
				}
				if(touch.timestamp>target.timestamp){
					target=touch;
				}
			}
			
			if(target==null){
				direction=DIR_None;
			}else{
				if(target.stageX<=GlobalRef.stageWidth/2){
					direction=DIR_Left;
				}else{
					direction=DIR_Right;
				}
			}
			
		}
		
		private static function onLongPressBengin(evt:GestureEvent):void{
//			longPress.
		}
		private static function onLongPressChange(evt:GestureEvent):void{
			
		}
		public static function pause():void{
			_pauseFlag=true;
		}
		public static function resume():void{
			_pauseFlag=false;
		}
		
		
		
		public static function stopControl():void{
			direction=DIR_None;
			if(target){
				GlobalRef.stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				GlobalRef.stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
				GlobalRef.stage.removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
				GlobalRef.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUp);
				GlobalRef.stage.removeEventListener(MouseEvent.MOUSE_OUT,onDeactivate);
				GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_BEGIN,onTouchBengin);
				GlobalRef.stage.removeEventListener(TouchEvent.TOUCH_END,onTouchEnd);
				GlobalRef.stage.removeEventListener(Event.DEACTIVATE,onDeactivate);
				
				target=null;
			}
			if(swipGesture){
				swipGesture.removeEventListener(GestureEvent.GESTURE_RECOGNIZED,onSwip);
			}
			
		}
		private static function onDeactivate(evt:Event):void{
			direction=DIR_None;
			_touchMap={};
			updateState();
		}
		private static function onKeyDown(evt:KeyboardEvent):void{
			if(evt.keyCode==Keyboard.LEFT){
				direction=DIR_Left;
			}
			if(evt.keyCode==Keyboard.RIGHT){
				direction=DIR_Right;
			}
		}
		private static function onKeyUp(evt:KeyboardEvent):void{
			if(evt.keyCode==Keyboard.LEFT){
				if(direction==DIR_Left){
					direction=DIR_None;
				}
			}
			if(evt.keyCode==Keyboard.RIGHT){
				if(direction==DIR_Right){
					direction=DIR_None;
				}
			}
		}
		private static function onMouseDown(evt:MouseEvent):void{
			if(!checkIfCould(evt))
			{
				return;
			}
			if(evt.stageX<=GlobalRef.stage.stageWidth/2){
				direction=DIR_Left;
			}else{
				direction=DIR_Right;
			}
		}
		private static function onMouseUp(evt:MouseEvent):void{
			direction=DIR_None;
		}
		
		public static const Type_Ignore:String="Type_Ignore";
		private static function checkIfCould(evt:Event):Boolean
		{
			if((evt.target)&&(evt.target is MovieClip)&&(evt.target.hasOwnProperty("type")&&(evt.target.type==Type_Ignore)))
			{
				return false;
			}
			return true;
			/*if((CitrusEngine.getInstance())&&(CitrusEngine.getInstance().state)&&(CitrusEngine.getInstance().state is GameState)&&((evt.target.parent is Base_Gui)||(evt.target.parent is Button)||(evt.target.parent is Base_Item)))
			{
//				trace((CitrusEngine.getInstance().state as GameState).gameGui.contains(evt.target as DisplayObject));
				return false;
			}
			return true;*/
		}
	}
}