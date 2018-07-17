package appUpdate
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import Tool.ApplicationInfoDesc;
	
	import org.osflash.signals.Signal;
	
	import util.Util;

	public class AppUpdateControl
	{
		public function AppUpdateControl()
		{
		}
		
		public static var pageUrl:String;
//		public static var minVersion:String;
		public static var maxVersion:String;
		public static var forceUpdate:Boolean;
		
		public static var autoAdroid:Boolean;
		
		public static var message:String;
		public static var curVersion:String;
		
		public static var continue_SN:Signal=new Signal();
		
		public static function proccessUpdate(data:Object):void{
			curVersion=ApplicationInfoDesc.NativeInfo.versionStr;
			
//			// test
////			data={};
//			data.appurl="http://gdown.baidu.com/data/wisegame/ead3f6ae95a53c67/Calculator_6.apk";
//////			data.minVersion=data.minVersion;
//			data.appversion="3.0.0";
//			data.forceUpdate=1;
//			data.autoAdroid=1;
			
			
			
			pageUrl=data.appurl;
//			minVersion=data.minVersion;
			maxVersion=data.appversion;
			forceUpdate=(int(data.forceUpdate)>0);
			autoAdroid=(int(data.autoAdroid)>0);
			
			message=Util.stringFormat("检测到新版本：{0}\n请在wifi网络下下载安装。",maxVersion);
			
			
			
			var appupdate:IAppUpdate=createAppUpdate();
			
			if(pageUrl==null){
				trace("更新页面没有赋值，无需处理");
				contiueGame();
				return ;
			}
			
			//如果 游戏发现最新的版本
			if(forceUpdate && ApplicationInfoDesc.handleVersionId(curVersion)<ApplicationInfoDesc.handleVersionId(maxVersion)){
				appupdate.showUpdate();
			}else{
				contiueGame();
			}
			
			
		}
		
		public static function contiueGame():void{
			continue_SN.dispatch();
		}
		
		public static function exitGame():void{
			Util.exitGame(null,0);
		}
		public static function gotoWebUrl():void{
			navigateToURL(new URLRequest(pageUrl),"_blank");
			Util.exitGame(null,0.5);
		}
		
		private static function createAppUpdate():IAppUpdate{
			
			// ios
//			return new AppUpdate_IOS;
			
			// android
			return new AppUpdate_Andriod;
			
			// test
//			return new AppUpdate_Test;
			
			
		}
	}
}