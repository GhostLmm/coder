package Tool.platform
{
	
	import flash.desktop.NativeApplication;

	public class GameExitPlatform
	{
		private static var needSave:Boolean=false;
		public static function setNeedSave():void
		{
			needSave=true;
		}
		public static function exitGame():void
		{
			if(needSave)
			{
				BASE.Save();
			}
			NativeApplication.nativeApplication.exit();
		}
		
	}
}