package com.ghostlmm.dig
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.models.GuankaModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_tile;
	import com.ghostlmm.xmldata.XMLDataManager;

	public class TileData
	{
		public function TileData()
		{
		}
		
		public var back:String;
		public var type:String;
		public var id:int;
		public var life:Number;
		public var node:Node_tile;
		public var topLayer:Boolean=false;
		public var defaultDie:Boolean=false;
		
		public var hasDie:Boolean=false;
		public var hasEat:Boolean=false;
		
		public var effect:int;
		
		public var xid:int;
		
		public var dropItemId:int;
		
		public var line:int;
		
		public function init():void{
			if(id>0){
				node=XMLDataManager.getTileById(id);
				
			}else{
				node=XMLDataManager.getTileByTag("type",type);
			}
			id=node.id;
			type=node.type;
//			effect=(Context.getInjectInstance(GuankaModel) as GuankaModel).cur
		}
		
		public function get hasImag():Boolean{
			if(node){
				if(node.image!="null"){
					return true;
				}
			}
			return false;
		}
		
		public function get image():String
		{
			if(node.image!="null" && node.image!="imge"){
				return node.image;
			}
			if(type==ResourceConst.R_equip){
				return XMLDataManager.getEquipById(xid).icon;
			}
			if(type==ResourceConst.R_item){
				return XMLDataManager.getItemById(xid).icon;
			}
			return null;
		}
		
		public function get couldEat():Boolean{
			if(node){
				return node.could_eat>0;
			}
			return false;
		}
		
		public function get couldDrill():Boolean{
			if(node){
				return node.could_drill>0;
			}
			return false;
		}
		
		public function get hasBackground():Boolean{
			if(node){
				return node.has_background>0;
			}
			return false;
		}
		
		/**
		 *   最外层的 城墙，游戏进行时基本看不到
		 */
		public static const TY_Boundary:int=2;
		/**
		 *    填充tile， 因为可以看到需要做特殊处理
		 */
		public static const TY_BWall:int=3;
		
		public static const TY_Wall:int=1;
		
		public static const TY_BossWall:int=99;
		/**
		 *   通向下一关的管道
		 */
		public static const TY_EnterNext:int=98;
		/**
		 *   通向下一关的管道(出口)
		 */
		public static const TY_EnterNextOut:int=96;
		/**
		 *   向下继续的管道
		 */
		public static const TY_Enter:int=97;
		/**
		 *   向下继续的管道(出口)
		 */
		public static const TY_EnterOut:int=95;
		
		public static const TY_Boss:int=100;
		
		public static const TY_Boom:int=101;
		public static const TY_Box:int=102;
		public static const TY_Key:int=103;
		public static const TY_Time:int=104;
		public static const TY_Zhuantou:int=105;
		
		
		public static const BossWallImage:String="map_boss";
		
		public static const MC_EnterNext:String="McGuandaoL";
		public static const MC_Enter:String="McGuandaoR";
		
		
	}
}