package
{
	import flash.desktop.NativeApplication;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import Tool.platform.PlatformManager;
	
	import util.Util;

	public class ExitGameControl
	{
		public function ExitGameControl()
		{
		}
		
		private static var _couldExit:Boolean=true;
		public static function setCouldExit(couldExit:Boolean):void{
			_couldExit=couldExit;
			if(!_couldExit){
				TopTip.hideExitTip();
			}
		}
		
		private static var _exitQuite:Boolean=true;
		public static function setExitQuite($exitQuite:Boolean):void
		{
			_exitQuite=$exitQuite;
		}
		
		public static function init():void
		{
			NativeApplication.nativeApplication.addEventListener(KeyboardEvent.KEY_DOWN,handleKeyDown);
		}
		private static function handleKeyDown(evt:KeyboardEvent):void
		{		
			if(evt.keyCode == Keyboard.BACK)
			{
				if(_exitQuite)
				{
					
					NativeApplication.nativeApplication.exit();
				}
				else
				{
					evt.preventDefault();
					PlatformManager.log("handleKeyDown 47");
					if(PlatformManager.getInstance().supportPlatExit()){
						PlatformManager.log("handleKeyDown 49");
						PlatformManager.getInstance().platExit();
						return ;
					}
					//					showExitAlert();
//					showExitTip();
					if(_couldExit){
						PlatformManager.log("handleKeyDown 56");
						if(TopTip.hasShow){
							TopTip.excuteCancle();
						}else{
							TopTip.showExitTip(Util.getLanguage("退出提示"),Util.exitGame);
						}
						
					}
					
				}
			}
		}
	}
}