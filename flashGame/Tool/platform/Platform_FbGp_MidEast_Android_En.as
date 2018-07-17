package Tool.platform
{
	import Tool.Googlplay.FacebookPlat;
	import Tool.Googlplay.GoogPlayContest;
	import Tool.platform.platBase.Platform_FBGoogleplay;
	
	import com.thor.utils.Locales;
	
	import flash.net.SharedObject;
	
	public class Platform_FbGp_MidEast_Android_En extends Platform_FBGoogleplay
	{
//		private var activeFlag:Boolean=false;
		public function Platform_FbGp_MidEast_Android_En()
		{
 			super();
		}
//		protected override function faceBookLoginFail():void
//		{
//			var typeSo:SharedObject=SharedObject.getLocal(GMainLoader.loginTypePath);
//			typeSo.data.type="local";
//			typeSo.flush();
//			typeSo.close();
//			super.faceBookLoginFail();
//		}
//		protected override function faceBookLoginCom(data:Object):void
//		{
//			super.faceBookLoginCom(data);
//			activeFlag=true;
//		}
		
		protected override function initFBGP():void
		{
			FacebookPlat.getInstance().setAppId(FacebookPlat.FaceBookID_EN_FbGp_MEAndroid);
			FacebookPlat.getInstance().init();
			ShareLinkUrl="";
			itemXmlUrl="ME_FbGp_En_Items.xml";
			GoogPlayContest.initGooglay(GoogPlayContest.PKey_FbGp_MidEast_En,GoogPlayContest.BackUrl_Facebook_En);
		}
		
//		public override function get suportSocialInfo():Boolean
//		{
//			return activeFlag;
//		}
		
		public override function get ExtrFlagObj():Object
		{
			var flag:Object={};
			flag[PlatExtrFlag.HasKuaisuDenglu]=true;
			return flag;
		}

	}
}