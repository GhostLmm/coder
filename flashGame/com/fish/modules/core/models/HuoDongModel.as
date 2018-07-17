package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.gameVO.BaseVo;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.HuodongVO;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import util.Util;

	public class HuoDongModel extends BaseModel
	{
		public var huodongVo:HuodongVO;
		
		public function HuoDongModel()
		{
			super();
		}
		protected override function onGameInitComplete():void
		{
			huodongVo=GameVOManager.getInstance().huodong;
			huodongVo.changAttr_SN.add(onHuodongVoChange);
			initHuodongConstData();
		}
		private function onHuodongVoChange(attr:String,newValue:*,oldValue:*,vo:BaseVo):void
		{
			huodongVo.update_SN.dispatch();
		}
		public var noonBegainTime:String;
		public var noonEndTime:String;
		public var afternoonBegainTime:String;
		public var afternoonEndTime:String;
		public var lingquMaxLimit:int;
		public var lingquType:String;
		public var lingquNum:int;
		private function initHuodongConstData():void
		{
			var noonTimeList:Array=XMLDataManager.getConstById("lingqu_time_noon").desc.toString().split("~");
			var afternoonTimeList:Array=XMLDataManager.getConstById("lingqu_time_afternoon").desc.toString().split("~");
			lingquMaxLimit=XMLDataManager.getConstById("lingqu_limit_count").value;
			lingquType=XMLDataManager.getConstById("lingqu_type").string_value.toString();
			lingquNum=XMLDataManager.getConstById("lingqu_tili_num").value;
			
			noonBegainTime=noonTimeList[0];
			noonEndTime=noonTimeList[1];
			
			afternoonBegainTime=afternoonTimeList[0];
			afternoonEndTime=afternoonTimeList[1];
		}		
		public function getLingqu1State():JudgeResult
		{
			var begainTimerStr:String=noonBegainTime;
			var endTimeStr:String=noonEndTime;
			var result:JudgeResult=timeCouldLingqu(begainTimerStr,endTimeStr);
			return result;
		}
		public function getLingqu2State():JudgeResult
		{
			var begainTimerStr:String=afternoonBegainTime;
			var endTimeStr:String=afternoonEndTime;
			var result:JudgeResult=timeCouldLingqu(begainTimerStr,endTimeStr);
			return result;
		}
		private function timeCouldLingqu(_begainTimeStr:String,_endTimeStr:String):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var date:Date=new Date(timerModel.serverTime);
			var endHours:int=_endTimeStr.split(":")[0];
			var endMinites:int=_endTimeStr.split(":")[1];
			if((date.hours>endHours)||(date.hours==endHours&&date.minutes>endMinites))
			{
				re.success=false;
				re.code=JudgeResult.CD_AreadyEnd;
				return re;
			}
			var beginHours:int=_begainTimeStr.split(":")[0];
			var beginMinites:int=_begainTimeStr.split(":")[1];
			if((date.hours>beginHours)||(date.hours==beginHours&&date.minutes>=beginMinites))
			{
				re.success=true;
				return re;
			}
			re.success=false;
			re.code=JudgeResult.CD_NotBegin;
			return re;
		}
		/**
		 *  领取
		 */
		public function lingqu():void
		{
			C2SEmitter.lingquHuodong();
		}
		public function couldLingqu(_id:int):JudgeResult
		{
			var re:JudgeResult=new JudgeResult();
			if(_id==1)
			{
				if(huodongVo.linquNoonCount>=lingquMaxLimit)
				{
					re.success=false;
					re.desc="已经领取";
					re.code=JudgeResult.CD_AreadyLingqu;
				}
				else
				{
					var time1Re:JudgeResult=getLingqu1State();
					re.code=time1Re.code;	
					re.success=time1Re.success;
				}
			}
			else
			{
				if(huodongVo.linquAfternoonCount>=lingquMaxLimit)
				{
					re.success=false;
					re.desc="已经领取";
					re.code=JudgeResult.CD_AreadyLingqu;
				}
				else
				{
					var time2Re:JudgeResult=getLingqu2State();
					re.code=time2Re.code;
					re.success=time2Re.success;
				}
			}
			if(re.code==JudgeResult.CD_AreadyEnd)
			{
				re.desc="已经结束";
			}
			else if(re.code==JudgeResult.CD_NotBegin)
			{
				re.desc="尚未开始";
			}
			return re;
		}
		
		//   参拜活动 相关的 操作
		public function couldCanbai():Boolean
		{
			var timerModel:TimerModel=Context.getInjectInstance(TimerModel);
			var serverDay:Number=Util.getDatesByTimestate(timerModel.serverTime);
			var canbaiDay:Number=Util.getDatesByTimestate(huodongVo.canbaiTime);
			if(serverDay==canbaiDay){
				return false;
			}
			return true;
		}
		
		
		
	}
}