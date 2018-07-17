package ui.fuben
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class TiliGoumaiWindow extends _WindowBase
	{
		public var _fnt_cishu:FontField;
		public var _fnt_num_cash:FontField;
		public var _fnt_num_tili:FontField;
		public var _btn_quxiao:Button;
		public var _btn_goumai:Button;
		public var _fnt_ziranhuifu:FontField;
		
		public function TiliGoumaiWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowTili);
			
			var wm:WindowTili=_scene;
			_fnt_cishu=new FontField(wm.fnt_cishu);
			_fnt_num_cash=new FontField(wm.fnt_num_cash);
			_fnt_num_tili=new FontField(wm.fnt_num_tili);
			_btn_quxiao=new Button(wm.btn_quxiao);
			_btn_goumai=new Button(wm.btn_goumai);
			_fnt_ziranhuifu=new FontField(wm.fnt_ziranhuifu);
		}
		public override function destory():void{
			if(_fnt_cishu) {_fnt_cishu.destory(); _fnt_cishu=null;}
			if(_fnt_num_cash) {_fnt_num_cash.destory(); _fnt_num_cash=null;}
			if(_fnt_num_tili) {_fnt_num_tili.destory(); _fnt_num_tili=null;}
			if(_btn_quxiao) {_btn_quxiao.destory(); _btn_quxiao=null;}
			if(_btn_goumai) {_btn_goumai.destory(); _btn_goumai=null;}
			if(_fnt_ziranhuifu) {_fnt_ziranhuifu.destory(); _fnt_ziranhuifu=null;}
			super.destory();
		}
	}
}