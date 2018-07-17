package com.ghostlmm.dig
{
	import com.ghostlmm.xmldata.XMLDataManager;

	public class GameConstConfig
	{
		public function GameConstConfig()
		{
		}
		
		public static const ShowLog:Boolean=false;
		
		
		public static function log(text:*):void
		{
			if(ShowLog){
				trace(text);
			}
		}
		
		public static function configFormConst():void{
			TileNums=XMLDataManager.getConstById("LayerTileNums").value;
			WorldRunSpeed=XMLDataManager.getConstById("WorldRunSpeed").value;
			RunSpeed=XMLDataManager.getConstById("DigRunSpeed").value;
			DropSpeed=XMLDataManager.getConstById("DigDropSpeed").value;
			BoomWidth=XMLDataManager.getConstById("DigBoomWidth").value;
			BoomDeep=XMLDataManager.getConstById("DigBoomDeep").value;
			DrillDeep=XMLDataManager.getConstById("DigDrillDeep").value;
			DrillWidth=XMLDataManager.getConstById("DigDrillWidth").value;
			NearbyPercent=XMLDataManager.getConstById("NearbyPercent").value;
			
		}
		
		public static const GameWidth:int=960;
		public static const GameHeight:int=640;
		public static const ViewCenterPercent:Number=0.4;
		
		/**
		 *   每个格子的大小
		 */
		public static const Tile_Width:Number=80;
		public static const Tile_Height:Number=80;
		
		public static var OffsetX:Number=-30;
		public static var OffsetY:Number=-30;
		public static var BuildingWidth:Number;
		public static var BuildingHeight:Number;
		
		public static function initOffset(buildingWidth:Number,buildingHeight:Number):void{
			
			BuildingWidth=buildingWidth;
			BuildingHeight=buildingHeight;
			ExtrTileNum=Math.ceil((GlobalRef.width/Tile_Width-TileNums)/2);
			ExtrTileNum=Math.max(1,ExtrTileNum);
			
			ExtrWallNum=Math.ceil((buildingWidth/Tile_Width-TileNums-2*ExtrTileNum)/2);
			ExtrWallNum=Math.max(1,ExtrWallNum);
			
			OffsetX=(buildingWidth-(TileNums+2*ExtrTileNum+2*ExtrWallNum)*Tile_Width)/2+Tile_Width/2;
			OffsetY=buildingHeight+Tile_Height/2;
//			OffsetX=(buildingWidth-(TileNums+2*ExtrTileNum+2*ExtrWallNum)*Tile_Width)/2;
//			OffsetY=buildingHeight;
			
			TileHeightNums=Math.ceil(GlobalRef.height/Tile_Height);
			
		}
		
		/**
		 *    横向格子数目
		 */
		public static var TileNums:int=12;
		
		/**
		 *   两边空白格子的数量
		 */
		public static var ExtrTileNum:int;
		
		/**
		 *   两边城墙的数量
		 */
		public static var ExtrWallNum:int;
		
		
		/**
		 *   纵向 屏幕可以显示的格子数目
		 */
		public static var TileHeightNums:Number=11;
		
		
		/**
		 *   在大厅中每秒可以行走的格子数
		 */
		public static var WorldRunSpeed:Number=1;
		
		
		/**
		 *   一秒钟可以走多少格子
		 */
		public static var RunSpeed:Number=2.5;
		
		/**
		 *   一秒钟可以掉落的格子数目
		 */
		public static var DropSpeed:Number=6;
		
		/**
		 *   零距离
		 */
		public static const ZeroDistance:Number=0.1;
		
		/**
		 *   临近距离百分比算作靠近
		 */
		public static var NearbyPercent:Number=1/6;
		
		/**
		 *   防止穿越配置
		 */
		public static const PreventPassArg:Number=1/7;
		
		
		/**
		 *   炸弹爆炸的范围 宽
		 */
		public static var BoomWidth:int=3;
		/**
		 *  爆炸的范围  深度
		 */
		public static var BoomDeep:int=3;
		
		public static var DrillDeep:int=3;
		public static var DrillWidth:int=3;
		
		/**
		 *   boss 下方的水管 的 长度
		 */
//		public static const PipeHeight:int=2;
	}
}