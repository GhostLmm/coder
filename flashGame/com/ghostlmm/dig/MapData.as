package com.ghostlmm.dig
{
	import flash.utils.Dictionary;

	public class MapData
	{
		public function MapData()
		{
		}
		
		
		
		public function getTile(tx:int,ty:int):GameTile
		{
			return tileDic[ty*100+tx];
		}
		
		
		private var tileDic:Dictionary;
		
		private var recycleArray:Array;
		
		
		public function init(processEffect:Function):void{
			
			recycleArray=[];
			tileDic=new Dictionary();
			lineDataMap={};
			
			viewWidth=GameConstConfig.TileNums+2*GameConstConfig.ExtrTileNum+2;
			viewHeight=GameConstConfig.TileHeightNums+2;
			
			for(var iy:int=0; iy<=viewHeight; iy++){
				for (var ix:int=0; ix<viewWidth; ix++){
					var tile:GameTile=new GameTile();
					tile.setBossLayer(DigGameControl.instance.gameLayer.bossLayer);
					tile.effectEat_SN.add(processEffect);
					DigGameControl.instance.gameLayer.backgroundLayer.addChild(tile.display);
					recycleArray.push(tile);
				}
			}
		}
		
		/*public function loadData(data:Object):void{
			var lines:Array=data.lineMap;
			for(var index:int=0; index<lines.length; index++){
				putLineData(index+data.VY,lines[index]);
			}
			initView(data.VX,data.VY);
		}*/
		
		public function reset():void{
			for each(var tile:GameTile in tileDic){
				tile.recycle();
				recycleArray.push(tile);
			}
			tileDic=new Dictionary();
			lineDataMap={};
			VX=-1;
			VY=-1;
		}
		
		private function recycleTile(x:int,y:int):void{
			var tile:GameTile=getTile(x,y);
			if(tile){
				tile.recycle();
				delete tileDic[y*100+x];
				recycleArray.push(tile);
			}
			
		}
		
	//---------------------------------------------------------------------------------
		private function putSetTile(x:int,y:int):void{
//			trace("放置Tile： "+x+"/"+y);
			var tileData:TileData=getTileData(x,y);
			
			if(tileData){
				var tile:GameTile=recycleArray.pop();
				tile.init(tileData,tileData.life,x,y);
				tileDic[y*100+x]=tile;
			}
			
		}
		
		public var viewWidth:int;
		public var viewHeight:int;
		
		public var VX:int=-1;
		public var VY:int=-1;
		
		public function initView($vx:int,$vy:int):void{
			var x:int;
			var y:int;
			
			for(x=$vx; x<$vx+viewWidth; x++){
				for(y=$vy; y<$vy+viewHeight; y++){
					putSetTile(x,y);
				}
			}
			
			VX=$vx;
			VY=$vy;
		}
		
		public function viewTOXY($vx:int,$vy:int):void{
			if(VX==$vx && VY>=$vy){
				return ;
			}
			GameConstConfig.log("[viewTOXY]\t"+$vx+","+$vy+"\t"+VX+","+VY);
			var x:int;
			var y:int;
			
			var t:int=0;
			if($vx>VX){
				//回收
				for(x=VX; x<$vx; x++){
					for(y=VY; y<$vy; y++){
						recycleTile(x,y);
						t++;
					}
				}
				for(x=$vx; x<VX+viewWidth; x++){
					for(y=VY; y<$vy; y++){
						recycleTile(x,y);
						t++;
					}
				}
				for(x=VX; x<$vx; x++){
					for(y=$vy; y<VY+viewHeight; y++){
						recycleTile(x,y);
						t++;
					}
				}
				GameConstConfig.log("[回收]\t"+t+"\t剩余："+recycleArray.length);
				t=0;
				// 放置
				for(x=VX+viewWidth; x<$vx+viewWidth; x++){
					for(y=$vy; y<VY+viewHeight; y++){
						putSetTile(x,y);
						t++;
					}
				}
				
				for(x=VX+viewWidth; x<$vx+viewWidth; x++){
					for(y=VY+viewHeight; y<$vy+viewHeight; y++){
						putSetTile(x,y);
						t++;
					}
				}
				
				for(x=$vx; x<VX+viewWidth; x++){
					for(y=VY+viewHeight; y<$vy+viewHeight; y++){
						putSetTile(x,y);
						t++;
					}
				}
				GameConstConfig.log("[放置]\t"+t+"\t剩余："+recycleArray.length);
				
				
			}else{
				
				for(x=VX; x<VX+viewWidth; x++){
					for(y=VY; y<$vy; y++){
						recycleTile(x,y);
						t++;
					}
				}
				
				
				
				for(x=$vx+viewWidth; x<VX+viewWidth; x++){
					for(y=$vy; y<VY+viewHeight; y++){
						recycleTile(x,y);
						t++;
					}
				}
				GameConstConfig.log("[回收]\t"+t+"\t剩余："+recycleArray.length);
				t=0;
				for(x=$vx; x<VX; x++){
					for(y=$vy; y<$vy+viewHeight; y++){
						putSetTile(x,y);
						t++;
					}
				}
				for(x=VX; x<$vx+viewWidth; x++){
					for(y=VY+viewHeight; y<$vy+viewHeight; y++){
						putSetTile(x,y);
						t++;
					}
				}
				GameConstConfig.log("[放置]\t"+t+"\t剩余："+recycleArray.length);
			}
			
			// 回收linedata
			for(y=VY; y<$vy; y++){
				delete lineDataMap[y.toString()];
			}
			//重设 x，y
			VX=$vx;
			VY=$vy;
			
		}
		
		
		private var lineDataMap:Object={};
		
		public function putLineData(lineIndex:int,lineData:LineData):void{
			lineDataMap[lineIndex+""]=lineData;
		}
		
		public function getTileData(x:int,y:int):TileData{
			var line:LineData=lineDataMap[y+""];
//			if(line==null){
//				return null;
//			}
			return line.getLineDataByIndex(x);
		}
		
		public function destory():void{
			if(recycleArray){
				for each(var tile:GameTile in recycleArray){
					tile.destory();
				}
				recycleArray=null;
			}
			if(tileDic){
				for each(var tile:GameTile in tileDic){
					tile.destory();
				}
				tileDic=null;
			}
			lineDataMap=null;
		}
		
		
		public function getLineTilesByDir(tx:Number,ty:Number,dir:int):Array{
			var re:Array=[];
			var index:int;
			var min:int;
			var max:int;
			ty=Math.round(ty);
			if(dir==DigGameControl.ST_Left){
				min=GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum;
				max=Math.round(tx);
			}
			if(dir==DigGameControl.ST_Right){
				min=Math.round(tx)+1;
				max=GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum+GameConstConfig.TileNums;
			}
			for(index=min; index<max; index++){
				var tile:GameTile=getTile(index,ty);
				if(tile){
					re.push(tile);
				}
			}
			return re;
		}
		
		
		public function extractData():Object{
			var obj:Object={};
			obj.VX=VX;
			obj.VY=VY;
			
			var lines:Array=[];
			
			for(var index:int=VY; index<VY+viewHeight; index++){
				var line:LineData=lineDataMap[index];
				lines.push(line);
			}
			
			
			obj.lineMap=lines;
			return obj;
		}
		
	}
}
