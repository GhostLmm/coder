package Tool.platform.meijiPlat
{
	import ane.ljsdk.XMUser;
	import ane.ljsdk.XMUserListener;
	
	public class MyUserListener implements XMUserListener
	{
		public function MyUserListener()
		{
		}
		
		public function onLoginSuccess(user:XMUser):void
		{
//			user.
		}
		
		public function onLoginFailed(reason:String):void
		{
		}
		
		public function onLogout():void
		{
		}
	}
}