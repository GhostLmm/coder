package Tool.facebook
{
//	import Tool.Googlplay.FacebookPlat;

	public class FacebookAdapt
	{
		public static function getFacebookObj():Object{
			return new FacebookPlatMock();
			
			
			//正式facebook
//			return FacebookPlat.getInstance();
		}
	}
}