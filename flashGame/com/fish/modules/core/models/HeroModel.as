package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.HeroVO;
	import com.fish.modules.core.gameVO.HeroimageVO;
	import com.fish.modules.core.models.tempData.EquipAttrAttach;
	import com.fish.modules.core.models.tempData.EquipData;
	import com.fish.modules.core.models.tempData.EquipGridData;
	import com.fish.modules.core.models.tempData.EquipZandouli;
	import com.fish.modules.core.models.tempData.WuqiData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_gun;
	import com.ghostlmm.xmldata.Node_hero;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.greensock.TweenLite;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.D;
	
	import snake.GameUtil;
	import snake.viewdata.PropertyData;
	import snake.viewdata.ViewData_Player;
	
	import util.Util;

	public class HeroModel extends BaseModel
	{
//		public var character_weapons:Array;
		public var appearance:Array;
		public var color:Array;
		
		public var heroVo:HeroVO;
		
		public var heroImageVo:HeroimageVO;
		
		private var wuqiNeedUpdate:Boolean=true;

		private var reqsDicForAttrChange:Object;
		
		public static var CouldEquipMinorGunNum:int;
		
		public var heroAttrUpdate_SN:Signal=new Signal(int);
		
		public var wuqiGenghuan_SN:Signal=new Signal();
		
		public function HeroModel()
		{
			super();
		}
		public function get mainGunId():int
		{
			return heroVo.gunId;
		}
		protected override function onGameInitComplete():void
		{
			reqsDicForAttrChange={};
			for each(var ms:String in C2SEmitter.HeroAttrChangeREQS){
				reqsDicForAttrChange[ms]=ms;
			}
			
			CouldEquipMinorGunNum=XMLDataManager.getConstById("fuqiang_num").value;
			heroVo=GameVOManager.getInstance().hero;
			heroImageVo=GameVOManager.getInstance().heroimage;
			appearance=JSON.parse(heroImageVo.userMovieFrame) as Array;
			color=GameUtil.turnArryStringToUint(heroImageVo.userColors) as Array;
			initWuqi();
			S2CHanlder.instance.message_SN.add(onMessage);
			calcHeroAttr();
//			forceUpdateHeroAttr();
//			TweenLite.delayedCall(1,heroAttrUpdate_SN.dispatch,[0]);
		}
		
		
		
		private function onMessage(msType:String):void{
			if(msType==C2SEmitter.REQ_EquipGunArmhandler){
				wuqiGenghuan_SN.dispatch();
			}
			
			if(reqsDicForAttrChange[msType]!=null){
				forceUpdateHeroAttr();
			}
			
		}
		
		public function getHeroData():ViewData_Player
		{
			var data:ViewData_Player=new ViewData_Player();
			data.vo=heroVo;
			data.playerNode=XMLDataManager.getHeroById(heroVo.xid);
			data.setAppearanceAndColor(heroImageVo.userMovieFrame,heroImageVo.userColors);
			return data;
		}
		public function get heroId():int{
			return heroVo.id;
		}
		
		
		
		public function getEquipDataDic():Dictionary{
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			var armyEquips:Array=equipModel.getArmyEquipDatas();
			var re:Dictionary=new Dictionary();
			for each(var data:EquipData in armyEquips){
				re[data.node.type]=data;
			}
			return re;
		}
		public function getGunEquipList():Array{
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			var armyEquips:Array=equipModel.getGunArray();
			var re:Array=[];
			for each(var data:EquipData in armyEquips){
				if(EquipModel.isGun(data.node)){
					re.push(data);
				}
			}
			return re;
		}
		
		
		public static const HeroType:String="hero";
		private static var _heroAppearenceList:Array;
		public static function getHeroAppearenceList():Array
		{
			if(null==_heroAppearenceList)
			{
				_heroAppearenceList=[];
				var xmlList:Array=XMLDataManager.Node_monster_typeArray;
				var index:int;
				for(index=0;index<xmlList.length;index++)
				{
					var xml:Node_monster_type=xmlList[index];
					if(xml.type==HeroType)
					{
						_heroAppearenceList.push(xml);
					}
				}
			}
			return _heroAppearenceList;
		}
		
		public static function getRandomHeroImageNode():Node_monster_type
		{
			var xmlList:Array=getHeroAppearenceList();
			var index:int=xmlList.length*Math.random();
			if(index>=xmlList.length-1)
			{
				index=xmlList.length-1;
			}
			var xml:Node_monster_type=xmlList[index];
			return xml;
		}
		public static function getRandomGunNodeId():int
		{
			var xmlList:Array=XMLDataManager.Node_gunArray;
			var index:int=xmlList.length*Math.random();
			if(index>=xmlList.length-1)
			{
				index=xmlList.length-1;
			}
			var xml:Node_gun=xmlList[index];
			return xml.id;
		}
		
		private var _wuqiArray:Array;
		private var _wuqiDic:Dictionary;
		
		/** 武器数组  **/
		public function getWuqiArray():Array{
			updateWuqi();
			return _wuqiArray;
		}
		
		private function onEquipUpdate():void{
			wuqiNeedUpdate=true;
		}
		
		private function updateWuqi():void{
			if(wuqiNeedUpdate){
				wuqiNeedUpdate=false;
				var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
				for each(var equipData:EquipData in equipModel.getGunArray()){
//					var wuqiData:WuqiData=getWuqiByXid();
					var wuqiData:WuqiData=_wuqiDic[equipData.node.id];
					wuqiData.initFormEquipData(equipData);
					
					if(wuqiData.hasArmy()){
						if(heroVo.gunId==wuqiData.xid){
							wuqiData.gunState=WuqiData.ST_Main;
						}else{
							wuqiData.gunState=WuqiData.ST_Unload;
						}
					}else{
						wuqiData.gunState=WuqiData.ST_Unload;
					}
				}
				
			}
		}
		
		public function getWuqiByXid(xid:int):WuqiData{
			updateWuqi();
			return _wuqiDic[xid];
		}
		
		private function initWuqi():void{
			_wuqiArray=[];
			_wuqiDic=new Dictionary();
			for each(var node:Node_gun in XMLDataManager.Node_gunArray){
				var wuqiData:WuqiData=new WuqiData();
				wuqiData.initGunNode(node);
				_wuqiArray.push(wuqiData);
				_wuqiDic[node.id]=wuqiData;
			}
			(Context.getInjectInstance(EquipModel) as EquipModel).wuqiUpdate_SN.add(onEquipUpdate);
			heroVo.changAttr_SN.add(onHeroVoChangAttr);
		}
		private function onHeroVoChangAttr(attr:String,a:*,b:*,v:*):void{
			wuqiNeedUpdate=true;
			if(attr=="level"){
				forceUpdateHeroAttr();
			}
		}
		
		private function hasUnloadWuqi():Boolean{
			for each(var data:WuqiData in getWuqiArray()){
				if(data.hasOwn()){
					if(data.gunState==WuqiData.ST_Unload){
						return true;
					}
				}
			}
			return false;
		}
		
		/** 当前已经装备上的主枪数量  **/
		public function get currentEquipMainWuqiNum():int{
			var re:int;
			for each(var data:WuqiData in getWuqiArray()){
				if(data.isMainGun()){
					re++;
				}
			}
			return re;
		}
		
		public function chouldGenghuaWuqi():JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(currentEquipMainWuqiNum!=1){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="请选择主枪提示";
				return re;
			}
			/*if(currentEquipMinorWuqiNum>CouldEquipMinorGunNum){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="副枪数量超过上限";
				return re;
			}*/
			re.success=true;
			return re;
		}
		
		
		/** 是否可以装备到主枪 **/
		public function couldArmyToMain(wuqiData:WuqiData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(currentEquipMainWuqiNum>0){
				re.success=true;
				re.desc="是否更换上主枪";
				re.needAlert=true;
				return re;
			}
			re.success=true;
			return re;
		}
		/** 是否可以卸载掉 主枪 **/
		public function couldUnLoadMain(wuqiData:WuqiData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(hasUnloadWuqi()){
				re.success=true;
				re.desc="是否卸下主枪";
				re.needAlert=true;
				return re;
			}
//			else{
//				re.success=false;
//				re.desc="当前枪为最后一把，不能卸下";
//				return re;
//			}
			re.success=true;
			return re;
		}
		
		/** 是否可以装备到副枪  **/
		/*public function couldArmyToMinor(wuqiData:WuqiData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			if(currentEquipMinorWuqiNum>=CouldEquipMinorGunNum){
				re.success=false;
				re.desc="当前副枪已满";
				return re;
			}
			
			if(wuqiData.isMainGun()){
				re.desc="是否从主枪更替成副枪";
				re.needAlert=true;
				re.success=true;
				return re;
			}
			re.success=true;
			return re;
		}*/
		
		/** 是否可以卸载副枪 **/
		public function couldUnloadMinor(wuqiData:WuqiData):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			
			re.success=true;
			return re;
		}
		
		public function mockUnload(wuqiData:WuqiData):void{
			wuqiData.gunState=WuqiData.ST_Unload;
		}
		
		/*public function mockArmyMain(wuqiData:WuqiData):void{
//			gunState=1;
			for each(var data:WuqiData in getWuqiArray()){
				if(data.isMainGun()){
					data.gunState=WuqiData.ST_Unload;
					break;
				}
			}
			wuqiData.gunState=WuqiData.ST_Main;
		}
		public function mockArmyMinor(wuqiData:WuqiData):void{
			wuqiData.gunState=WuqiData.ST_Minor;
		}*/
		
		
		/** 强制更新枪的数据  **/
		public function forceUpdateWuqi():void{
			wuqiNeedUpdate=true;
		}
		
		
		
		/** 当前已经装备上的副枪数量  **/
		/*public function get currentEquipMinorWuqiNum():int{
			var re:int;
			for each(var data:WuqiData in getWuqiArray()){
				if(data.isMinorGun()){
					re++;
				}
			}
			return re;
		}*/
		
		public override function destory():void
		{
			heroAttrUpdate_SN.removeAll();
			S2CHanlder.instance.message_SN.remove(onMessage);
			if(wuqiGenghuan_SN) {wuqiGenghuan_SN.removeAll();}
			if(heroVo){
				heroVo.changAttr_SN.remove(onHeroVoChangAttr);
				heroVo=null;
			}
			if(_wuqiArray){
				for each(var wuqiData:WuqiData in _wuqiArray){
					wuqiData.destory();
				}
				_wuqiArray=null;
				_wuqiDic=null;
			}
			super.destory();
		}
		
		
		
		
		//--------------------------------
		//----       战斗力相关数值 
		//--------------------------------
		
		
		
