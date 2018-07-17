package ui.choujiang
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class ChoujiangfenjieWindow extends _WindowBase
	{
		public var _fnt_desc:FontField;
		public var _pos_1:Position;
		public var _pos_2:Position;
		public var _mc_anmi:MovieClip;
		public var _btn_queding:Button;
		
		public function ChoujiangfenjieWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowChoujiangZhuanhuan);
			initModule();
		}
		private function initModule():void
		{
			_fnt_desc=new FontField(windowMaterial.fnt_desc);
			_pos_1=new Position(windowMaterial.pos_1);
			_pos_2=new Position(windowMaterial.pos_2);
			_mc_anmi=windowMaterial.mc_anmi;
			_btn_queding=new Button(windowMaterial.btn_queding);
		}
		private function destroyMc():void
		{
			if(_fnt_desc){_fnt_desc.destory();_fnt_desc=null;};
			if(_pos_1){_pos_1.destory();_pos_1=null;};
			if(_pos_2){_pos_2.destory();_pos_2=null;};
			_mc_anmi=null;
			if(_btn_queding){_btn_queding.destory();_btn_queding=null;};
		}
		private function get windowMaterial():WindowChoujiangZhuanhuan
		{
			return _scene as WindowChoujiangZhuanhuan;
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
	}
}