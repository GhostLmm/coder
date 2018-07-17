package ui.window
{
import flash.display.MovieClip
	public class TingfuPage extends WebPage
	{
		public function TingfuPage()
		{
			super(false);
		}
		
		protected override function getMaterialClass():Class{
			return (AssetManager.getAssetClass("WindowGonggao") as Class); 
		}
		protected override function getPageUrl():String{
			return UrlConfig.weihuUrl+"?"+getRandomPix();
		}
		
		public override function destory():void{
			_instance=null;
			super.destory();
		}
		
		public static var _instance:TingfuPage;
		public static function getInstance():TingfuPage{
			if(_instance==null){
				_instance=new TingfuPage();
			}
			return _instance;
		}
	}
}
