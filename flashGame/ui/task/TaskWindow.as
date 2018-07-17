package ui.task
{
	import com.fish.modules.core.models.TaskModel;
	
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.widget.TabButtonController;
	import ui.window._WindowBase;
	
	import view.module.LabelSwitch;
	
	public class TaskWindow extends _WindowBase
	{
		public static const LB_MainTask:String="maintask";
		public var _btn_close:Button;
		private var _pos_scroll_task:Position;
		public var _scr_task:ScrollControllerMax;
		
//		private var _btnArray:Array;
		
//		public var labelSwitch:LabelSwitch;
//		public var taskPanelArray:Array;
//		public static var panelRect:Rectangle;
		
		public var _tishi1:MovieClip;
		public var _tishi2:MovieClip;
//		public var _tishi3:MovieClip;
		
		public var _tabButton:TabButtonController;
		public var _btn_mainTask:Button;
		public var _btn_dailyTask:Button;
		
		
		public function TaskWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowTask);
			
			var mc:WindowTask=_scene;
			_btn_close=new Button(mc.btn_close);
			_pos_scroll_task=new Position(mc.pos_scroll_task);
			_tabButton=new TabButtonController();
			_btn_mainTask=new Button(mc.btn_tag1);
			_tishi1=mc.btn_tag1.mc_tishi;
			_btn_dailyTask=new Button(mc.btn_tag2);
			_tishi2=mc.btn_tag2.mc_tishi;
			_btn_mainTask.name=TaskModel.TP_Main;
			_btn_dailyTask.name=TaskModel.TP_Daily;
			_tabButton.registerButton(_btn_mainTask);
			_tabButton.registerButton(_btn_dailyTask);
			_scr_task=new ScrollControllerMax(_pos_scroll_task);
			
		}
		protected override function get delayBind():Boolean{
			return true;
		}
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_pos_scroll_task) {_pos_scroll_task.destory(); _pos_scroll_task=null;}
//			if(labelSwitch) {labelSwitch.destory(); labelSwitch=null;}
			_tishi1=null;
			_tishi2=null;
			if(_tabButton) {_tabButton.destory(); _tabButton=null;}
			if(_btn_dailyTask) {_btn_dailyTask.destory(); _btn_dailyTask=null;}
			if(_btn_mainTask) {_btn_mainTask.destory(); _btn_mainTask=null;}
			if(_scr_task) {_scr_task.destory(); _scr_task=null;}
			super.destory();
		}
	}
}