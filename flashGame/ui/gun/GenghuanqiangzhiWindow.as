package ui.gun
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class GenghuanqiangzhiWindow extends _WindowBase
	{
		public var _btn_close:Button;
		
		private var _pos_scroll:Position;
		public var _scr_gun:ScrollControllerMax;
//		public var _fnt_zhuqiang_num:FontField;
//		public var _fnt_fuqiang_num:FontField;
		
//		public var _btn_quxiao:Button;
//		public var _btn_queding:Button;
		
		public function GenghuanqiangzhiWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowGenghuanqiangzhi);
			
			var mc:WindowGenghuanqiangzhi=_scene;
			_btn_close=new Button(mc.btn_close);
			_pos_scroll=new Position(mc.pos_scroll);
			_scr_gun=new ScrollControllerMax(_pos_scroll);
//			_fnt_zhuqiang_num=new FontField(mc.fnt_zhuqiang_num);
//			_fnt_fuqiang_num=new FontField(mc.fnt_fuqiang_num);
//			_btn_queding=new Button(mc.btn_queding);
//			_btn_quxiao=new Button(mc.btn_quxiao);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_pos_scroll) {_pos_scroll.destory(); _pos_scroll=null;}
			if(_scr_gun) {_scr_gun.destory(); _scr_gun=null;}
//			if(_fnt_zhuqiang_num) {_fnt_zhuqiang_num.destory(); _fnt_zhuqiang_num=null;}
//			if(_fnt_fuqiang_num) {_fnt_fuqiang_num.destory(); _fnt_fuqiang_num=null;}
//			if(_btn_queding) {_btn_queding.destory(); _btn_queding=null;}
//			if(_btn_quxiao) {_btn_quxiao.destory(); _btn_quxiao=null;}
			super.destory();
		}
	}
}