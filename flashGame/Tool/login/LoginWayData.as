package Tool.login
{
	import Tool.platform.PlatformManager;

	public class LoginWayData
	{
		public var openId:String="";
		public var token:String="";
		public var mac:String="";
		public var platName:String;
		public var extraObj:Object={};
		
		public function LoginWayData()
		{
			platName=PlatformManager.getInstance().getLoginPlatName();
		}
	}
}