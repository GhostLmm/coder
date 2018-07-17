package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.gameVO.EquipVO;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.HeroModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_equip_nb;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import r1.deval.D;
	
	import snake.viewdata.PropertyData;
	
	import util.Util;

	public class EquipData
	{
		public function EquipData()
		{
		}
		
		public var node:Node_equip;
		
		public var node_shenzhuang:Node_equip_nb;
		public var shenzhuangExp:int;
		public var shenzhuangLv:int;
		
		public var euipVo:EquipVO;
		
		
		public var zandouliData:EquipZandouli;
		
		public var xid:int;
		
		public var id:Number;
		
		public var tempIndex:int;
		public var tempSelected:Boolean;
		
		
		public var shenzhuangAddAttrs:Array;
		public var shenzhuanAddValues:Array;
		
		public static const NBDamage:String="damage";
		
		public function initVo(vo:EquipVO):void{
			euipVo=vo;
			xid=vo.xid;
			node=XMLDataManager.getEquipById(xid);
			id=vo.id;
			if(vo.shenzhuangXid>0){
				node_shenzhuang=XMLDataManager.getEquip_nbById(vo.shenzhuangXid);
				shenzhuangExp=vo.shenzhuangExp;
				shenzhuangAddAttrs=JSON.parse(node_shenzhuang.type) as Array;
				shenzhuanAddValues=JSON.parse(node_shenzhuang.num) as Array;
				shenzhuangLv=node_shenzhuang.id%100;
			}
			zandouliData=EquipZandouli.getZandouliData(id);
		}
		
		public function resetShenzhuang():void{
			if(euipVo.shenzhuangXid>0){
				node_shenzhuang=XMLDataManager.getEquip_nbById(euipVo.shenzhuangXid);
				shenzhuangExp=euipVo.shenzhuangExp;
				shenzhuangAddAttrs=JSON.parse(node_shenzhuang.type) as Array;
				shenzhuanAddValues=JSON.parse(node_shenzhuang.num) as Array;
				shenzhuangLv=node_shenzhuang.id%100;
			}else{
				node_shenzhuang=null;
			}
		}
		
		public function calcNbAttrAdd():Object
		{
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var obj:Object={};
			var attr:String ;
			for each( attr in Util.AllAttrNames){
				obj[attr]=0;
			}
			for(var index:int=0; index<shenzhuangAddAttrs.length; index++){
				attr=shenzhuangAddAttrs[index];
				
				if(attr=="cri" || attr=="renxing" || attr=="hit" || attr=="eva"){
					
					var arg:Object={};
					arg.lv=heroModel.heroVo.level;
					arg[attr+"_pro"]=shenzhuanAddValues[index];
					obj[attr]+= D.evalToInt( XMLDataManager.getExpressionById(attr).expression,arg);
				}
			}
			return obj;
			
		}
		
		public function calaNbDamageAtkAdd():int{
//			return 0;
			var re:int=0;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			if(euipVo.shenzhuangXid>0){
				var index:int=shenzhuangAddAttrs.indexOf(NBDamage);
				if(index>=0){
					var damage:Number=shenzhuanAddValues[index];
					
					re += damage*heroModel.base_atk;
				}
				index=shenzhuangAddAttrs.indexOf("cridamage");	
				if(index>=0){
					re += shenzhuanAddValues[index]*heroModel.base_atk;
				}
				trace("神装改变"+re);
			}
			
			return 0;
		}
		public function calcNBSpeedAdd():int{
			if(euipVo.shenzhuangXid>0){
				var index:int=shenzhuangAddAttrs.indexOf("speed");
				if(index>=0){
					var speedPro:Number=shenzhuanAddValues[index];
					var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
					return speedPro*heroModel.base_speed;
				}
			}
			return 0;
		}
		
		public function hasShenzhuang():Boolean{
			return node_shenzhuang!=null;
		}
		
		public function hasArmy():Boolean{
			return euipVo && euipVo.heroId>0;
		}
		
		public function isGun():Boolean{
			return node.type>6;
		}
		
		public function calcProperty_Base():PropertyData{
			var propertyData:PropertyData=new PropertyData();
			var attr:String;
			
			for each(attr in EquipAttrAttach.AttrNames){
				if(node.hasOwnProperty(attr)){
					propertyData[attr]=node[attr];
				}
			}
			return propertyData;
		}
		
		public function calcProperty_NONB():PropertyData{
			var propertyData:PropertyData=new PropertyData();
			var attr:String;
			
			for each(attr in EquipAttrAttach.AttrNames){
				if(node.hasOwnProperty(attr)){
					propertyData[attr]=node[attr];
				}
			}
			
			if(!isGun() && !hasArmy()){
				// 如果是没有装上去的装备
				return propertyData;
			}
			
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var equipGrid:EquipGridData=bagModel.getEquipGridById(node.type);
			
			for each(attr in EquipAttrAttach.getAttrArray(ResourceConst.R_equip,node.id)){
				
				propertyData[attr]+=EquipGridData.calcAttrAdd_Enhance(attr,node[attr],equipGrid.lv_bianqiang);
				propertyData[attr]+=EquipGridData.calcAttrAdd_Star(attr,node[attr],equipGrid.lv_xing);
			}
			// 宝石
			/*var baoshiAttrAddObj:Object=equipGrid.calcAttrAdd_Baoshi();
			for each(attr in Util.AllAttrNames){
				if(propertyData[attr]==null){
					propertyData[attr]=0;
				}
				propertyData[attr]+=baoshiAttrAddObj[attr];
			}*/
			
			return propertyData;
		}
		
	}
}