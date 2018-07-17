package com.fish.modules.core
{
	import com.fish.modules.core.events.CoreViewEvent;
	import com.fish.modules.core.models.DailyquestModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.MaoxianModel;
	import com.fish.modules.core.models.UserModel;
	import com.fish.modules.core.models.UserTreeModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import core.WindowManager;
	
	import ui.layer.MDI_UiLayer;
	import ui.window.dongfu.friend.HaoyouWindow;
	import ui.window.maoxian.Maoxian1Window;
	import ui.window.monvta.MonvtaWindow;
	
	import util.Util;
	
	import view.CommonControlFun;
	import view.commontools.GongnengManager;

	public class FunctionGuide
	{
		public function FunctionGuide()
		{
		}
		private static var _instance:FunctionGuide;
		public static function get instance():FunctionGuide{
			if(_instance==null) _instance=new FunctionGuide();
			return _instance;
		}
		
		private var _activeFlag:Boolean=false;
		
		public function active():void{
			_activeFlag=true;
			S2CHanlder.instance.message_SN.add(onMessage);
		}
		public function deActive():void{
			_activeFlag=false;
			S2CHanlder.instance.message_SN.remove(onMessage);
		}
		
		public function guide(type:String,arg:Object=null):void{
			if(!_activeFlag) {
				trace("引导没有激活");
				return ;
			}
			var userTreeModel:UserTreeModel=Context.getInjectInstance(UserTreeModel);
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			switch(type){
				case "maoxian":
					CommonControlFun.gotoMaoxiang();
					break;
				case "leitai":
					Context.getInsance().viewDispatcher.dispatchEvent(new CoreViewEvent(CoreViewEvent.JumpScene,{scene:MDI_UiLayer.Label_LeitaifuScene}));
					break;
				case "qiyu":
					Context.getInsance().viewDispatcher.dispatchEvent(new CoreViewEvent(CoreViewEvent.JumpScene,{scene:MDI_UiLayer.Label_QiyuScene}));
					break;
				case "tree":
					CommonControlFun.gotoNvpu(true);
					break;
				case "fuli":
					WindowManager.getWindowByClass(HaoyouWindow).open();
					break;
				case "xuanxiu":
					CommonControlFun.gotoXuanxiuWindow();
					break;
				case "zhuanbeiQianghua":
					CommonControlFun.gotoEquipQianghua();
					break;
				case "boss":
					CommonControlFun.openBossWindow();
					break;
				case "monvta":
//					Context.getInsance().viewDispatcher.dispatchEvent(new CoreViewEvent(CoreViewEvent.JumpScene,{scene:MDI_UiLayer.Label_QiyuScene}));
					if(userModel.userVo.userLevel<GongnengManager.getInstance().getDongfuGonnengByKey("yuanzheng").lv){
						Util.flow("魔女塔开启提示",GongnengManager.getInstance().getDongfuGonnengByKey("yuanzheng").lv);
						return ;
					}
					WindowManager.getWindowByClass(MonvtaWindow).open();
					break;
				case "yueka":
					var dailyModel:DailyquestModel=Context.getInjectInstance(DailyquestModel);
					if(dailyModel.cuoldLingquYueka()){
						C2SEmitter.lingquYueka();
					}
					
					break;
			}
			
		}
		
		private function openMaoxianWindow():void
		{
			var maoxianModel:MaoxianModel=Context.getInjectInstance(MaoxianModel);
			if(maoxianModel.initFlag){
				WindowManager.getWindowByClass(Maoxian1Window).open();
			}else{
				C2SEmitter.maoxianInit();
			}
		}
		private function onMessage(messType:String):void
		{
			if(messType==C2SEmitter.REQ_GetMaoxianInitHandler){
				var maoxianModel:MaoxianModel=Context.getInjectInstance(MaoxianModel);
				maoxianModel.initGuanka();
				WindowManager.getWindowByClass(Maoxian1Window).open();
			}
		}
	}
}