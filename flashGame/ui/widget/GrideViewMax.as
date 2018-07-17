package ui.widget
{
	import com.greensock.TimelineMax;
	import com.greensock.TweenMax;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;

	public class GrideViewMax
	{
		public static const VERTICAL:int = 1;
		public static const HORIZONTAL:int = 2;
		
		private var itemClass:Class;
		public var dataArray:Array;
		private var align:int;
		private var container:DisplayObjectContainer;
		private var viewRect:Rectangle;
		
		public var itemSize:Number=-1;
		
		public var attrX:String;
		public var attrWidth:String;
		public var attrY:String;
		
		public var showNum:int;
		
		private var itemArray:Array;
		private var startIndex:int;
		
		public var itemWidth:Number;
		public var itemHeight:Number;
		public var itemLength:int;
		
//		private var needCache:Boolean=false;
		
		
		private var vitrulWidth:Number;
		
		public var selectSN:Signal=new Signal(int,Object);
		public var tapSN:Signal=new Signal(int,Object);
		
		public var _currentSelectIndex:int=-1;
		
		
		
		public function GrideViewMax($itemCls:Class,$container:DisplayObjectContainer,$viewRect:Rectangle,$align:int=1)
		{
			itemArray=[];
			container=$container;
			itemClass=$itemCls;
			viewRect=$viewRect;
			
			align=$align;
			attrX=(align==VERTICAL)?"y":"x";
			attrY=(align!=VERTICAL)?"y":"x";
			attrWidth=(align==VERTICAL)?"height":"width";
		}
		
		private function initItemSize(data:Object):void{
			var temp:Object=new itemClass();
			trace(temp["constructor"]);
			(temp as IGridItemMax).loadData(data);
			itemSize=temp[attrWidth];
			
			itemWidth=temp.width;
			itemHeight=temp.height;
			if(itemSize==0){
				throw new Error("item 没有体积 ： "+itemClass);
			}
			(temp as IGridItemMax).destory();
			temp=null;
			showNum=Math.ceil(viewRect[attrWidth]/itemSize);
		}
		
		private function initItemArray():void
		{	
			startIndex=0;
			for(var index:int=0; index<showNum+2; index++){
				var item:DisplayObject=new itemClass();
				item[attrX]=(index-1)*itemSize;
				item.visible=false;
				container.addChild(item);
				itemArray.push(item);
				item.addEventListener(TQTTouchEvent.TOUCH_TAP,onSelect);
				
			}
		}
		
		private function onSelect(evt:Event):void
		{
			
			var target:IGridItemMax=evt.currentTarget as IGridItemMax;
			if(target.enable){
				if(setSelected(target.index)){
					if(null!=selectSN)
					{
						selectSN.dispatch(target.index,target.data);
					}
				}else{
					tapSN.dispatch(target.index,target.data);
				}
				
				
				
			}
		}
		
		public function setSelected(index:int):Boolean
		{
			if(_currentSelectIndex!=index){
				_currentSelectIndex=index;
				updateSelect();
				return true;
			}
			return false;
			
		}
		
		public function getCurrentViewRect():Rectangle
		{
			var rect:Rectangle=new Rectangle();
			rect=viewRect.clone();
			rect[attrX]=startIndex*itemSize;
			trace("startIndex:"+startIndex);
			return rect;
		}
		
		public function length():int
		{
			return (dataArray)?dataArray.length:0;
		}
		
//		public function getCurrent
		
		public function getItemByIndex(index:int,curentIndex:int=int.MIN_VALUE):Object
		{
//			if(!needCache){
//				return itemArray[index];
//			}
			if(curentIndex==int.MIN_VALUE){
				curentIndex=startIndex;
			}
			var t:int=curentIndex%(showNum+2)+1;
			if(t==showNum+2){
				t=0;
			}
			//			if(index==curentIndex-1){
			//				t-1+showNum+2)
			//			}
			
			if(index>=curentIndex-1 && index<=curentIndex+showNum){
				var itemIndex:int=(index-curentIndex+t+showNum+2)%(showNum+2);
				return itemArray[itemIndex];
			}else{
				return null;
			}
		}
		
		
		
		public function getPositionItem(index:int):Object
		{
			var obj:Object={};
			obj.x=0;
			obj.y=0;
			obj[attrX]=index*itemSize;
			obj[attrWidth]=itemSize;
			return obj;
		}
		
		private function setItemDataIndex(index:int,curentIndex:int=int.MIN_VALUE):void
		{
			if(curentIndex==int.MIN_VALUE){
				curentIndex=startIndex;
			}
			var item:Object=getItemByIndex(index,curentIndex);
			var data:Object=(index>=0 && index<dataArray.length)?dataArray[index]:null;
			if(item==null) return ;
			
			if(item[attrX]!=index*itemSize){
				item[attrX]=index*itemSize;
			}
			item[attrY]=0;
			if(item.visible!=(data!=null)){
				item.visible=(data!=null);
			}
			if(data!=null){
				item.index=index;
				item.loadData(data);
				
				
				item.selected=(item.index==_currentSelectIndex);
				
//				trace("赋值 并 显示： "+index +"\t"+attrX+" : "+item[attrX]+"/"+item.visible);
			}
		}
		
		private function updateSelect():void
		{
			for each(var item:IGridItemMax in itemArray){
				item.selected=(item.index==_currentSelectIndex);
			}
		}
		
//		private function 
		internal var tweenFlag:Boolean;
		
		internal var _tweenComSN:Signal=new Signal();
		private function tweenStart():void
		{
			tweenFlag=true;
			container.mouseEnabled=false;
			container.mouseChildren=false;
		}
		private function tweenStop(isDestory:Boolean=false):void
		{
			container.mouseEnabled=true;
			container.mouseChildren=true;
			tweenFlag=false;
			if(_timeLine){
				_timeLine.stop();
				_timeLine.clear();
				_timeLine=null;
				if(!isDestory){
					_tweenComSN.dispatch();
				}
				
			}
		}
		
		private var _tweenTime:Number=0.05;
		public function setTweenTime(value:Number):void{
			_tweenTime=value;
		}
			
		
		private var _timeLine:TimelineMax;
		public function setDataArray(array:Array,resetIndex:Boolean,showMovie:Boolean,
									 $itemSize:Number=-1,$itemWidth:Number=-1,$itemHeight:Number=-1):void
		{
			tweenFlag=false;
			container.mouseEnabled=true;
			container.mouseChildren=true;
			
			if(_timeLine){
				_timeLine.stop();
				_timeLine.clear();
				_timeLine=null;
			}
			
			if(itemSize==-1 && $itemSize!=-1 && array.length!=0){
				itemSize=$itemSize;
				itemWidth=$itemWidth;
				itemHeight=$itemHeight;
				showNum=Math.ceil(viewRect[attrWidth]/itemSize);
				initItemArray();
			}else{
				if(itemSize==-1){
					if(array.length!=0){
						initItemSize(array[0]);
						initItemArray();
					}else{
						return ;
					}
				}
			}
			
			
//			_currentSelectIndex=-1;
			dataArray=array;
			itemLength=dataArray.length;
			vitrulWidth=itemSize*dataArray.length;
//			needCache=(dataArray.length>showNum+2);
			
			if(resetIndex){
				startIndex=0;
				this[attrX]=0;
			}
			
			var index:int=0;
			for (index=startIndex-1; index<startIndex+showNum+1; index++){
				setItemDataIndex(index);
			}
			if(showMovie && startIndex==0){
				tweenStart();
				_timeLine=new TimelineMax({onComplete:tweenStop});
				var tweenArray:Array=[];
				for each(var item:IGridItemMax in itemArray){
					if((item as Object).visible){
						tweenArray.push(item.enterMovie());
					}
				}
				_timeLine.appendMultiple(tweenArray,0,"normal",_tweenTime);
			}
			
			/*if(!needCache){
				for(index=0; index<showNum+2; index++){
					var item:Object=itemArray[index];
					item[attrX]=index*itemSize;
					if(index<dataArray.length){
						item.visible=true;
						(item as IGridItem).loadData(dataArray[index]);
						container.addChild(item as DisplayObject);
					}else{
						if(container.contains(item as DisplayObject)){
							container.removeChild(item as DisplayObject);
						}
						
					}
				}
			}else{
				for (index=startIndex-1; index<startIndex+showNum+1; index++){
					setItemDataIndex(index);
				}
			}*/
		}
		
		public function destory():void
		{
			tweenStop(true);
			if(dataArray){
				dataArray=null;
			}
			if(itemArray){
				for each(var item:IGridItemMax in itemArray){
					(item as DisplayObject).removeEventListener(TQTTouchEvent.TOUCH_TAP,onSelect);
					item.destory();
				}
				itemArray.length=0;
				itemArray=null;
			}
			if(container){
				container.removeChildren();
				container=null;
			}
			if(selectSN) {selectSN.removeAll();selectSN=null;}
			if(tapSN) {tapSN.removeAll(); tapSN=null;}
			
		}
		
		private function resetAttr(vaule:Number):void
		{
			//			return ;
			var newStart:int=Math.round((-vaule)/itemSize);
			//			trace(newStart+" / "+startIndex);
			if(newStart==startIndex){
				return ;
			}else{
				for(var index:int=newStart-1; index<newStart+showNum+1; index++)
				{
					if(index>=startIndex-1 && index<startIndex+showNum+1){
						continue;
					}
					setItemDataIndex(index,newStart);
				}
				startIndex=newStart;
			}
		}
		
		public function get x():Number
		{
			return container.x;
		}
		public function get y():Number
		{
			return container.y;
		}
		
		
		public function set x(value:Number):void
		{
			if(align!=VERTICAL){
				resetAttr(value);
			}
			
			container.x=value;
		}
		public function set y(value:Number):void
		{
			if( align==VERTICAL)
			{
				resetAttr(value);
			}
			container.y=value;
		}
		public function get height():Number
		{
			if(align==VERTICAL){
				return vitrulWidth;
			}
			return container.height;
		}
		public function get width():Number
		{
			if(align!=VERTICAL){
				return vitrulWidth;
			}
			return container.width;
		}
	}
}