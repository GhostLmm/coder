package ui.battle
{
	import ui.widget.Button;
	import ui.window._WindowBase;
	
	public class ExitbattleWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_quxiao:Button;
		public var _btn_queding:Button;
		
		public function ExitbattleWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowFightTuichu);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_queding=new Button(windowMaterial.btn_queding);
			_btn_quxiao=new Button(windowMaterial.btn_quxiao);
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_queding){_btn_queding.destory();_btn_queding=null;};
			if(_btn_quxiao){_btn_quxiao.destory();_btn_quxiao=null;};
		}
		private function get windowMaterial():WindowFightTuichu
		{
			return _scene as  WindowFightTuichu;
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
	}
}