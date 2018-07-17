package com.ghostlmm.dig
{
	import flashx.textLayout.debug.assert;

	public class LineData
	{
		public function LineData()
		{
		}
		private var _datas:Array;
		public function setTileDatas($datas:Array):void{
			_datas=$datas;
		}
		
		public function setDatas($datas:Array):void{
			_datas=$datas;
		}
		
		public function getLineDataByIndex(index:int):TileData{
			return _datas[index];
		}
		
		
		
		
		/*public static function  createLineTileData(line:int,wallLife:Number,wallBack:String):LineData{
			trace("创建行数据：\t"+line);
			
			var lineData:LineData=new LineData();
			var re:Array=[];
			
			
			
			for (var index:int=0; index<GameConstConfig.TileNums+2*GameConstConfig.ExtrTileNum+2*GameConstConfig.ExtrWallNum; index++){
				var data:TileData=new TileData();
				if(index<GameConstConfig.ExtrWallNum || index>=GameConstConfig.ExtrWallNum+2*GameConstConfig.ExtrTileNum+GameConstConfig.TileNums){
					data.back=wallBack;
					data.life=int.MAX_VALUE;
					data.type=GameTile.TY_Boundary;
				}else if( (index>=GameConstConfig.ExtrWallNum && index<GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum) ||
					(index>=GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum+GameConstConfig.TileNums && index<GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum*2+GameConstConfig.TileNums)
				)
				{
					data.back=wallBack;
					data.life=wallLife;
					data.type=GameTile.TY_BWall;
				}else{
					data=createRandom();
					data.life=wallLife;
					data.back=wallBack;
				}
				re.push(data);
			}
			
			lineData._datas=re;
			return lineData;
		}
		
		private static const GailvPeizhi:Object={
			1:80,
			101:5,102:5,103:5,104:5,105:5
		}
		private static var typeArray:Array=[1,101,102,103,104,105];
		private static var gailvArray:Array=[75,5,5,5,5,5];
		private static var total:int=100;
		private static function createRandom():TileData{
			var data:TileData=new TileData();
			var r:int=int(int.MAX_VALUE*Math.random())%total;
			var t:int=0;
			for(var index:int=0; index<gailvArray.length; index++){
				t+=gailvArray[index];
				if(r<t){
					data.type=typeArray[index];
					break;
				}
			}
			return data;
		}*/
		
	}
}