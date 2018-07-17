package ui.window
{
import flash.display.MovieClip
	public class GongaoPreloadPage extends WebPage
	{
		public function GongaoPreloadPage()
		{
			super(false,true);
		}
		protected override function getMaterialClass():Class{
			return (AssetManager.getAssetClass("WindowGonggao") as Class); 
		}
		protected override function getPageUrl():String{
//			return UrlConfig.weihuUrl+"?"+getRandomPix();
//			return "http://www.baidu.com/";
			return UrlConfig.welcomeUrl+"?"+getRandomPix();
//			return "http://120.24.249.95:8080/pay/payAli/alipayindex.jsp?bill_no=1412771124867DUO";
		}
	}
}
