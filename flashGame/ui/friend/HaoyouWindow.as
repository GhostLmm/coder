package ui.friend
{
	import flash.display.MovieClip;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class HaoyouWindow extends _WindowBase
	{
		public var _mc_haoyou:MovieClip
		public var _btn_close:Button;
		public var _btn_tianjiahaoyou:Button;
		public var _fnt_haoyou:FontField;
		public var _pos_scroll_v_haoyou:Position;
		public var _prg_haoyou:ProgressManager;
		public var _scrollController:ScrollController;
		public function HaoyouWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowHaoyou);
			_btn_close = new Button(_scene.btn_close);
			_btn_tianjiahaoyou = new Button(_scene.btn_tianjiahaoyou);
			_fnt_haoyou = new FontField(_scene.fnt_haoyou);
			_pos_scroll_v_haoyou = new Position(_scene.pos_scroll_v_haoyou);
			_scrollController = new ScrollController(_pos_scroll_v_haoyou);
			_pos_scroll_v_haoyou.addChild(_scrollController);
			_prg_haoyou = new ProgressManager(_scene.prg,_fnt_haoyou,ProgressManager.LIMIT);
			_mc_haoyou=_scene.mc_haoyou as MovieClip;
		}
		
		public override function destory():void
		{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_btn_tianjiahaoyou) {_btn_tianjiahaoyou.destory(); _btn_tianjiahaoyou=null;}
			if(_fnt_haoyou) {_fnt_haoyou.destory(); _fnt_haoyou=null;}
			if(_pos_scroll_v_haoyou) {_pos_scroll_v_haoyou.destory(); _pos_scroll_v_haoyou=null;}
			if(_prg_haoyou) {_prg_haoyou.destory(); _prg_haoyou=null;}
			if(_scrollController) {_scrollController.destory(); _scrollController=null;}
			
			_mc_haoyou=null;
			super.destory();
		}
	}
}
