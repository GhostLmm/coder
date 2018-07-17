package com.fish.modules.core.models.tempData
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.gameVO.EquipVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	import r1.deval.D;
	
	import snake.viewdata.PropertyData;
	
	import util.Util;

	public class EquipZandouli
	{
		public function EquipZandouli()
		{
		}
		/** 基础的战斗力  **/
		private var _baseZandouli:int;
		/** 装备到格子上的战斗力 **/
		private var _zhuanbeiZandouli:int;
		private var needUpdate:Boolean=true;
		public var vo:EquipVO;
		
//		public var propertyData:PropertyData;
		
		
		public function get baseZandouli():int{
			update();
			return _baseZandouli;
		}
		public function get zhuangbeiZandouli():int{
			update();
			return _zhuanbeiZandouli;
		}
		
		private function _destory():void{
			
		}
		private function initFromVo($vo:EquipVO):void{
			vo=$vo;
			vo.update_SN.add(onUpdate);
		}
		private function update():void{
			var time:int=getTimer();
			if(needUpdate){
				needUpdate=false;
				
				_baseZandouli=calcBaseZandouli();
//				calcProperty();
				_zhuanbeiZandouli=calcTotalZandouli();
				
			}
			trace("战斗力计算耗时： "+(getTimer()-time));
		}
		
		private function calcProperty():void{
			
		}
		
		private function calcBaseZandouli():int{
			var node:Node_equip=XMLDataManager.getEquipById(vo.xid);
			var arg:Object={};
			for each(var attr:String in EquipAttrAttach.AttrNames){
				if(node.hasOwnProperty(attr)){
					arg[attr]=node[attr];
				}
			}
			return Util.calcZhandouliByAttrMap(arg);
//			return 0;
		}
		
		private function calcTotalZandouli():int{
			var node_equip:Node_equip=XMLDataManager.getEquipById(vo.xid);
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			var equipData:EquipData=equipModel.getEquipById(vo.id);
			var attr:String;
			if(node_equip.type<=6 && vo.heroId<=0){
				// 如果是没有装上去的装备
				return _baseZandouli;
			}
			
//			if(node_equip.type<=6 && vo.heroId>0){
			if(true){
				//  装备上去的 装备
				var bagModel:BagModel=Context.getInjectInstance(BagModel);
				var equipGrid:EquipGridData=bagModel.getEquipGridById(node_equip.type);
				var obj:Object={};
				for each(attr in EquipAttrAttach.getAttrArray(ResourceConst.R_equip,node_equip.id)){
					obj[attr]=node_equip[attr];
					obj[attr]+=EquipGridData.calcAttrAdd_Enhance(attr,node_equip[attr],equipGrid.lv_bianqiang);
					obj[attr]+=EquipGridData.calcAttrAdd_Star(attr,node_equip[attr],equipGrid.lv_xing);
				}
				
				var baoshiAttrAddObj:Object=equipGrid.calcAttrAdd_Baoshi();
				for each(attr in Util.AllAttrNames){
					if(obj[attr]==null){
						obj[attr]=0;
					}
					obj[attr]+=baoshiAttrAddObj[attr];
				}
				
				if(vo.shenzhuangXid>0){
					// 有神装的时候
					var shengzhuangAddObj:Object=equipData.calcNbAttrAdd();
					for(attr in shengzhuangAddObj){
						obj[attr]+=shengzhuangAddObj[attr];
					}
				}
				obj.atk+=equipData.calaNbDamageAtkAdd();
				obj.speed+=equipData.calcNBSpeedAdd();
				return Util.calcZhandouliByAttrMap(obj) ;
			}
			
			
			return 0;
		}
		
		private function onUpdate():void{
			needUpdate=true;
		}
		
		public static function init():void{
			destory();
			zandouliDic=new Dictionary();
		}
		
		public static function updateZhandouli():void{
			if(zandouliDic){
				for each(var zhandouli:EquipZandouli in zandouliDic){
					if(zhandouli.vo.modifyType>=0){
						zhandouli.needUpdate=true;
					}else{
						delete zandouliDic[zhandouli.vo.id];
					}
				}
			}
		}
		
		public static function destory():void{
			if(zandouliDic){
				for each(var item:EquipZandouli in zandouliDic){
					item._destory();
				}
				zandouliDic=null;
			}
		}
		
		public static function getZandouliData(eid:Number):EquipZandouli{
			var zandouli:EquipZandouli=zandouliDic[eid];
			if(zandouli==null){
				zandouli=new EquipZandouli();
				zandouli.initFromVo(GameVOManager.getInstance().getEquipVOByid(eid));
				zandouliDic[eid]=zandouli;
			}
			return zandouli;
		}
		
		private static var zandouliDic:Dictionary;
	}
}