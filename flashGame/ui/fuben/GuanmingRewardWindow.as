package ui.fuben
{
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class GuanmingRewardWindow extends _WindowBase
	{
		private var _pos_scroll_reward:Position;
		public var _scr_reward:ScrollControllerMax;
		public var _btn_lingqu:ButtonMax;
		public var _btn_close:Button;
		public var _fnt_paiming:FontField;
		public function GuanmingRewardWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowGuanjunReward);
			
			var mc:WindowGuanjunReward=_scene;
			_pos_scroll_reward=new Position(mc.pos_scroll_reward);
			_scr_reward=new ScrollControllerMax(_pos_scroll_reward,ScrollControllerMax.HORIZONTAL);
			_btn_lingqu=new ButtonMax(mc.btn_lingqu);
			_btn_close=new Button(mc.btn_close);
			_fnt_paiming=new FontField(mc.fnt_paiming);
		}
		public override function destory():void{
			if(_pos_scroll_reward) {_pos_scroll_reward.destory();_pos_scroll_reward=null;}
			if(_scr_reward) {_scr_reward.destory();_scr_reward=null;}
			if(_btn_lingqu) {_btn_lingqu.destory();_btn_lingqu=null;}
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_fnt_paiming) {_fnt_paiming.destory();_fnt_paiming=null;}
			super.destory();
		}
	}
}