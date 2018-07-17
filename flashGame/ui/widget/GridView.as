package ui.widget
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;

	public class GridView implements IComponent
	{
		public static const VERTICAL:int = 1;
		public static const HORIZONTAL:int = 2;
		
		private var itemClass:Class;
		internal var dataArray:Array;
		private var align:int;
		private var container:DisplayObjectContainer;
		private var viewRect:Rectangle;
		
		public var itemSize:Number=-1;
		
		private var attrX:String;
		private var attrWidth:String;
		
		public var showNum:int;

		private var itemArray:Array;
		public var startIndex:int;
		
		
		
		private var vitrulWidth:Number;
		
		
		
		public function GridView($itemCls:Class,$container:DisplayObjectContainer,$viewRect:Rectangle,$align:int=1)
		{
			itemArray=[];
			container=$container;
			itemClass=$itemCls;
			viewRect=$viewRect;
			
			align=$align;
			attrX=(align==VERTICAL)?"y":"x";
			attrWidth=(align==VERTICAL)?"height":"width";
		}
		
		private function initItemArray(data:Object):void
		{
			var temp:Object=new itemClass();
			trace(temp["constructor"]);
			(temp as IGridItem).loadData(data);
			itemSize=temp[attrWidth];
			if(itemSize==0){
				throw new Error("item 没有体积 ： "+itemClass);
			}
			(temp as IGridItem).destory();
			temp=null;
			showNum=Math.ceil(viewRect[attrWidth]/itemSize);
			startIndex=0;
			for(var index:int=0; index<showNum+2; index++){
				var item:DisplayObject=new itemClass();
				item[attrX]=(index-1)*itemSize;
				item.visible=false;
				container.addChild(item);
				itemArray.push(item);
			}
		}
		
		public function length():int
		{
			return (dataArray)?dataArray.length:0;
		}
		
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
			if(item.visible!=(data!=null)){
				item.visible=(data!=null);
			}
			if(data!=null){
				item.loadData(data);
				
				trace("赋值 并 显示： "+index +"\t"+attrX+" : "+item[attrX]+"/"+item.visible);
			}
		}
		
		public function setDataArray(array:Array):void
		{
			if(itemSize==-1){
				if(array.length!=0){
					initItemArray(array[0]);
				}else{
					return ;
				}
			}
			dataArray=array;

			vitrulWidth=itemSize*dataArray.length;
//			needCache=(dataArray.length>showNum+2);
			var index:int=0;
//			if(!needCache){
//				for(index=0; index<showNum+2; index++){
//					var item:Object=itemArray[index];
//					item[attrX]=index*itemSize;
//					if(index<dataArray.length){
//						item.visible=true;
//						(item as IGridItem).loadData(dataArray[index]);
//						container.addChild(item as DisplayObject);
//					}else{
//						if(container.contains(item as DisplayObject)){
//							container.removeChild(item as DisplayObject);
//						}
//						
//					}
//				}
//			}else{
//			startIndex=0;
//			x=0;
//			y=0;
			for (index=startIndex-1; index<startIndex+showNum+1; index++){
				setItemDataIndex(index);
			}
//			}
		}
		
		public function destory():void
		{
			if(dataArray){
				dataArray=null;
			}
			if(container){
				container.removeChildren();
				container=null;
			}
			if(itemArray){
				for each(var item:IGridItem in itemArray){
					item.destory();
					item=null;
				}
				itemArray.length=0;
				itemArray=null;
			}
			itemClass=null;
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
			if(align==VERTICAL)
			{
				resetAttr(value);
			}
			container.y=value;
		}
		public function get height():Number
		{
			if( align==VERTICAL){
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
