package ui.task
{
	import com.fish.modules.core.models.TaskModel;
	import com.ghostlmm.lightMVC.Context;

	public class MainTaskPanel extends TaskBasePanel
	{
		public function MainTaskPanel()
		{
			super();
		}
		
		protected override function initMoulde():void{
			_scroll.initClass(Item_Task);
		}
		
		public override function update():void{
			setShow();
		}
		
		protected override function setShow():void{
			var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
			_scroll.setData(taskModel.getMainTaskList());
		}
		
	}
}