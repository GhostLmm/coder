package ui.task
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.tempData.TaskData;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	
	import util.Util;
	
	public class Item_Task extends Item_BaseTask
	{
	
		public function Item_Task($mc:MovieClip=null)
		{
			super($mc);
		}
		
		
		
		
		protected override function onLinqu(evt:Event):void{
			var taskData:TaskData=m_data as TaskData;
			if(taskData.status==TaskData.ST_Complete){
				C2SEmitter.getTaskReward(taskData.node.id);
			}
		}
		protected override function onClickQiangwang(evt:Event):void{
			var taskData:TaskData=m_data as TaskData;
			if(taskData.status==TaskData.ST_Active){
				taskData.guide();
				WindowManager.closeWindowByClass(TaskWindow);
			}
		}
		
		protected override function setShow():void{
			var taskData:TaskData=m_data as TaskData;
			var pack:RewardsPackData=new RewardsPackData();
			
			_num_cash.text=taskData.node.bouns_cash+"";
			_num_exp.text=taskData.node.bouns_exp+"";
			_num_money.text=taskData.node.bonus_money+"";
			if(taskData.node.bouns_cash>0){
				_num_cash.visible=true;
				_mc_cash.visible=true;
			}else{
				_num_cash.visible=false;
				_mc_cash.visible=false;
			}
			
			_fnt_name.text=taskData.node.task_name;
			_fnt_desc.text=taskData.node.desc;
			if(taskData.isFenbu()){
				var comStep:int=taskData.hasCompleteStep();
				if(comStep>taskData.getTotalStep()) comStep=taskData.getTotalStep();
				var desc:String=comStep+"/"+taskData.getTotalStep();
				/*if(taskData.status==TaskData.ST_Complete){
					Util.setSuccessText(_fnt_jindu,desc);
				}else{
					Util.setFailText(_fnt_jindu,desc);
				}*/
				_fnt_jindu.text=desc;
				
			}else{
				_fnt_jindu.text="";
			}
			
			if(taskData.hasUserLevelActive()){
				_fnt_lv_limit.text="";
			}else{
				_fnt_lv_limit.text="("+taskData.node.need_lv+")";
			}
			_mc_wancheng.visible=false;
			_btn_lingqu.visible=false;
			_btn_qianwang.visible=false;
			if(taskData.status==TaskData.ST_Active){
				_btn_qianwang.visible=true;
				_fnt_jindu.visible=true;
			}
			if(taskData.status==TaskData.ST_Complete){
				_btn_lingqu.visible=true;
				_fnt_jindu.visible=true;
			}
			if(taskData.status==TaskData.ST_Finish){
				_mc_wancheng.visible=true;
				_fnt_jindu.visible=false;
			}
		}
		
		
		
	}
}