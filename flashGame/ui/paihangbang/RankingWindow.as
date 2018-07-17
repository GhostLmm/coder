package ui.paihangbang
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.window._WindowBase;
	
	public class RankingWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_dengjibang:Button;
		public var _btn_lianshengbang:Button;
		public var _btn_tuhaobang:Button;
		public var _btn_xiongbabang:Button;
		public var _fnt_cishu:FontField;
		public var _prg_cishu:ProgressManager;
		public var _pos_scene_paihangbang:Position;
		public var _fnt_desc:FontField;
		
		public function RankingWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowPaihangbang);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_dengjibang=new Button(windowMaterial.btn_tag3);
			_btn_lianshengbang=new Button(windowMaterial.btn_tag2);
			_btn_tuhaobang=new Button(windowMaterial.btn_tag4);
			_btn_xiongbabang=new Button(windowMaterial.btn_tag1);
			
			_fnt_cishu=new FontField(windowMaterial.fnt_cishu);
			_prg_cishu=new ProgressManager(null,_fnt_cishu);
			_fnt_desc=new FontField(windowMaterial.fnt_desc);
			
			_pos_scene_paihangbang=new Position(windowMaterial.pos_scene_paihangbang);
		}
		public override function destory():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_dengjibang){_btn_dengjibang.destory();_btn_dengjibang=null;};
			if(_btn_lianshengbang){_btn_lianshengbang.destory();_btn_lianshengbang=null;};
			if(_btn_tuhaobang){_btn_tuhaobang.destory();_btn_tuhaobang=null;};
			if(_btn_xiongbabang){_btn_xiongbabang.destory();_btn_xiongbabang=null;};
			
			if(_fnt_cishu){_fnt_cishu.destory();_fnt_cishu=null;};
			if(_prg_cishu){_prg_cishu.destory();_prg_cishu=null;};
			if(_fnt_desc){_fnt_desc.destory();_fnt_desc=null;};
			
			if(_pos_scene_paihangbang){_pos_scene_paihangbang.destory();_pos_scene_paihangbang=null;};
			super.destory();
		}
		private function get windowMaterial():WindowPaihangbang		{
			return _scene as WindowPaihangbang;		}
	}
}
