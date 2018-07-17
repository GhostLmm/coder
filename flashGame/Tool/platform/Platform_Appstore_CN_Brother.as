package Tool.platform
{
	import Tool.Inapp_appstore.ChongzhiTool;
	import Tool.platform.platBase.Platform_Appstore;
	
	/**   appstore 中文版 自己的发布
	 * */
	public class Platform_Appstore_CN_Brother extends Platform_Appstore
	{
		public function Platform_Appstore_CN_Brother()
		{
			super();
		}
		
		protected override function initChongzhiTool():void
		{
			ChongzhiTool.setPayUrl(ChongzhiTool.App_cn_payUrlName);
			ChongzhiTool.setPayXmlNameStr(ChongzhiTool.AppStore_ItemsXmlName);
			ChongzhiTool.getInstance().init();
		}
		
		public override function get ExtrFlagObj():Object
		{
			var obj:Object={};
			obj[PlatExtrFlag.HideLevelGiftVaule]=true;
			return obj;
		}
		
		public override function get platName():String
		{
			return "AppStore_cn_Brother";
		}
	}
}