package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.gameVO.BattleVO;
	import com.fish.modules.core.gameVO.BattleresultVO;
	import com.fish.modules.core.gameVO.CopyVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.tempData.FubenBoxData;
	import com.fish.modules.core.models.tempData.FubenMapData;
	import com.fish.modules.core.models.tempData.GuangmingData;
	import com.fish.modules.core.models.tempData.SaodangData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.Node_fuben_map;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.utils.Dictionary;
	
	import core.WindowManager;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.D;
	
	import snake.GameManager;
	
	import ui.battle.BattleResultWindowData;
	import ui.battle.ShengliWindow;
	import ui.battle.ShibaiWindow;
	
	import util.Util;

	public class MapModel extends BaseModel
	{
		public static const ExtrNum:int=4;
		public var isNeedShowTongguanTishi:Boolean=false;
		
		private var voDic:Dictionary;
		private var zhangjieDataArray:Array;
		private var needFresh:Boolean=false;
		public var oldCopyStatus:int;
		/**  是否在扫荡过程中
		 * */
		public var isInSaodang:Boolean=false;
		
		private var childRef:Dictionary;
		
		public var currentChallengeFubenId:int;
		private var lastStar:int;
		
		public var showFubenFirst:int=-1;
		
		public static function convertIndexToHeapId(_index:int):int
		{
			var result:int=0;
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			var xml:Node_fuben=XMLDataManager.getFubenById(mapModel.currentChallengeFubenId);
			var heapIdArray:Array=JSON.parse(xml.monster) as Array;
			return heapIdArray[_index-1];
		}
		public function MapModel()
		{
			super();
		}
		public override function destory():void
		{
			fubenGuanmingDetailGetCom_SN.removeAll();
			isNeedShowTongguanTishi=false;
			GameVOManager.getInstance().arrayVoOP_SN.remove(onArrayChange);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			if(copyVoArrayChange_SN) {copyVoArrayChange_SN.removeAll(); copyVoArrayChange_SN=null;}
			super.destory();
		}
		
		private var maxNearMapId:int=0;
		
		private function onInitData():void{
			zhangjieDataArray=[];
			var maxVoId:int=0;
			for each(var mapNode:Node_fuben_map in XMLDataManager.Node_fuben_mapArray){
				var funbenMap:FubenMapData=new FubenMapData(mapNode);
				zhangjieDataArray.push(funbenMap);
			}
			for each(var vo:CopyVO in GameVOManager.getInstance().copys){
				getFubenMapByVo(vo).addVo(vo);
				if(maxVoId<vo.xid){
					maxVoId=vo.xid;
				}
			}
			for each(var fubenNode:Node_fuben in XMLDataManager.Node_fubenArray){
				getFubenMapById(fubenNode.fuben_map).fubenNodeArray.push(fubenNode);
			}
			
		}
		
		private function getFubenMapByVo(vo:CopyVO):FubenMapData{
			return zhangjieDataArray[XMLDataManager.getFubenById(vo.xid).fuben_map-1];
		}
		public function getFubenMapById( mapId:int):FubenMapData{
			return zhangjieDataArray[mapId-1] as FubenMapData;
		}
		public function getMapDataArrayForShow():Array{
			var re:Array=[];
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var extr:int=0;
			for each(var mapData:FubenMapData in zhangjieDataArray){
				re.push(mapData);
				if(mapData.node.need_lv<=userModel.userVo.userLevel){
					mapData.levelActive=true;
				}else{
					mapData.levelActive=false;
					extr++;
					if(extr>=ExtrNum) break;
				}
			}
			return re;
		}
		
		public function getDefaultSection(sectionArray:Array=null):int{
			var sections:Array=sectionArray;
			if(sections==null){
				sections=getMapDataArrayForShow();
			}
			var defaultSection:int=0;
			for ( var index:int=0; index<sections.length; index++){
				if(!isMapActive(sections[index])){
					defaultSection=index-1;
					break;
				}
			}
			return defaultSection;
		}
		
		/**
		 * 获得清除挑战次数花费的cash
		 */
		public function getClearTiaozhanCost():int
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var cost:int=D.evalToInt(XMLDataManager.getExpressionById("FubenCishu").expression,{cishu:userModel.userVo.clearTiaozhanCount+1});
			return cost;
//			var userModel:UserModel=Context.getInjectInstance(UserModel);
//			var base:int=XMLDataManager.getConstById("FubenCishu").value;
//			var result:int=(userModel.userVo.clearTiaozhanCount+1)*base;
//			return result;
		}
		
		public function getSaodangResult():Array{
			var re:Array=[];
			var items:Array=JSON.parse(GameVOManager.getInstance().saodangresult.dropItems) as Array;
			var node:Node_fuben=XMLDataManager.getFubenById(currentChallengeFubenId);
			var dropItem:Array=JSON.parse(node.reward_item) as Array;
			var dropNum:Array=JSON.parse(node.reward_item_num) as Array;
			var index:int=1;
			for each(var indexs:Array in items){
				var saodangData:SaodangData=new SaodangData();
				saodangData.rewardArray=[];
				saodangData.node=node;
				saodangData.index=index;
//				saodangData.rewardArray.push({});
				for each(var index:int in indexs){
					saodangData.rewardArray.push({"key":ResourceConst.R_item,"xid":dropItem[index],"num":dropNum[index]});
				}
				re.push(saodangData);
				index++;
			}
			return re;
		}
		public static function getShibaiModulus():Number
		{
			return XMLDataManager.getConstById("fuben_fail_var").value;
		}
		public static function showFubenResult():void
		{
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			
			var node:Node_fuben=XMLDataManager.getFubenById(mapModel.currentChallengeFubenId);
			var param:BattleResultWindowData=new BattleResultWindowData();
			
			param.oldStarNum=mapModel.lastStar;
			
			var vo:CopyVO=GameVOManager.getInstance().getCopyVOByxid(mapModel.currentChallengeFubenId);
			
			var funbenBox:FubenBoxData=new FubenBoxData(XMLDataManager.getFubenById(mapModel.currentChallengeFubenId));
			funbenBox.setVo(vo);
			param.newStarNum=funbenBox.getStars();
			
			var battleResultVo:BattleresultVO=GameVOManager.getInstance().battleresult;
			var result:int=battleResultVo.result;
			
			param.killTime=int(battleResultVo.time/1000);
			param.life=battleResultVo.life;
			param.type=CoreSwitchEvent.BT_Copy;
			if(result>0){
				
				param.packData.bouns_exp=node.reward_exp;
				param.packData.bonus_money=node.reward_money;
				//				param.reward_rongyu=node.reward_rongyu;
				
				
				param.packData.bouns_itmes=Util.createArrayJosnToMap(node.reward_item,node.reward_item_num);
				/*var baseRewardItem:Array=JSON.parse(node.reward_item) as Array;
				var baseRewardNum:Array=JSON.parse(node.reward_item_num) as Array;
				
				var rewardIndexs:Array=JSON.parse(vo.dropItem) as Array;
				for each(var rewardIndex:int in rewardIndexs){
					param.rewardItemArray.push({key:ResourceConst.R_item,xid:baseRewardItem[rewardIndex],num:baseRewardNum[rewardIndex]});
				}*/
				
				
				WindowManager.openOnlyWinodw(ShengliWindow,param);
			}else{
//				param.reward_exp=int(getShibaiModulus()*node.reward_exp);
//				param.reward_money=int(getShibaiModulus()*node.reward_money);
				param.packData.bouns_exp=0;
				param.packData.bonus_money=0;
				WindowManager.openOnlyWinodw(ShibaiWindow,param);
			}
		}
		
		/**  判断是否可以进行扫荡
		 * */
		public function couldShaoDang(data:FubenBoxData):JudgeResult
		{
			var guanqiaId:int=data.node.id;
			var re:JudgeResult=new JudgeResult();
			var useModel:UserModel=Context.getInjectInstance(UserModel);
			var saodangFresh:Number=getSaodangFreshTime();
			var timeModel:TimerModel=Context.getInjectInstance(TimerModel);
			
			var vipModel:VipModel=Context.getInjectInstance(VipModel);
			
			
			if(!hasPassThisMap(data)){
				re.code=JudgeResult.CD_OtherHanlder;
				re.success=false;
				re.desc="本关没有通关，不能扫荡";
				return re;
			}
			if(data.getStars()<3){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="关卡没有获得三颗星，无法扫荡";
				return re;
			}
			
			if(data.hasTioazanCount>=data.node.limit_num){
				re.success=false;
				re.desc="挑战次数上限";
				re.code=JudgeResult.CD_HasOverLimit;
				return re;
			}
			
			if(!vipModel.couldAddRonglian && useModel.userVo.userLevel<getSaodangMinLevel()){
				re.code=JudgeResult.CD_UserLevelNotEnough;
				re.success=false;
				re.desc="扫荡等级不够提示";
				return re;
			}
			
			if(!vipModel.couldAddRonglian && saodangFresh>timeModel.serverTime){
				re.code=JudgeResult.CD_CoolDown;
				re.success=false;
				re.desc="扫荡冷却";
				return re;
			}
			
			// 判定体力是否足够
			var costTili:int=data.couldTiaozanCount()*data.node.cost_tili;
			if(useModel.userVo.currentTili<costTili){
				re.success=false;
				re.code=JudgeResult.CD_TiliNotEnough;
				re.desc="扫荡体力不足";
				return re;
			}
			re.success=true;
			return re;
		}
		/*public function getSaodangMinVip():int{
			return 10;
		}*/
	
		public function getSaodangMinLevel():int{
			return 0;
		}
		
		public function couldTiaozan(boxData:FubenBoxData):JudgeResult{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var re:JudgeResult=new JudgeResult();
			if(userModel.userVo.currentTili<boxData.node.cost_tili){
				re.code=JudgeResult.CD_TiliNotEnough;
				re.desc=Util.getLanguage("体力不足");
				return re;
			}
			if(boxData.hasTioazanCount>=boxData.node.limit_num){
				re.code=JudgeResult.CD_HasOverLimit;
				return re;
			}
			re.success=true;
			return re;
		}
		/** 是否通过该副本  **/
		public function hasPassThisMap(boxData:FubenBoxData):Boolean{
			return hasPassVo(boxData.vo);
		}
		
		
		
		public function getSaodangFreshTime():Number
		{
//			return 0;
			var fresh:Number=GameVOManager.getInstance().saodangresult.refreshTime;
			if(isNaN(fresh)){
				fresh=0;
			}
			return fresh;
		}
		
		/**
		 *   map 是否激活
		 */
		public function isMapActive(mapData:FubenMapData):Boolean{
			if(mapData.node.id==1){
				return true;
			}
			if(mapData.fubenNodeArray.length==0){
				return false;
			}
			var needFuben:int=(mapData.fubenNodeArray[0] as Node_fuben).need_fuben;
			var needMap:FubenMapData = getFubenMapById(XMLDataManager.getFubenById(needFuben).fuben_map);
			var vo:CopyVO=needMap.voDic[needFuben];
			if(hasPassVo(vo)){
				return true;
			}else{
				return false;
			}
		}
		
		private function hasPassVo(vo:CopyVO):Boolean{
			if(vo && vo.status>0) return true;
			return false;
		}
		
		public function hasPassFuben(fubenId:int):Boolean{
			var vo:CopyVO=GameVOManager.getInstance().getCopyVOByxid(fubenId);
			if(vo && vo.status>0) return true;
			return false;
		}
		
		/**
		 *   获取某一章节下的 副本数组
		 */
		public function getFubenBoxDataOnMap(mapData:FubenMapData):Array{
			var re:Array=[];
			var lastId:int=mapData.fubenNodeArray[mapData.fubenNodeArray.length-1].id;
			for each(var node:Node_fuben in mapData.fubenNodeArray){
				var fubenBox:FubenBoxData=new FubenBoxData(node);
				var vo:CopyVO=mapData.voDic[node.id];
				
				if(re.length==0 && mapData.node.id==1){
					fubenBox.isActive=true;
				}else{
					if(hasPassFuben(node.need_fuben)){
						fubenBox.isActive=true;
					}
				}
				
				if(fubenBox.isActive){
					if(vo){
						fubenBox.hasPass=hasPassVo(vo);
						fubenBox.setVo(vo);
					}
				}
				if(fubenBox.node.id==lastId){
					fubenBox.isLastFuben=true;
				}
				
				re.push(fubenBox);
			}
			return re;
		}
		
		
		protected override function onGameInitComplete():void
		{
//			createChildRefrance();
			onInitData();
			GameVOManager.getInstance().arrayVoOP_SN.add(onArrayChange);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		
		
		public static const ILLEGAL_KILL:int= -3010;
		public static const NO_EXISTS_MONSTER:int= -3011;
		public static const YOU_ARE_WIN:int= 1001;
		public static const YOU_ARE_LOSE:int= 1002;
		public static const REPEATED_KILL:int= -3014;
		public static const ILLEGAL_OPER:int= -3005;  //已经作弊
		
		public static const BATTLE_END:int= -3063;
		/**
		 * 超时
		 */
		public static const TIME_ARCHIVE:int= -3062;
		/**
		 * 伤害数值验证出错
		 */
		public static const CHECK_ERROR:int= -3032;//数值验证失败
		/**
		 * 副本错误码处理
		 */
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_FubenBattleingHandler)
			{
				switch(_code)
				{
					case ILLEGAL_KILL:
					
						break;
					case NO_EXISTS_MONSTER:
						
						break;
					case YOU_ARE_WIN:
						forceStopBattle();
						break;
					case YOU_ARE_LOSE:
						forceStopBattle();
						break;
					case ILLEGAL_OPER:
						
						break;
					case BATTLE_END:
						
						break;
					case TIME_ARCHIVE:
						forceStopBattle();
						break;
					case CHECK_ERROR:
						
						break;
				}
			}
		}
		/**
		 * 战斗超时
		 */
		public static function battleTimeEnd():void
		{
			var zombieModel:ZombieModel=Context.getInjectInstance(ZombieModel);
			zombieModel.reset();
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			GameManager.manager.canvas.endBattle();
			battleModel.getBattleReward();
		}
		/**
		 * 战斗撤退
		 */
		public static function battleRetreat():void
		{
			var zombieModel:ZombieModel=Context.getInjectInstance(ZombieModel);
			zombieModel.reset();
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			GameManager.manager.canvas.endBattle();
			battleModel.getBattleReward(1);
		}
		public static function forceStopBattle():void
		{
			var zombieModel:ZombieModel=Context.getInjectInstance(ZombieModel);
			zombieModel.reset();
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			GameManager.manager.canvas.endBattle();
			battleModel.getBattleReward();
		}
		
		
		private function onMessage(_messageType:String,c2s:DigC2SProto,code:int):void
		{
			/*if(C2SEmitter.REQ_ChallengeCopyHandler)
			{
				trace("");
			}*/
			/*if(C2SEmitter.REQ_FubenBattlePreHandler==_messageType){
				currentChallengeFubenId=c2s.fuben.xid;
				(Context.getInjectInstance(BattleModel) as BattleModel).startBattle(currentChallengeFubenId);
			}*/
			
			if(C2SEmitter.REQ_FubenNameSmallGetHandler==_messageType){
				if(code>0){
					proccessGuanmingDetails(c2s.fuben.xid);
				}
			}
			
		}
		
		
		
		public function goBattle(fubenDate:FubenBoxData):void{
			currentChallengeFubenId=fubenDate.node.id;
			lastStar=fubenDate.getStars();
			(Context.getInjectInstance(BattleModel) as BattleModel).isEnded=false;
			(Context.getInjectInstance(BattleModel) as BattleModel).startBattle(currentChallengeFubenId);
		}
		
		public var cacheCopyVo:CopyVO;
		public var copyVoArrayChange_SN:Signal=new Signal();
		private function onArrayChange(cls:Class,array:Array):void
		{
			if(cls==CopyVO)
			{
				needFresh=true;
				copyVoArrayChange_SN.dispatch();
				cacheCopyVo=array[0] as CopyVO;
				
				getFubenMapByVo(cacheCopyVo).addVo(cacheCopyVo);
				
				
				/*if(S2CHanlder.instance.currentMessage!=C2SEmitter.REQ_ClearCopyCountHandler)
				{
					//如果不是扫荡的话，就显示战斗界面
					if(!isInSaodang){
						Context.getInsance().coreDispatcher.dispatchEvent( new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Copy}) );
					}
					return;
				}*/
				
				
			}
		}
		public static const DealBaseMap:int=1000;
		public function isLastMapCopy(_xid:int):Boolean
		{
			if((_xid%DealBaseMap)==10)
			{
				return true;
			}
			return false;
		}
		
		/**
		 *    获取地图名数组
		 */
		
		
		/** 是否开启副本 **/
		public function checkCouldPk(node:Node_fuben):Boolean{
			
			if(GameVOManager.getInstance().getCopyVOByxid(node.id)) return true;
			if(GameVOManager.getInstance().getCopyVOByxid(node.need_fuben)) return true;
			return false;
		}
		
		
		private var itemFubenDic:Dictionary;
		
		private function createItemFubenDic():void{
			if(itemFubenDic==null){
				itemFubenDic=new Dictionary();
				for each(var node:Node_fuben in XMLDataManager.Node_fubenArray){
					var dropItems:Array=JSON.parse(node.reward_item) as Array;
					for each(var id:int in dropItems){
						if(itemFubenDic[id]==null){
							itemFubenDic[id]=[];
						}
						itemFubenDic[id].push(node);
					}
				}
			}
		}
		
		public  function getCopyListByItemId(_itemId:int):Array
		{
			createItemFubenDic();
			var result:Array=itemFubenDic[_itemId];
			if(result==null){
				result=[];
			}
			return result;
		}
		private  function compare(A:Node_fuben,B:Node_fuben):int
		{
			var weightA:int=0;
			var weightB:int=0;
			if(checkCouldPk(A))
			{
				weightA+=10000;
			}
			if(checkCouldPk(B))
			{
				weightB+=10000;
			}
			if(A.id>=B.id)
			{
				weightA+=100;
			}
			if(B.id>=A.id)
			{
				weightB+=100;
			}
			return weightB-weightA;
		}
		
		public function getFubenGuanmingDetail(fubenId:int):void{
			C2SEmitter.getSmallFunbenGuanming(fubenId);
		}
		private var userPaiming:int;
		public var fubenGuanmingDetailGetCom_SN:Signal=new Signal(int,Array);
		public var guanmingDetails:Array;
		private function proccessGuanmingDetails(fubenId:int):void{
			guanmingDetails=[];
			userPaiming=-1;
			var obj:Object=JSON.parse(GameVOManager.getInstance().funbenguanming.guanmingDetail);
			for(var key:String in obj){
				var data:GuangmingData=new GuangmingData();
				data.name=key;
				data.passTime=obj[key];
				data.funbenId=fubenId;
				guanmingDetails.push(data);
				
			}
			guanmingDetails.sort(compareGuanming);
			for(var index:int=0; index<guanmingDetails.length; index++){
				(guanmingDetails[index] as GuangmingData).paiming=index+1;
				if((guanmingDetails[index] as GuangmingData).name==GLBaseData.userName){
					userPaiming=index+1;
				}
			}
			fubenGuanmingDetailGetCom_SN.dispatch(fubenId,guanmingDetails);
		}
		
		public function couldLinquGuamingReward(fubenId:int):JudgeResult{
			var re:JudgeResult=new JudgeResult();
			if(userPaiming!=1){
				re.code=JudgeResult.CD_OutOfRange;
				re.desc="没有冠名，无法领取";
				return re;
			}
			
			if(hasLingquGuanmingReward(fubenId)){
				re.code=JudgeResult.CD_OtherHanlder;
				re.desc="冠名奖励已经领取过了";
				return re;
			}
			
			re.success=true;
			return re;
		}
		
		public function hasLingquGuanmingReward(fubenId:int):Boolean{
//			return false;
			var temp:Array=JSON.parse(GameVOManager.getInstance().funbenguanming.lingquStatus) as Array;
			if(temp.indexOf(fubenId)!=-1){
				return true;
			}
			return false;
		}
		
		public function getUserGuanmingPaiming():int{
			return userPaiming;
		}
		
		private function compareGuanming(A:GuangmingData,B:GuangmingData):int{
			return A.passTime-B.passTime;
		}
		public static function tiaoZhanFuben(_id:int):void
		{
			BattleModel.clearCommonBattleInfo();
			(Context.getInjectInstance(ZombieModel) as ZombieModel).reset();
			C2SEmitter.sendBattlePre(_id);
		}
//		/** 今日副本排名 **/
//		public function getFubenPaiming_Now():int{
//			return 2;
//			return GameVOManager.getInstance().extrdata.fubenPaimingNow;
//		}
//		
//		/** 昨日副本排名 **/
//		public function getFubenPaiming_Old():int{
//			return -1;
//			return GameVOManager.getInstance().extrdata.fubenPaimingOld;
//		}
		
		
	}
}