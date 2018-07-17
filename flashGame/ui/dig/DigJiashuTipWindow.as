package ui.dig
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class DigJiashuTipWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_cishu:FontField;
		public var _fnt_time_desc:FontField;
		public var _fnt_num_cash:FontField;
		public var _btn_jiasu:Button;
		public function DigJiashuTipWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText(WindowWakuangJiasu);
			_btn_close=new Button(_scene.btn_close);
			_fnt_cishu=new FontField(_scene.fnt_cishu);
			_fnt_time_desc=new FontField(_scene.fnt_time_desc);
			_fnt_num_cash=new FontField(_scene.fnt_num_cash);
			_btn_jiasu=new Button(_scene.btn_jiasu);
			_btn_jiasu.name="btn_jiasu2";
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_fnt_cishu) {_fnt_cishu.destory();_fnt_cishu=null;}
			if(_fnt_time_desc) {_fnt_time_desc.destory();_fnt_time_desc=null;}
			if(_fnt_num_cash) {_fnt_num_cash.destory();_fnt_num_cash=null;}
			if(_btn_jiasu) {_btn_jiasu.destory();_btn_jiasu=null;}
			super.destory();
		}
	}
}