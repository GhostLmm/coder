package ui.fuben
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class FubenPaihangRewardWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _mc_paiming1:MovieClip;
		public var _mc_paiming2:MovieClip;
		
		public var _fnt_fuben1:FontField;
		public var _fnt_fuben2:FontField;
		public var _fnt_mingci1:FontField;
		public var _fnt_mingci2:FontField;
		
		private var _pos_scroll_reward:Position;
		public var _scr_reward:ScrollControllerMax;
		
		public function FubenPaihangRewardWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowGuanmingReward);
			
			var mc:WindowGuanmingReward=_scene;
			
			_btn_close=new Button(mc.btn_close);
			_mc_paiming1=mc.mc_paiming1;
			_mc_paiming2=mc.mc_paiming2;
			
			_fnt_fuben1=new FontField(_mc_paiming1.fnt_fuben);
			_fnt_fuben2=new FontField(_mc_paiming2.fnt_fuben);
			_fnt_mingci1=new FontField(_mc_paiming1.fnt_mingci);
			_fnt_mingci2=new FontField(_mc_paiming2.fnt_mingci);
			
			_pos_scroll_reward=new Position(mc.pos_scroll_reward);
			_scr_reward=new ScrollControllerMax(_pos_scroll_reward);
			
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_fnt_fuben1) {_fnt_fuben1.destory(); _fnt_fuben1=null;}
			if(_fnt_fuben2) {_fnt_fuben2.destory(); _fnt_fuben2=null;}
			if(_fnt_mingci1) {_fnt_mingci1.destory(); _fnt_mingci1=null;}
			if(_fnt_mingci2) {_fnt_mingci2.destory(); _fnt_mingci2=null;}
			if(_pos_scroll_reward) {_pos_scroll_reward.destory(); _pos_scroll_reward=null;}
			if(_scr_reward) {_scr_reward.destory(); _scr_reward=null;}
			
			_mc_paiming1=null;
			_mc_paiming2=null;
			super.destory();
		}
	}
}