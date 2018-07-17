package ui.layer
{
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.fish.modules.core.models.BagModel;
	import com.fish.modules.core.models.EquipModel;
	import com.fish.modules.core.models.TaskModel;
	import com.ghostlmm.dig.DigGuideTip;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.bag.BagWindow;
	import ui.equip.ChuanchengWindow;
	import ui.equip.EquipRonglianWindow;
	import ui.equip.ShenzhuangTunshiWindow;
	import ui.shezhi.CaidanWindow;
	import ui.task.TaskWindow;
	import ui.widget.Button;
	
	import util.SwitchManager;
	import util.Util;
	
	import view.CommonControlFun;

	public class UIBrPart
	{
		public var btn_bg:Button;
//		public var btn_setup:Button;
		public var btn_help:Button;
		public var btn_ronglian:Button;
		public var jumpBtn:MovieClip;
		private var mc_changan:MovieClip;
		public var btn_gonghui:Button;
		
		
		private var taskTip:MovieClip;
		private var bagTip:MovieClip;
		
		private var mc:mc_ui_BRpart;
		public function UIBrPart()
		{
			mc=new mc_ui_BRpart();
			btn_bg=new Button(mc.bagBtn);
			btn_help=new Button(mc.helpBtn);
//			btn_setup=new Button(mc.setupBtn);
			btn_ronglian=new Button(mc.RonglianBtn);
			btn_gonghui=new Button(mc.GonghuiBtn);
			taskTip=mc.helpBtn.mc_tishi;
			bagTip=mc.bagBtn.mc_tishi;
			taskTip.visible=false;
			bagTip.visible=false;
			
			mc.x=GlobalRef.width;
			mc.y=GlobalRef.height;
			jumpBtn=mc.jumpBtn;
			mc_changan=jumpBtn.mc_changan;
		}
		
		public function get display():DisplayObject{
			return mc;
		}
		
		
		public function init():void{
			
			var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
			taskModel.taskUpdate_SN.add(setTaskTip);
			
//			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			equipModel.modelUpdata_SN.add(setBagTip);
			
			btn_bg.addEventListener(TqtEvent.BUTTON_CLICK,onClickBg);
			btn_help.addEventListener(TqtEvent.BUTTON_CLICK,onClickHelp);
//			btn_setup.addEventListener(TqtEvent.BUTTON_CLICK,onClickSetUp);
			btn_ronglian.addEventListener(TqtEvent.BUTTON_CLICK,onClickRonglian);
			btn_gonghui.addEventListener(TqtEvent.BUTTON_CLICK,onClickGonghui);
			
			/*if(CommonControlFun.isInZhucheng()){
				btn_gonghui.visible=true;
			}else{
				btn_gonghui.visible=false;
			}*/
			
			mc_changan.visible=false;
			/*if(Util.guideIsCompelete()){
				mc_changan.visible=false;
			}else{
				mc_changan.visible=true;
			}*/
			
			if(!SwitchManager.getInstance().Switch_Gonghui){
				btn_gonghui.visible=false;
			}
			
			setTaskTip();
			setBagTip();
		}
		
		private function setTaskTip():void{
			var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
			if(taskModel.couldLinquNum_DailyTask+taskModel.couldlinquNum_MainTask>0){
				taskTip.visible=true;
			}else{
				taskTip.visible=false;
			}
		}
		private function setBagTip():void{
			var bagModel:BagModel=Context.getInjectInstance(BagModel);
			if(bagModel.getIdleEquipGridNum()<=0){
				bagTip.visible=true;
			}else{
				bagTip.visible=false;
			}
		}
		
		private function onClickBg(evt:Event):void
		{
			WindowManager.openOnlyWinodw(BagWindow);
//			Context.getInsance().coreDispatcher.dispatchEvent(new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Mining}));
		}
		private function onClickHelp(evt:Event):void{
			WindowManager.openOnlyWinodw(TaskWindow);
//			var tip:DigGuideTip=new DigGuideTip();
//			GlobalRef.root.addChild(tip.display);
//			tip.showEffect();
			
		}
		private function onClickSetUp(evt:Event):void{
			WindowManager.openOnlyWinodw(CaidanWindow);
//			WindowManager.openOnlyWinodw(ShenzhuangTunshiWindow);
		}
		private function onClickRonglian(evt:Event):void{
			WindowManager.openOnlyWinodw(EquipRonglianWindow);
		}
		private function onClickGonghui(evt:Event):void{
			CommonControlFun.gotoBanghui();
		}
		
		
		public function destory():void{
			var taskModel:TaskModel=Context.getInjectInstance(TaskModel);
			taskModel.taskUpdate_SN.remove(setTaskTip);
			var equipModel:EquipModel=Context.getInjectInstance(EquipModel);
			equipModel.modelUpdata_SN.remove(setBagTip);
			mc=null;
			jumpBtn=null;
			taskTip=null;
			bagTip=null;
			mc_changan=null;
			if(btn_bg) {btn_bg.removeEventListener(TqtEvent.BUTTON_CLICK,onClickBg);btn_bg.destory();btn_bg=null;}
			if(btn_help) {btn_help.removeEventListener(TqtEvent.BUTTON_CLICK,onClickHelp);btn_help.destory();btn_help=null;}
//			if(btn_setup) {btn_setup.removeEventListener(TqtEvent.BUTTON_CLICK,onClickSetUp);btn_setup.destory();btn_setup=null;}
			if(btn_ronglian) {btn_ronglian.removeEventListener(TqtEvent.BUTTON_CLICK,onClickRonglian);btn_ronglian.destory();btn_ronglian=null;}
			if(btn_gonghui) {btn_gonghui.removeEventListener(TqtEvent.BUTTON_CLICK,onClickGonghui);btn_gonghui.destory();btn_gonghui=null;}
		}
	}
}