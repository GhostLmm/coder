package Tool.platform
{
	import Tool.Inapp_appstore.ChongzhiTool;
	import Tool.platform.platBase.Platform_Appstore;
	
	import com.thor.utils.Locales;
	
	/**   台湾 ios
	 * */
	public class Platform_Taiwan_IOS extends Platform_Appstore
	{
		private static const TaiwanItemsXml:String="appstoreItems.xml";
		public function Platform_Taiwan_IOS()
		{
			super();
		}
		
		protected override function initChongzhiTool():void
		{
			ChongzhiTool.setPayUrl(ChongzhiTool.App_cn_payUrlName);
			ChongzhiTool.setPayXmlNameStr(TaiwanItemsXml);
			ChongzhiTool.getInstance().init();
		}
		public override function get platName():String
		{
			return "ios_taiwan";
		}
		
		public override function getPlatKefu1():String
		{
			return Locales.Get("help_info_ios_taiwan_1");
		}
		
		public override function getPlatKefu2():String
		{
			return Locales.Get("help_info_ios_taiwan_2");
		}
		public override function get moneyType():String
		{
			return "NT$"
		}
	}
}