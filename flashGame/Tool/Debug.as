package Tool
{
	import com.thor.utils.Locales;
	
	import flash.display.DisplayObjectContainer;
	
	//import flash.desktop.NativeApplication;

	public class Debug
	{
		private static const IS_DEBUG:Boolean = true;
		
		public static function assert(condition:*, errMsg:String):void{
			if(!Boolean(condition)){
				if(IS_DEBUG){
					POPUPS.DisplayCCbot(Locales.Get("zz_error_title"), Locales.Get("zz_error_para", {v1:errMsg}), Locales.Get("btn_ok"), function():void{
						POPUPS.Next();
						//NativeApplication.nativeApplication.exit(1);
					}, false);
				}
			}
		}
		
		public static function assertAsset(assetReference:*, assetName:String):void{
			var errMsg:String = "元件" + assetName + "丢失,请联系美术解决";
			Debug.assert(assetReference, errMsg);
		}
		
		public static function error(errMsg:String):void{
			logInner("debug_error", errMsg);
		}
		
		public static function warning(errMsg:String):void{
			logInner("debug_warning", errMsg);
		}
		
		public static function log(errMsg:String):void{
			logInner("debug_info", errMsg);
		}
		
		private static function logInner(errType:String, errMsg:String):void{
			if(!IS_DEBUG) return ;
			
			if(errMsg == null){
				trace(errType);
			}else{
				trace(errType, ":" , errMsg);
			}
		}
	}
}