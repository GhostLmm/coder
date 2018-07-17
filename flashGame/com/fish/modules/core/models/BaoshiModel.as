package com.fish.modules.core.models
{
	import com.fish.modules.core.gameVO.BaoshiVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.ItemVO;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_baoshi;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;

	public class BaoshiModel extends BaseModel
	{
		private var _baoshiArray:Array;
		private var _baoshiDic:Dictionary;
		private var _needUpdate:Boolean=true;
		public function BaoshiModel()
		{
			super();
		}
		
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onVoArrayChange);
			GameVOManager.getInstance().equipgrid.changAttr_SN.add(onGridAttrChange);
		}
		
		private function onGridAttrChange(attr:String,a:*,b:*,c:*):void{
			if(attr=="gridBaoshi"){
				_needUpdate=true;
				modelUpdata_SN.dispatch();
			}
		}
		
		private function onVoArrayChange(cls:Class,array:Array):void{
			if(cls==BaoshiVO){
				_needUpdate=true;
				modelUpdata_SN.dispatch();
			}
		}
		
		public function hasNextLevel(baoshiId:int):Boolean{
			return XMLDataManager.getBaoshiById(baoshiId).jinhua_id!=0;
		}
		
		public function couldUpdateBaoshi(baoshiXid:int,hasEquip:Boolean=false):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			var baoshiData:BaoshiData=getBaoshiDataByXid(baoshiXid);
			var node:Node_baoshi=XMLDataManager.getBaoshiById(baoshiXid);
			if(baoshiData==null && !hasEquip){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="没有此宝石";
				return re;
			}
			
			if(!hasNextLevel(baoshiXid)){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc="宝石无法升级等级提示";
				return re;
			}
			
			if(hasJinghuaNum(baoshiXid,hasEquip)<node.jinhua_base_num){
				re.code=JudgeResult.CD_CailiaoNotEnough;
				re.desc="宝石升级材料不足提示";
				return re;
			}
			re.success=true;
			return re;
		}
		
		public function hasJinghuaNum(baoshiId:int,hasEquip:Boolean):int{
			var node:Node_baoshi=XMLDataManager.getBaoshiById(baoshiId);
			var xid:int=node.jinhua_need_id;
			if(node.jinhua_id==0){
				xid=baoshiId;
			}
			
			if(hasEquip){
				return getBaoshiNumByXid(xid);
			}else{
				if(node.jinhua_need_id==baoshiId){
					return getBaoshiNumByXid(xid)-1;
				}
				return getBaoshiNumByXid(xid);
			}
			
			
		}
		
		
		private function updateBaoshi():void{
			if(_needUpdate){
				_baoshiArray=[];
				_baoshiDic=new Dictionary();
				
				var bagModel:BagModel=Context.getInjectInstance(BagModel);
				var usebaoshiDic:Object=bagModel.getBaoshiUseInfo();
				var num:int;
				
				for each(var vo:BaoshiVO in GameVOManager.getInstance().baoshis){
					
					if(usebaoshiDic.hasOwnProperty(vo.xid)){
						num=vo.num-usebaoshiDic[vo.xid];
					}else{
						num=vo.num;
					}
					if(num>0){
						var data:BaoshiData=new BaoshiData();
						data.initVo(vo,num);
						_baoshiArray.push(data);
						_baoshiDic[data.xid]=data;
					}
				}
				_needUpdate=false;
			}
		}
		
		private function getBaoshiDataByXid(xid:int):BaoshiData{
			updateBaoshi();
			return _baoshiDic[xid];
		}
		
		public function getBaoshiNumByXid(xid:int):int{
			var baoshiData:BaoshiData=getBaoshiDataByXid(xid);
			if(baoshiData==null) return 0;
			return baoshiData.num;
		}
		
		public function getBaoshiDataArray():Array{
			updateBaoshi();
			return _baoshiArray;
		}
		
		
		public override function destory():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.remove(onVoArrayChange);
			super.destory();
		}
	}
}