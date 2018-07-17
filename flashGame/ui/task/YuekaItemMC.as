package ui.task
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.TaskModel;
	import com.fish.modules.core.models.TimerModel;
	import com.fish.modules.core.models.tempData.DailyTaskData;
	import com.fish.modules.core.models.tempData.TaskData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.chongzhi.ChongzhiWindow;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	
	import util.GameTime;
	import util.Util;

	public class YuekaItemMC
	{
		private var mc:ItemYueka;
		private var _pos_image:Position;
		private var _fnt_name:FontField;
		private var _fnt_desc:FontField;
		private var _fnt_num:FontField;
		private var _fnt_lv_limit:FontField;
		private var _fnt_jindu:FontField;
		private var _mc_wancheng:MovieClip;
		private var _btn_lingqu:Button;
		private var _btn_qianwang:Button;
		
		private var data:DailyTaskData;
		
		public function get display():DisplayObject{
			return mc;
		}
		
		public function YuekaItemMC()
		{
			mc=AssetManager.createMCForText(ItemYueka) as ItemYueka;
			_pos_image=new Position(mc.pos_scroll_reward);
			_fnt_name=new FontField(mc.fnt_name);
			_fnt_desc=new FontField(mc.fnt_desc);
			_fnt_num=new FontField(mc.fnt_num);
			_fnt_lv_limit=new FontField(mc.fnt_lv_limit);
			_fnt_jindu=new FontField(mc.fnt_jindu);
			_mc_wancheng=mc.mc_wancheng;
			_btn_lingqu=new Button(mc.btn_lingqu);
			_btn_qianwang=new Button(mc.btn_qianwang);
			
			_btn_lingqu.addEventListener(TqtEvent.BUTTON_CLICK,onClickLinqu);
			_btn_qianwang.addEventListener(TqtEvent.BUTTON_CLICK,onClickQiangwang);
		}
		
		private function onClickLinqu(evt:Event):void{
			if(data.status==DailyTaskData.ST_Complete){
				C2SEmitter.getDailyTaskReward(data.node.id);
			}
		}
		private function onClickQiangwang(evt:Event):void{
			WindowManager.openOnlyWinodw(ChongzhiWindow);
		}
		
		public function loadData($data:DailyTaskData):void{
			data=$data;
			_pos_image.fillWithBitmapByClassName(data.node.icon);
			_fnt_name.text=data.node.task_name;
			_fnt_desc.text=data.node.desc;
			_fnt_lv_limit.text="";
			_fnt_num.text=data.node.bouns_cash.toString();
			
//			_fnt_jindu.text=data.hasCompleteStep()+"/"+data.node.target_num;
			_fnt_jindu.text="";
			
			var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
			if(data.status!=DailyTaskData.ST_Active){
				var time:GameTime=new GameTime(taskModel.yuekaEndTime-TimerModel.instance.serverTime);
				_fnt_desc.text=Util.getLanguage("月卡剩余时间提示",time.toStringDayOrTime2());
			}
			
			_mc_wancheng.visible=false;
			_btn_lingqu.visible=false;
			_btn_qianwang.visible=false;
			if(data.status==DailyTaskData.ST_Active){
				_btn_qianwang.visible=true;
			}
			if(data.status==DailyTaskData.ST_Complete){
				_btn_lingqu.visible=true;
			}
			if(data.status==DailyTaskData.ST_Finish){
				_mc_wancheng.visible=true;
			}
		}
		
		public function destory():void{
			if(_pos_image) {_pos_image.destory(); _pos_image=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			if(_fnt_num) {_fnt_num.destory(); _fnt_num=null;}
			if(_fnt_lv_limit) {_fnt_lv_limit.destory(); _fnt_lv_limit=null;}
			if(_fnt_jindu) {_fnt_jindu.destory(); _fnt_jindu=null;}
			if(_btn_lingqu) {_btn_lingqu.removeEventListener(TqtEvent.BUTTON_CLICK,onClickLinqu); _btn_lingqu.destory(); _btn_lingqu=null;}
			if(_btn_qianwang) {_btn_qianwang.removeEventListener(TqtEvent.BUTTON_CLICK,onClickQiangwang); _btn_qianwang.destory(); _btn_qianwang=null;}
			
			if(_mc_wancheng){
				_mc_wancheng=null;
			}
			
		}
	}
}