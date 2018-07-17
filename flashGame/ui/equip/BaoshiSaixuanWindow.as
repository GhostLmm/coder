package ui.equip
{
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class BaoshiSaixuanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		private var _pos_scroll_baoshi:Position;
		public var _scr_baoshi:ScrollControllerMax;
		public function BaoshiSaixuanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBaoshishaixuan);
			
			var mc:WindowBaoshishaixuan=_scene;
			
			_btn_close=new Button(mc.btn_close);
			
			_pos_scroll_baoshi=new Position(mc.pos_scroll_baoshi)
			_scr_baoshi=new ScrollControllerMax(_pos_scroll_baoshi,ScrollControllerMax.HORIZONTAL);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory();_btn_close=null;};
			if(_pos_scroll_baoshi) {_pos_scroll_baoshi.destory();_pos_scroll_baoshi=null;};
			if(_scr_baoshi) {_scr_baoshi.destory();_scr_baoshi=null;};
			super.destory();
		}
	}
}