//		["atk","def","hp","cri","renxing","hit","eva","speed"];
		//  基础值
		private var _base_atk:int;
		private var _base_def:int;
		private var _base_hp:int;
		private var _base_cri:int;
		private var _base_renxing:int;
		private var _base_hit:int;
		private var _base_eva:int;
		private var _base_speed:int;
		// 加成后的值
		private var _real_atk:int;
		private var _real_def:int;
		private var _real_hp:int;
		private var _real_cri:int;
		private var _real_renxing:int;
		private var _real_hit:int;
		private var _real_eva:int;
		private var _real_speed:int;
		
		private var _heroZhandouli:int;
		
		
		public function get base_atk():int{
			calcHeroAttr();
			return _base_atk;
		}
		public function get base_def():int{
			calcHeroAttr();
			return _base_def;
		}
		public function get base_hp():int{
			calcHeroAttr();
			return _base_hp;
		}
		public function get base_cri():int{
			calcHeroAttr();
			return _base_cri;
		}
		public function get base_renxing():int{
			calcHeroAttr();
			return _base_renxing;
		}
		public function get base_hit():int{
			calcHeroAttr();
			return _base_hit;
		}
		public function get base_eva():int{
			calcHeroAttr();
			return _base_eva;
		}
		public function get base_speed():int{
			calcHeroAttr();
			return _base_speed;
		}
		
		public function get real_atk():int{
			calcHeroAttr();
			return _real_atk;
		}
		public function get real_def():int{
			calcHeroAttr();
			return _real_def;
		}
		public function get real_hp():int{
			calcHeroAttr();
			return _real_hp;
		}
		public function get real_cri():int{
			calcHeroAttr();
			return _real_cri;
		}
		public function get real_renxing():int{
			calcHeroAttr();
			return _real_renxing;
		}
		public function get real_hit():int{
			calcHeroAttr();
			return _real_hit;
		}
		public function get real_eva():int{
			calcHeroAttr();
			return _real_eva;
		}
		public function get real_speed():int{
			calcHeroAttr();
			return _real_speed;
		}
		
		public function get heroZhandouli():int{
			calcHeroAttr();
			return _heroZhandouli;
		}
		
		private var heroAttrNeedUpdateFlag:Boolean=true;
		
		/** 计算英雄的各种属性值  **/
		public function calcHeroAttr():void{
			if(!heroAttrNeedUpdateFlag) return ;
			heroAttrNeedUpdateFlag=false;
			var attr:String;
			for each(attr in Util.AllAttrNames){
				this["_base_"+attr]=0;
			}
			
			var heroNode:Node_hero=XMLDataManager.getHeroById(heroVo.xid);
			
			_base_atk=heroNode.atk+(heroVo.level-1)*heroNode.atk_up;
			_base_hp = heroNode.hp+(heroVo.level-1)*heroNode.hp_up;
			_base_def = heroNode.def+(heroVo.level-1)*heroNode.def_up;
			_base_speed = heroNode.speed+(heroVo.level-1)*heroNode.speed_up;
			
			_base_cri=heroNode.cri;
			_base_renxing=heroNode.renxing;
			_base_hit=heroNode.hit;
			_base_eva=heroNode.eva;
			
//			trace(11 + 43 + 514 + 43 + 587 +43 +25 +50 +50 +1);
//			trace(54 +50+ 557 +50 +0 +630+0 +25);
//			trace("英雄等级战斗力： "+traceZhandouli());
			
			tianjiaChaonengliAttr();
			
			var nbObj:Object=tianjiaEquipAttr();
			tianjiaNBAttr(nbObj);
			
			_real_atk=_base_atk*(1+nbObj[EquipData.NBDamage])*(1+nbObj["cridamage"]);
			
			if(nbObj["speed"]!=null){
				_real_speed=_base_speed+_base_speed*nbObj["speed"];
			}else{
				_real_speed=_base_speed;
			}
			
			_real_cri=_base_cri;
			_real_def=_base_def;
			_real_eva=_base_eva;
			_real_hit=_base_hit;
			_real_hp=_base_hp;
			_real_renxing=_base_renxing;
			
			
			var arg:Object={};
			for each(attr in Util.AllAttrNames){
				arg[attr]=this["_real_"+attr];
			}
			_heroZhandouli=Util.calcZhandouliByAttrMap(arg);
			
		}
		
		private function traceZhandouli():int{
			var arg:Object={};
			for each(var attr:String in Util.AllAttrNames){
				arg[attr]=this["_base_"+attr];
			}
			return Util.calcZhandouliByAttrMap(arg);
		}
		
		/** 计算神装加成  **/
		public function tianjiaNBAttr(nbObj:Object):void{
//			var attrDic:Object={};
//			var attr:String;
//			for each(attr in Util.AllAttrNames){
//				attrDic[attr]=attr;
//			}
			for(var attr:String in nbObj){
//				if(attrDic[attr]!=null){
				if(attr=="cri" || attr=="renxing" || attr=="hit" || attr=="eva"){
					var exp:String=XMLDataManager.getExpressionById(attr).expression;
					var arg:Object={};
					arg.lv=heroVo.level;
					arg[attr+"_pro"]=nbObj[attr];
					this["_base_"+attr]+=D.evalToInt(exp,arg);
				}else if(attr==EquipData.NBDamage){
					
				}
			}
		}
		
		/** 计算武器属性加成   返回神装属性  **/
		private function tianjiaEquipAttr():Object{
			var nbObj:Object={};
			nbObj.cridamage=0.0;
			nbObj.damage=0.0;
			
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			
			var wuqiData:WuqiData=getWuqiByXid(mainGunId);
			
			var equipArray:Array=equipModel.getArmyEquipDatas().concat(wuqiData);
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			
			var attr:String;
			for each(var equipData:EquipData in equipArray){
				var equipAttrs:Array=EquipAttrAttach.getAttrArray(ResourceConst.R_equip,equipData.euipVo.xid);
				var gridData:EquipGridData=bagModel.getEquipGridById(equipData.node.type);
				for each(attr in equipAttrs){
					
					this["_base_"+attr]+=equipData.node[attr];
					this["_base_"+attr]+=EquipGridData.calcAttrAdd_Enhance(attr,equipData.node[attr],gridData.lv_bianqiang);
					this["_base_"+attr]+=EquipGridData.calcAttrAdd_Star(attr,equipData.node[attr],gridData.lv_xing);
				}
				
				//  宝石 添加
				var baoshiAdd:Object=gridData.calcAttrAdd_Baoshi();
				for(attr in baoshiAdd){
					this["_base_"+attr]+=baoshiAdd[attr];
				}
				
				if(equipData.euipVo.shenzhuangXid>0){
					for(var index:int=0; index<equipData.shenzhuangAddAttrs.length; index++){
						attr=equipData.shenzhuangAddAttrs[index];
						if(nbObj[attr]==null){
							nbObj[attr]=0.0;
						}
						nbObj[attr]+=equipData.shenzhuanAddValues[index];
					}
				}
			}
			return nbObj;
		}
		
		/** 添加超能力的 属性值 **/
		private function tianjiaChaonengliAttr():void{
			var chaonengliModel:ChaonengliModel=Context.getInjectInstance(ChaonengliModel);
			var cahonengProperty:PropertyData=chaonengliModel.totalProperty;
			
			_base_atk+=cahonengProperty.atk;
			_base_cri+=cahonengProperty.cri;
			_base_def+=cahonengProperty.def;
			_base_eva+=cahonengProperty.eva;
			_base_hit+=cahonengProperty.hit;
			_base_hp+=cahonengProperty.hp;
			_base_renxing+=cahonengProperty.renxing;
			_base_speed+=cahonengProperty.speed;
		}
		
		
		public function forceUpdateHeroAttr():void{
			heroAttrNeedUpdateFlag=true;
			EquipZandouli.updateZhandouli();
			heroAttrUpdate_SN.dispatch(_heroZhandouli);
			
			
		}
		
		
		
		
	}
}