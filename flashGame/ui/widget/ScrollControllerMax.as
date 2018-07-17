package ui.widget
{
	import com.fish.modules.core.models.GuideModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.tool.ListenerAddProxy;
	import com.greensock.TweenLite;
	import com.greensock.easing.Quart;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import avmplus.getQualifiedSuperclassName;
	
	import core.PlayerGuideManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import util.Util;
	
	public class ScrollControllerMax extends Sprite implements IComponent
	{
		public static const VERTICAL:int = 1;
		public static const HORIZONTAL:int = 2;
		
		public static const Type_Top:int=1;
		public static const Type_Center:int=2;
		public static const Type_Bottom:int=3;
		
		public static const DURATION:Number = 2000;
		
		protected var _proxy:ListenerAddProxy;
		
		public var _position:Position;
		private var _align:int;
		private var _duration:Number;
		private var _compareFunc:Function;
		
		protected var _container:Sprite = new Sprite;
		protected var _scroll_bar:Sprite = new Sprite;
		
		protected var _direction:String;
		protected var _distance:String;
		protected var _direction_oppo:String;
		protected var _distance_oppo:String;
		
		protected var _moveFlag:Boolean;
		
		private var _cls:Class;
		private var _dataArray:Array;
		protected var _gridView:GrideViewMax;
		
		protected var _speed:Number;
		protected var _pos_new:Number;
		protected var _pos_old:Number;
		protected var _time_new:uint;
		protected var _time_old:uint;
		
		private var moveStart:Number;
		
		public function get currentSelectedIndex():int
		{
			return _gridView._currentSelectIndex;
		}
		
		public function get currentSelectedData():Object
		{
			return _dataArray[_gridView._currentSelectIndex];
		}
		
		public function get dataArray():Array{
			return _dataArray;
		}
		
		private var _moveTop:Boolean=false;
		public function ScrollControllerMax(position:Position,align:int=VERTICAL,moveTop:Boolean=false)
		{
			_moveTop=moveTop;
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
			
			init();
			
			Util.replace(position,this);
//			_proxy.addListener(this,Event.ADDED_TO_STAGE,onInit,false,0,true);
		}
		
		public function initClass($cls:Class):void
		{
			if(_cls){
				throw new Error("item 类已经赋值");
			}
			_cls=$cls;
			_gridView=new GrideViewMax(_cls,_container,scrollRect,_align);
			_gridView.selectSN.add(gridViewSelect);
			_gridView.tapSN.add(gridViewTap);
		}
		
		public function setData($dataArray:Array,resetIndex:Boolean=false,showMovie:Boolean=false,$itemSize:Number=-1,$itemWidth:Number=-1,$itemHeight:Number=-1):void
		{
			if(_cls==null){
				throw new Error("item 类没有赋值");
			}
			_dataArray=$dataArray;
			_gridView.setDataArray(_dataArray,resetIndex,showMovie,$itemSize,$itemWidth,$itemHeight);
			setBarVisileShow();
		}
		private function setBarVisileShow():void
		{
			if(null==_gridView)
			{
				return;
			}
			if(null==_gridView.dataArray)
			{
				return;
			}
			if(_gridView.dataArray.length<=_gridView.showNum)
			{
				barVisible=false;
			}
			else
			{
				barVisible=true;
			}
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
//		public function 
		
		private function init():void
		{
			addChild(_container);
			addChild(_scroll_bar);
			_scroll_bar.visible = false;
			_scroll_bar[_direction_oppo] = scrollRect[_direction_oppo]+scrollRect[_distance_oppo]*0.98;
			_scroll_bar[_distance_oppo] = scrollRect[_distance_oppo]*0.02;
			_proxy.addListener(_container,TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false,0,true);
		}
		
		protected function onTouchBegin(evt:Object):void
		{
//			if((!PlayerGuideManager.getInstance()._tutorialComplete)||(LevelGuideManager.getInstance().isGuiding))
//			{
//				return;
//			}
			
			var guideModel:GuideModel = Context.getInjectInstance(GuideModel);
			if(guideModel && !guideModel.isComplete){
				return ;
			}
			
			
			moveStart=containerDirection;
			TweenLite.killTweensOf(_gridView);
			
			_proxy.removeListener(this,Event.ENTER_FRAME,onEnterFrame);
			_speed = 0;
			_pos_new = _pos_old = this["mouse"+_direction.toUpperCase()];
			_time_old = _time_new = getTimer();
			
			_scroll_bar.visible = true;
			//			GlobalRef.stage
			_proxy.addListener(GlobalRef.stage,TQTTouchEvent.TOUCH_MOVE,onTouchMove,false,0,true);
			//			GlobalRef.stage.addEventListener(TQTTouchEvent.TOUCH_OUT,onTouchEnd,false,0,true);
			_proxy.addListener(GlobalRef.stage,TQTTouchEvent.TOUCH_END,onTouchEnd,false,0,true);
		}
		
		protected function get containerDirection():Number
		{
			return _gridView[_direction];
		}
		protected function get containerDistance():Number
		{
			return _gridView[_distance];
		}
		protected function set containerDistance(value:Number):void
		{
			if(_gridView){
				_gridView[_distance]=value;
			}
		}
		protected function set containerDirection(value:Number):void
		{
			if(_gridView){
				_gridView[_direction]=value;
			}
		}
		
		protected function onTouchMove(evt:Object):void
		{
			var delta:Number = this["mouse"+_direction.toUpperCase()]-_pos_new;
//			trace("移动的计算距离："+delta);
			if(containerDirection > 0 || containerDirection < -containerDistance + scrollRect[_distance]) {
				delta *= 0.1;
			}
//			trace("移动的距离："+delta);
			moveContainer(delta);
			_pos_old = _pos_new;
			_pos_new = this["mouse"+_direction.toUpperCase()];
			_time_old = _time_new;
			_time_new = getTimer();
			
			if( Math.abs(containerDirection-moveStart) > 4 ){
				_container.mouseChildren=false;
			}
		}
		public function moveContainer(delta:Number):void
		{
			containerDirection += delta;
			updateBar();
		}
		
		private function moveAfterTween():void
		{
			moveViewToIndexOrData(moveIndex);
		}
		private var moveIndex:int;
		public function setSelectIndexOrData(indexOrData:*,needMove:Boolean=true):void
		{
			_gridView._tweenComSN.remove(moveAfterTween);
			
			var index:int;
			if(indexOrData is int){
				index=indexOrData;
			}else{
				for(index=0; index<_dataArray.length; index++){
					if(_dataArray[index]==indexOrData){
						break;
					}
				}
				if(index>=_dataArray.length){
					trace("没有该数据可以作为选择项");
					return ;
				}
			}
			
			if(needMove){
				if(_gridView.tweenFlag){
					moveIndex=index;
					_gridView._tweenComSN.addOnce(moveAfterTween);
				}else{
					moveViewToIndexOrData(index);
				}
				
			}
			
			if(_gridView.setSelected(index)){
				var evt:TqtEvent=new TqtEvent(TqtEvent.SCROLL_SELECTED,{index:index,data:_dataArray[index]});
				dispatchEvent(evt);
				trace("选择 ："+index);
			}
		}
		
		public function getRealyItemByIndex(index:int):Object
		{
			return _gridView.getItemByIndex(index);
		}
		
		private function gridViewTap(index:int,data:Object):void
		{
			var evt:TqtEvent=new TqtEvent(TqtEvent.SCROLL_TAP,{index:index,data:data});
			dispatchEvent(evt);
			trace("点击："+index);
		}
		
		private function gridViewSelect(index:int,data:Object):void
		{
			var evt:TqtEvent=new TqtEvent(TqtEvent.SCROLL_SELECTED,{index:index,data:data});
			dispatchEvent(evt);
			trace("选择 ："+index);
		}
		
		public function moveViewToIndexOrData(indexOrData:*):void
		{
			var pos:Number=0;
			var index:int;
			if(indexOrData is int){
				index=indexOrData;
			}else{
				for(index=0; index<_dataArray.length; index++){
					if(_dataArray[index]==indexOrData){
						break;
					}
				}
				if(index>=_dataArray.length){
					trace("没有该数据可以作为选择项");
					return ;
				}
			}
			
//			pos=_gridView.itemSize*index+scrollRect[_distance]/2;
			
			
			pos=_gridView.itemSize*index;
			
			pos=adjustPostion(pos);
			if(_moveTop){
				moveToPostionInTween(-pos);
			}else{
				var rect:Rectangle=_gridView.getCurrentViewRect();
				var p:Point=new Point(0,0);
				p[_gridView.attrX]=_gridView.itemSize*index;
				//			p.x+=_gridView.itemWidth/2;
				//			p.y+=_gridView.itemHeight/2;
				
				p.x+=_gridView.itemWidth/2;
				p.y+=_gridView.itemHeight/2;
				//			trace("信息："+index+" / "+pos+" / "+rect+" / "+p+" / "+_gridView.itemSize+" / "+_gridView.itemHeight);
				if(rect.containsPoint(p)){
					trace("当前item 已经显示在舞台上");
				}else{
					moveToPostionInTween(-pos);
				}
			}
			
		}
		
		private function moveToPostionInTween(pos:Number):void
		{
			_proxy.removeListener(GlobalRef.stage,TQTTouchEvent.TOUCH_MOVE,onTouchMove);
			_proxy.removeListener(GlobalRef.stage,TQTTouchEvent.TOUCH_END,onTouchEnd);
			//			GlobalRef.stage.removeEventListener(TQTTouchEvent.TOUCH_OUT,onTouchEnd);
			_proxy.removeListener(this,Event.ENTER_FRAME,onEnterFrame);
			
			var obj:Object={};
			obj[_gridView.attrX]=pos;
			obj.ease=Quart.easeOut;
			obj.onComplete=function():void{
				_proxy && _proxy.addListener(_container,TQTTouchEvent.TOUCH_BEGIN,onTouchBegin,false,0,true);
			};
			TweenLite.to(_gridView,1,obj);
		}
		
		
		private function adjustPostion(pos:Number):Number
		{
			pos=Math.max(0,pos);
//			pos=Math.min(pos,scrollRect[_distance]);
			var wd:Number;
//			trace("位置调整："+_gridView.itemLength+" / "+_gridView.itemLength*_gridView.itemSize+" / "+scrollRect[_gridView.attrWidth]+" / "+(_gridView.itemLength*_gridView.itemSize<=scrollRect[_gridView.attrWidth]));
			if(_gridView.itemLength*_gridView.itemSize<=scrollRect[_gridView.attrWidth]){
				
//				wd=scrollRect[_gridView.attrWidth];
				wd=0;
			}else{
				wd=_gridView.itemLength*_gridView.itemSize-scrollRect[_gridView.attrWidth];
			}
			pos=Math.min(pos,wd);
			return pos;
		}
		
		protected function updateBar():void
		{
			//			_scroll_bar[_distance] = scrollRect[_distance] * scrollRect[_distance] / cotanieW;
			//			_scroll_bar[_direction] = -containX * scrollRect[_distance] /cotanieW;
			_scroll_bar[_distance] = scrollRect[_distance] * scrollRect[_distance] / containerDistance;
			_scroll_bar[_direction] = -containerDirection * scrollRect[_distance] / containerDistance;
		}
		
		protected function onTouchEnd(evt:Object):void
		{
			_container.mouseChildren=true;
			var elapsedTime:Number = getTimer() - _time_old;
			_speed = (this["mouse"+_direction.toUpperCase()] - _pos_old) / elapsedTime;
			_time_old = _time_new = getTimer();
			
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
		
		public function destory():void
		{
			if(_proxy) {_proxy.clear(); _proxy=null;}
			TweenLite.killTweensOf(_gridView);
			_dataArray=null;
			if(_gridView) {_gridView.destory(); _gridView=null;}
			
		}
	}
}