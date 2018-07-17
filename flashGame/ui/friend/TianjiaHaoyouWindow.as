package ui.friend
{
	import ui.widget.Button;
	import ui.widget.InputField;
	import ui.window._WindowBase;
	
	
	public class TianjiaHaoyouWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_queding:Button;
		public var _btn_quxiao:Button;
		public var _fnt_shuru_name:InputField;
		public var _btn_suiji:Button;
		
		public function TianjiaHaoyouWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowTianjiahaoyou);
			_btn_close = new Button(_scene.btn_close);
			_btn_queding = new Button(_scene.btn_queding);
			_btn_quxiao = new Button(_scene.btn_quxiao);
			_fnt_shuru_name = new InputField(_scene.fnt_shuru_name);
			_btn_suiji=new Button(_scene.btn_suiji);
		}
		
		public override function destory():void
		{
			if(_btn_close) {_btn_close.destory(); _btn_close=null};
			if(_btn_queding) {_btn_queding.destory(); _btn_queding=null};
			if(_btn_quxiao) {_btn_quxiao.destory(); _btn_quxiao=null};
			if(_fnt_shuru_name) {_fnt_shuru_name.destory(); _fnt_shuru_name=null};
			if(_btn_suiji) {_btn_suiji.destory();_btn_suiji=null;}
			super.destory();
		}
	}
}
