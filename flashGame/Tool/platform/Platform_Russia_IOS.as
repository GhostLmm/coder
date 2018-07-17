package Tool.platform
{
	import Tool.Inapp_appstore.ChongzhiTool;
	import Tool.platform.platBase.Platform_Appstore;
	
	import com.thor.utils.Locales;
	
	public class Platform_Russia_IOS extends Platform_Appstore
	{
		private static const ItemsXml:String="appstoreItems.xml";
		public function Platform_Russia_IOS()
		{
			super();
		}		
		protected override function initChongzhiTool():void
		{
			ChongzhiTool.setPayUrl(ChongzhiTool.App_cn_payUrlName);
			ChongzhiTool.setPayXmlNameStr(ItemsXml);
			ChongzhiTool.getInstance().init();
		}
		
		public override function get ExtrFlagObj():Object{

			return null;
		}
		
		public override function get moneyType():String
		{
			return "Руб";
		}
		public override function get platName():String
		{
			return "ios_Russia";
		}
		public override function getPlatKefu1():String
		{
			return Locales.Get("help_info_ios_Russia_1");
		}
		
		public override function getPlatKefu2():String
		{
			return Locales.Get("help_info_ios_Russia_2");
		}
	}
}