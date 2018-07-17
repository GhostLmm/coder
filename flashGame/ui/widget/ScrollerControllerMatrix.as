package ui.widget
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class ScrollerControllerMatrix implements IComponent
	{
		public static const VERTICAL:int = 1;
		public static const HORIZONTAL:int = 2;
		private var srollMax:ScrollControllerMax;
		private var cls:Class;
		
		private var itemSize:Number=-1;
		private var itemOtherSize:Number=-1;
		private var itemWidth:Number;
		private var itemHeight:Number;
		private var itemNum:Number;
		
		private var posRect:Rectangle;
		
		private var align:int;
		
		public var dataArray:Array;
		
		public function ScrollerControllerMatrix(position:Position,$align:int=VERTICAL,moveTop:Boolean=false)
		{
			this.align=$align;
			posRect=position.rect.clone();
			srollMax=new ScrollControllerMax(position,align,moveTop);
			srollMax.initClass(MatrixGridItem);
			super();
		}
		
		public function initClass($cls:Class):void{
			cls=$cls;
		}
		/**
		 * 每一行列显示的
		 */
		public function setData($dataArray:Array,$perNum:int=0,showMovie:Boolean=false,resetIndex:Boolean=false):void{
			showMovie=false;
			if($dataArray && $dataArray.length>0 && itemSize==-1){
				initItemSize($dataArray[0],$perNum);
			}
			setShow($dataArray,showMovie,resetIndex);
		}
		
		public function getRealyItemByIndex(index:int):Object
		{
//			return _gridView.getItemByIndex(index);
			if(dataArray){
				var num:int=int(index/itemNum);
				var gridItem:MatrixGridItem=srollMax.getRealyItemByIndex(num) as MatrixGridItem;
				if(gridItem){
					return gridItem.getItemByIndex( index%itemNum );
				}else{
					return null;
				}
			}
			return null;
		}
		
		private function setShow($dataArray:Array,showMovie:Boolean,resetIndex:Boolean=false):void{
			if($dataArray==null){
				return ;
			}
			dataArray=$dataArray;
			// 重组数组
			var temp:Array=[];
			var num:int=Math.ceil(dataArray.length/itemNum);
			for(var id:int=0; id<num; id++){
				var obj:Object={};
				obj.align=align;
				obj.itemSize=itemOtherSize;
				
				obj.dataArray=dataArray.slice(id*itemNum,(id+1)*itemNum);
				obj.itemCls=cls;
				obj.itemNum=itemNum;
				temp.push(obj);
			}
			srollMax.setData(temp,resetIndex,showMovie,itemSize,itemWidth,itemHeight);
		}
		
		
		private function initItemSize(data:Object,$perNum:int=0):void{
			var temp:Object=new cls();
			temp.loadData(data);
			itemWidth=temp.width;
			itemHeight=temp.height;
			if(VERTICAL==align){
				itemSize=temp.height;
				itemNum=Math.round(posRect.width/itemWidth);
				itemOtherSize=itemWidth;
			}else{
				itemSize=temp.width;
				itemNum=Math.round(posRect.height/itemHeight);
				itemOtherSize=itemHeight;
			}
			if(0!=$perNum)
			{
				itemNum=$perNum;
			}			
			temp.destory();
			
		}
		
		public function destory():void{
			if(srollMax){
				srollMax.destory();
				srollMax=null;
			}
		}
	}
}