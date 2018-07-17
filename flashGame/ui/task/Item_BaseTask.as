package ui.task
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.tempData.DailyTaskData;
	import com.fish.modules.core.models.tempData.TaskData;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.mc.JiangliMc;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.IGridItemMax;
	import ui.widget.NumFontStatic;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import util.Util;
	
	import view.Base_Item;
	
	public class Item_BaseTask extends Base_Item implements IGridItemMax
	{
		protected var _pos_imag:Position;
		protected var _fnt_name:FontField;
		protected var _fnt_lv_limit:FontField;
		protected var _fnt_desc:FontField;
		protected var _fnt_jindu:FontField;
		public var _btn_lingqu:Button;
		public var _btn_qianwang:Button;
		protected var _mc_wancheng:MovieClip;
		
		protected var _num_money:NumFontStatic;
		protected var _num_exp:NumFontStatic;
		protected var _num_cash:NumFontStatic;
		protected var _mc_cash:MovieClip;
		
		private static var yuekaItem:YuekaItemMC;
		
		public function Item_BaseTask($mc:MovieClip=null)
		{
			super($mc);
			
			/*var color:uint=taskData.hasComplete? 0x33FF00 : 0xFF0000;
			
			var count:int=taskData.hasComplete ? taskData.questNode.target_num : taskData.completeCount;
			_fnt_jindu.htmlText=Util.createHtml(color,count+"/"+taskData.questNode.target_num);*/
		}
		
		protected override function get itemClassName():Class{
			return ItemTask;
			
		}
		protected override function initModule():void{
			var mc:ItemTask = m_mc as ItemTask;
			_pos_imag=new Position(mc.pos_scroll_reward);
//			_src_reward=new ScrollControllerMax(_pos_scroll_reward,ScrollControllerMax.HORIZONTAL);
//			_src_reward.initClass(JiangliMc);
			_fnt_name=new FontField(mc.fnt_name);
			_fnt_lv_limit=new FontField(mc.fnt_lv_limit);
			_fnt_desc=new FontField(mc.fnt_desc);
			_fnt_jindu=new FontField(mc.fnt_jindu);
			_btn_lingqu=new Button(mc.btn_lingqu);
			_btn_qianwang=new Button(mc.btn_qianwang);
			_num_money=new NumFontStatic(mc.num_money);
			_num_exp=new NumFontStatic(mc.num_exp);
			_num_cash=new NumFontStatic(mc.num_cash);
			_mc_cash=mc.mc_cash;
			_mc_wancheng=mc.mc_wancheng;
		}
		
		public override function destory():void{
			if(_pos_imag) {_pos_imag.destory(); _pos_imag=null;}
//			if(_src_reward) {_src_reward.destory(); _src_reward=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_fnt_lv_limit) {_fnt_lv_limit.destory(); _fnt_lv_limit=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			if(_fnt_jindu) {_fnt_jindu.destory(); _fnt_jindu=null;}
			if(_btn_lingqu) {_btn_lingqu.destory(); _btn_lingqu=null;}
			if(_btn_qianwang) {_btn_qianwang.destory(); _btn_lingqu=null;}
			if(_num_money) {_num_money.destory(); _num_money=null;}
			if(_num_exp) {_num_exp.destory(); _num_exp=null;}
			if(_num_cash) {_num_cash.destory(); _num_cash=null;}
			_mc_wancheng=null;
			_mc_cash=null;
			
			if(yuekaItem) {yuekaItem.destory(); yuekaItem=null;}
			super.destory();
		}
		
		protected override function registerEvent():void{
			addTargetEvent(_btn_lingqu,TqtEvent.BUTTON_CLICK,onLinqu);
			addTargetEvent(_btn_qianwang,TqtEvent.BUTTON_CLICK,onClickQiangwang);
		}
		
		private function setShow_Daily():void{
			var taskData:DailyTaskData= m_data as DailyTaskData;
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
		
		private function setShow_Main():void{
			if(yuekaItem && yuekaItem.display && yuekaItem.display.parent ){
				yuekaItem.display.parent.removeChild(yuekaItem.display);
			}
			m_mc.visible=true;
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
//			_fnt_desc.text=taskData.node.desc;
			_fnt_desc.text=taskData.desc;
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
		
		protected function onLinqu(evt:Event):void{
			if(m_data is TaskData){
				onLinqu_Main(evt);
			}else{
				onLinqu_Daily(evt);
			}
		}
		protected function onClickQiangwang(evt:Event):void{
			if(m_data is TaskData){
				onClickQiangwang_Main(evt);
			}else{
				onClickQiangwang_Daily(evt);
			}
		}
		protected  function onLinqu_Main(evt:Event):void{
			var taskData:TaskData=m_data as TaskData;
			if(taskData.status==TaskData.ST_Complete){
				C2SEmitter.getTaskReward(taskData.node.id);
			}
		}
		protected  function onClickQiangwang_Main(evt:Event):void{
			var taskData:TaskData=m_data as TaskData;
			if(taskData.status==TaskData.ST_Active){
				taskData.guide();
				WindowManager.closeWindowByClass(TaskWindow);
			}
		}
		protected  function onLinqu_Daily(evt:Event):void{
			var taskData:DailyTaskData=m_data as DailyTaskData;
			if(taskData.status==DailyTaskData.ST_Complete){
				C2SEmitter.getDailyTaskReward(taskData.node.id);
			}
		}
		protected  function onClickQiangwang_Daily(evt:Event):void{
			var taskData:DailyTaskData=m_data as DailyTaskData;
			if(taskData.status==TaskData.ST_Active){
				
				taskData.guide();
				if(taskData.needCloseOnGuide()){
					WindowManager.closeWindowByClass(TaskWindow);
				}
				
			}
		}
		
		protected override function setShow():void{
			_pos_imag.destoryChild();
			if(m_data is TaskData){
				setShow_Main();
			}else{
				setShow_Daily();
			}
		}
		
		
		public function set enable(value:Boolean):void
		{
		}
		
		public function get enable():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		private var _index:int;
		public function set index(value:int):void
		{
			_index=value;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function get data():Object
		{
			return m_data;
		}
		
		public function enterMovie():*
		{
			return null;
		}
	}
}

