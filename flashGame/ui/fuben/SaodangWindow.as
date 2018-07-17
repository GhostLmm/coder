package ui.fuben
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	public class SaodangWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _pos_scroll_saodang:Position;
		public var _scr_saodang:ScrollControllerMax;
		public function SaodangWindow(params:Object=null)
		{
			super(params);
//			_scene=new (AssetManager.getAssetClass("WindowSaodang") as Class)();
			_scene=AssetManager.createMCForText(WindowSaodang); 
			this.addChild(_scene);
			var wm:flash.display.MovieClip=_scene; 
			_btn_close=new Button(wm.btn_close);
			_pos_scroll_saodang=new Position(wm.pos_scroll_saodang);
			_scr_saodang=new ScrollControllerMax(_pos_scroll_saodang);
		}
		
		public override function destory():void
		{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_pos_scroll_saodang) {_pos_scroll_saodang.destory();_pos_scroll_saodang=null;}
			if(_scr_saodang) {_scr_saodang.destory();_scr_saodang=null;}
			super.destory();
		}
	}
}
