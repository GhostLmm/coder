package ui.dig
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class DigRewardWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_time:FontField;
		public var _scn_money:NumFontScroll;
		public var _scn_exp:NumFontScroll;
		
		private var _pos_scroll_item:Position;
		
		public var _btn_queding:Button;
		public var _scr_reward:ScrollControllerMax;
		public function DigRewardWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowWakuangShouyi);
			
			var mc:WindowWakuangShouyi=_scene;
			_btn_close=new Button(mc.btn_close);
			_fnt_time=new FontField(mc.fnt_time);
			_scn_money=new NumFontScroll(mc.scn_money);
			_scn_exp=new NumFontScroll(mc.scn_exp);
			
			_pos_scroll_item=new Position(mc.pos_desc);
			_scr_reward=new ScrollControllerMax(_pos_scroll_item);
			_btn_queding=new Button(mc.btn_queding);
		}
		
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_fnt_time) {_fnt_time.destory(); _fnt_time=null;}
			if(_scn_money) {_scn_money.destory(); _scn_money=null;}
			if(_scn_exp) {_scn_exp.destory(); _scn_exp=null;}
			if(_pos_scroll_item) {_pos_scroll_item.destory(); _pos_scroll_item=null;}
			if(_scr_reward) {_scr_reward.destory(); _scr_reward=null;}
			if(_btn_queding) {_btn_queding.destory();_btn_queding=null;}
			super.destory();
		}
		
		
	}
}