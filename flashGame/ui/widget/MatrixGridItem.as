package ui.widget
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	internal class MatrixGridItem extends Sprite implements IGridItemMax
	{
		public function MatrixGridItem()
		{
			super();
		}
		
		private var align:int;
		private var itemSize:Number;
		private var itemNum:int;
		private var dataArray:Array;
		private var dataObj:Object;
		private var itemCls:Class;
		
		private var itemArray:Array;
		
		public function set enable(value:Boolean):void
		{
			
		}
		
		public function getItemByIndex(itemIndex:int):Object{
			if(itemArray && itemArray.length>itemIndex){
				return itemArray[itemIndex];
			}
			return null;
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		private var _index:int;
		public function set index(value:int):void
		{
			_index=value;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function loadData($data:Object):*
		{
			dataObj=$data;
			align=dataObj.align;
			itemSize=dataObj.itemSize;
			dataArray=dataObj.dataArray;
			itemCls=dataObj.itemCls;
			itemNum=dataObj.itemNum;
			if(itemArray==null){
				initItemArray();
			}
			
			setShow();
			
			return this;
		}
		
		private function initItemArray():void{
			itemArray=[];
			for (var pos:int=0; pos<itemNum; pos++){
				var item:Object=new itemCls();
				if(align==ScrollControllerMax.VERTICAL){
					item.x=pos*itemSize;
				}else{
					item.y=pos*itemSize;
				}
				this.addChild(item as DisplayObject);
				itemArray.push(item);
			}
		}
		private function setShow():void
		{
			for(var pos:int=0; pos<itemNum; pos++){
				var item:Object=itemArray[pos];
				var itemdata:Object=null;
				if(pos<dataArray.length){
					itemdata=dataArray[pos];
					item.visible=true;
					item.loadData(itemdata);
				}else{
					item.visible=false;
				}
				
				item.index=itemNum*index+pos;
			}
		}
		
		public function get data():Object
		{
			
			return dataObj;
		}
		
		public function enterMovie():*
		{
			visible=false;
//			return null;
			return showVisible;
		}
		private function showVisible():void{
			visible=true;
		}
		
		public function destory():void
		{
			if(itemArray){
				for each(var item:Object in itemArray){
					item.destory();
				}
				itemArray=null;
			}
			dataArray=null;
			dataObj=null;
			this.removeChildren();
		}
	}
}