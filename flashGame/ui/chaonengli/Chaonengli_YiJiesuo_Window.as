package ui.chaonengli
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class Chaonengli_YiJiesuo_Window extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_queding:Button;
		
		public var _fnt_nengli_name:FontField;
		public var _fnt_add_nengli:FontField;
		public var _fnt_nengli_desc:FontField;
		
		public var _pos_skill:Position;
		
		public function Chaonengli_YiJiesuo_Window(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(wnd_nengli_jiesuo);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_queding=new Button(windowMaterial.btn_queding);
			
			_fnt_nengli_name=new FontField(windowMaterial.fnt_nengli_name);
			_fnt_add_nengli=new FontField(windowMaterial.fnt_add_nengli);
			_fnt_nengli_desc=new FontField(windowMaterial.fnt_nengli_desc);
			
			_pos_skill=new Position(windowMaterial.pos_skill);
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_queding){_btn_queding.destory();_btn_queding=null;};
			
			if(_fnt_nengli_name){_fnt_nengli_name.destory();_fnt_nengli_name=null;};
			if(_fnt_add_nengli){_fnt_add_nengli.destory();_fnt_add_nengli=null;};
			if(_fnt_nengli_desc){_fnt_nengli_desc.destory();_fnt_nengli_desc=null;};
			
			if(_pos_skill){_pos_skill.destory();_pos_skill=null;};
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():wnd_nengli_jiesuo
		{
			return _scene as wnd_nengli_jiesuo;
		}
	}
}