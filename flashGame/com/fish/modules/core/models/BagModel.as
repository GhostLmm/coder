package com.fish.modules.core.models
{
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.gameVO.EquipgridVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.ItemVO;
	import com.fish.modules.core.models.tempData.BagData;
	import com.fish.modules.core.models.tempData.BagSetData;
	import com.fish.modules.core.models.tempData.BaoshiData;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.fish.modules.core.models.tempData.ItemData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_equipEnhance;
	import com.ghostlmm.xmldata.Node_equip_star;
	import com.ghostlmm.xmldata.Node_equip_type;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.D;
	
	import util.Util;

	public class BagModel extends BaseModel
	{
		private var bagSetsDic:Dictionary;
		
		private var _gridDic:Dictionary;
		private var gridVo:EquipgridVO;
		
		private var _updateStar_GridToItem:Dictionary;
		private var _updateStar_ItemToGrid:Dictionary;
		
		public var gridUpdate_SN:Signal=new Signal();
		public function BagModel()
		{
			super();
		}
		
		private function initUpdateStarNeedItem():void{
			_updateStar_GridToItem=new Dictionary();
			_updateStar_ItemToGrid=new Dictionary();
			
			var node_star:Node_equip_star=XMLDataManager.Node_equip_starArray[0];
			for each(var node:Node_equip_type in XMLDataManager.Node_equip_typeArray){
				if(node_star.hasOwnProperty("type_"+node.id)){
					var tmp:Array=JSON.parse(node_star["type_"+node.id]) as Array;
					var itemXid:int=tmp[0];
					_updateStar_GridToItem[node.id]=itemXid;
					_updateStar_ItemToGrid[itemXid]=node.id;
				}
			}
		}
		
		public function getSuipianToUpGrid(itemXid:int):int{
			return _updateStar_ItemToGrid[itemXid];
		}
		
		protected override function onGameInitComplete():void
		{
			initUpdateStarNeedItem();
			_gridDic=new Dictionary();
			bagSetsDic=new Dictionary();
			bagSetsDic[BagSetData.SET_Baosi]=new BagSetData(BagSetData.SET_Baosi);
			bagSetsDic[BagSetData.SET_Equip]=new BagSetData(BagSetData.SET_Equip);
			bagSetsDic[BagSetData.SET_Suipian]=new BagSetData(BagSetData.SET_Suipian);
			bagSetsDic[BagSetData.SET_Tool]=new BagSetData(BagSetData.SET_Tool);
			gridVo=GameVOManager.getInstance().equipgrid;
			initEquipGridFormVo();
			
			gridVo.update_SN.add(onGridUpdate);
		}
		
		private function onGridUpdate():void{
			initEquipGridFormVo();
			gridUpdate_SN.dispatch();
		}
		
		public function getBaoshiUseInfo():Object{
			var dic:Object={};
			for each(var gridData:EquipGridData in _gridDic){
				for each(var xid:int in gridData.baoshiStateArray){
					if(dic[xid]==null){
						dic[xid]=0;
					}
					dic[xid]+=1;
				}
			}
			return dic;
		}
		
		public function couldQianghuaEquipGrid10(gridId:int):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			var gridData:EquipGridData=getEquipGridById(gridId);
			if(gridData.lv_bianqiang>=EquipGridData.maxBianqiangLv){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc="强化达到最大等级";
				return re;
			}
			var needMoney:int=0;
			var needItem:int=0;
			var needLv:int=gridData.node_bianqiang.need_lv;
			var maxBianqiangLv:int=EquipGridData.maxBianqiangLv;
			for (var index:int=0; index<10; index++){
				var lv:int=gridData.lv_bianqiang+index;
				if(lv>=maxBianqiangLv){
//					lv=maxBianqiangLv;
					break;
				}
				var node:Node_equipEnhance=XMLDataManager.getEquipEnhanceById(lv);
				needMoney+=node.money_price;
				needItem+=node.shitou_price;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userLevel<needLv){
				re.code=JudgeResult.CD_UserLevelNotEnough;
				re.desc=Util.getLanguage("强化等级不够",needLv);
				return re;
			}
			
			if(userModel.userVo.userMoney<needMoney){
				re.code=JudgeResult.CD_UserMoneyNotEnough;
				re.desc="铜币不足";
				return re;
			}
			
			var itemId:int=XMLDataManager.getConstById("qianghua_shitou_id").value;
			var itemVo:ItemVO=GameVOManager.getInstance().getItemVOByxid(itemId);
			var itemNum:int=0;
			if(itemVo) itemNum=itemVo.num;
			
			if(itemNum<node.shitou_price){
				re.code=JudgeResult.CD_CailiaoNotEnough;
				re.desc="强化材料不足";
				return re;
			}
			
			re.success=true;
			return re;
			
		}
		
		public function couldQianghuaEquipGrid(gridId:int):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			var gridData:EquipGridData=getEquipGridById(gridId);
			
			if(gridData.lv_bianqiang>=EquipGridData.maxBianqiangLv){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc="强化达到最大等级";
				return re;
			}
			var node:Node_equipEnhance=gridData.node_bianqiang;
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var needLv:int=node.need_lv;
			if(userModel.userVo.userLevel<needLv){
				re.code=JudgeResult.CD_UserLevelNotEnough;
				re.desc=Util.getLanguage("强化等级不够",needLv);
				return re;
			}
				
			if(userModel.userVo.userMoney<node.money_price){
				re.code=JudgeResult.CD_UserMoneyNotEnough;
				re.desc="铜币不足";
				return re;
			}
			
			var itemId:int=XMLDataManager.getConstById("qianghua_shitou_id").value;
			var itemVo:ItemVO=GameVOManager.getInstance().getItemVOByxid(itemId);
			var itemNum:int=0;
			if(itemVo) itemNum=itemVo.num;
			
			if(itemNum<node.shitou_price){
				re.code=JudgeResult.CD_CailiaoNotEnough;
				re.desc="强化材料不足";
				return re;
			}
			
			re.success=true;
			return re;
			
		}
		
		private function initEquipGridFormVo():void{
			var qiang:Object=JSON.parse(gridVo.gridQiang);
			var xing:Object=JSON.parse(gridVo.gridXing);
			var baoshi:Object=JSON.parse(gridVo.gridBaoshi);
			var ronglian:Object=JSON.parse(gridVo.gridRonglian);
			
			var idDic:Object={};
			var key:String;
			for (key in qiang){
				idDic[key]=true;
			}
			for (key in xing){
				idDic[key]=true;
			}
			for (key in baoshi){
				idDic[key]=true;
			}
			for (key in ronglian){
				idDic[key]=true;
			}
			
			for (key in idDic){
				var equipGrid:EquipGridData=getEquipGridById(int(key));
				equipGrid.setData(qiang[key],xing[key],baoshi[key],ronglian[key]);
			}
			
		}
		
		public function getEquipGridById(id:int):EquipGridData{
			if(_gridDic[id]==null){
				_gridDic[id]=new EquipGridData(id);
			}
			return _gridDic[id];
		}
		
		/** 是否可以升星  **/
		public function couldUpdateStart(gridId:int):JudgeResult{
			var gridData:EquipGridData=getEquipGridById(gridId);
			var re:JudgeResult=new JudgeResult();
			
			if(!gridData.hasNextLevel_star()){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc="升星级别达到上限";
				return re;
			}
			
			
			
			var node:Node_equip_star=gridData.node_star;
			
			if(node.qianghua_limit>gridData.lv_bianqiang){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="强化等级不够，无法升星";
				return re;
			}
			
			var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
			
			if(itemModel.getItemNumById(gridData.updateStar_itemId)<gridData.updateStar_itemNum){
				re.code=JudgeResult.CD_CailiaoNotEnough;
				re.desc="升星材料不足";
				re.data=gridData.updateStar_itemId;
				return re;
			}
			
			re.success=true;
			return re;
			
		}
		
		
		public function getBagsetByType(setType:String):BagSetData{
			return bagSetsDic[setType];
		}
		
		
		public function createEquipBagDatas():Array{
			var re:Array=[];
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			
			var equipArray:Array=equipModel.getNotArmyEquipDatas();
			
//			var equipTypeDic:Dictionary=new Dictionary();
//			for each(var data:EquipData in equipModel.getArmyEquipDatas()){
//				equipTypeDic[data.node.type]=data;
//			}
			
			var index:int=0;
			var maxBags:int=getMaxBagNums();
			
			var couldUseBags:int=getInitBagNums()+getHasUnlockBagNums();
			var extr:int=3;
			if(couldUseBags%4==0){
				if(couldUseBags+4*extr<maxBags){
					maxBags=couldUseBags+4*extr;
				}
			}else{
				var t:int=Math.ceil(couldUseBags/4)*4+4*extr;
				if(t<maxBags){
					maxBags=t;
				}
			}
			
			var lockIndex:int=0;
			
			while(index<maxBags){
				var bagData:BagData=new BagData();
				re.push(bagData);
				if(index<couldUseBags){
					bagData.lock=false;
					
					if(index<equipArray.length){
						bagData.num=1;
						var node:Node_equip=equipArray[index].node;
						bagData.data=equipArray[index];
						
						var armyEquip:EquipData=equipModel.getEquipByArmyType(node.type);
						if(armyEquip==null){
							bagData.state=1;
						}else{
							
							
//							var z:int=equipModel.getBaseEquipZhandouli(node);
//							var a:int=equipModel.getBaseEquipZhandouli(armyEquip.node);
							var z:int=(equipArray[index] as EquipData).zandouliData.baseZandouli;
							var a:int=armyEquip.zandouliData.baseZandouli;
							
							
							if(z==a){
								bagData.state=0;
							}else if(z>a){
								bagData.state=1;
							}else{
								bagData.state=-1;
							}
						}
					}else{
						bagData.data=null;
					}
				}else{
					bagData.lock=true;
					lockIndex++;
					bagData.lockIndex=lockIndex;
					
				}
				index++;
			}
			
			
			re.sort(compareEquipBag);
			
			return re;
		}
	
		
		private function compareEquipBag(A:BagData,B:BagData):int{
			var va:int=0;
			var vb:int=0;
			
			if(!Util.guideIsCompelete()){
				var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
				if(A.data && guideModel.getGuideEquipId()==A.data.xid){
					va-=10000000;
				}
				if(B.data && guideModel.getGuideEquipId()==B.data.xid){
					vb-=10000000;
				}
			}
			
			if(A.lock) va+=100000*A.lockIndex;
			if(B.lock) vb+=100000*B.lockIndex;
			if(A.data==null) va+=10000;
			if(B.data==null) vb+=10000;
			if(A.data && B.data){
				var nodeA:Node_equip=A.data.node as Node_equip;
				var nodeB:Node_equip=B.data.node as Node_equip;
				
				if(nodeA.star>nodeB.star){
					vb+=1000;
				}
				if(nodeA.star<nodeB.star){
					va+=1000;
				}
				
				if(nodeA.type>nodeB.type){
					va+=100;
				}
				if(nodeA.type<nodeB.type){
					vb+=100;
				}
				var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
				var zandouliA:int=(A.data as EquipData).zandouliData.baseZandouli;
				var zandouliB:int=(B.data as EquipData).zandouliData.baseZandouli;
				if(zandouliA>zandouliB){
					vb+=10;
				}
				if(zandouliA<zandouliB){
					va+=10;
				}
				if(nodeA.id>nodeB.id){
					vb+=1;
				}
				if(nodeA.id<nodeB.id){
					va+=1;
				}
			}
			
			return va-vb;
		}
		
		
		/** 空闲的格子数量  **/
		public function getIdleEquipGridNum():int{
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			return getCouldUseBagNum()- equipModel.getNotArmyEquipDatas().length;
		}
		
		
		/** 包裹里装备栏初始格子数 **/
		public function getInitBagNums():int{
			return XMLDataManager.getConstById("bag_equip_chushi").value;
		}
		/** 包裹里装备栏最大格子数 **/
		public function getMaxBagNums():int{
			return XMLDataManager.getConstById("bag_equip_max").value;
		}
		/** 已经解锁过的包裹格子数量  **/
		public function getHasUnlockBagNums():int{
//			return 16;
			return GameVOManager.getInstance().user.couldUseBugnum-getInitBagNums();
		}
		public function getCouldUseBagNum():int{
			return GameVOManager.getInstance().user.couldUseBugnum;
		}
		/**  计算解锁 包裹栏的花费 **/
		public function calcUnlockBagCost(lockIndex:int):int{
			var expression:String=XMLDataManager.getExpressionById("bag_equip_cost").expression;
			var start:int=getCouldUseBagNum();
			var cost:int=0;
			for (var index:int=start+1; index<=start+lockIndex; index++){
				cost+=D.evalToInt(expression,{gezi_num:(index-getInitBagNums())});
			}
			return cost;
		}
		
		/** 
		 *  是否可以解锁包裹
		 */
		public function couldUnlockBag(lockIndex:int):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			re.success=false;
			
			if(getInitBagNums()+getHasUnlockBagNums()+lockIndex>getMaxBagNums()){
				re.code=JudgeResult.CD_HasOverLimit;
				re.desc="解锁数量超过上限";
				return re;
			}
			var cost:int=calcUnlockBagCost(lockIndex);
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userCash<cost){
				re.code=JudgeResult.CD_CashNotEnough;
				return re;
			}
			re.success=true;
			return re;
			
		}
		
		public function createBaoshiDatas():Array{
			var re:Array=[];
			var baoshiArray:Array=(Context.getInjectInstance(BaoshiModel) as BaoshiModel).getBaoshiDataArray();
			var duidie:int;
			for each(var baoshiData:BaoshiData in baoshiArray){
				duidie=baoshiData.num;
				while(duidie>0){
					var bagData:BagData = new BagData();
					bagData.type=ResourceConst.R_baoshi;
					bagData.data=baoshiData.node;
					if(duidie>baoshiData.node.duidie){
						bagData.num=baoshiData.node.duidie;
					}else{
						bagData.num=duidie;
					}
					duidie-=baoshiData.node.duidie;
					re.push(bagData);
				}
				
			}
			addExtrBagData(re,ResourceConst.R_baoshi);
			return re;
		}
		
		public function createSuipianDatas():Array{
			var re:Array=[];
			var itemArray:Array=(Context.getInjectInstance(ItemModel) as ItemModel).getItemDataArray();
			var duidie:int;
			for each(var itemData:ItemData in itemArray){
				if(itemData.node.tag==ItemModel.TAG_suipian){
					duidie=itemData.vo.num;
					while(duidie>0){
						var bagData:BagData = new BagData();
						bagData.type=ResourceConst.R_item;
						bagData.data=itemData.node;
						if(duidie>itemData.node.duidie){
							bagData.num=itemData.node.duidie;
						}else{
							bagData.num=duidie;
						}
						re.push(bagData);
						duidie-=itemData.node.duidie;
					}
					
					
					
				}
			}
			addExtrBagData(re,ResourceConst.R_item);
			return re;
		}
	
		
		
		
		
		
		
		public function createDaojuBagDatas():Array{
			var re:Array=[];
			var itemArray:Array=(Context.getInjectInstance(ItemModel) as ItemModel).getItemDataArray();
			for each(var itemData:ItemData in itemArray){
				if(itemData.node.tag!=ItemModel.TAG_suipian){
					var bagData:BagData = new BagData();
					bagData.type=ResourceConst.R_item;
					bagData.data=itemData.node;
					bagData.num=itemData.vo.num;
					re.push(bagData);
				}
			}
			addExtrBagData(re,ResourceConst.R_item);
			return re;
		}
		
		
		private function addExtrBagData(dataArray:Array,type:String):void{
			var exr:int=5;
			var t:int=dataArray.length%4;
//			if(t==0){
//				t=exr*4;
//			}else{
//				t=(4-t)+exr*4;
//			}
			
			if(t!=0) t=4-t;
			if(Math.ceil(dataArray.length/4)<exr){
				t=(exr-Math.ceil(dataArray.length/4))*4+t;
			}
			t+=4;
			for(var index:int=0; index<t; index++){
				var bagData:BagData = new BagData();
				bagData.type=type;
				dataArray.push(bagData);
			}
		}
		
		public override function destory():void
		{
			if(gridVo){
				gridVo.update_SN.remove(onGridUpdate);
				gridVo=null;
			}
			gridUpdate_SN.removeAll();
			super.destory();
		}
		
	}
}