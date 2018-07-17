package core
{
	import flash.utils.Dictionary;
	
	import org.osflash.signals.Signal;
	
	import ui.battle.ExitbattleWindow;
	import ui.digWindow.AlertWindow;
	import ui.window.JinggaoWindow;
	import ui.window._WindowBase;
	import ui.window._WindowInterface;
	
	import util.Dict;
	import util.Util;

	public class WindowManager
	{
		public static var currentAlert:JinggaoWindow;
		public static var windowOp_SN:Signal=new Signal();
		private static var _instance:WindowManager;
		private static function get instance():WindowManager
		{
			if(_instance == null) {
				_instance = new WindowManager;
			}
			return _instance;
		}
		
		private var _dict:Dict;
		public static function init():void
		{
			instance._dict = new Dict;
		}
		
		private static var currentOpenWndDic:Dictionary=new Dictionary();
		
		public static function hasWindowOpen():Boolean
		{
			for each(var w:Object in currentOpenWndDic){
				if(w!=null){
					if(!(w is ExitbattleWindow))
					{
						return true;
					}
				}
				
			}
			return false;
		}
		
		public static function closeWindowByClass(cls:Class):void
		{
			if(currentOpenWndDic[cls]){
				(currentOpenWndDic[cls] as _WindowBase).close();
			}
		}
		
		public static function openOnlyWinodw(cls:Class,extrObj:Object=null):void
		{
			trace("打开窗口：\t"+cls);
			if(!getCurrentOpenedWindowByClass(cls))
			{
				getWindowByClass(cls,extrObj).open();
				if(!Util.guideIsCompelete()){
					
					PlayerGuideManager.getInstance().onOpenWindow(Util.getClassName(cls));
				}
				
			}else{
				closeWindowByClass(cls);
				getWindowByClass(cls,extrObj).open();
			}
		}
		/**  打开警告窗口 **/
		public static function openAlert(desc:String,okFn:Function=null,okArgs:Array=null,cancelFn:Function=null,cancelArgs:Array=null):void{
			openOnlyWinodw(AlertWindow,{desc:desc,okFn:okFn,okArgs:okArgs,cancelFn:cancelFn,cancelArgs:cancelArgs});
		}
		
		
		private static function getWindowByClass(cls:Class,extrObj:Object=null):_WindowInterface
		{
//			if (instance._dict[cls] == null) {
//				instance._dict[cls] = new cls(extrObj);
//				trace("new window",cls)
//				if (instance._dict[cls] is _WindowBase == false) {
//					instance._dict[cls] = null;
//				}
//			}
//			return instance._dict[cls];
			
			var wnd:_WindowBase=new cls(extrObj);
			currentOpenWndDic[cls]=wnd;
			windowOp_SN.dispatch();
			return  wnd;
		}
		
		public static function closeWND(wnd:_WindowBase):void
		{
			currentOpenWndDic[wnd["constructor"]]=null;
			delete currentOpenWndDic[wnd["constructor"]];
			
			windowOp_SN.dispatch()
		}
		
		public static function closeAllWindow():void
		{
			for each(var wnd:_WindowBase in currentOpenWndDic)
			{
				wnd.close();
			}
			currentOpenWndDic=new Dictionary();
			windowOp_SN.dispatch();
		}
		public static function getCurrentOpenedWindowByClass(cls:Class):_WindowBase
		{
			return currentOpenWndDic[cls];
		}
		
		public static function registerWindow(cls:Class,window:_WindowInterface):void
		{
			instance._dict[cls] = window;
			if (instance._dict[cls] is _WindowBase == false) {
				instance._dict[cls] = null;
			}
		}
	}
}