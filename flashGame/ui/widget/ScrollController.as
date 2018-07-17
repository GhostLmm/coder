package ui.widget
{
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import core.event.TQTTouchEvent;
	
	import util.Queue;
	
	public class ScrollController extends Sprite implements IComponent
	{
		public static const VERTICAL:int = 1;
		public static const HORIZONTAL:int = 2;
		
		public static const UPDATE:String = "tqt_scroll_controller_update";
		public static const DURATION:Number = 2000;
		private var _position:Position;
		private var _align:int;
		private var _duration:Number;
		private var _compareFunc:Function;
		
		protected var _items:Queue = new Queue;
		protected var _showIndexs:Queue = new Queue;
		
		protected var _container:Sprite = new Sprite;
		protected var _scroll_bar:Sprite = new Sprite;
		
		protected var _speed:Number;
		protected var _pos_new:Number;
		protected var _pos_old:Number;
		protected var _time_new:uint;
		protected var _time_old:uint;
		
		protected var _direction:String;
		protected var _distance:String;
		protected var _direction_oppo:String;
		protected var _distance_oppo:String;
		
		private var _itemClass:Class;
		
		protected var _proxy:ListenerAddProxy;
		
		
		private var _moveStart:Number;
		
		private var _touchStartTime:int;
		protected var _touchStartPos:Number;
		
		public function ScrollController(position:Position,align:int=VERTICAL)
		{
			_proxy=new ListenerAddProxy();
			super();
			_position = position;
			_align = align;
			_duration = DURATION;
			
			switch(_align) {
				case HORIZONTAL:
					_direction = "x";
					_direction_oppo = "y";
					_distance = "width";
					_distance_oppo = "height";
					break;
				case VERTICAL:
				default:
					_direction = "y";
					_direction_oppo = "x";
					_distance = "height";
					_distance_oppo = "width";
					break;
			}
			
			this.x = position.rect.x;
			this.y = position.rect.y;
			scrollRect = new Rectangle(0,0,position.rect.width,position.rect.height);
			
			_scroll_bar.graphics.clear();
			_scroll_bar.graphics.beginFill(GlobalRef.scr_color, GlobalRef.scr_aphla);
			_scroll_bar.graphics.drawRect(0, 0, 1, 1);
			_scroll_bar.graphics.endFill();
			_proxy.addListener(this,Event.ADDED_TO_STAGE,onInit,false,0,true);
		}
		/**
		 *  设置不可拖动
		 */
		public function setCannotTuodong():void
		{
			_proxy.removeListener(_container,TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false);
		}
		protected function onInit(evt:Event):void
		{
			_proxy.removeListener(this,Event.ADDED_TO_STAGE,onInit);
			addChild(_container);
			addChild(_scroll_bar);
			_scroll_bar.visible = false;
			_scroll_bar[_direction_oppo] = scrollRect[_direction_oppo]+scrollRect[_distance_oppo]*0.98;
			_scroll_bar[_distance_oppo] = scrollRect[_distance_oppo]*0.02;
			updateBar();
			updateItems();
			_proxy.addListener(this,Event.ADDED_TO_STAGE,onAddToStage,false,0,true);
			_proxy.addListener(_container,TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false,0,true);
		}
		
		protected function onAddToStage(evt:Event):void
		{
//			containerDirection = 0;
			updateBar();
			updateItems();
			_time_old = _time_new = getTimer();
//			_proxy.addListener(this,Event.ENTER_FRAME,onEnterFrame,false,0,true);
		}
		
		protected function onTouchBegin(evt:Object):void
		{
			/*if((!PlayerGuideManager.getInstance()._tutorialComplete)||(LevelGuideManager.getInstance().isGuiding))
			{
				return;
			}*/
			_proxy.removeListener(this,Event.ENTER_FRAME,onEnterFrame);
			_speed = 0;
			_pos_new = _pos_old = this["mouse"+_direction.toUpperCase()];
			_time_old = _time_new = getTimer();
			_touchStartTime=getTimer();
			_touchStartPos=this["mouse"+_direction.toUpperCase()];
			_scroll_bar.visible = true;
//			GlobalRef.stage
			_proxy.addListener(GlobalRef.stage,TQTTouchEvent.TOUCH_MOVE,onTouchMove,false,0,true);
//			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_OUT,onTouchEnd,false,0,true);
			_proxy.addListener(GlobalRef.stage,TQTTouchEvent.TOUCH_END,onTouchEnd,false,0,true);
			
			_moveStart=containerDirection;
		}
		
		protected function onTouchMove(evt:Object):void
		{
			var delta:Number = this["mouse"+_direction.toUpperCase()]-_pos_new;
			if(containerDirection > 0 || containerDirection < -containerDistance + scrollRect[_distance]) {
				delta *= 0.1;
			}
			moveContainer(delta);
			_pos_old = _pos_new;
			_pos_new = this["mouse"+_direction.toUpperCase()];
			_time_old = _time_new;
			_time_new = getTimer();
			
			if( Math.abs(containerDirection-_moveStart)>4){
				_container.mouseChildren=false;
			}
		}
		
		protected function onTouchEnd(evt:Object):void
		{
			
			_container.mouseChildren=true;
			var elapsedTime:Number = getTimer() - _time_old;
			_speed = (this["mouse"+_direction.toUpperCase()] - _pos_old) / elapsedTime;
			_time_old = _time_new = getTimer();
			
			if(getTimer()-_touchStartTime<=20){
				trace("间隔太短");
				_speed=0;
			}
			var derJuli:Number=this["mouse"+_direction.toUpperCase()]-_touchStartPos;
			if(Math.abs(derJuli)<10)
			{
				_speed=0;	
			}
			_proxy.removeListener(GlobalRef.stage,TQTTouchEvent.TOUCH_MOVE,onTouchMove);
			_proxy.removeListener(GlobalRef.stage,TQTTouchEvent.TOUCH_END,onTouchEnd);
//			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_OUT,onTouchEnd);
			_proxy.addListener(this,Event.ENTER_FRAME,onEnterFrame,false,0,true);
		}
		
		protected function onEnterFrame(evt:Event):void
		{
			var _time_current:Number = getTimer();
			var t:Number = _time_current - _time_old;
			var dt:Number = _time_current - _time_new;
			var delta:Number = 0;
			var k:Number = -0.01 * dt;
			if(t < _duration) {
				delta = _speed * Math.pow( (1-t/_duration),0.5) * dt;
			}
			if(containerDirection < -containerDistance + scrollRect[_distance]) {
				delta = (containerDirection+containerDistance-scrollRect[_distance]) * k;
				_speed = 0;
			}
			if(containerDirection > 0 || containerDistance < scrollRect[_distance]) {
				delta = containerDirection * k;
				_speed = 0;
			}
			moveContainer(delta);
			_time_new = _time_current;
			if(Math.abs(delta) == 0) {
				_proxy.removeListener(this,Event.ENTER_FRAME,onEnterFrame);
				_scroll_bar.visible = false;
			}
		}
		public function moveToIndex(_index:int,_isNeedMove:Boolean=false):void
		{
			if((_index>=0)&&(_index<getItemLength()))
			{
				var posObj:Object=getItemPostionByIndex(_index);
				if(!_isNeedMove)
				{
					if(_align==VERTICAL)
					{
						containerDirection=-posObj.y;
					}
					else
					{
						containerDirection=-posObj.x;
					}
				}
				else
				{
					if(_align==VERTICAL)
					{
						TweenLite.to(this,0.5,{containerDirection:-posObj.y});
					}
					else
					{
						TweenLite.to(this,0.5,{containerDirection:-posObj.y});
					}
				}
			}
		}
		public function get containerDirection():Number
		{
			return (_gridView)?_gridView[_direction]:_container[_direction];
		}
		protected function get containerDistance():Number
		{
			return (_gridView)?_gridView[_distance]:_container[_distance];
		}
		protected function set containerDistance(value:Number):void
		{
			if(_gridView){
				_gridView[_distance]=value;
			}else{
				_container[_distance]=value;
			}
		}
		public function set containerDirection(value:Number):void
		{
			if(_gridView){
				_gridView[_direction]=value;
			}else{
				_container[_direction]=value;
			}
		}
		protected function updateBar():void
		{
//			_scroll_bar[_distance] = scrollRect[_distance] * scrollRect[_distance] / cotanieW;
//			_scroll_bar[_direction] = -containX * scrollRect[_distance] /cotanieW;
			_scroll_bar[_distance] = scrollRect[_distance] * scrollRect[_distance] / containerDistance;
			_scroll_bar[_direction] = -containerDirection * scrollRect[_distance] / containerDistance;
		}
		/**   返回的并非真实的 数据，而是位置数据
		 * */ 
		protected function getItemPostionByIndex(index:int):Object
		{
			if(_gridView){
				return _gridView.getPositionItem(index);
			}
			return _items[_showIndexs[index]];
		}
		public function getRealyItemByIndex(index:int):Object
		{
			if(_gridView){
				return _gridView.getItemByIndex(index);
			}
			return _items[_showIndexs[index]];
		}
		
		protected function getItemLength():int
		{
			if(_gridView){
				return _gridView.length();
			}
			return _showIndexs.length;
		}
		
		public function updateItems():void
		{
			if(_gridView) return ;
			if(_compareFunc != null) {
				_items.sort(_compareFunc);
			}
			_showIndexs = new Queue;
			var delta:Number = 0;
			var count:uint = _items.length;
			for(var i:uint=0; i<count; i++) {
				if(_items[i].visible) {
					_items[i][_direction] = delta;
					if(_items[i][_distance] == 0) {
						GlobalRef.stage.addChild(_items[i]);
					}
					_container.addChild(_items[i]);
					delta += _items[i][_distance];
					_showIndexs.push(i);
				} else {
					if(_container.contains(_items[i])) {
						_container.removeChild(_items[i]);
					}
				}
			}
		}
		
		public function initItems(items:Queue,compareFunc:Function=null):void
		{
			if(compareFunc != null) {
				_compareFunc = compareFunc;
			}
			_items = items;
			_container.removeChildren();
			var len:int = _items.length;
			for (var i:int=0;i<len;i++) {
				_container.addChild(_items[i]);
				
			}
			updateItems();
			containerDirection = 0;
		}
		
		public function initItemClass(itemClass:Class,dataArray:Array=null):void
		{
			_itemClass=itemClass;
			
			if(_gridView==null){
				_gridView=new GridView(itemClass,_container,scrollRect,_align);
				
			}
			
			if(dataArray!=null){
				setData(dataArray);
			}
		}
		
		protected var _gridView:GridView;
		
		
		public function setData(dataArray:Array):void
		{
			if((dataArray.length<_gridView.startIndex)||(dataArray.length<_gridView.startIndex+_gridView.showNum))
			{
				initPosition();
				_gridView.startIndex=0;
			}
//			if(_gridView.startIndex+_gridView.showNum>=dataArray.length)
//			{
//				_gridView.startIndex=dataArray.length-_gridView.showNum>0?dataArray.length-_gridView.showNum:0;
//				moveToIndex(_gridView.startIndex);
//			}
			_gridView.setDataArray(dataArray);
		}
		
		/**  获取数据 通过 位置 ， 
		 * */
		public function getDataByIndex($index:int):Object
		{
			if(_gridView && _gridView.dataArray && _gridView.dataArray.length-1>=$index){
				return _gridView.dataArray[$index];
			}
			return null;
		}
		
		
		
		public function addItem(item:DisplayObject):void
		{
			_items.push(item);
			_container.addChild(item);
			_proxy.addListener(item,UPDATE,onAddToStage,false,0,true);
			updateItems();
		}
		
		public function removeItem(item:DisplayObject):void
		{
			_items.remove(item);
			if(_container.contains(item)) {
				_container.removeChild(item);
			}
			updateItems();
		}
		
		public function moveContainer(delta:Number):void
		{
			containerDirection += delta;
			updateBar();
		}
		
		public function initPosition():void
		{
			containerDirection = 0;
		}

		public function get items():Queue
		{
			return _items;
		}

		public function get compareFunc():Function
		{
			return _compareFunc;
		}

		public function set compareFunc(value:Function):void
		{
			_compareFunc = value;
			updateItems();
		}
		
		public function set barVisible(value:Boolean):void
		{
			if(value) {
				addChild(_scroll_bar);
			} else {
				if(contains(_scroll_bar)) {
					removeChild(_scroll_bar);
				}
			}
//			_scroll_bar.visible = value;
		}
		
		public function destory():void
		{
			TweenLite.killTweensOf(_gridView);
			TweenLite.killTweensOf(this);
			if(_proxy){
				_proxy.clear();
				_proxy=null;
			}
			if(_container){
				_container.removeChildren();
				_container=null;
			}
			if(_gridView){
				_gridView.destory();
				_gridView=null;
			}
			_position=null;
			_scroll_bar=null;
			

			if(items){
				_items=null;
			}
			
			_compareFunc=null;
		}
	}
}