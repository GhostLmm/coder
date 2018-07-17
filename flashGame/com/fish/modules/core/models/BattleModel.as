package com.fish.modules.core.models
{
	import com.fish.GLBaseData;
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.gameVO.BattleVO;
	import com.fish.modules.core.gameVO.BattlebaseVO;
	import com.fish.modules.core.gameVO.BattlegunVO;
	import com.fish.modules.core.gameVO.BattleheroVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.story.StoryManager;
	import com.ghostlmm.xmldata.Node_fuben;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.BattleC2S;
	import com.mutou.tqt.DigC2SProto;
	import com.netease.protobuf.Int64;
	
	import flash.utils.getTimer;
	
	import core.PlayerGuideManager;
	
	import org.osflash.signals.Signal;
	
	import r1.deval.D;
	
	import snake.GameManager;
	import snake.viewdata.battle.AttackComputeData;
	import snake.viewdata.battle.BattleData_Hero;

	public class BattleModel extends BaseModel
	{
		public var battleBase:BattlebaseVO;
		public function BattleModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			battleBase=GameVOManager.getInstance().battlebase;
		}
		public override function destory():void
		{
			if(enemyDieAll_SN) {enemyDieAll_SN.removeAll();}
			if(getRewardMsgCom) {getRewardMsgCom.removeAll();}
			super.destory();
		}
		public function checkIfTimeEnd():Boolean
		{
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var der:Number=battleBase.battleMustEndTime-timerModel.serverTime;
			if(der>0)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
		/**
		 * 战斗中本方英雄数据
		 */
		public function getMyHeroData():BattleData_Hero
		{
			var result:BattleData_Hero=new BattleData_Hero(false);
			result.battleHeroVo=getBattleHeroByUid(int(GLBaseData.userId));
			result.battleGuns=getBattleGuns(int(GLBaseData.userId));
			result.setData();
			return result;
		}
		/**
		 * 战斗中本方英雄数据
		 */
		public function getEnemyHeroData():BattleData_Hero
		{
			var result:BattleData_Hero=new BattleData_Hero(true);
			result.battleHeroVo=getBattleHeroByUid(int(GLBaseData.userId),true);
			result.battleGuns=getBattleGuns(int(GLBaseData.userId),true);
			result.setData();
			return result;
		}
		public function getBattleGuns(_uid:int,_isEnemy:Boolean=false):Array
		{
			var result:Array=[];
			var voArray:Array=GameVOManager.getInstance().battleguns;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:BattlegunVO=voArray[index] as BattlegunVO;
				if(_isEnemy)
				{
					if(vo.heroid!=_uid)
					{
						result.push(vo);
					}
				}
				else
				{
					if(vo.heroid==_uid)
					{
						result.push(vo);
					}
				}
			}
			return result;
		}
		public function getBattleHeroByUid(_uid:int,_isEnemy:Boolean=false):BattleheroVO
		{
			var heroVoArray:Array=GameVOManager.getInstance().battleheros;
			var index:int;
			for(index=0;index<heroVoArray.length;index++)
			{
				var vo:BattleheroVO=heroVoArray[index] as BattleheroVO;
				if(_isEnemy)
				{
					if(vo.id!=_uid)
					{
						return vo;
					}
				}
				else
				{
					if(vo.id==_uid)
					{
						return vo;
					}
				}
			}
			return null;
		}
		
		private static var BaojiBaseNum:Number=0;
		public static function get BaojiBase():Number
		{
			if(0==BaojiBaseNum)
			{
				BaojiBaseNum=XMLDataManager.getConstById("baoji_base").value;
			}
			return BaojiBaseNum;
		}
		
		/** 大关卡id **/
		public var cur_id1:int;
		/** 中关卡id **/
		public var cur_id2:int;
		/** 小关卡id **/
		public var cur_id3:int;
		
		public var node_fuben:Node_fuben;
		
		public var mapArray:Array;
		public var monsterHeapArray:Array;
		public var indexArray:Array;
//		public var monsterLevelArray:Array;
		
		public var getRewardMsgCom:Signal=new Signal();
		
		
		public var enemyDieAll_SN:Signal=new Signal();
		
		public function startBattle($guankaId:int):void{
			
			cur_id2=$guankaId;
			
			node_fuben=XMLDataManager.getFubenById($guankaId);
			
			cur_id1=node_fuben.fuben_map;
			
			cur_id3=0;
			
			mapArray=JSON.parse(node_fuben.map) as Array;
			monsterHeapArray=JSON.parse(node_fuben.monster) as Array;
			indexArray=JSON.parse(node_fuben.biaozhi) as Array;
//			monsterLevelArray=JSON.parse(node_fuben.monster_lv) as Array;
			
			Context.getInsance().coreDispatcher.dispatchEvent(new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Copy}));
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(msType==C2SEmitter.REQ_FubenBettleRewardHandler){
				if(code==1)
				{
//					getRewardMsgCom.dispatch();
					
					var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
					if(!guideModel.isComplete){
						if(GameVOManager.getInstance().battleresult.result>0){
							PlayerGuideManager.getInstance().onFunbenSuccess(cur_id2);
						}else{
							PlayerGuideManager.getInstance().onFunbenFail(cur_id2);
						}
					}
					
					if(GameVOManager.getInstance().battleresult.result>0 
						&& GameManager.needShowEndStory(cur_id2)){
						GameManager.showEndStory(cur_id2);
						isEnded=true;
						
					}else{
						MapModel.showFubenResult();
						isEnded=true;
					}
				}
			}
		}
		
		
		public function getBattleReward(_isRetreat:int=0):void{
			//如果是副本的话
			var mapModel:MapModel=Context.getInjectInstance(MapModel);
			C2SEmitter.getFubenReward(mapModel.currentChallengeFubenId,_isRetreat);
		}
		
		public function getCurMap():String{
			return mapArray[cur_id3];
		}
