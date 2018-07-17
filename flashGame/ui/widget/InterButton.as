package ui.widget
{
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.greensock.TweenLite;
	import com.greensock.easing.Elastic;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import org.gestouch.events.GestureEvent;
	import org.gestouch.gestures.TapGesture;
	
	import util.Util;

	internal class InterButton extends Sprite implements ButtonInterface, IComponent
	{
		private static var startX:Number=1;
		private static var startY:Number=1;
		private static var endX:Number=0.9;
		private static var endY:Number=0.9;
		private static var time:Number=0.75;
		
		private static var downFn:Object=Elastic.easeOut;
		private static var upFn:Object=Elastic.easeOut;
		
		private var _view:MovieClip;
		private var _container:MovieClip;
		private var _isPressed:Boolean;
		private var _isSelected:Boolean;
		private var _isEnabled:Boolean;
		private var _point:Point = new Point(0,0);
		
		private var _proxy:ListenerAddProxy;
		
//		private var _tween:TweenLite;
//		
//		private static const TweenTime:Number=0.3;
//		private static const TargetScale:Number=0.8;
		
		private var containerWidth:Number;
		private var containerHeight:Number;
//		private static const EaseFN:*=
		
//		private var tap:TapGesture;
		
		public function InterButton(view:MovieClip, container:MovieClip=null)
		{
			_proxy=new ListenerAddProxy();
			_view = view;
			if(container == null) {
				_container = view;
			} else {
				_container = container;
			}
			name=_view.name;
			
			containerWidth=_container.width;
			containerHeight=_container.height;
			
			Util.replace(_container,this);
			
			this.x=_container.x+_container.width/2;
			this.y=_container.y+_container.height/2;
			_container.x=-_container.width/2;
			_container.y=-_container.height/2;
			
			addChild(_container);
			
			_isPressed = false;
			_isSelected = false;
			_isEnabled = true;
			updateStatus();
						
//			_container.addEventListener(TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false,0,true);
//			_container.addEventListener(TQTTouchEvent.TOUCH_OVER,onTouchOver,false,0,true);
//			_container.addEventListener(TQTTouchEvent.TOUCH_OUT,onTouchOut,false,0,true);
//			_container.addEventListener(TQTTouchEvent.TOUCH_END,onTouchEnd,false,0,true);
			
			textMouseEnable();
			
//			_tween=TweenLite.to(this,TweenTime,{scaleX:TargetScale,scaleY:TargetScale,paused:true});
			
			_proxy.addListener(_container,TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false,0,true);
			_proxy.addListener(_container,TQTTouchEvent.TOUCH_OVER,onTouchOver,false,0,true);
			_proxy.addListener(_container,TQTTouchEvent.TOUCH_OUT,onTouchOut,false,0,true);
			_proxy.addListener(_container,TQTTouchEvent.TOUCH_END,onTouchEnd,false,0,true);
			
			
//			tap=new TapGesture(this);
//			tap.addEventListener(GestureEvent.GESTURE_RECOGNIZED,onTap);
//			tap.addEventListener(GestureEvent.GESTURE_POSSIBLE,onPossible);
//			tap.addEventListener(GestureEvent.GESTURE_FAILED,onFailed);
//			tap.addEventListener(GestureEvent.GESTURE_STATE_CHANGE,onChange);
		}
		
		private function onTap(evt:GestureEvent):void{
			trace(evt.toString());
		}
		private function onPossible(evt:GestureEvent):void{
			trace(evt.toString());
		}
		private function onFailed(evt:GestureEvent):void{
			trace(evt.toString());
		}
		private function onChange(evt:GestureEvent):void{
			trace(evt.toString());
		}
		
		private function textMouseEnable():void
		{
			for(var index:int; index<_container.numChildren; index++){
				var dis:DisplayObject=_container.getChildAt(index);
				if(dis && (dis is TextField)){
					(dis as TextField).mouseEnabled=false;
					(dis as TextField).selectable=false;
				}
			}
		}
		
		
		
		private function onTouchBegin(evt:Object):void
		{
			isPressed = true;
			_point = new Point(evt.stageX,evt.stageY);
//			_tween.play();
			TweenLite.killTweensOf(this);
			TweenLite.to(this, time, {scaleX:endX, scaleY:endY, ease:downFn});
			_proxy.addListener(GlobalRef.stage,TQTTouchEvent.TOUCH_END,recoverTween,false,0,true);
		}
		
		private function onTouchOver(evt:Object):void
		{
			isPressed = true;
		}
		
		private function onTouchOut(evt:Object):void
		{
//			_point = new Point(0,0);
			isPressed = false;
			
		}
		private function recoverTween(evt:Event=null):void
		{
//			_tween.reverse(_tween._duration);
			TweenLite.killTweensOf(this);
			TweenLite.to(this, time, {scaleX:startX, scaleY:startY, ease:upFn});
			_proxy.removeListener(GlobalRef.stage,TQTTouchEvent.TOUCH_END,recoverTween,false);
		}
		private function onTouchEnd(evt:Object):void
		{
			isPressed = false;
			if(
				Math.abs(evt.stageX-_point.x) < containerWidth &&
				Math.abs(evt.stageY-_point.y) < containerHeight ) {
//				trace("按钮点击成功");
				if(_isEnabled) {
					_container.dispatchEvent(new TqtEvent(TqtEvent.BUTTON_CLICK,this.name,true,true));
				} else {
					_container.dispatchEvent(new TqtEvent(TqtEvent.BUTTON_CLICK_DISABLE));
				}
				trace("点击按钮:\t"+name);
//				TweenLite.delayedCall(_tween._duration,dispatcherClickEvent,[_isEnabled]);
			}else{
//				trace("按钮点击失败： "+evt.stageX+"/"+_point.x+"/"+containerWidth+"\t"+evt.stageY+"/"+_point.y+"/"+containerHeight);
			}
			
		}
		
		private function dispatcherClickEvent(ie:Boolean):void
		{
			if(ie) {
				if(_container) _container.dispatchEvent(new TqtEvent(TqtEvent.BUTTON_CLICK,this.name,true,true));
			} else {
				if(_container) _container.dispatchEvent(new TqtEvent(TqtEvent.BUTTON_CLICK_DISABLE));
			}
		}
		
		public function get isPressed():Boolean
		{
			return _isPressed;
		}
		
		public function set isPressed(isPressed:Boolean):void
		{
			if(_isPressed == isPressed) {
				return;
			}
			_isPressed = isPressed;
			updateStatus();
		}
		
		public function get isSelected():Boolean
		{
			return _isSelected;
		}
		
		public function set isSelected(isSelected:Boolean):void
		{
			if(_isSelected == isSelected) {
				return;
			}
			_isSelected = isSelected;
			updateStatus();
		}
		
		public function get isEnabled():Boolean
		{
			return _isEnabled;
		}
		
		public function set isEnabled(isEnabled:Boolean):void
		{
			_isEnabled = isEnabled;
			updateStatus();
		}
		
		
		protected function updateStatus():void
		{
			var frameId:int = 0;
			/*if(_isPressed) {
				frameId |= 1;
			}
			if(_isSelected) {
				frameId |= 2;
			}
			if(_isEnabled == false) {
				frameId = 4;
			}*/
			if(!isEnabled){
				frameId=3;
			}else{
				if(isSelected){
					frameId=2;
				}else{
					frameId=1;
				}
			}
			_view.gotoAndStop(frameId);
			if(_view.mc_bg){
				_view.mc_bg.gotoAndStop(frameId);
			}
			
		}

		public function get view():MovieClip
		{
			return _view;
		}

		public function get container():MovieClip
		{
			return _container;
		}
		
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
//			_container.addEventListener(type, listener, useCapture, priority, useWeakReference);
			_proxy.addListener(_container,type, listener, useCapture, priority, useWeakReference);
		}
		
		public function destory():void
		{
			TweenLite.killTweensOf(dispatcherClickEvent);
			TweenLite.killTweensOf(this);
//			if(_tween){
//				_tween.kill();
//				_tween=null;
//			}
			if(_proxy){
				_proxy.clear();
				_proxy=null;
			}
			removeChildren();
			_container=null;
			
		}
	}
}