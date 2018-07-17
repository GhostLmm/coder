package ui.jinkuang
{
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
	public class JinkuangLogWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _pos_scroll_v:Position;
		public var _scrollController:ScrollController;
		
		public function JinkuangLogWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowJinkuangLog);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_pos_scroll_v=new Position(windowMaterial.pos_scroll_v);
			_scrollController=new ScrollController(_pos_scroll_v);
			_pos_scroll_v.removeChildren();
			_pos_scroll_v.addChild(_scrollController);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_pos_scroll_v){_pos_scroll_v.destory();_pos_scroll_v=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowJinkuangLog 
		{
			return _scene as WindowJinkuangLog; 
		}
	}
}
