package com.ghostlmm.dig
{
	import com.fish.modules.core.models.GuankaModel;
	import com.ghostlmm.lightMVC.Context;
	
	import org.osflash.signals.Signal;

	/**
	 * 
	 *   一直往一个方向走，如果遇到 墙壁就不走， 
	 *   
	 * 
	 * 
	 */
	public class GameAI
	{
		public function GameAI()
		{
		}
		
		public var dir:int;
		public var changDir_SN:Signal=new Signal();
		public function update():void{
			var mapdata:MapData=DigGameControl.instance.mapData;
			var role:GameRole=DigGameControl.instance.gameRole;
			var control:DigGameControl=DigGameControl.instance;
			var tileObj:Object=DigGameControl.instance.calcLayerPositionToTile(role.x,role.y);
			
			var guankaModel:GuankaModel=Context.getInjectInstance(GuankaModel);
			
//			if(guankaModel.isBossLine(role.curTileY)){
//				if(guankaModel.curBossLayer==role.curTileY+1 && role.curTileX==GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum+GameConstConfig.TileNums-1){
//					dir=DigGameControl.ST_Down;
//				}else{
//					dir=DigGameControl.ST_Right;
//				}
//				changDir_SN.dispatch();
//				return ;
//			}
			
			if(hasToolInDir(tileObj.x,tileObj.y,DigGameControl.ST_Right)){
				dir=DigGameControl.ST_Right;
				changDir_SN.dispatch();
				return ;
			}
			if(hasToolInDir(tileObj.x,tileObj.y,DigGameControl.ST_Left)){
				dir=DigGameControl.ST_Left;
				changDir_SN.dispatch();
				return ;
			}
			
			dir=DigGameControl.ST_Down;
			
			var down:Array=DigGameControl.instance.getNearTiles(tileObj.x,tileObj.y,DigGameControl.ST_Down);
			if(role.judgeHasCanntDig(down)){
				var leftLength:int=mapdata.getLineTilesByDir(role.curTileX,role.curTileY,DigGameControl.ST_Left).length;
				var rightLength:int=mapdata.getLineTilesByDir(role.curTileX,role.curTileY,DigGameControl.ST_Right).length;
				if(leftLength>rightLength){
					dir=DigGameControl.ST_Left;
				}else{
					dir=DigGameControl.ST_Right;
				}
				
			}
			
			changDir_SN.dispatch();
		}
		
		private function hasToolInDir($tx:Number,$ty:Number,$dir:int):Boolean{
			var mapdata:MapData=DigGameControl.instance.mapData;
			var dirTiles:Array=mapdata.getLineTilesByDir($tx,$ty,$dir);
			for each(var tile:GameTile in dirTiles){
				if(tile.tileData.id==TileData.TY_Boss){
					return false;
				}
				if(tile.tileData.couldEat && !tile.hasDie && !tile.hasEat){
					return true;
				}
			}
			return false;
		}
	}
}