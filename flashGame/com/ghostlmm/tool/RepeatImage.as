package com.ghostlmm.tool
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	public class RepeatImage extends Sprite
	{
		public function RepeatImage()
		{
			super();
		}
		
		private var _viewWidth:Number;
		private var _bitdata:BitmapData;
		
		private var imgArray:Array;
		private var posDic:Object;
		private var tileWidth:int;
		private var viewImgNum:int;
		public function destory():void{
			_bitdata=null;
			if(imgArray){
				for each(var tile:ImageTile in imgArray){
					tile.destory();
				}
				imgArray=null;
			}
			
		}
		
		public function init($viewWidth:Number,$bitdata:BitmapData):void
		{
			_viewWidth=$viewWidth;
			_bitdata=$bitdata;
			tileWidth=_bitdata.width;
			viewImgNum=Math.ceil(_viewWidth/_bitdata.width)+2;
			imgArray=[];
			posDic={};
			for(var index:int=0; index<viewImgNum; index++){
				var tile:ImageTile=new ImageTile();
				var img:Bitmap=(new Bitmap(_bitdata));
				tile.imag=img;
				addChild(img);
				tile.pos=index-1;
				tile.imag.x=(index-1)*tileWidth;
				posDic[tile.pos]=tile;
			}
		}
		
		private function setTilePos(tile:ImageTile,pos:int):void{
			delete posDic[tile.pos.toString()];
			tile.pos=pos;
			tile.imag.x=pos*tileWidth;
			posDic[tile.pos.toString()]=tile;
		}
		
		
		public function updateViewPort(vx:Number):void{
//			return ;
			var start:int=Math.floor(vx/tileWidth);
			var recyleTiles:Array=[];
			
			for(var key:String in posDic){
				var pos:int=int(key);
				if(pos<start-1 || pos>=start+viewImgNum-1){
					recyleTiles.push(posDic[key]);
				}
			}
			
			for(var pos:int=start-1; pos<start-1+viewImgNum; pos++){
				if(!posDic.hasOwnProperty(pos.toString())){
					var tile:ImageTile=recyleTiles.pop();
					if(tile){
						setTilePos(tile,pos);
					}
				}
			}
		}
		
	}
}
import flash.display.Bitmap;

class ImageTile
{
	public var pos:int;
	public var imag:Bitmap;
	
	public function destory():void{
		imag=null;
	}
}