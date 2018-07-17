package ui.vip
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontStatic;
	import ui.widget.PageControllerWithButton;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.widget.ProgressManagerMax;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class VipWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_viptitel:FontField;
//		public var _btn_left:Button;
//		public var _btn_right:Button;
		public var _pos_desc:Position;
//		public var _src_desc:ScrollControllerMax;
		
		public var _page_desc:PageControllerWithButton;
		
		public var _fnt_desc:FontField;
		public var _pos_vip:Position;
		public var _num_suipian:NumFontStatic;
		
		public var _prg_lv:ProgressManager;
		
		public var _btn_chongzhi:Button;
		
		public function VipWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowVip);
			
			var mc:WindowVip=_scene;
			_btn_close=new Button(mc.btn_close);
			_fnt_viptitel=new FontField(mc.fnt_viptitel);
//			_btn_left=new Button(mc.btn_left);
//			_btn_right=new Button(mc.btn_right);
			_pos_desc=new Position(mc.pos_desc);
//			_src_desc=new ScrollControllerMax(_pos_desc);
			_page_desc=new PageControllerWithButton(_pos_desc,mc.btn_left,mc.btn_right,ScrollControllerMax.HORIZONTAL);
			_fnt_desc=new FontField(mc.fnt_desc);
			_pos_vip=new Position(mc.pos_vip);
			
			_num_suipian=new NumFontStatic(mc.num_suipian);
			
			_prg_lv=new ProgressManager(mc.prg_baoshi,_num_suipian);
			_btn_chongzhi=new Button(mc.btn_chongzhi);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_fnt_viptitel) {_fnt_viptitel.destory(); _fnt_viptitel=null;}
			if(_pos_desc) {_pos_desc.destory(); _pos_desc=null;}
			if(_page_desc) {_page_desc.destory(); _page_desc=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			if(_pos_vip) {_pos_vip.destory(); _pos_vip=null;}
			if(_num_suipian) {_num_suipian.destory(); _num_suipian=null;}
			if(_prg_lv) {_prg_lv.destory(); _prg_lv=null;}
			if(_btn_chongzhi) {_btn_chongzhi.destory(); _btn_chongzhi=null;}
			super.destory();
		}
	}
}