package com.ghostlmm.module
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	public class LabaModule extends Sprite
	{
		public function LabaModule()
		{
			super();
		}
		
		private var _bitdata:BitmapData;
		private var _slotNum:int;
		private var _slotHeight:Number;
		
		private var _container:Sprite;
		private var _bitmap1:Bitmap;
		private var _bitmap2:Bitmap;
//		private var _bitmap3:Bitmap;
		
		private var _viewPoint:Number;
		
		private var _defaultSlot:DisplayObject;
		
		public function get viewHeight():Number{
			return _bitdata.height;
		}
		public function get slotHeight():Number{
			return _slotHeight;
		}
		public function rejustViewPoint():void{
			viewPoint=(viewPoint/viewHeight-Math.floor(viewPoint/viewHeight))*viewHeight;
		}
		
		public function get viewPoint():Number{
			return _viewPoint;
		}
		public function set viewPoint(value:Number):void{
			if(_viewPoint!=value){
				_viewPoint=value;
				_container.y=-_viewPoint;
				
				var index:int=Math.round(_viewPoint/_bitdata.height);
				putBitmap(index);
				putBitmap(index-1);
//				_bitmap1.y=index*_bitdata.height;
//				_bitmap2.y=(index+1)*_bitdata.height;
//				trace(index+"\t"+_viewPoint+"\t"+_bitmap1.y+"\t"+_bitmap2.y);
			}
		}
		
		private function putBitmap(index:int):void{
			var bitmap:Bitmap;
			if(index%2==0){
				bitmap=_bitmap1;
			}else{
				bitmap=_bitmap2;
			}
			if(bitmap.y!=index*_bitdata.height){
				bitmap.y=index*_bitdata.height;
			}
			if(_defaultSlot){
				if(index==-1){
					bitmap.visible=false;
				}else{
					bitmap.visible=true;
				}
			}
		}
		
		public function init($sourceBit:BitmapData,$slotNum:int,$defaultSlot:DisplayObject=null):void{
			_defaultSlot=$defaultSlot;
			_bitdata=$sourceBit;
			_slotNum=$slotNum;
			_slotHeight=_bitdata.height/_slotNum;
			
			initMask();
			initDisplay();
		}
		
		private function initDisplay():void{
			_container=new Sprite();
			this.addChild(_container);
			_bitmap1=new Bitmap(_bitdata);
			_bitmap2=new Bitmap(_bitdata);
//			_bitmap3=new Bitmap(_bitdata);
			_container.addChild(_bitmap1);
			_container.addChild(_bitmap2);
			initStartPoint();
//			_container.addChild(_bitmap3);
			
		}
		
		public function initStartPoint():void{
			if(_defaultSlot){
				_container.addChild(_defaultSlot);
				_defaultSlot.y=-_slotHeight;
				_defaultSlot.x=0;
				viewPoint=-_slotHeight;
			}else{
				viewPoint=0;
			}
			
		}
		
		private function initMask():void{
			var maskRect:Shape=new Shape();
			maskRect.graphics.beginFill(0,0);
			maskRect.graphics.drawRect(0,0,_bitdata.width,_slotHeight);
			maskRect.graphics.endFill();
			this.addChild(maskRect);
			this.mask=maskRect;
		}
		
		
		public function destory():void{
			_bitdata=null;
			this.removeChildren();
			_bitmap1=null;
			_bitmap2=null;
			_container=null;
			
		}
	}
}