package ui.task
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.tempData.DailyTaskData;
	import com.fish.modules.core.models.tempData.TaskData;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	
	import util.Util;
	
	public class Item_DailyTask extends Item_BaseTask
	{
		private var taskData:DailyTaskData;
		
		private static var yuekaItem:YuekaItemMC;
		
		public function Item_DailyTask($mc:MovieClip=null)
		{
			super($mc);
		}
		
		public override function loadData($data:Object):*{
			taskData=$data as DailyTaskData;
			return super.loadData($data);
		}
		
		protected override function onLinqu(evt:Event):void{
			if(taskData.status==DailyTaskData.ST_Complete){
				C2SEmitter.getDailyTaskReward(taskData.node.id);
			}
		}
		protected override function onClickQiangwang(evt:Event):void{
			if(taskData.status==TaskData.ST_Active){
				
				taskData.guide();
				if(taskData.needCloseOnGuide()){
					WindowManager.closeWindowByClass(TaskWindow);
				}
				
			}
		}
		
		public override function destory():void{
			if(yuekaItem) {yuekaItem.destory(); yuekaItem=null;}
			super.destory();
		}
		
		protected override function setShow():void{
			
			if(taskData.isYueka()){
				if(yuekaItem==null) yuekaItem=new YuekaItemMC();
				m_mc.visible=false;
				this.addChild(yuekaItem.display);
				yuekaItem.loadData(taskData);
				return ;
			}
			if(yuekaItem && this.contains(yuekaItem.display) ){
				this.removeChild(yuekaItem.display);
			}
			m_mc.visible=true;
			
			_pos_imag.fillWithBitmapByClassName(taskData.node.icon);
			
			_fnt_name.text=taskData.node.task_name;
			_fnt_desc.text=taskData.node.desc;
			
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
			
			var completeStep:int=taskData.hasCompleteStep();
			if(completeStep>taskData.node.target_num) completeStep=taskData.node.target_num;
			var desc:String=completeStep+"/"+taskData.node.target_num;
			/*if(taskData.status==TaskData.ST_Complete){
				Util.setSuccessText(_fnt_jindu,desc);
			}else{
				Util.setFailText(_fnt_jindu,desc);
			}*/
			_fnt_jindu.text=desc;
			_fnt_lv_limit.visible=false;
			
			_mc_wancheng.visible=false;
			_btn_lingqu.visible=false;
			_btn_qianwang.visible=false;
			if(taskData.status==DailyTaskData.ST_Active){
				_btn_qianwang.visible=true;
				_fnt_jindu.visible=true;
			}
			if(taskData.status==DailyTaskData.ST_Complete){
				_btn_lingqu.visible=true;
				_fnt_jindu.visible=true;
			}
			if(taskData.status==DailyTaskData.ST_Finish){
				_mc_wancheng.visible=true;
				_fnt_jindu.visible=false;
			}
			
			if(taskData.isVip()){
				_fnt_jindu.visible=false;
			}else{
				_fnt_jindu.visible=true;
			}
		}
	}
}