package com.fish.modules.core.models
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.gameVO.BattleheroVO;
	import com.fish.modules.core.gameVO.BattlepersonVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.LeitaiVO;
	import com.fish.modules.core.gameVO.LeitaipersionVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_leitai;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import core.WindowManager;
	
	import org.osflash.signals.Signal;
	
	import snake.GameManager;
	import snake.viewdata.ViewData_LeitaiPlayer;
	import snake.viewdata.leitai.ViewData_LeitaiPerson;
	
	import ui.battle.BattleResultWindowData;
	import ui.battle.ShengliWindow;
	import ui.battle.ShibaiWindow;
	
	import util.Util;
	
	import view.CommonControlFun;

	public class LeitaiModel extends BaseModel
	{
		public static const BATTLE_USER_RANK_ERROR:int=-3036;
		public var leitaiVoArrayChange_SN:Signal=new Signal();
		private var needFreshPersonInfo:Boolean=false;
		public var _leitaiVo:LeitaiVO;
		public var getRewardMsgCom:Signal=new Signal();
		
		public function LeitaiModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.add(onLeitaiInfoChange);
			_leitaiVo=GameVOManager.getInstance().leitai;
			S2CHanlder.instance.Opt_Message_SN.add(onErrorDeal);
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
			if(_msgType==C2SEmitter.REQ_LeitaiBattleIngHandler)
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
						battleTimeEnd();
						break;
					case CHECK_ERROR:
						
						break;
				}
			}
		}
		/**
		 * 敌人死亡
		 */
		public static function allEnemyDie():void
		{
			BattleModel.allEnemyDie();
		}
		/**
		 * 战斗超时
		 */
		public static function battleTimeEnd():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			leitaiModel.sendLeitaiResult();
		}
		
		/**
		 * 战斗撤退
		 */
		public static function battleRetreat():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			leitaiModel.sendLeitaiResult(1);
		}
