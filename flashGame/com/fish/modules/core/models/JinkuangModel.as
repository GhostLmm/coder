package com.fish.modules.core.models
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.gameVO.BattlepersonVO;
	import com.fish.modules.core.gameVO.ExtrdataVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.JinkuangVO;
	import com.fish.modules.core.gameVO.JinkuanglogVO;
	import com.fish.modules.core.gameVO.XitongkuangVO;
	import com.fish.modules.core.gameVO.XitongkuangpersonVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_const;
	import com.ghostlmm.xmldata.Node_jinkuang;
	import com.ghostlmm.xmldata.Node_jinkuangrukou;
	import com.ghostlmm.xmldata.Node_leitai;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import org.osflash.signals.Signal;
	
	import snake.GameManager;
	
	import ui.battle.BattleResultWindowData;
	import ui.battle.ShengliWindow;
	import ui.battle.ShibaiWindow;
	import ui.jinkuang.JinkuangNoOccupiedWindow;
	import ui.jinkuang.JinkuangRukouWindow;
	import ui.jinkuang.JinkuangWindow;
	import ui.jinkuang.ZhanlingWindow;
	import ui.window.CommonRewardWindow;
	import ui.window.JinggaoWindow;
	
	import util.GameTime;
	import util.Util;
	
	import view.CommonControlFun;
	import view.viewData.JinkuangData;

	public class JinkuangModel extends BaseModel
	{
		public static const KUANG_NO_PEPOLE:int=3046;
		public static const NOT_YOUR_KUANG:int=3047;
				
		public static const NO_SlAVE_KUANG:int=3049;
		public static const MASTER_KUANG_NO_PEPOLE:int=3050;
		public static const SELF_CANNT_FUSHU:int=3051;
		public static const MASTER_NOT_YOUR_FRIEND:int=3052;
		public static const YOUR_NOT_MASTER_FRIEND:int=3053;
		public static const SLAVE_KUANG_HAS_PEPOLE:int=3054;
		public static const LVEDUO_MASTER_FIRST:int=3056;
		public static const ALREADEY_OCCUPY:int=3057;
		public static const OCCUPY_MASTER_FIRST:int=3060;
		public static const KUANG_FIGHTING:int=3058;
		public static const OTHER_CHETUI:int=3059;
		public static const CANNOT_ACHIEVE:int=-3027;
		
		public static const Success:int=1;
		
		public var cacheRukouData:Node_jinkuangrukou;
		public static var cacheJinkuangXid:int;
		
		public var jinkuangVo:JinkuangVO;
		public function JinkuangModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			jinkuangVo=GameVOManager.getInstance().jinkuang;
			GameVOManager.getInstance().arrayVoOP_SN.add(onVoArrayChange);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			S2CHanlder.instance.Opt_Message_SN.add(dealWithErrorCode);
		}
		
		public function getLengqueTime():*
		{
			if(null==jinkuangVo)
			{
				return 0;
			}
			if(jinkuangVo.optLengqueTime==0)
			{
				return 0;
			}
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var gameTime:GameTime=new GameTime(jinkuangVo.optLengqueTime-timerModel.serverTime);
			if(int(gameTime.miliSecond/1000)<=0)
			{
				return 0;
			}
			return gameTime.toString2();
		}
		public override function destory():void
		{
			GameVOManager.getInstance().arrayVoOP_SN.remove(onVoArrayChange);
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			S2CHanlder.instance.Opt_Message_SN.remove(dealWithErrorCode);
			cacheRukouData=null;
		}
		public var lveduoMoney:int;
		private function onOptMessage(_msg:String,_code:int):void
		{
			if(_msg==C2SEmitter.REQ_KuangQuganPreHandler)
			{
				if(_code==1)
				{
					var extraData:ExtrdataVO=GameVOManager.getInstance().extrdata;
					var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
					battleModel.isEnded=false;
					if(extraData.jingkuangFight>0)
					{
						var evt:CoreSwitchEvent=new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_JinkuangQugan});
						Context.getInsance().coreDispatcher.dispatchEvent(evt);
					}
					else
					{
						occupySuccessDo();
					}
				}
			}
			else if(_msg==C2SEmitter.REQ_KuangLveduoPreHandler)
			{
				if(_code==1)
				{
					var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
					battleModel.isEnded=false;
					var extraData:ExtrdataVO=GameVOManager.getInstance().extrdata;
					lveduoMoney=extraData.xitongkuangMoney;
					if(extraData.jingkuangFight>0)
					{
						var evt:CoreSwitchEvent=new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_JinkuangLveduo});
						Context.getInsance().coreDispatcher.dispatchEvent(evt);
					}
					else
					{
						
					}
				}
			}
			else if(_msg==C2SEmitter.REQ_GatherUserInfoKuangHandler)
			{
				JinkuangLogChange_SN.dispatch();
			}
			else if(_msg==C2SEmitter.REQ_KuangLveduoRewardHandler||_msg==C2SEmitter.REQ_KuangQuganRewardHandler)
			{
				switch(_code)
				{
					case 1:
						if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo||GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
						{
							showBattleResult();
						}
						break;
				}
			}
		}
		public function showBattleResult():void
		{
			var result:int=GameVOManager.getInstance().battleresult.result;
			var param:BattleResultWindowData=new BattleResultWindowData();
			param.life=GameVOManager.getInstance().battleresult.life;
			param.killTime=GameVOManager.getInstance().battleresult.time;
			if(result<=0)//失败
			{
				WindowManager.openOnlyWinodw(ShibaiWindow,param);
			}
			else if(result>=1)//胜利
			{
				WindowManager.openOnlyWinodw(ShengliWindow,param);
			}
			
		}
		public function getCurrentMap():String
		{
			return "level_0_1";
		}
		public function lveduoResult():void
		{
			WindowManager.openOnlyWinodw(JinkuangRukouWindow);
			WindowManager.openOnlyWinodw(JinkuangWindow,cacheRukouData);
			var extraData:ExtrdataVO=GameVOManager.getInstance().extrdata;
			lveduoMoney=extraData.xitongkuangMoney;
			var result:Boolean=BattleModel.getBattleResult();
			if(result)
			{
				if(lveduoMoney>0)
				{
					var param:RewardsPackData=new RewardsPackData();
					param.bonus_money=Math.abs(lveduoMoney);
					WindowManager.openOnlyWinodw(CommonRewardWindow,param);
				}
				else
				{
					Util.flow("掠夺成功",Math.abs(lveduoMoney));
				}
			}
			else
			{
				Util.flow("掠夺失败",Math.abs(lveduoMoney));
			}
		}
		public function quganResult():void
		{
			WindowManager.openOnlyWinodw(JinkuangRukouWindow);
			WindowManager.openOnlyWinodw(JinkuangWindow,cacheRukouData);
			var result:Boolean=BattleModel.getBattleResult();
			if(result)
			{
				Util.flow("驱赶成功");
			}
			else
			{
				Util.flow("驱赶失败");
			}
		}
		/**
		 * 占领成功
		 */
		public static function occupySuccessDo():void
		{
			Util.flow("成功占领金矿");
			var window:JinkuangNoOccupiedWindow=WindowManager.getCurrentOpenedWindowByClass(JinkuangNoOccupiedWindow) as JinkuangNoOccupiedWindow;
			if(null!=window)
			{
				window.close();
			}
		}
		public var JinkuangLogChange_SN:Signal=new Signal();
		public var XitongkuangChangeSN:Signal=new Signal();
		private function onVoArrayChange(cls:Class,array:Array):void
		{
			if(cls==XitongkuangVO)
			{
				XitongkuangChangeSN.dispatch();
			}
			if(cls==JinkuanglogVO)
			{
				JinkuangLogChange_SN.dispatch();
			}
		}
		public static function getJinkuangrukouList():Array
		{
			return XMLDataManager.Node_jinkuangrukouArray;
		}
		/**
		 *  得到不同金矿的xml数组
		 */
		public static function getJinkuangNodeListByType(_type:int):Array
		{
			var xmlTotalList:Array=XMLDataManager.Node_jinkuangArray;
			var xmlTypeArray:Array=[];
			var index:int;
			for(index=0;index<xmlTotalList.length;index++)
			{
				var xml:Node_jinkuang=xmlTotalList[index] as Node_jinkuang;
				if(xml.type==_type)
				{
					xmlTypeArray.push(xml);
				}
			}
			return xmlTypeArray;
		}
		/**
		 * 根据金矿类型，得到当前金矿数据数组
		 */
		public function getJinkuangDataArray(_type:int):Array
		{
			var result:Array=[];
			var xmllist:Array=getJinkuangNodeListByType(_type);
			var index:int;
			for(index=0;index<xmllist.length;index++)
			{
				var jinkuangData:JinkuangData=new JinkuangData();
				jinkuangData.xml=xmllist[index] as Node_jinkuang;
				jinkuangData.vo=getXitongkuangVObyXid(jinkuangData.xml.id);
				result.push(jinkuangData);
			}
			return result;
		}
		private function getXitongkuangVObyXid(_xid:int):XitongkuangVO
		{
			var voArray:Array=GameVOManager.getInstance().xitongkuangs;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:XitongkuangVO=voArray[index] as XitongkuangVO;
				if(vo.xid==_xid)
				{
					return vo;
				}
			}
			return null;
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
		

		
		public static const ReqArray:Array=[C2SEmitter.REQ_GetServerKuangInfoHandler,C2SEmitter.REQ_GetTargetKuangInfoHandler,C2SEmitter.REQ_RetreatKuangHandler,C2SEmitter.REQ_GainKuangHandler,
			C2SEmitter.REQ_FushuKuangHandler,C2SEmitter.REQ_GetUserInfoKuangHandler,C2SEmitter.REQ_GatherUserInfoKuangHandler,C2SEmitter.REQ_GetUserKuangHandler,
			C2SEmitter.REQ_OccupyKuangHandler,C2SEmitter.REQ_KuangLveduoPreHandler,C2SEmitter.REQ_KuangLveduoBattleHandler,C2SEmitter.REQ_KuangLveduoRewardHandler,
			C2SEmitter.REQ_KuangQuganPreHandler,C2SEmitter.REQ_KuangQuganBattleHandler,C2SEmitter.REQ_KuangQuganRewardHandler];
		public static function dealWithErrorCode(_messageType:String,_code:int):void
		{
			if(-1==ReqArray.indexOf(_messageType))
			{
				return;
			}
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
				case KUANG_FIGHTING:
					Util.flow("正在战斗中，稍后再来");
					break;
				case OTHER_CHETUI:
					Util.flow("对方已经撤退了");
					break;
				case CANNOT_ACHIEVE:
					Util.flow("还没到收获时间");
					break;
			}
		}
		public static function dealWithJinkuangInfo(_optCode:int):void
		{
			switch(_optCode)
			{
				case KUANG_NO_PEPOLE:
					var tempVo:XitongkuangpersonVO;
					tempVo=GameVOManager.getInstance().xitongkuangperson;
					if(tempVo.mainUserId>0&&CommonControlFun.checkIfMySelf(tempVo.mainUserId))
					{
						Util.flow("无人占领");
					}
					else
					{
						WindowManager.openOnlyWinodw(JinkuangNoOccupiedWindow,_optCode);
					}
					break;
				case OCCUPY_MASTER_FIRST:
				case Success:
					WindowManager.openOnlyWinodw(ZhanlingWindow,_optCode);
					break;

			}
		}
		
		private static function battleTimeEnd():void{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				JinkuangModel.LveduoBattleTimeEnd();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				JinkuangModel.QuganBattleTimeEnd();
			}
		}
		public static function forceStopBattle():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			jinkuangModel.sendResult();
		}
		private function sendResult():void
		{
			if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangLveduo)
			{
				sendJinkuangLveduoResult();
			}
			else if(GameSwitchSceneController.btType==CoreSwitchEvent.BT_JinkuangQugan)
			{
				sendJinkuangQuganResult();
			}
		}
		/**
		 * 检测是否是主矿 
		 */
		public static function checkIfisMainJinkuang(_xid:int):Boolean
		{
			var xml:Node_jinkuang=XMLDataManager.Node_jinkuangDic[_xid];
			var fushuArray:Array=JSON.parse(xml.fushu) as Array;
			if((xml.zhu<=0)&&(fushuArray.length>0))
			{
				return true;
			}
			return false;
		}
		/**
		 * 检测是否是附属矿
		 */
		public static function checkIfIsAssistJinkuang(_xid:int):Boolean
		{
			var xml:Node_jinkuang=XMLDataManager.Node_jinkuangDic[_xid];
			var fushuArray:Array=JSON.parse(xml.fushu) as Array;
			if((xml.zhu>0)&&(fushuArray.length<=0))
			{
				return true;
			}
			return false;
		}
		public static const Style_Main:int=1;
		public static const Style_Fu:int=2;
		public static const Style_Self:int=3;
		public static function checkJinkuangStyle(_xid:int):int
		{
			var xml:Node_jinkuang=XMLDataManager.Node_jinkuangDic[_xid];
			var fushuArray:Array=JSON.parse(xml.fushu) as Array;
			if((xml.zhu<=0)&&(fushuArray.length>0))
			{
				return Style_Main;
			}
			if((xml.zhu>0)&&(fushuArray.length<=0))
			{
				return Style_Fu;
			}
			return Style_Self;
		}
		public static function occupyJinkuang(_xid:int,_type:int):void
		{
			cacheJinkuangXid=_xid;
			C2SEmitter.occupyKuangPre(_xid,_type);
		}
		public static function checkIfIsMyFushuKuang(_vo:XitongkuangpersonVO):Boolean
		{
			if(CommonControlFun.checkIfMySelf(_vo.mainUserId))
			{
				return true;
			}
			return false;
		}
		public static const REWARD_LVEDUO:int=1;
		public static const REWARD_QUGAN:int=2;
		public static const REWARD_ZIDONGJIESUAN:int=3;
		public static const REWARD_ZHUKUANG_CHEDUI_JIESUAN:int=4;
		
		public static function convertLogToDesc(_vo:JinkuanglogVO):String
		{
			var result:String=Util.getLanguage("金矿记录_"+_vo.type);
			var paramArray:Array=[];
			paramArray.push(CommonControlFun.timeToYMRHMS(_vo.time));
			switch(_vo.type)
			{
				case REWARD_LVEDUO:				
					paramArray.push(_vo.userName);
					paramArray.push(_vo.lostMoney);
					paramArray.push(_vo.money);
					break;
				case REWARD_QUGAN:
					paramArray.push(_vo.userName);
					paramArray.push(_vo.money);
					break;
				case REWARD_ZIDONGJIESUAN:
					paramArray.push(_vo.money);
					break;
				case REWARD_ZHUKUANG_CHEDUI_JIESUAN:
					paramArray.push(_vo.money);
					break;
			}
			var index:int;
			for(index=0;index<paramArray.length;index++)
			{
				var param:String=paramArray[index];
				result=result.replace("{"+(index)+"}",param);
			}
			return result;
		}
		public static function getLogType(_vo:JinkuanglogVO):String
		{
			return Util.getLanguage("金矿记录Type_"+_vo.type);
		}
		public static function get LveduoBili():Number
		{
			return XMLDataManager.getConstById("jinkuang_lveduo_chenggong").value;
		}
		public static function get JiesuanTime():int
		{
			return XMLDataManager.getConstById("jinkuang_jiesuanzhouqi").value;
		}
		public static function computeShouhuoMoney(_time:int,_base:int):int
		{
			return _base*Math.floor(_time/JiesuanTime);
		}
		public static function computeLveduoMoney(_total:int):int
		{
			var result:int=int(_total*LveduoBili);
			return result;
		}
		public function checkCouldJinru(_node:Node_jinkuangrukou):Boolean
		{
			var _leitaiRank:int=jinkuangVo.lastLeitaiRank;
			var needRankArray:Array=JSON.parse(_node.rank) as Array;
			var top:int=needRankArray[0];
			var low:int=needRankArray[1];
			if((_leitaiRank>=top)&&(_leitaiRank<=low))
			{
				return true;
			}
			if(_leitaiRank<=0)
			{
				return true;
			}
			return false;
		}
		public function checkIfIhaveKuang():Boolean
		{
			var voArray:Array=GameVOManager.getInstance().xitongkuangs;
			var index:int;
			for(index=0;index<voArray.length;index++)
			{
				var vo:XitongkuangVO=voArray[index] as XitongkuangVO;
				if(CommonControlFun.checkIfMySelf(vo.userId))
				{
					return true;
				}
			}
			return false;
		}
		public static function isMyKuangDo(_callBack:Function):void
		{
			var onOk:Function=function():void
			{
				_callBack.apply();
			}
			var alert:JinggaoWindow;
			alert = new JinggaoWindow({data:{msg:Util.getLanguage("你已经拥有金矿，如果继续，则自动放弃现在占领的矿及资源")}});
			alert.addEventListener(TqtEvent.ALERT_OK,onOk,false,0,true);
			alert.open();
		}
		public static function JinkuangNeedLevel():int
		{
			var xml:Node_const=XMLDataManager.getConstById("jinkuang_lv");
			if(xml)
			{
				return xml.value;
			}
			return 0;
		}
		/**
		 * 战斗超时
		 */
		public static function LveduoBattleTimeEnd():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			jinkuangModel.sendJinkuangLveduoResult();
		}
		/**
		 * 战斗撤退
		 */
		public static function lveduoRetreat():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			jinkuangModel.sendJinkuangLveduoResult(1);
		}
		
		/**
		 * 发送擂台胜利失败消息
		 */
		public function sendJinkuangLveduoResult(_isRetreat:int=0):void
		{
			GameManager.manager.canvas.endBattle();
			C2SEmitter.GetLveduoKuangReward(_isRetreat);
		}
		
		/**
		 * 战斗超时
		 */
		public static function QuganBattleTimeEnd():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			jinkuangModel.sendJinkuangLveduoResult();
		}
		/**
		 * 战斗撤退
		 */
		public static function QuganRetreat():void
		{
			var battleModel:BattleModel=Context.getInjectInstance(BattleModel);
			battleModel.isEnded=true;
			var jinkuangModel:JinkuangModel=Context.getInjectInstance(JinkuangModel);
			jinkuangModel.sendJinkuangQuganResult(1);
		}
		/**
		 * 发送擂台胜利失败消息
		 */
		public function sendJinkuangQuganResult(_isRetreat:int=0):void
		{
			GameManager.manager.canvas.endBattle();
			C2SEmitter.GetLveduoKuangReward(_isRetreat);
		}
	}
}