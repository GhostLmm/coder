package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.gameVO.BaoshiVO;
	import com.fish.modules.core.gameVO.EquipVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.fish.modules.core.models.tempData.EquipZandouli;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_equip;
	import com.ghostlmm.xmldata.Node_equip_ronglian;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.D;

	public class EquipModel extends BaseModel
	{
		
		public static const PartLanguage:Object={
			1:"头",2:"手",3:"腿",4:"胸",5:"足",6:"腰"
		};
		
		/** 计算战斗力  **/
		private static function calcEquipFightingCapacity(equipData:EquipData):int{
			var baseCap:int=(Context.getInjectInstance(EquipModel) as EquipModel).getBaseEquipZhandouli(equipData.node);
			if(equipData.euipVo.heroId>0){
				var bagModel:BagModel=Context.getInjectInstance(BagModel);
				var gridData:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
				var attrArray:Array=EquipAttrAttach.getAttrArray(ResourceConst.R_equip,equipData.node.id);
				
				var cap:int=baseCap;
				for each(var attr:String in attrArray){
//					cap+=gridData.
				}
				
				return cap;
				
			}else{
				return baseCap;
			}
		}
		
		// 类别  枪 、 正常装备 （装备在身、没有装备上的， 带神装的、不带神装的）
		private var _gunArray:Array;
		private var _equipArray:Array;
		private var _equipArmArray:Array;
		private var _equipNotArmArray:Array;
		private var _equipDic:Dictionary;
		private var _equipShenzhuangArray:Array;
		private var _allGunEquipArray:Array;
		private var _armyTypeEquipDic:Dictionary;
		
		private var _needUpdate:Boolean=true;
		
		
		public var wuqiUpdate_SN:Signal=new Signal();
		
		public function EquipModel()
		{
			super();
			EquipZandouli.init();
		}
		
		public static function isGun(node:Node_equip):Boolean{
			return node.type>6;
		}
//		public static function isGunId(id:int):Boolean{
//			return id>6;
//		}
		
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onArrayChange);
		}
		
		private function update():void{
			if(_needUpdate){
				_gunArray=[];
				_equipArray=[];
				_equipArmArray=[];
				_equipNotArmArray=[];
				_allGunEquipArray=[];
				_equipShenzhuangArray=[];
				_equipDic=new Dictionary();
				_armyTypeEquipDic=new Dictionary();
				
				for each(var vo:EquipVO in GameVOManager.getInstance().equips){
					if(vo.modifyType>=0){
						var data:EquipData=new EquipData();
						data.initVo(vo);
						
						_equipDic[data.id]=data;
						_allGunEquipArray.push(data);
						if(data.node.type>6){
							_gunArray.push(data);
						}else{
							_equipArray.push(data);
							if(data.hasShenzhuang()){
								_equipShenzhuangArray.push(data);
							}
							if(data.euipVo.heroId>0){
								_equipArmArray.push(data);
								_armyTypeEquipDic[data.node.type]=data;
							}else{
								_equipNotArmArray.push(data);
							}
						}
					}
				}
				_needUpdate=false;
			}
		}
		
		public function getEquipByArmyType(armyType:int):EquipData{
			update();
			return _armyTypeEquipDic[armyType];
		}
		
		public function getEquipById(eid:Number):EquipData{
			update();
			return _equipDic[eid];
		}
		
		public function getGunArray():Array{
			update();
			return _gunArray;
		}
		public function getBattleCouldUseGunXidArray():Array
		{
			var result:Array=[];
			var dealArray:Array=getGunArray();
			var index:int;
			var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
			var heroId:int=heroModel.heroId;
			for(index=0;index<dealArray.length;index++)
			{
				var data:EquipData=dealArray[index];
				if(data.euipVo.heroId==heroId)
				{
					result.push(data.xid);
				}
			}
			return result;
		}
		/** 获取当前装备上的武器数据， 根据装备部位 **/
		/*public function getArmyEquipByPart(partType:int):EquipData{
			update();
			for each(var data:EquipData in _hasArmyEquipArray){
				if(data.node.type==partType){
					return data;
				}
			}
			return null;
		}*/
		
		private var zhandouliDic:Dictionary=new Dictionary();
		private var zhandouliExp:String;
		/** 获得基础武器的战斗力 **/
		private function getBaseEquipZhandouli(node:Node_equip):int{
			if(zhandouliDic.hasOwnProperty(node.id)){
				return zhandouliDic[node.id];
			}
			if(zhandouliExp==null){
				zhandouliExp=XMLDataManager.getExpressionById("equip_zhandouli").expression;
			}
//			equip_def+equip_speed+equip_hp+equip_Cri+equip_Renxing+equip_Hit+equip_Eva
			var arg:Object={};
			arg.equip_def=node.def;
			arg.equip_speed=node.def;
			arg.equip_hp=node.hp;
			arg.equip_Cri=node.cri;
			arg.equip_Renxing=node.renxing;
			arg.equip_Hit=node.hit;
			arg.equip_Eva=node.hit;
			zhandouliDic[node.id]=D.evalToInt(zhandouliExp,arg);
			return zhandouliDic[node.id];
		}
		
		/** 神装武器  **/
		public function getEquipShenzhuang():Array{
			update();
			return _equipShenzhuangArray;
		}
		
		/** 是否可以熔炼 **/
		public function couldRonglian(equips:Array):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			for each(var data:EquipData in equips){
				if(data==null) continue;
				if(data.euipVo.modifyType<0 || data.euipVo.heroId>0){
					re.code=JudgeResult.CD_OtherHanlder;
					re.desc="装备选择错误";
					return re;
				}
			}
			
			re.success=true;
			return re;
			
		}
		
		/** 熔炼可以获得的熔炼值  **/
		public function calcEquipRonglian(equips:Array):int{
			var re:int;
			for each(var data:EquipData in equips){
				if(data==null) continue;
				var node:Node_equip_ronglian=XMLDataManager.getEquip_ronglianById(data.node.star);
				if(node){
					re+=node.rongglian_num;
				}
			}
			return re;
		}
		// warning 
		/** 计算装备替换后属性值变换  **/
		/*public function calcChuandaiAttrDef(equipData:EquipData):Array{
			var re:Array=[];
			
			for each(var attr:String in EquipAttrAttach.AttrNames){
				if(equipData.node.hasOwnProperty(attr) && equipData.node[attr]>0){
					var attrAttach:EquipAttrAttach=new EquipAttrAttach();
					attrAttach.attr=attr;
					attrAttach.value=500;
					attrAttach.derValue=(int(Math.random()*100)%2==0) ? 50 : -33;
					re.push(attrAttach);
				}
			}
			
			return re;
		}*/
		
		public function couldArayEquip(data:EquipData):JudgeResult{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var re:JudgeResult=new JudgeResult();
			re.success=false;
			if(data.node.lv>userModel.userVo.userLevel){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="用户等级不够，无法装备";
				return re;
			}
			re.success=true;
			return re;
		}
		
		private function onArrayChange(cls:Class,array:Array):void{
			if(cls==EquipVO){
				_needUpdate=true;
				modelUpdata_SN.dispatch();
				for each(var vo:EquipVO in array){
					if( XMLDataManager.getEquipById(vo.xid).type>6){
						wuqiUpdate_SN.dispatch();
						break;
					}
				}
			}
		}
		public function getEquipAndGunDatas():Array{
			update();
			return _allGunEquipArray;
		}
		public function getEquipDatas():Array{
			update();
			return _equipArray;
		}
		public function getArmyEquipDatas():Array{
			update();
			return _equipArmArray;
		}
		public function getNotArmyEquipDatas():Array{
			update();
			return _equipNotArmArray;
		}
		
		
		public function calcChuanchengNeedMoney(sourceEquip:EquipData,targetEquip:EquipData):int{
			return 100;
		}
		
		//  传承
		public function couldChuancheng(sourceEquip:EquipData,targetEquip:EquipData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(sourceEquip.node.type!=targetEquip.node.type){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="神装选择错误";
				return re;
			}
			if(!sourceEquip.hasShenzhuang()){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="原始装备无神装提示";
				return re;
			}
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if(userModel.userVo.userMoney<calcChuanchengNeedMoney(sourceEquip,targetEquip) ){
				re.code=JudgeResult.CD_UserMoneyNotEnough;
				re.desc="铜币不足";
				return re;
			}
			re.success=true;
			return re;
		}
		
		/**神装是否可以吞噬 **/
		public function couldTunshi(source:EquipData,tunshiDatas:Array):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			if(source.node_shenzhuang.next_id==0){
				re.code=JudgeResult.CD_OutOfRange;
				re.desc="装备已经最高等级，无法吞噬提升提示";
				return re;
			}
			
			for each(var data:EquipData in tunshiDatas){
				if(data.hasArmy()){
					re.code=JudgeResult.CD_OtherHanlder;
					re.desc="装备选择错误";
					return re;
				}
				if(!data.hasShenzhuang()){
					re.code=JudgeResult.CD_OtherHanlder;
					re.desc="装备选择错误";
					return re;
				}
			}
			
			re.success=true;
			return re;
		}
		
		// 神装等级操作  
		
		
		/** 是否可以卸载装备  **/
		public function couldUnloadEquip(equipData:EquipData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(equipData.node.type>6){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="枪支不在这里卸载";
				return re;
			}
			
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			if(bagModel.getIdleEquipGridNum()<=0){
				re.code=JudgeResult.CD_BagGridNotEnough;
				re.desc="装备格子不够";
				return re;
			}
			
			
			re.success=true;
			return re;
		}
		
		
		
		
		public override function destory():void
		{
			if(wuqiUpdate_SN) {wuqiUpdate_SN.removeAll();}
			EquipZandouli.destory();
			GameVOManager.getInstance().arrayVoOP_SN.remove(onArrayChange);
			super.destory();
		}
	}
}