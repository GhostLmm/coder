package appUpdate
{
//	import com.freshplanet.ane.AirAlert.AirAlert;
	
	import Tool.AndroidUpdate;
	import Tool.ApplicationInfoDesc;
	import Tool.platform.PlatformManager;

	public class AppUpdate_Andriod implements IAppUpdate
	{
		public function AppUpdate_Andriod()
		{
		}
		
		public function showUpdate():void
		{
			TopTip.showExitTip(AppUpdateControl.message,AppUpdateControl.gotoWebUrl,AppUpdateControl.exitGame);
			/*if(AppUpdateControl.autoAdroid){
				AndroidUpdate.showUpdate(AppUpdateControl.pageUrl,
					ApplicationInfoDesc.NativeInfo.appName+".apk",
					ApplicationInfoDesc.NativeInfo.appName,
					PlatformManager.getInstance().getOnlyPlatName()+" 已经下载",
					AppUpdateControl.curVersion,
					AppUpdateControl.maxVersion);
			}else{
				TopTip.showExitTip(AppUpdateControl.message,AppUpdateControl.gotoWebUrl,AppUpdateControl.exitGame);
//				AirAlert.getInstance().showAlert("更新",AppUpdateControl.message,"更新",AppUpdateControl.gotoWebUrl,"取消",AppUpdateControl.exitGame);
			}*/
		}
	}
}