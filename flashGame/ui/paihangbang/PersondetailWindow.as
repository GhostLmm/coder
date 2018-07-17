package ui.paihangbang
{
	import ui.OtherHeroModule;
	import ui.widget.Button;
	import ui.window._WindowBase;
	
	public class PersondetailWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _otherHeroModule:OtherHeroModule;
		
		public function PersondetailWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowChakanRenwu);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_otherHeroModule=new OtherHeroModule(windowMaterial);
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_otherHeroModule){_otherHeroModule.destory();_otherHeroModule=null;};
		}
		private function get windowMaterial():WindowChakanRenwu
		{
			return _scene as WindowChakanRenwu;
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
	}
}