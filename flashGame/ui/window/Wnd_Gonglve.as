package ui.window
{
import flash.display.MovieClip
	public class Wnd_Gonglve extends Wnd_WebPage
	{
		public function Wnd_Gonglve(params:Object=null)
		{
			super(params);
		}
		
		protected override function getPageUrl():String{
			return UrlConfig.gonglveUrl;
		}
		protected override function getMaterialClass():Class
		{
			return (AssetManager.getAssetClass("WindowGonglve") as Class); 
		}
	}
}
