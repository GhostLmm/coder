package appUpdate
{
//	import com.freshplanet.ane.AirAlert.AirAlert;

	public class AppUpdate_IOS implements IAppUpdate
	{
		public function AppUpdate_IOS()
		{
		}
		
		public function showUpdate():void
		{
			TopTip.showExitTip(AppUpdateControl.message,AppUpdateControl.gotoWebUrl,AppUpdateControl.exitGame);
//			AirAlert.getInstance().showAlert("更新",AppUpdateControl.message,"更新",AppUpdateControl.gotoWebUrl,"取消",AppUpdateControl.exitGame);
		}
	}
}