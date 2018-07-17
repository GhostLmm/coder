package ui.layer
{
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TQTTouchEvent;
	import core.event.TqtEvent;
	
	import ui.shezhi.CaidanWindow;
	
	import view.CommonControlFun;
	import view.module.BroadCastView;
	import view.module.ToggleController;
	
	public class MDI_UiLayer extends Mediator
	{
		public static const LabelArray:Array=[Label_DongfuScene,Label_MeirenScene,Label_QiyuScene,Label_LeitaifuScene,Label_JishiScene];
		public static const Label_DongfuScene:String="Label_DongfuScene";
		public static const Label_MeirenScene:String="Label_MeirenScene";
		public static const Label_QiyuScene:String="Label_QiyuScene";
		public static const Label_LeitaifuScene:String="Label_LeitaifuScene";
		public static const Label_JishiScene:String="Label_JishiScene";
		
		private static const DongfuObj:Object={"s":true,"t":true,"u":true};
		private static const JishiObj:Object={"s":true,"t":true,"u":false};
		private static const LeitaiObj:Object={"s":true,"t":true,"u":false};
		private static const MeirenObj:Object={"s":true,"t":true,"u":false};
		private static const QiyuObj:Object={"s":true,"t":true,"u":true};
		
		[Inject]
		public var uilayer:UiLayer;
		
		
		
		private var toggleController:ToggleController;
		
		public var m_currentScene:String;
		
		public function MDI_UiLayer()
		{
			super();
		}
		public static var isInit:Boolean=true;
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
//			uilayer.springMenu.setHuodongData(changeClsArrayToNameArray());
			uilayer.rb.init();
			
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			initBroadCast();
		}
		private function openShezhi(evt:Event):void{
			WindowManager.openOnlyWinodw(CaidanWindow);
		}
		private function registerEvent():void
		{
			addViewListener(uilayer.btn_setup,TqtEvent.BUTTON_CLICK,openShezhi);
//			addViewListener(uilayer.liaotianBtn,TQTTouchEvent.TOUCH_TAP,showLiaotian);
		}
		private function setShow():void
		{
			
		}
		private var m_broadCastView:BroadCastView;		
		private function initBroadCast():void
		{					
			m_broadCastView=new BroadCastView(uilayer.broadCastUI);
		}
		private function showLiaotian(evt:Event=null):void
		{
			CommonControlFun.gotoChat();
		}
		private function changeClsArrayToNameArray():Array{
			var clss:Array=Preload.testWindowClsArray;
			var nameArray:Array=[];
			for each(var cls:Class in clss){
				var clsName:String=cls+"";
				clsName=clsName.substr("[class ".length,clsName.length-1-"[class ".length);
				clsName=clsName.replace("Window","");
				clsName=clsName.replace("window","");
				nameArray.push({name:clsName,cls:cls});
			}
			return nameArray;
		}
		
		
		
		
		public override function destroy():void
		{
			// todo
			if(m_broadCastView){m_broadCastView.destroy();m_broadCastView=null;};
			if(toggleController){
				toggleController.destory();
				toggleController=null;
			}
			
			super.destroy();
			
		}
	}
}