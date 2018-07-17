package ui.leitai
{	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
	
	public class LeitaiRewardWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_paiming:FontField;
		public var _pos_scroll_v_leitai:Position;
		public var _scrollController:ScrollController;

		public function LeitaiRewardWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowLeitai);
			_btn_close = new Button(windowMaterial.btn_close);
			_fnt_paiming = new FontField(windowMaterial.fnt_paiming);

			_pos_scroll_v_leitai = new Position(windowMaterial.pos_scroll_v_leitai);
			_scrollController = new ScrollController(_pos_scroll_v_leitai);
			_pos_scroll_v_leitai.addChild(_scrollController);
		}
		public override function destory():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_fnt_paiming){_fnt_paiming.destory();_fnt_paiming=null;};
			if(_pos_scroll_v_leitai){_pos_scroll_v_leitai.destory();_pos_scroll_v_leitai=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			super.destory();
		}
		private function get windowMaterial():WindowLeitai
		{
			return _scene as WindowLeitai;
		}
	}
}