//		public function 
		
		public var isEnded:Boolean;
		public function hasNextMinorGuanka():Boolean{

			if((!checkIfTimeEnd())&&(!isEnded))
//			if((!checkIfTimeEnd())&&(getMyHeroData().curHealth>0)&&(!isEnded))
			{
				return mapArray.length>cur_id3+1;
			}
			else
			{
				return false;
			}
		}
		
		public function goNextMinorGuanka():void{
			cur_id3++;
			Context.getInsance().coreDispatcher.dispatchEvent(new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Copy}));
		}
		//以下是协议相关
		/**
		 * 发送擂台敌人死亡消息
		 */
		public static function sendFubenEnemyDie(_id:int):void
		{
			challengeCommonPersonIng(0,0,0,_id);
		}	
		/**
		 * 发送擂台敌人死亡消息
		 */
		public static function sendLeitaiEnemyDie(_id:int):void
		{
			challengeCommonPersonIng(0,0,0,_id);
		}
		public static const NULL:int = 0;
		public static const JI_BAOJI:int = 1;
		public static const JI_SHANBI:int = 2;
		public static function sendBattling(_mySide:AttackComputeData,_enemySide:AttackComputeData,_damage:int,_firedWay:Number,_isMyHurt:Boolean):void
		{
			sendCommonBattling(_mySide,_enemySide,_damage,_firedWay,_isMyHurt);
		}
		/**
		 * 玩家死亡
		 */
		public static function playerDie():void
		{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)
			{
				sendLeitaiBattleInfoAll();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
			{
				sendFubenBattleInfoAll();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				sendJinkuangLveduoBattleInfoAll();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				sendJinkuangQuganBattleInfoAll()
			}
		}
		/**
		 * 所有敌人死亡
		 */
		public static function allEnemyDie():void
		{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)
			{
				sendLeitaiBattleInfoAll();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
			{
				sendFubenBattleInfoAll();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				sendJinkuangLveduoBattleInfoAll();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				sendJinkuangQuganBattleInfoAll()
			}
		}
		/**
		 * 一起发送擂台战斗信息
		 */
		private static function sendLeitaiBattleInfoAll():void
		{
			if((null!=commonBattleInfoArray)&&(commonBattleInfoArray.length!=0))
			{
				C2SEmitter.sendLeitaiBattleInfoTotal(commonBattleInfoArray);
				clearCommonBattleInfo();
			}
		}
		/**
		 * 一起发送副本战斗信息
		 */
		private static function sendFubenBattleInfoAll():void
		{
			if((null!=commonBattleInfoArray)&&(commonBattleInfoArray.length!=0))
			{
				(Context.getInjectInstance(ZombieModel) as ZombieModel).reset();
				C2SEmitter.sendFubenBattleInfoTotal(commonBattleInfoArray);
				clearCommonBattleInfo();
			}
		}
		/**
		 * 一起发送金矿掠夺战斗信息
		 */
		private static function sendJinkuangLveduoBattleInfoAll():void
		{
			if((null!=commonBattleInfoArray)&&(commonBattleInfoArray.length!=0))
			{
				C2SEmitter.lveduoKuangIng(commonBattleInfoArray);
				clearCommonBattleInfo();
			}
		}
		/**
		 * 一起发送金矿驱赶战斗信息
		 */
		private static function sendJinkuangQuganBattleInfoAll():void
		{
			if((null!=commonBattleInfoArray)&&(commonBattleInfoArray.length!=0))
			{
				C2SEmitter.occupyKuangIng(commonBattleInfoArray);
				clearCommonBattleInfo();
			}
		}
		/**
		 * 战斗超时
		 */
		public static function battleTimeEnd():void
		{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)
			{
				LeitaiModel.battleTimeEnd();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
			{
				MapModel.battleTimeEnd();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				JinkuangModel.LveduoBattleTimeEnd();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				JinkuangModel.QuganBattleTimeEnd();
			}
		}
		
		/**
		 * 用户主动退出战斗
		 */
		public static function userStopBattle():void
		{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)
			{
				LeitaiModel.battleRetreat();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Copy)
			{
				MapModel.battleRetreat();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				JinkuangModel.lveduoRetreat();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				JinkuangModel.QuganRetreat();
			}
		}
		
		/**
		 * 保存战斗过程通信
		 */
		private static function sendCommonBattling(_mySide:AttackComputeData,_enemySide:AttackComputeData,_damage:int,_firedWay:Number,_isMyHurt:Boolean):void
		{
			var heId:int=_enemySide.id;
			var heDead:int=0;
			var heGun:Number=_enemySide.gunXid;
			
			var heLoseHp:int=0;	
			var heFiredWay:Number=0;
			
			var meLoseHp:int=0;
			var meFiredWay:Number=0;	
			
			if(_isMyHurt)
			{
				meLoseHp=_damage;
				heFiredWay=_firedWay;
			}
			else
			{
				heLoseHp=_damage;
				meFiredWay=_firedWay;
			}			
			var meGun:Number=_mySide.gunXid;
			challengeCommonPersonIng(heId,meLoseHp,meFiredWay,heDead,heLoseHp,heFiredWay,meGun,heGun);
		}
		private static var commonBattleInfoArray:Array;
		/**
		 * 保存擂台战斗信息，一起发送
		 */
		public static function challengeCommonPersonIng(_heId:int=0,_meLoseHp:int=0,_meFiredWay:Number=0,_heDead:int=0,_heLoseHp:int=0,_heFiredWay:Number=0,_meGun:Number=0,heGun:Number=0):void
		{
			var battle:BattleC2S=new BattleC2S;
			battle.infoId=Int64.fromNumber(getTimer());
			battle.heId=_heId;
			battle.meLoseHp=_meLoseHp;
			battle.meFiredWay=Int64.fromNumber(_meFiredWay);
			battle.heDead=_heDead;
			battle.heLoseHp=_heLoseHp;
			battle.heFiredWay=Int64.fromNumber(_heFiredWay);
			battle.meGun=Int64.fromNumber(_meGun);
			battle.heGun=Int64.fromNumber(heGun);
			saveCommonBattleInfo(battle);
		}
		/**
		 * 保存战斗信息
		 */
		private static function saveCommonBattleInfo(_battleInfo:BattleC2S):void
		{
			if(null==commonBattleInfoArray)
			{
				commonBattleInfoArray=[];
			}
			commonBattleInfoArray.push(_battleInfo);
		}
		public static function clearCommonBattleInfo():void
		{
			if(null==commonBattleInfoArray)
			{
				commonBattleInfoArray=[];
			}
			commonBattleInfoArray.length=0;
		}
		public static function getBattleResult():Boolean
		{
			var result:int=GameVOManager.getInstance().battleresult.result;
			if(result<=0)
			{
				return false;
			}
			return true;
		}
		//以下都是战斗中需要用到公式计算
		/**
		 * 暴击率计算公式
		 * cri*(0.00039-((lv-1)*0.0000025))
		 */
		private static var Cri_Pro_Express:String;
		private static function getCri_Pro_Express():String
		{
			if(null==Cri_Pro_Express)
			{
				Cri_Pro_Express=XMLDataManager.getExpressionById("cri_pro").expression;
			}
			return Cri_Pro_Express;
		}
		public static function computeCri_Pro(_level:int,_cri:int):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["cri"]=_cri;
			computeObj["lv"]=_level;
			var computeStr:String=getCri_Pro_Express();
			result=D.evalToNumber(computeStr,computeObj);
			return result;
		}
		
		/**
		 * 命中率计算公式
		 * hit*(0.00039-((lv-1)*0.0000025))
		 */
		private static var Hit_Pro_Express:String;
		private static function getHit_Pro_Express():String
		{
			if(null==Hit_Pro_Express)
			{
				Hit_Pro_Express=XMLDataManager.getExpressionById("hit_pro").expression;
			}
			return Hit_Pro_Express;
		}
		public static function computeHit_Pro(_level:int,_hit:int):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["hit"]=_hit;
			computeObj["lv"]=_level;
			var computeStr:String=getHit_Pro_Express();
			result=D.evalToNumber(computeStr,computeObj);
			return result;
		}
		
		/**
		 * 韧性率计算公式
		 * renxing*(0.00039-((lv-1)*0.0000025))
		 */
		private static var Renxing_Pro_Express:String;
		private static function getRenxing_Pro_Express():String
		{
			if(null==Renxing_Pro_Express)
			{
				Renxing_Pro_Express=XMLDataManager.getExpressionById("renxing_pro").expression;
			}
			return Renxing_Pro_Express;
		}
		public static function computeRenxing_Pro(_level:int,_renxing:int):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["renxing"]=_renxing;
			computeObj["lv"]=_level;
			var computeStr:String=getRenxing_Pro_Express();
			result=D.evalToNumber(computeStr,computeObj);
			return result;
		}
		
		/**
		 * 闪避率计算公式
		 * eva*(0.00039-((lv-1)*0.0000025))
		 */
		private static var Eva_Pro_Express:String;
		private static function getEva_Pro_Express():String
		{
			if(null==Eva_Pro_Express)
			{
				Eva_Pro_Express=XMLDataManager.getExpressionById("eva_pro").expression;
			}
			return Eva_Pro_Express;
		}
		public static function computeEva_Pro(_level:int,_eva:int):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["eva"]=_eva;
			computeObj["lv"]=_level;
			var computeStr:String=getEva_Pro_Express();
			result=D.evalToNumber(computeStr,computeObj);
			return result;
		}
		
		/**
		 * 真实闪避率计算公式
		 * a_cri_pro+a_lvzi_cri_pro-b_renxing_pro-b_lvzi_renxing_pro
		 */
		private static var Real_Cri_Pro_Express:String;
		private static function getReal_Cri_Pro_Express():String
		{
			if(null==Real_Cri_Pro_Express)
			{
				Real_Cri_Pro_Express=XMLDataManager.getExpressionById("real_cri_pro").expression;
			}
			return Real_Cri_Pro_Express;
		}
		/**
		 * 真实闪避率计算公式
		 * a_cri_pro+a_lvzi_cri_pro-b_renxing_pro-b_lvzi_renxing_pro
		 */
		public static function computeReal_Cri_Pro(a_cri_pro:Number,a_lvzi_cri_pro:Number,b_renxing_pro:Number,b_lvzi_renxing_pro:Number):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["a_cri_pro"]=a_cri_pro;
			computeObj["a_lvzi_cri_pro"]=a_lvzi_cri_pro;
			computeObj["b_renxing_pro"]=b_renxing_pro;
			computeObj["b_lvzi_renxing_pro"]=b_lvzi_renxing_pro;
			var computeStr:String=getReal_Cri_Pro_Express();
			result=D.evalToNumber(computeStr,computeObj);
			return result;
		}
		
		/**
		 * 真实命中率计算公式
		 * 1+a_hit_pro+a_lvzi_hit_pro-b_eva_pro-b_lvzi_eva_pro
		 */
		private static var Real_Hit_Pro_Express:String;
		private static function getReal_Hit_Pro_Express():String
		{
			if(null==Real_Hit_Pro_Express)
			{
				Real_Hit_Pro_Express=XMLDataManager.getExpressionById("real_hit_pro").expression;
			}
			return Real_Hit_Pro_Express;
		}
		/**
		 * 真实命中率计算公式
		 * 1+a_hit_pro+a_lvzi_hit_pro-b_eva_pro-b_lvzi_eva_pro
		 */
		public static function computeReal_Hit_Pro(a_hit_pro:Number,a_lvzi_hit_pro:Number,b_eva_pro:Number,b_lvzi_eva_pro:Number):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["a_hit_pro"]=a_hit_pro;
			computeObj["a_lvzi_hit_pro"]=a_lvzi_hit_pro;
			computeObj["b_eva_pro"]=b_eva_pro;
			computeObj["b_lvzi_eva_pro"]=b_lvzi_eva_pro;
			var computeStr:String=getReal_Hit_Pro_Express();
			result=D.evalToNumber(computeStr,computeObj);
			return result;
		}
		
		
		/**
		 * 正常计算伤害值
		 * (a_atk-b_def/5)*a_atk/(a_atk+b_def/2)*(1+a_lvzi_damage)
		 */
		private static var Damage_Express:String;
		private static function getDamage_Express():String
		{
			if(null==Damage_Express)
			{
				Damage_Express=XMLDataManager.getExpressionById("damage").expression;
			}
			return Damage_Express;
		}
		/**
		 * 正常计算伤害值
		 * (a_atk-b_def/5)*a_atk/(a_atk+b_def/2)*(1+a_lvzi_damage)
		 */
		public static function computeDamage(a_atk:Number,a_lvzi_damage:Number,b_def:Number):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["a_atk"]=a_atk;
			computeObj["a_lvzi_damage"]=a_lvzi_damage;
			computeObj["b_def"]=b_def;
			var computeStr:String=getDamage_Express();
			result=D.evalToNumber(computeStr,computeObj);
			if(result<=1)
			{
				result=1;
			}
			return result;
		}
		
		/**
		 * 暴击计算伤害值
		 * (a_atk-b_def/5)*a_atk/(a_atk+b_def/2)*(1+a_lvzi_damage)*baoji_base*(1+a_lvzi_cri_damage)
		 */
		private static var Cri_Damage_Express:String;
		private static function getCri_Damage_Express():String
		{
			if(null==Cri_Damage_Express)
			{
				Cri_Damage_Express=XMLDataManager.getExpressionById("cri_damage").expression;
			}
			return Cri_Damage_Express;
		}
		/**
		 * 暴击计算伤害值
		 * (a_atk-b_def/5)*a_atk/(a_atk+b_def/2)*(1+a_lvzi_damage)*baoji_base*(1+a_lvzi_cri_damage)
		 */
		public static function computeCri_Damage(a_atk:Number,a_lvzi_damage:Number,b_def:Number,a_lvzi_cri_damage:Number,$baoji_base:Number):Number
		{
			var result:Number=0;
			var computeObj:Object={};
			computeObj["a_atk"]=a_atk;
			computeObj["a_lvzi_damage"]=a_lvzi_damage;
			computeObj["b_def"]=b_def;
			computeObj["a_lvzi_cri_damage"]=a_lvzi_cri_damage;
			computeObj["baoji_base"]=$baoji_base;
			var computeStr:String=getCri_Damage_Express();
			result=D.evalToNumber(computeStr,computeObj);
			if(result<=1)
			{
				result=1;
			}
			return result;
		}
	}
}