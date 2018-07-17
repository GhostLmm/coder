package
{
	import com.fish.modules.core.CoreConfig;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.ViewControl;
	import com.fish.modules.core.events.CoreEvent;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.ModuleManager;
	
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	import core.LayerController;
	
	import ui.layer.MDI_UiLayer;

	public class GameRefreshControl
	{
		public function GameRefreshControl()
		{
		}
		
		public static var freshSwitch:Boolean=true;
		
		private static const IntervalTime:int=200;
		
		private static var _refreshFlag:Boolean=true;
		public static function get refreshFlag():Boolean
		{
			return _refreshFlag;
		}
		public static function set refreshFlag(value:Boolean):void
		{
			if(value){
				_close_time=new Date().time;
			}
			_refreshFlag=value;
		}
		
		private static var _close_time:Number;
		
		public static function init():void
		{
			
			NativeApplication.nativeApplication.addEventListener( Event.ACTIVATE, appActivate);
			NativeApplication.nativeApplication.addEventListener( Event.DEACTIVATE, appDeactivate);
		}
		
		public static function refresh(arg:Object=null):void
		{
			if(!freshSwitch){
				return ;
			}
			MDI_UiLayer.isInit=true;
			while(GlobalRef.topLayer.numChildren){
				var dis:DisplayObject=GlobalRef.topLayer.removeChildAt(0);
				try{
					(dis as Object).destory();
				}catch(e:Error){
					trace("refresh "+e.message);
				}
			}
			//显示等待界面
			var refreshView:RefreshView=new RefreshView();
			GlobalRef.topLayer.addChild(refreshView);
			
			
			S2CHanlder.instance.reset();
			//先撤掉所有显示
//			SwitchSceneController.getInstance().clearFlashView();
//			
//			SwitchSceneController.getInstance().clearBattleView();
			
			//清理
			ModuleManager.getInstance().unLoadmodule(CoreConfig.NAME);
			
			CoreConfig.clearModel();
		
//			StoryManager.instance.reset();
			GameVOManager.getInstance().reset();
			
			ModuleManager.getInstance().loadmodule(CoreConfig.NAME);
			
			ViewControl.init();
			
//			SwitchSceneController.getInstance().isInBattle=false;
			
			refreshView.showWait();
			
//			Wnd_Announcement.anounceFlag=false;
			LayerController.instance.init(GlobalRef.root);
			S2CHanlder.instance.initCom_SN.addOnce(function():void{
				refreshView.setMeassageComplete();
			});
			
			Context.getInsance().coreDispatcher.dispatchEvent(new CoreEvent(CoreEvent.StartInitGame));
			
			
			
		}
		
		private static function appActivate(evt:Event):void
		{
			var time:Number=new Date().time;
			trace("休眠时间： "+(time-_close_time));
			if(_close_time==0){
				_close_time=new Date().time;
			}
			if(refreshFlag && time-_close_time>IntervalTime*1000){
				trace("  刷新游戏   ");
				refresh();
			}
		}
		
		private static function appDeactivate(evt:Event):void
		{
			_close_time=new Date().time;
			trace("舞台进入后台： "+_close_time);
		}
		
	}
}