package Tool.platform
{
	import Tool.Inapp_appstore.ChongzhiTool;
	import Tool.platform.platBase.Platform_Appstore;
	
	import com.thor.utils.Locales;
	
	public class Platform_JP_IOS extends Platform_Appstore
	{
		private static const ItemsXml:String="appstoreItems.xml";
		public function Platform_JP_IOS()
		{
			super();
		}
		protected override function initChongzhiTool():void
		{
			ChongzhiTool.setPayUrl(ChongzhiTool.App_cn_payUrlName);
			ChongzhiTool.setPayXmlNameStr(ItemsXml);
			ChongzhiTool.getInstance().init();
		}
		public override function get platName():String
		{
			return "ios_japan";
		}
		public override function getPlatKefu1():String
		{
			return Locales.Get("help_info_ios_japan_1");
		}
		
		public override function getPlatKefu2():String
		{
			return Locales.Get("help_info_ios_japan_2");
		}
	}
}