package Tool.platform
{
	import Tool.Inapp_appstore.ChongzhiTool;
	import Tool.platform.platBase.Platform_Appstore;
	
	import com.thor.utils.Locales;
	
	public class Platform_English_IOS extends Platform_Appstore
	{
		private static const ItemsXml:String="appstoreItems.xml";
		public function Platform_English_IOS()
		{
			super();
		}
		public override function get platCode():String{
			return "facebook";
		}
		protected override function initChongzhiTool():void
		{
			ChongzhiTool.setPayUrl(ChongzhiTool.App_cn_payUrlName);
			ChongzhiTool.setPayXmlNameStr(ItemsXml);
			ChongzhiTool.getInstance().init();
		}
		public override function get moneyType():String
		{
			return "$";
		}
		public override function get platName():String
		{
			return "ios_en";
		}
		public override function getPlatKefu1():String
		{
			return Locales.Get("help_info_ios_en_1");
		}
		
		public override function getPlatKefu2():String
		{
			return Locales.Get("help_info_ios_en_2");
		}
	}
}