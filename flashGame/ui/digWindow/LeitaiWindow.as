package ui.digWindow
{
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class LeitaiWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public function LeitaiWindow(params:Object=null)
		{
			super(params);
			_scene=new (AssetManager.getAssetClass("WindowLeitai") as Class)(); 
			_btn_close=new Button(_scene.btn_close);
			
			_btn_close.addEventListener(TqtEvent.BUTTON_CLICK,close);
		}
	}
}
