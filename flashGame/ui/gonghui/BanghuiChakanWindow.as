package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BanghuiChakanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_queding:Button;
		
		public var _fnt_BanghuiName:FontField;
		public var _fnt_banghuixuanyan_value:FontField;
		public var _fnt_bangzhu:FontField;
		public var _fnt_banghuidengji:FontField;
		public var _fnt_bangpairenshu:FontField;
		public var _fnt_chuangjiantime:FontField;
		public var _prg:ProgressManager;
		
		public var _pos_banghui_icon:Position;
		
		public function BanghuiChakanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBanghuiShenqing);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_queding=new Button(windowMaterial.btn_queding);
			
			_fnt_BanghuiName=new FontField(windowMaterial.fnt_BanghuiName);
			_fnt_banghuixuanyan_value=new FontField(windowMaterial.fnt_banghuixuanyan_value);
			_fnt_bangzhu=new FontField(windowMaterial.fnt_bangzhu);
			_fnt_banghuidengji=new FontField(windowMaterial.fnt_banghuidengji);
			_fnt_bangpairenshu=new FontField(windowMaterial.fnt_bangpairenshu);
			_fnt_chuangjiantime=new FontField(windowMaterial.fnt_chuangjiantime);
			_prg=new ProgressManager(null,_fnt_bangpairenshu);
			
			_pos_banghui_icon=new Position(windowMaterial.pos_banghui_icon);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_queding){_btn_queding.destory();_btn_queding=null;};
			
			if(_fnt_BanghuiName){_fnt_BanghuiName.destory();_fnt_BanghuiName=null;};
			if(_fnt_banghuixuanyan_value){_fnt_banghuixuanyan_value.destory();_fnt_banghuixuanyan_value=null;};			
			if(_fnt_bangzhu){_fnt_bangzhu.destory();_fnt_bangzhu=null;};
			if(_fnt_banghuidengji){_fnt_banghuidengji.destory();_fnt_banghuidengji=null;};
			if(_fnt_bangpairenshu){_fnt_bangpairenshu.destory();_fnt_bangpairenshu=null;};
			if(_fnt_chuangjiantime){_fnt_chuangjiantime.destory();_fnt_chuangjiantime=null;};
			if(_prg){_prg.destory();_prg=null;};
			
			if(_pos_banghui_icon){_pos_banghui_icon.destory();_pos_banghui_icon=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowBanghuiShenqing 
		{
			return _scene as  WindowBanghuiShenqing; 
		}
	}
}
