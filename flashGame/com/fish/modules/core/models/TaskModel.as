package com.fish.modules.core.models
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.DailytaskVO;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.gameVO.TaskVO;
	import com.fish.modules.core.models.tempData.DailyTaskData;
	import com.fish.modules.core.models.tempData.TaskData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_daily_task;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import util.SwitchManager;

	public class TaskModel extends BaseModel
	{
		private var mainTaskList:Array;
		private var mainTaskDic:Dictionary;
		
		private var dailyTaskList:Array;
		private var dailyTaskDic:Dictionary;
		
		private var needUpdate:Boolean=true;
		
		public var taskUpdate_SN:Signal=new Signal();
		
		private var _couldLinquNum_DailyTask:int;
		private var _couldlinquNum_MainTask:int;
		
		public static const TP_Main:String="btn_tag1";
		public static const TP_Daily:String="btn_tag2";
		
		public function get couldLinquNum_DailyTask():int{
			updateData();
			return _couldLinquNum_DailyTask;
		}
		public function get couldlinquNum_MainTask():int{
			updateData();
			return _couldlinquNum_MainTask;
		}
		
		public function TaskModel()
		{
			super();
		}
		
		protected override function onGameInitComplete():void
		{
//			initData();
			GameVOManager.getInstance().arrayVoOP_SN.add(onArrayChange);
			GameVOManager.getInstance().dailytask.update_SN.add(onDailyUpdate);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			(Context.getInjectInstance(ChongzhiModel) as ChongzhiModel).modelUpdata_SN.add(onChongzhiUpdate);
		}
		
		private function onMessage(msType:String, c2s:DigC2SProto, code:int):void{
			if(msType== C2SEmitter.REQ_FubenSaodangHandler || msType==C2SEmitter.REQ_FubenBettleRewardHandler
				|| msType==C2SEmitter.REQ_EquipUpStarHandler || msType==C2SEmitter.REQ_EquipEhanceBatchHandler
				|| msType==C2SEmitter.REQ_EquipEhanceHandler || msType==C2SEmitter.REQ_FubenBettleRewardHandler
				){
				needUpdate=true;
				taskUpdate_SN.dispatch();
			}
		}
		private function onChongzhiUpdate():void{
			needUpdate=true;
			taskUpdate_SN.dispatch();
		}
		
		private function onDailyUpdate():void{
			needUpdate=true;
			taskUpdate_SN.dispatch();
		}
		
		private function onArrayChange(cls:Class,array:Array):void{
			if(cls==TaskVO){
				needUpdate=true;
				taskUpdate_SN.dispatch();
			}
		}
		
		private function updateData():void{
			if(!needUpdate) return ;
			updateDailyTask();
			updateMainTask();
			needUpdate=false;
		}
		private function updateDailyTask():void{
			_couldLinquNum_DailyTask=0;
			dailyTaskList=[];
			dailyTaskDic=new Dictionary();
			var vo:DailytaskVO=GameVOManager.getInstance().dailytask;
			
			var vipModel:VipModel=Context.getInjectInstance(VipModel);
			
			var details:Object=JSON.parse(vo.taskDetail);
			var finishs:Array=JSON.parse(vo.taskFinish) as Array;
			var finishMap:Object={};
			for each(var tid:int in finishs){
				finishMap[tid]=true;
			}
			
			for each(var node:Node_daily_task in XMLDataManager.Node_daily_taskArray){
				var taskData:DailyTaskData=new DailyTaskData();
				var completeStep:int=details[node.id];
				var finish:Boolean=finishMap[node.id];
				taskData.initData(node,completeStep,finish);
				if(taskData.node.guide_type==DailyTaskData.TP_Vip && !SwitchManager.getInstance().Switch_VIP_Icon){
					continue;
				}
				
				dailyTaskDic[taskData.node.id]=taskData;
				dailyTaskList.push(taskData);
				if(taskData.status==DailyTaskData.ST_Complete){
					_couldLinquNum_DailyTask++;
				}
			}
			dailyTaskList.sort(compareDailyTask);
		}
		
		/** 月卡终止时间**/
		public function get yuekaEndTime():Number{
			var t:Number=GameVOManager.getInstance().dailytask.yuekaEndtime;
			if(isNaN(t)){
				return 0;
			}
			return t;
		}
		
		/** 是否处于月卡阶段  **/
		public function hasInYuekaTime():Boolean{
			return yuekaEndTime>TimerModel.instance.serverTime;
		}
		
		private function updateMainTask():void{
			_couldlinquNum_MainTask=0;
			needUpdate=false;
			mainTaskDic=new Dictionary();
			mainTaskList=[];
			for each(var vo:TaskVO in GameVOManager.getInstance().tasks){
				
				var taskData:TaskData=new TaskData();
				taskData.initFromVo(vo);
				if(taskData.status!=TaskData.ST_Finish){
					if(taskData.node){
						mainTaskList.push(taskData);
						mainTaskDic[taskData.node.id]=taskData;
						if(taskData.status==TaskData.ST_Complete){
							_couldlinquNum_MainTask++;
						}
					}
				}
				
			}
			
			mainTaskList.sort(compareMainTask);
		}
		
		public function getDailyTaskList():Array{
			updateData();
			return dailyTaskList;
		}
		private function compareDailyTask(A:DailyTaskData,B:DailyTaskData):int{
			var va:int;
			var vb:int;
			
			va+=A.node.paixu;
			vb+=B.node.paixu;
			
//			va+=A.status*100;
//			vb+=B.status*100;
			
			return va-vb;
		}
		private function compareMainTask(A:TaskData,B:TaskData):int{
			var va:int;
			var vb:int;
			
			va+=A.status*100;
			vb+=B.status*100;
			if(A.node.id>B.node.id){
				va+=1;
			}
			if(A.node.id<B.node.id){
				vb+=1;
			}
			return va-vb;
		}
		
		
		
		public override function destory():void
		{
			taskUpdate_SN.removeAll();
			if(GameVOManager.getInstance().dailytask) GameVOManager.getInstance().dailytask.update_SN.remove(onDailyUpdate);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			GameVOManager.getInstance().arrayVoOP_SN.remove(onArrayChange);
			super.destory();
		}
		
		public function getMainTaskById(tid:int):TaskData{
			updateData();
			return mainTaskDic[tid];
		}
		
		/** 获取主线任务列表 **/
		public function getMainTaskList():Array{
			updateData();
			return mainTaskList;
		}
		
	}
}