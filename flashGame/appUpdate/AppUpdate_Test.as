package appUpdate
{
	public class AppUpdate_Test implements IAppUpdate
	{
		public function AppUpdate_Test()
		{
		}
		
		public function showUpdate():void
		{
			TopTip.showExitTip(AppUpdateControl.message,AppUpdateControl.gotoWebUrl,AppUpdateControl.contiueGame);
		}
	}
}