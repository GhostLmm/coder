package com.fish.modules.core.models
{
	import com.ghostlmm.dig.GameConstConfig;
	import com.ghostlmm.dig.GameTile;
	import com.ghostlmm.dig.LineData;
	import com.ghostlmm.dig.TileData;
	import com.ghostlmm.tool.ProbabilityTool;
	import com.ghostlmm.xmldata.Node_boss;
	import com.ghostlmm.xmldata.Node_guanka;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;

	public class DigGuankaModel extends BaseModel
	{
		public function DigGuankaModel()
		{
			super();
		}
		
		protected override function onGameInitComplete():void
		{
			setGuanka(1);
		}
		
		private static const ExtrBossWall:int=2;
		
		
		private var _guanka:int;
		private var _curGuankaNode:Node_guanka;
		private var _bossNode:Node_boss;
		private var _gailvTotal:int;
		private var probability:ProbabilityTool;
		
		public function goFight():void{
			_continueMapFlag=true;
		}
		
		private var _continueMapFlag:Boolean=false;
		public function get continueMapFlag():Boolean{
			return _continueMapFlag;
		}
		
		public function get fightResult():Boolean{
			return false;
		}
		
		
		/**
		 *    循环层数
		 */
		private var cycleLayer:int=0;
		
		public var layerDataReady_SN:Signal=new Signal(int);
		
		/**
		 *    这boss层内 所有出现物品的总数
		 */
		private var _layerDataMap:Object;
		
		
		/**
		 *   当前 循环层数下的 boss layer
		 * 
		 */
		public function get curBossLayer():int{
			return (cycleLayer+1)*guankaNode.boss_layer;
		}
		
	
//		
		public function get guankaNode():Node_guanka{
			return _curGuankaNode;
		}
		public function get bossNode():Node_boss{
			return _bossNode;
		}
		
		public function get curGuanka():int
		{
			return _guanka;
		}
		
		private function setGuanka($guanka:int):void{
			_guanka=$guanka;
			_curGuankaNode=XMLDataManager.getGuankaById(_guanka);
			var json:Object=JSON.parse(_curGuankaNode.wupin);
			probability=new ProbabilityTool(json);
			_bossNode=XMLDataManager.getBossById(_curGuankaNode.boss);
		}
		
		/**
		 *  是否属于boss的哪一些格子
		 */
		private function isBossGrid(tx:int,ty:int):Boolean{
			
			if(ty>=curBossLayer-_bossNode.height && ty<curBossLayer){
				if(tx>=GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum && tx<GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum+_bossNode.width){
					return true;
				}
			}
			return false;
		}
		/**
		 *   是否和 boss 属于同一行， 如果是同一行的话， 那么这一行将没有道具
		 */
		public function isBossLine(line:int):Boolean{
			if(line>=curBossLayer-_bossNode.height && line<curBossLayer){
				return true;
			}
			return false;
		}
		
		public function isBossWall(ty:int):Boolean{
			return curBossLayer==ty;
		}
		public function isBoosOutWall(ty:int):Boolean{
			return curBossLayer+1==ty;
		}
		/**
		 *   是不是 boss 墙下面的两层
		 */
		public function isBossOut2Wall(ty:int):Boolean
		{
			if(ty<=ExtrBossWall+2) return false;
			ty=ty%guankaNode.boss_layer;
			if(ty>=2 && ty<2+ExtrBossWall){
				return true;
			}
			return false;
		}
		/**
		 *   是不是boss 墙下面的第三层
		 */
		public function isBossOut3Wall(ty:int):Boolean
		{
			if(ty<=ExtrBossWall+2) return false;
			ty=ty%guankaNode.boss_layer;
			if(ty==ExtrBossWall+2){
				return true;
			}
			return false;
		}
		
		
		
		
		
		
		public  function  createLineTileData(line:int):LineData{
			GameConstConfig.log("创建行数据：\t"+line);
			
			var lineData:LineData=new LineData();
			var re:Array=[];
			
			var wallBack:String=guankaNode.background;
			var wallLife:int=guankaNode.xueliang;
			
			
			for (var index:int=0; index<GameConstConfig.TileNums+2*GameConstConfig.ExtrTileNum+2*GameConstConfig.ExtrWallNum; index++){
				var data:TileData=new TileData();
				
				if(index<GameConstConfig.ExtrWallNum || index>=GameConstConfig.ExtrWallNum+2*GameConstConfig.ExtrTileNum+GameConstConfig.TileNums){
					data.back=wallBack;
					data.life=int.MAX_VALUE;
					data.type=TileData.TY_Boundary;
				}else if( (index>=GameConstConfig.ExtrWallNum && index<GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum) ||
					(index>=GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum+GameConstConfig.TileNums && index<GameConstConfig.ExtrWallNum+GameConstConfig.ExtrTileNum*2+GameConstConfig.TileNums)
				)
				{
					data.back=wallBack;
					data.life=wallLife;
					data.type=TileData.TY_BWall;
				}else{
					
					data.type=int(probability.createRandom());
					data.life=wallLife;
					data.back=wallBack;
					
					if(isBossGrid(index,line)){
						data.type=TileData.TY_Boss;
						data.life=wallLife;
						data.back=wallBack;
					}else{
						if(isBossLine(line)){
							data.back=wallBack;
							data.life=wallLife;
							data.type=TileData.TY_Wall;
						}
						if(isBossWall(line)){
							if(index==GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum){
								data.type=TileData.TY_EnterNext;
								data.life=wallLife;
								data.back=wallBack;
							}else if(index<GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum+GameConstConfig.TileNums-1){
								data.type=TileData.TY_BossWall;
								data.life=int.MAX_VALUE;
								data.back=TileData.BossWallImage;
							}else{
								data.type=TileData.TY_Enter;
								data.life=wallLife;
								data.back=wallBack;
							}
							data.topLayer=true;
						}
						if(isBoosOutWall(line)){
							if(index==GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum){
								data.type=TileData.TY_EnterNextOut;
								data.life=wallLife;
								data.back=wallBack;
								data.defaultDie=true;
							}else if(index>=GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum+bossNode.width
								&& index<GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum+GameConstConfig.TileNums-1){
								data.type=TileData.TY_BossWall;
								data.life=int.MAX_VALUE;
								data.back=TileData.BossWallImage;
							}else{
								data.type=TileData.TY_EnterOut;
								data.life=wallLife;
								data.back=wallBack;
								data.defaultDie=true;
							}
							data.topLayer=true;
						}
						if(isBossOut2Wall(line)){
							data.back=wallBack;
							data.life=wallLife;
							data.type=TileData.TY_Wall;
							
							if(index==GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum || index==GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum+GameConstConfig.TileNums-1){
								data.defaultDie=true;
							}
						}
						if(isBossOut3Wall(line)){
							if(index==GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum || index==GameConstConfig.ExtrTileNum+GameConstConfig.ExtrWallNum+GameConstConfig.TileNums-1){
								data.type=TileData.TY_BossWall;
								data.life=int.MAX_VALUE;
								data.back=TileData.BossWallImage;
							}
						}
					}
				}
				data.node=XMLDataManager.getTileById(data.type);
				re.push(data);
			}
			
			lineData.setDatas(re);
			return lineData;
		}
		
		
		public function reset():void{
			cycleLayer=0;
			_continueMapFlag=false;
		}
		
		
		
	}
}