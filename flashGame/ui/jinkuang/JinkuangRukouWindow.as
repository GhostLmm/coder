package ui.jinkuang
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
	public class JinkuangRukouWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _pos_scroll_h_rukou:Position;
		public var _scrollController:ScrollController;
		public var _fnt_paiming:FontField;
		public var _btn_chakanguize:Button;
		
		public function JinkuangRukouWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowJinkuangRukou);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_pos_scroll_h_rukou=new Position(windowMaterial.pos_scroll_h_rukou);
			_scrollController=new ScrollController(_pos_scroll_h_rukou,ScrollController.HORIZONTAL);
			_pos_scroll_h_rukou.removeChildren();
			_pos_scroll_h_rukou.addChild(_scrollController);
			_fnt_paiming=new FontField(windowMaterial.fnt_paiming);
			_btn_chakanguize=new Button(windowMaterial.btn_chakanguize);
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_pos_scroll_h_rukou){_pos_scroll_h_rukou.destory();_pos_scroll_h_rukou=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			if(_fnt_paiming){_fnt_paiming.destory();_fnt_paiming=null;};
			if(_btn_chakanguize){_btn_chakanguize.destory();_btn_chakanguize=null;};
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():WindowJinkuangRukou 
		{
			return _scene as WindowJinkuangRukou; 
		}
	}
}
