package ui.digWindow
{
	import ui.widget.Button;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class RenwuWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public function RenwuWindow(params:Object=null)
		{
			super(params);
			_scene=new (AssetManager.getAssetClass("WindowRenwu") as Class)(); 
			_btn_close=new Button(_scene.btn_close);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			super.destory();
		}
	}
}
