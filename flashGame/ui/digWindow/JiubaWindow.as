package ui.digWindow
{
	
	import ui.widget.Button;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class JiubaWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public function JiubaWindow(params:Object=null)
		{
			super(params);
			_scene=new (AssetManager.getAssetClass("WindowJiuba") as Class)(); 
			_btn_close=new Button(_scene.btn_close);
		}
		
		public override function destory():void
		{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			super.destory();
		}
	}
}
