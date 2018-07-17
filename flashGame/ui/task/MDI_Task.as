package ui.task
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.RewardsData;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.TaskModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_daily_task;
	import com.ghostlmm.xmldata.Node_task;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	public class MDI_Task extends Mediator
	{
		[Inject]
		public var wm:TaskWindow;
		[Inject]
		public var taskModel:TaskModel;
		
		public function MDI_Task()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			var label:int=0;
			if(wm._params!=null){
				label=int(wm._params);
			}
			wm._scr_task.initClass(Item_BaseTask);
//			wm.labelSwitch.changeShowPanel(wm.taskPanelArray[label]);
			
//			.addEventListener(TqtEvent.BUTTON_TA_SELECT
			addViewListener(wm._tabButton,TqtEvent.BUTTON_TA_SELECT,onSelect);
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			wm._tabButton.setFuocus(TaskModel.TP_Main);
			wm._scr_task.setData(taskModel.getMainTaskList(),true);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
			taskModel.taskUpdate_SN.add(onTaskUpdate);
			setTishi();
			
			
		}
		
		public function getFirtTaskItem():*{
			if(wm && wm._scr_task){
				return wm._scr_task.getRealyItemByIndex(0);
			}
			return null;
		}
		
		private function onSelect(evt:TqtEvent):void{
			var type:String=evt.data;
			if(type==TaskModel.TP_Daily){
				wm._scr_task.setData(taskModel.getDailyTaskList(),true);
			}else{
				wm._scr_task.setData(taskModel.getMainTaskList(),true);
			}
		}
		
		
		private function onTaskUpdate():void{
			if(wm._tabButton.focus==TaskModel.TP_Daily){
				wm._scr_task.setData(taskModel.getDailyTaskList());
			}else{
				wm._scr_task.setData(taskModel.getMainTaskList());
			}
			setTishi();
		}
		
		private function setTishi():void{
			wm._tishi1.visible=taskModel.couldlinquNum_MainTask>0;
			wm._tishi2.visible=taskModel.couldLinquNum_DailyTask>0;
		}
		
		private function showMainTaskReward(id:int):void{
			var node:Node_task=XMLDataManager.getTaskById(id);
			var pack:RewardsPackData=new RewardsPackData();
			pack.bonus_money=node.bonus_money;
			pack.bouns_cash=node.bouns_cash;
			pack.bouns_exp=node.bouns_exp;
			pack.bouns_itmes=Util.createArrayJosnToMap(node.bouns_item_id,node.bouns_item_num);
			WindowManager.openOnlyWinodw(CommonRewardWindow,pack);
		}
		private function showDailyTaskReward(id:int):void{
			var node:Node_daily_task=XMLDataManager.getDaily_taskById(id);
			var pack:RewardsPackData=new RewardsPackData();
			pack.bonus_money=node.bonus_money;
			pack.bouns_cash=node.bouns_cash;
			pack.bouns_itmes=Util.createArrayJosnToMap(node.bouns_item_id,node.bouns_item_num);
			WindowManager.openOnlyWinodw(CommonRewardWindow,pack);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(code>0){
				if(msType==C2SEmitter.REQ_TaskRewardHandler){
//					Util.flow("领取任务奖励成功提示");
					Music.playFX(Music.FX_taskreward);
					showMainTaskReward(c2s.task.rewardXid);
//					wm.labelSwitch.update();
					onTaskUpdate();
				}
				if(msType==C2SEmitter.REQ_DailyTaskRewardHandler){
//					Util.flow("领取任务奖励成功提示");
					Music.playFX(Music.FX_taskreward);
					showDailyTaskReward(c2s.task.rewardXid);
//					wm.labelSwitch.update();
					onTaskUpdate();
				}
				if(msType==C2SEmitter.REQ_MoneyBuyHandler || msType==C2SEmitter.REQ_EquipRonglianHandler ){
//					wm.labelSwitch.update();
					onTaskUpdate();
				}
			}
			
			
		}
		
		public override function destroy():void
		{
			// todo
			taskModel.taskUpdate_SN.remove(onTaskUpdate);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}