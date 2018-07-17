package ui.window
{
	import com.adobe.utils.StringUtil;
	import com.fish.modules.core.models.GuideModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.ViewAssemble;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getTimer;
	
	import core.LayerController;
	import core.PlayerGuideManager;
	import core.WindowManager;
	
	import org.osflash.signals.Signal;
	
	import ui.mc._McBase;
	import ui.widget.Button;
	
	import util.Queue;
	import util.Util;
	
	import view.CommonControlFun;

	public class _WindowBase extends _McBase implements _WindowInterface
	{
		protected var _backgroundMask:Sprite;
		private var _parentWindow:_WindowBase;
		private var _waiting:Queue;
		private var _active:Queue;
		public var _params:Object;
		protected var _uiStatus:Object;
		private var _suspend:Boolean;
		
		private var _wndType:String;
		
		
		protected var showUserInfo:Boolean=false;
		
		private static const MaxTime:Number=0.65;
		
		
		public var nextFrame_SN:Signal=new Signal();
		
		private var tick:int=2;
		
		private var _time:int;
		
		protected function get delayBind():Boolean{
			return false;
		}
		
		public function get wndType():String
		{
			if(_wndType==null){
				_wndType=getQualifiedClassName(_scene);
			}
			return _wndType;
		}
		
		public function _WindowBase(params:Object=null)
		{
			super();
			_scene = new Sprite;
			
			_backgroundMask = new Sprite;
			_waiting = new Queue;
			_active = new Queue;
			_params = params;
			if(_params == null) {
				_params = new Object;
			}
			if(_params.hasOwnProperty("parent")) {
				_parentWindow = _params.parent;
			}
			if(_params.hasOwnProperty("data")) {
//				_data = _params.data;
			}
			_uiStatus = null;
			
			var graphics:Graphics = _backgroundMask.graphics;
			graphics.lineStyle(0, 0x000000, 0.5);
			graphics.beginFill(0x000000, backTransparant);
			graphics.drawRect(-GlobalRef.width/2,-GlobalRef.height/2,GlobalRef.width,GlobalRef.height);
			graphics.endFill();
			
			addChildAt(_backgroundMask,0);
//			_backgroundMask.addEventListener(TQTTouchEvent.TOUCH_TAP,close,false,0,true);
			_time=getTimer();
			if(isNeedGradualChange)
			{
				_backgroundMask.alpha=0;
				addEventListener(Event.ENTER_FRAME,onFrame);
			}
			else
			{
				_backgroundMask.alpha=backColorAlpha;
			}
		}
		
		private function adjustCloseBtn():void
		{
			if(isAdjustCloseBtn)
			{
				var button:Button=this["_btn_close"];
				var posPoint:Point=new Point(GlobalRef.width-button.width/2-10-GlobalRef.width/2,10+button.height/2-GlobalRef.height/2);
				var target:Point=Util.getRelativePostion(_scene,button.parent,posPoint);
				button.x=target.x;
				button.y=target.y;
			}
		}
				
		private function onFrame(evt:Event):void{
			var a:Number=(getTimer()-_time)/1000/MaxTime;
			if(a>=1){
				_backgroundMask.alpha=1;
				removeEventListener(Event.ENTER_FRAME,onFrame);
			}else{
				_backgroundMask.alpha=a;
			}
		}
		private function onTick(evt:Event):void{
			tick--;
			if(tick<0){
				removeEventListener(Event.ENTER_FRAME,onTick);
				if(delayBind){
					ViewAssemble.bindMediator(this);
				}
				nextFrame_SN.dispatch();
			}
		}
		
		public override function destory():void
		{
			removeEventListener(Event.ENTER_FRAME,onTick);
			removeEventListener(Event.ENTER_FRAME,onFrame);
			nextFrame_SN.removeAll();
			removeChildren();
			CommonControlFun.clearMaterial(_scene);
			if(_scene) {_scene.removeChildren();_scene=null;}
			super.destory();
		}
		
		
		
		public function updateData(data:*):void
		{
			
		}
		
		protected function beforeOpen():void
		{
//			LayerController.instance.uiLayer.pushStatus(_uiStatus);
			trace("[open window] type:\t"+wndType);
			if(!delayBind){
				ViewAssemble.bindMediator(this);
			}
			
			
			addEventListener(Event.ENTER_FRAME,onTick);
			
			if((null==_uiStatus)||(_uiStatus.t==true)||(_uiStatus.s==true)||(_uiStatus.u==true))
			{
				Music.playFX(Music.FX_Window_Open);	
			}
			
			// 显示用户条
			if(showUserInfo){
//				if(LayerController.instance.uiLayer.userInfoBar){
//					var userBar:UserInfoBar=LayerController.instance.uiLayer.userInfoBar;
//					userBar.display.x=-GlobalRef.width/2;
//					userBar.display.y=-GlobalRef.height/2;
//					this.addChild(userBar.display);
//				}
			}
			
			adjustCloseBtn();
			
		}
		
	/*	private function setStaticText(container:DisplayObjectContainer):void{
			if(container!=null){
				var childNum:int=container.numChildren;
				for(var index:int=0; index<childNum; index++){
					var child:DisplayObject=container.getChildAt(index);
					if(child!=null ){
						if(child is TextField){
							if(child.name.indexOf("instance")!=-1){
								(child as TextField).mouseEnabled=false;
								(child as TextField).selectable=false;
								(child as TextField).text=Util.getWindowLan(proName);
								
							}
						}else if(child is DisplayObjectContainer){
							setStaticText(child as DisplayObjectContainer);
						}
							
					}
				}
			}
		}*/
		
		
		
		
		
		protected function afterOpen():void{}
		
		protected function beforeClose():void{}
		
		protected function afterClose():void
		{
			if((null==_uiStatus)||(_uiStatus.t==true)||(_uiStatus.s==true)||(_uiStatus.u==true))
			{
				Music.playFX(Music.FX_Window_Close);
			}
			if(showUserInfo){
//				if(contains(LayerController.instance.uiLayer.userInfoBar.display)){
//					LayerController.instance.uiLayer.userInfoBar.display.x=0;
//					LayerController.instance.uiLayer.userInfoBar.display.y=0;
//					LayerController.instance.uiLayer.addChild(LayerController.instance.uiLayer.userInfoBar.display);
//				}
			}
			
			
//			LayerController.instance.uiLayer.popStatus(_uiStatus);
		}
		
		override protected function onAddToStage(evt:Event=null):void
		{
			super.onAddToStage(evt);
			afterOpen();
		}
		
		override protected function onRemoveFromStage(evt:Event=null):void
		{
			super.onRemoveFromStage(evt);
			afterClose();
			destory();
			openNext();
		}
		
		public function open(evt:Event=null):void
		{
			parentWindow.pushWindow(this,-100);
		}
		
		public function close(evt:Event=null):void
		{
			while(_waiting.length > 0) {
				_waiting[0].close();
			}
			while(_active.length > 0) {
				_active[0].close();
			}
			if(parentWindow != this) {
				parentWindow.closeWindow(this);
			}
		}
		
		private final function openWindow(window:_WindowBase):void
		{
			window.x=GlobalRef.width/2;
			window.y=GlobalRef.height/2;
			if(contains(window)) {
				addChild(window);
				return;
			}
			window.beforeOpen();
			addChild(window);
			
			
			
			//后台发送打开窗口log
			/*var windowName:String = getQualifiedClassName(window);
			if(UserData.windowTraceData[windowName] == null) {
				UserData.windowTraceData[windowName] = 1;
			} else {
				UserData.windowTraceData[windowName] += 1;
			}*/
			
//			if(LayerController.instance != null && _maskLoading) {
//				LayerController.instance.waitLayer.removeLoading(this);
//			}
		}
		
		public final function pushWindow(window:_WindowBase,index:int=-1):void
		{
			if(window == null) {
				return;
			}
			if (index < -99) {
				_active.push(window);
				openWindow(window);
			} else {
				_waiting.addItemAt(window,index);
				openNext();
			}
		}
		private final function closeWindow(window:_WindowBase):void
		{
			ViewAssemble.unBindMediator(window);
			window.beforeClose();
			if(contains(window) && window != this) {
				removeChild(window);
			}
			_active.remove(window);
			
			WindowManager.closeWND(window);
			openNext();
		}
		
		private final function openNext():void
		{
			if(_suspend || _active.length > 0 || _waiting.length == 0) {
				return;
			}
			var window:_WindowBase = _waiting.shift();
			_active.push(window);
			openWindow(window);
		}
		
		public final function get parentWindow():_WindowBase
		{
			if(_parentWindow == null) {
				_parentWindow = LayerController.instance.windowLayer.rootWindow;
			}
			return _parentWindow;
		}

		public function get suspend():Boolean
		{
			return _suspend;
		}

		public function set suspend(value:Boolean):void
		{
			_suspend = value;
			if(_suspend == false) {
				openNext();
			}
		}
		
		protected function get isAdjustCloseBtn():Boolean
		{
			return false;
		}
		
		/**
		 * 背景透明度
		 */
		protected function get backColorAlpha():Number
		{
			return 1;
		}
		/**
		 * 绘制背景
		 */
		protected function get backTransparant():Number
		{
			return 0.7;
		}
		/**
		 * 背景是否支持渐变
		 */
		protected function get isNeedGradualChange():Boolean
		{
			return true;
		}
	}
}