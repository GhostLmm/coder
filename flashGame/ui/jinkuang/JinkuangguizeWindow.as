package ui.jinkuang
{
	import flash.text.TextField;
	
	import ui.widget.Button;
	import ui.window._WindowBase;
	
	public class JinkuangguizeWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_info:TextField;
		
		public function JinkuangguizeWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowJinkuangguize);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_fnt_info=windowMaterial.fnt_info;
		}
		private function destroyModule():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_fnt_info)_fnt_info=null;
		}
		public override function destory():void
		{
			destroyModule();
			super.destory();
		}
		private function get windowMaterial():WindowJinkuangguize
		{
			return _scene as WindowJinkuangguize;
		}
	}
}