//		public static function forceStopBattle_Win():void{
//			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
//			battleModel.isEnded=true;
//		}
		
		
		public static function forceStopBattle():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			leitaiModel.sendLeitaiResult();
		}
		private function onErrorDeal(_messageType:String,_code:int):void
		{
			if(_messageType==C2SEmitter.REQ_LeitaiBattlePreHandler)
			{
				switch(_code)
				{
					case 1:
						CommonControlFun.showLeitaiPkWindow();
						(Context.getInjectInstance(BattleModel) as BattleModel).isEnded=false;
//						Context.getInsance().coreDispatcher.dispatchEvent( new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Leitai}) );
						break;
					case BATTLE_USER_RANK_ERROR:
						C2SEmitter.getLeitaiPersonList();
						break;
				}				
			}
			if(_messageType==C2SEmitter.REQ_LeitaiBattleRewardHandler)
			{
				switch(_code)
				{
					case 1:
						if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_Leitai)
						{
							var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
							leitaiModel.showBattleResult();
						}
						break;
				}
			}
		}
		public var cacheLeitaiPerson:ViewData_LeitaiPerson;
		public function changeLeitaiPerson(_index:int):void
		{
			BattleModel.clearCommonBattleInfo();
			var viewData:ViewData_LeitaiPerson=getLeitaiInfoByIndex(_index);
			cacheLeitaiPerson=viewData;
			C2SEmitter.challengeLeitaiPerson(viewData.userId,viewData.leitaiRank);
		}
		public function getCurrentMap():String
		{
			return "level_0_1";
		}
		private static var LeitaiFightLimit:int=0;
		public static function getLeitaiFreeFightLimit():int
		{
			if(0==LeitaiFightLimit)
			{
				LeitaiFightLimit=XMLDataManager.getConstById("leitai_fight_limit").value;
			}
			return LeitaiFightLimit;
		}
		private function onLeitaiInfoChange(cls:Class,array:Array):void
		{
			if(cls==LeitaipersionVO)
			{
				needFreshPersonInfo=true;
				leitaiVoArrayChange_SN.dispatch();
			}
		}
		
		public function getLeitaiInfoByIndex(_value:int):ViewData_LeitaiPerson
		{
			var index:int=_value;
			var dataList:Array=leitaiPersonsViewData;
			return dataList[index-1] as ViewData_LeitaiPerson;
		}
		
		private var _leitaiPersonDataArray:Array;
		public function get leitaiPersonsViewData():Array
		{
			if((null==_leitaiPersonDataArray)||(needFreshPersonInfo))
			{
				updateleitaiPersonDataArray();
			}
			return _leitaiPersonDataArray;
		}
		private function updateleitaiPersonDataArray():void
		{
			if(null==_leitaiPersonDataArray)
			{
				_leitaiPersonDataArray=[];
			}
			_leitaiPersonDataArray.length=0;
			var leitaiPersonArray:Array=GameVOManager.getInstance().leitaipersions;
			var index:int;
			for(index=0;index<leitaiPersonArray.length;index++)
			{
				var leitaiPersonVo:LeitaipersionVO=leitaiPersonArray[index] as LeitaipersionVO;
				var leitaiItemData:ViewData_LeitaiPerson=new ViewData_LeitaiPerson();
				leitaiItemData.vo=leitaiPersonVo;
				_leitaiPersonDataArray.push(leitaiItemData);
			}
			_leitaiPersonDataArray.sort(compare);
			needFreshPersonInfo=false;
		}
		private function compare(A:ViewData_LeitaiPerson,B:ViewData_LeitaiPerson):int
		{
			return A.leitaiRank - B.leitaiRank;
		}
		public override function destory():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onErrorDeal);
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			super.destory();
		}
		/**
		 * 挑战次数是否足够
		 */
		public function countCouldTiaozhan():Boolean
		{
			var currentNum:int=_leitaiVo.tiaozhanCount;
			if(currentNum>=getLeitaiFreeFightLimit())
			{
				return false;
			}
			return true;
		}
		private var timeToMoneyUnit:int=0;
		public function getTimeToMoneyUnit():int
		{
			if(timeToMoneyUnit==0)
			{
				timeToMoneyUnit=XMLDataManager.getConstById("fight_time_unit").value;
			}
			return timeToMoneyUnit;
		}
		private var Leitai_fail_reward:Number=0;
		public function getLeitai_fail_reward():Number
		{
			if(Leitai_fail_reward==0)
			{
				Leitai_fail_reward=XMLDataManager.getConstById("leitai_fail_reward").value;
			}
			return Leitai_fail_reward;
		}
		
		/**
		 * 发送擂台胜利失败消息
		 */
		public function sendLeitaiResult(_isRetreat:int=0):void
		{
			GameManager.manager.canvas.endBattle();
			var vo:BattlepersonVO=GameVOManager.getInstance().battlepersons[0];
			var userId:int=vo.uid;
			C2SEmitter.GetLeitaiReward(userId,_isRetreat);
		}
		public function get otherPlayerData():ViewData_LeitaiPlayer
		{
			var leitaiPlayerData:ViewData_LeitaiPlayer=new ViewData_LeitaiPlayer;
			leitaiPlayerData.battlePerson=GameVOManager.getInstance().battlepersons[0];
			var voArray:Array=GameVOManager.getInstance().battleheros;
			for each(var vo:BattleheroVO in voArray)
			{
				if(vo.id==leitaiPlayerData.battlePerson.uid)
				{
					leitaiPlayerData.battleHero=vo;
					break;
				}
			}		
			return leitaiPlayerData;
		}
		public function showBattleResult():void
		{
			var result:int=GameVOManager.getInstance().battleresult.result;
			var param:BattleResultWindowData=new BattleResultWindowData();
			param.killTime=GameVOManager.getInstance().battleresult.time/1000;
			param.life=GameVOManager.getInstance().battleresult.life;
			param.type=CoreSwitchEvent.BT_Leitai;
			var rewardNode:Node_leitai=getCurrentLeitaiXml();
			if(result<=0)//失败
			{
				
				param.packData.bouns_exp=Math.floor(rewardNode.reward_exp*getLeitai_fail_reward());
				param.packData.bonus_money=Math.floor(rewardNode.reward_money*getLeitai_fail_reward());
				param.packData.bouns_rongyu=Math.floor(rewardNode.reward_rongyu*getLeitai_fail_reward());

				WindowManager.openOnlyWinodw(ShibaiWindow,param);
			}
			else if(result>=1)//胜利
			{
				param.packData.bouns_exp=rewardNode.reward_exp;
				param.packData.bonus_money=rewardNode.reward_money;
				param.packData.bouns_rongyu=rewardNode.reward_rongyu;
				param.packData.bouns_itmes=Util.createArrayJosnToMap(rewardNode.reward_item,rewardNode.reward_item_num);
				/*var itemsArray:Array=JSON.parse(rewardNode.reward_item) as Array;
				var itemsNumArray:Array=JSON.parse(rewardNode.reward_item_num) as Array;
				var index:int;
				for(index=0;index<itemsArray.length;index++)
				{
					param.rewardItemArray.push({"key":ResourceConst.R_item,"xid":itemsArray[index],"num":itemsNumArray[index]});
				}*/
				WindowManager.openOnlyWinodw(ShengliWindow,param);
			}
			
		}
		public function getCurrentLeitaiXml():Node_leitai
		{
			var result:Node_leitai;
			var lastPaiming:int=_leitaiVo.myRank;
			var rankXmlList:Array=XMLDataManager.Node_leitaiArray;
			var index:int;
			for(index=0;index<rankXmlList.length;index++)
			{
				var xml:Node_leitai=rankXmlList[index] as Node_leitai;
				if(lastPaiming<=xml.id)
				{
					result=xml;
					break;
				}
			}
			return result;
		}
	}
}