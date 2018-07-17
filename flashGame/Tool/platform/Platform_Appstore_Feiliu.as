package Tool.platform
{
	import Tool.Inapp_appstore.ChongzhiTool;
	import Tool.platform.platBase.Platform_Appstore;
	
	public class Platform_Appstore_Feiliu extends Platform_Appstore
	{
		public function Platform_Appstore_Feiliu()
		{
			super();
		}
		
		protected override function initChongzhiTool():void
		{
			ChongzhiTool.setPayUrl(ChongzhiTool.Feiliu_cn_payUrlName);
			ChongzhiTool.setPayXmlNameStr(ChongzhiTool.feiliuItemXmlUrl);
			ChongzhiTool.getInstance().init();
		}
		
		public override function get ExtrFlagObj():Object
		{
			var obj:Object={};
			obj[PlatExtrFlag.DontShowQiehuan]=true;
			obj[PlatExtrFlag.SendWifiMac]=true;
			return obj;
		}
		public override function get platName():String
		{
			return "feiliu_cn";
		}
	}
}