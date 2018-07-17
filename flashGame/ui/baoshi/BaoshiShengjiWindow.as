package ui.baoshi
{

	
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontStatic;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
	public class BaoshiShengjiWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _pos_item:Position;
		public var _fnt_name:FontField;
		
		public var _fnt_desc:FontField;
		public var _fnt_shuxing1:FontField;
		public var _fnt_shuxing2:FontField;
		
		public var _mc_up2:MovieClip;
		public var _mc_up1:MovieClip;
		
		public var _fnt_desc_up:FontField;
		public var _fnt_shuxing1_up:FontField;
		public var _fnt_shuxing2_up:FontField;
		
		public var _pos_cailiao:Position;
		private var _num_suipian:NumFontStatic;
		public var _prg_suipian:ProgressManager;
		public var _btn_add:Button;
		public var _btn_shengji:Button;
		
		public function BaoshiShengjiWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBaoshiShengji);
			
			var mc:WindowBaoshiShengji=_scene;
			
			_btn_close=new Button(mc.btn_close);
			_pos_item=new Position(mc.pos_item);
			_fnt_name=new FontField(mc.fnt_name);
			
			_fnt_desc=new FontField(mc.fnt_desc);
			_fnt_shuxing1=new FontField(mc.fnt_shuxing1);
			_fnt_shuxing2=new FontField(mc.fnt_shuxing2);
			
			_fnt_desc_up=new FontField(mc.fnt_desc_up);
			_fnt_shuxing1_up=new FontField(mc.fnt_shuxing1_up);
			_fnt_shuxing2_up=new FontField(mc.fnt_shuxing2_up);
			
			_pos_cailiao=new Position(mc.pos_cailiao);
			_num_suipian=new NumFontStatic(mc.num_suipian);
			_prg_suipian=new ProgressManager(mc.prg_baoshi,_num_suipian);
			_btn_add=new Button(mc.btn_add);
			_btn_shengji=new Button(mc.btn_shengji);
			
			_mc_up1=mc.mc_up1;
			_mc_up2=mc.mc_up2;
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			if(_fnt_shuxing1) {_fnt_shuxing1.destory(); _fnt_shuxing1=null;}
			if(_fnt_shuxing2) {_fnt_shuxing2.destory(); _fnt_shuxing2=null;}
			if(_fnt_desc_up) {_fnt_desc_up.destory(); _fnt_desc_up=null;}
			if(_fnt_shuxing1_up) {_fnt_shuxing1_up.destory(); _fnt_shuxing1_up=null;}
			if(_fnt_shuxing2_up) {_fnt_shuxing2_up.destory(); _fnt_shuxing2_up=null;}
			if(_pos_cailiao) {_pos_cailiao.destory(); _pos_cailiao=null;}
			if(_num_suipian) {_num_suipian.destory(); _num_suipian=null;}
			if(_prg_suipian) {_prg_suipian.destory(); _prg_suipian=null;}
			if(_btn_add) {_btn_add.destory(); _btn_add=null;}
			if(_btn_shengji) {_btn_shengji.destory(); _btn_shengji=null;}
			_mc_up1=null;
			_mc_up2=null;
			super.destory();
		}
		
		
		
		
		
	}
}