package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.gameVO.EquipgridVO;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.Node_equipEnhance;
	import com.ghostlmm.xmldata.Node_equip_star;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import r1.deval.D;
	
	import util.Util;

	public class EquipGridData
	{
		public function EquipGridData($id:int)
		{
			id=$id;
			setBianqiangLevel(0);
			setXingLevel(1);
			
			
			
			
		}
		
		private function setBianqiangLevel(lv:int):void{
			lv_bianqiang=lv;
			node_bianqiang=XMLDataManager.getEquipEnhanceById(lv_bianqiang);
			next_node_bianqiang=XMLDataManager.getEquipEnhanceById(lv_bianqiang+1);
		}
		
		private function setXingLevel(lv:int):void{
			lv_xing=lv;
			node_star=XMLDataManager.getEquip_starById(lv_xing);
			next_node_star=XMLDataManager.getEquip_starById(lv_xing+1);
			var temp:Array=JSON.parse(node_star["type_"+id]) as Array;
			updateStar_itemId=temp[0];
			updateStar_itemNum=temp[1];
		}
		
		public function hasNextLevel_star():Boolean{
			return next_node_star!=null;
		}
		
		public var id:int;
		public var lv_bianqiang:int;
		public var lv_xing:int;
		
		public var updateStar_itemId:int;
		public var updateStar_itemNum:int;
		
		
		public var node_star:Node_equip_star;
		public var next_node_star:Node_equip_star;
		
		
		public var node_bianqiang:Node_equipEnhance;
		public var next_node_bianqiang:Node_equipEnhance;
		
//		public var lv_baoshi:int;
		
		public var baoshiStateArray:Array=[0,0,0,0,0];
		
		public function getBaoshiStateObj():Object{
			var obj:Object={};
			for(var index:int=0; index<baoshiStateArray.length; index++){
				if(baoshiStateArray[index]>0){
					obj[index+1]=baoshiStateArray[index];
				}
			}
			return obj;
		}
		
		public function hasLoadbaoshi():Boolean{
			for each(var bid:int in baoshiStateArray){
				if(bid>0){
					return true;
				}
			}
			return false;
		}
		
		public static function get maxBianqiangLv():int{
			var array:Array=XMLDataManager.Node_equipEnhanceArray;
			return array[array.length-1].id;
		}
		public static function get maxXingLv():int{
			var array:Array=XMLDataManager.Node_equip_starArray;
			return array[array.length-1].id;
		}
		/** 变强 **/
		public static function calcAttrAdd_Enhance(attr:String,baseVlue:int,lv:int):int{
			if(lv<=0) return 0;
			var exp:String=XMLDataManager.getExpressionById("equip_enhance_"+attr).expression;
			var obj:Object={};
			obj["equip_"+attr]=baseVlue;
			obj.equip_lv=lv;
			return D.evalToInt(exp,obj);
		}
		/** 升星带来的属性增长  **/
		public static function calcAttrAdd_Star(attr:String,baseVlue:int,lv:int):int{
			if(lv<=0) return 0;
			var exp:String=XMLDataManager.getExpressionById("equip_star_"+attr).expression;
			var obj:Object={};
			obj["equip_"+attr]=baseVlue;
			obj.equip_star=lv;
			return D.evalToInt(exp,obj);
		}
		
		/** 宝石带来的属性增长 **/
		public function calcAttrAdd_Baoshi():Object{
//			return 0;
			
			var obj:Object={};
			var attr:String;
			for each(attr in Util.AllAttrNames){
				obj[attr]=0;
			}
			
			for each(var baoshiId:int in baoshiStateArray){
				if(baoshiId>0){
				    var baoshiNode:Node_baoshi=XMLDataManager.getBaoshiById(baoshiId);
					for each(attr in Util.AllAttrNames){
						obj[attr]+=baoshiNode[attr];
					}
				}
			}
			return obj;
		}
		
		
		
		
		public function setData(qiangData:Object,xingData:Object,baoshiData:Object,ronglianData:Object):void{
			if(qiangData!=null){
				setBianqiangLevel(int(qiangData));
				
			}
			if(xingData!=null){
				setXingLevel(int(xingData));
				
			}
			
			if(baoshiData!=null){
				baoshiStateArray=[0,0,0,0,0];
				for(var key:String in baoshiData){
					baoshiStateArray[int(key)-1]=int(baoshiData[key]);
				}
			}
		}
		
		public function getBaoshiInPos(pos:int):int{
			return baoshiStateArray[pos-1];
		}
		
//		public function getUpdateStarNeedItem():Object{
//			var node:Node_equip_star=XMLDataManager.getEquip_starById(lv_xing);
//			var temp:Array=JSON.parse( node["type_"+id]) as Array;
//			var obj
//		}
		
	}
}