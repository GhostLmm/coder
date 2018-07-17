package ui.widget
{
	import core.event.TqtEvent;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.utils.getTimer;
	
	import util.Queue;

	public class PageController extends ScrollController
	{
		public var _target_index:Number = 0;
		protected var _progressManagers:Queue = new Queue;
		
		public function PageController(position:Position,align:int=VERTICAL)
		{
			super(position,align);
		}
		
		override protected function onTouchBegin(evt:Object):void
		{
			super.onTouchBegin(evt);
			_scroll_bar.visible = false;
		}
		
		public static const MoveRate:Number=0.2;
		
		override protected function onTouchEnd(evt:Object):void
		{
			super.onTouchEnd(evt);
			var leftIndex:int = 0;
			var rightIndex:int = 0;
			var len:int = getItemLength();
			if(this._target_index==0)
			{
				leftIndex=0;
				rightIndex=1;
			}
			else if(this._target_index==len-1)
			{
				leftIndex=len-2;
				rightIndex=len-1;
			}
			else
			{
				leftIndex=this._target_index-1;
				rightIndex=this._target_index+1;
			}
			for (var i:int=0;i<len;i++) {
				var item:Object = getItemPostionByIndex(i);
				if(item[_direction] < -containerDirection 
					&& -containerDirection < item[_direction]+item[_distance]) {
					leftIndex = i;
					if(leftIndex == len-1) {
						rightIndex = i;
					} else {
						rightIndex = i+1;
					}
				}
			}
			
//			trace("currentIndex:"+_target_index+
//				"\tleft:"+leftIndex+
//				"\tright:"+rightIndex+
//				"\tcontainPostion:"+(-containerDirection+scrollRect[_distance])+
//				"\tleftX:"+getItemPostionByIndex(leftIndex)[_direction]+
//				"\trightX:"+getItemPostionByIndex(rightIndex)[_direction]+
//				"\twidth:"+getItemPostionByIndex(rightIndex)[_distance]  );
			
			var goLeft:Boolean=-containerDirection< getItemPostionByIndex(leftIndex)[_direction] +getItemPostionByIndex(leftIndex)[_distance]*(1-MoveRate);
			
			var rightObj:Object=getItemPostionByIndex(rightIndex);
			if(rightObj==null) rightIndex--;
			var goRight:Boolean=-containerDirection+scrollRect[_distance] > getItemPostionByIndex(rightIndex)[_direction] +getItemPostionByIndex(rightIndex)[_distance]*MoveRate;
			
			if(_speed > 0.2) {
				_target_index = leftIndex;
			} else if(_speed < -0.2) {
				_target_index = rightIndex;
			}
			else if(_speed!=0)
			{
				var derJuli:Number=this["mouse"+_direction.toUpperCase()]-_touchStartPos;
				trace(derJuli);
				if(Math.abs(derJuli)>10)
				{						
					var left:Boolean= Math.abs(leftIndex-_target_index) > Math.abs(rightIndex-_target_index);
					if(left){
						if(goLeft){
							_target_index=leftIndex;
						}else{
							_target_index=rightIndex;
						}
					}else{
						if(goRight){
							_target_index=rightIndex;
						}else{
							_target_index=leftIndex;
						}
					}
				}
				else
				{
					trace("回不去啦！")
				}
			}
//			else if(-containerDirection< getItemPostionByIndex(leftIndex)[_direction] +getItemPostionByIndex(leftIndex)[_distance]*4/5 ) {
//				_target_index = leftIndex;
//			} else if(-containerDirection+scrollRect[_distance] > getItemPostionByIndex(rightIndex)[_direction] +getItemPostionByIndex(rightIndex)[_distance]/5 ) {
//				_target_index = rightIndex;
//			}
//			else {
//				_target_index = rightIndex;
//			}
			selectTab();
		}
		
		override protected function onEnterFrame(evt:Event):void
		{
			var _time_current:Number = getTimer();
			var t:Number = _time_current - _time_old;
			var dt:Number = _time_current - _time_new;
			var delta:Number = 0;
			var k:Number = -0.01 * dt;
			delta = containerDirection * k;
			if(_target_index >= 0 && _target_index < getItemLength()) {
				delta += getItemPostionByIndex(_target_index)[_direction] * k;
			}
			moveContainer(delta);
			_time_new = _time_current;
//			if(Math.abs(containerDirection)<10&&Math.abs(delta)<0.4) {
			if(Math.abs(delta)<0.4) {
				if(null!=getItemPostionByIndex(_target_index))
				{	
					containerDirection=-getItemPostionByIndex(_target_index)[_direction];
				}
				_proxy.removeListener(this,Event.ENTER_FRAME,onEnterFrame);
				_scroll_bar.visible = false;
			}
		}
		
		override public function initItems(items:Queue, compareFunc:Function=null):void
		{
			_target_index = 0;
			super.initItems(items, compareFunc);
			selectTab();
		}
		
		override public function addItem(item:DisplayObject):void
		{
			super.addItem(item);
			setShowIndex(_target_index);
		}
		
		override public function removeItem(item:DisplayObject):void
		{
			super.removeItem(item);
			if(_target_index >= getItemLength()) {
				_target_index -= 1;
			}
			setShowIndex(_target_index);
		}
		
		override public function updateItems():void
		{
			super.updateItems();
			setShowIndex(_target_index);
		}
		
		
		public function setShowIndex(index:int):void
		{
			if(index < 0 || index >= getItemLength()) {
				return;
			}
			_target_index = index;
			selectTab();
			_time_old = _time_new = getTimer();
			_proxy.addListener(this,Event.ENTER_FRAME,onEnterFrame,false,0,true);
		}
		
		public function setIndex(index:int):void
		{
			if(_gridView){
				setShowIndex(index);
			}else{
				setShowIndex(_showIndexs.indexOf(index));
			}
			
		}
		
		protected function selectTab():void
		{
			var item:* = null;
			if(_target_index >= 0 && _target_index < getItemLength()) {
				item = getRealyItemByIndex(_target_index);
			}
			updateProgressManagers();
			trace("发送TAB_SELECT事件");
			dispatchEvent(new TqtEvent(TqtEvent.TAB_SELECT,{"index":_target_index,"item":item}));
		}
		
		public function registerProgressManager(prg:ProgressManager):void
		{
			_progressManagers.push(prg);
		}
		
		private function updateProgressManagers():void
		{
			for each( var prg:ProgressManager in _progressManagers) {
				prg.devider = getItemLength();
				prg.progress = _target_index+1;
			}
		}
		public override function destory():void
		{
			if(_progressManagers){
//				_progressManagers.length=0;
				_progressManagers=null;
			}
			super.destory();
		}
	}
}