package ui.task
{
	import com.fish.modules.core.models.TaskModel;
	import com.ghostlmm.lightMVC.Context;

	public class DailyTaskPanel extends TaskBasePanel
	{
		public function DailyTaskPanel()
		{
			super();
		}
		
		protected override function initMoulde():void{
			_scroll.initClass(Item_DailyTask);
		}
		
		public override function update():void{
			setShow();
		}
		
		protected override function setShow():void{
			var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
			_scroll.setData(taskModel.getDailyTaskList());
		}
		
		public override function clear():void{
			
			super.clear();
		}
	}
}