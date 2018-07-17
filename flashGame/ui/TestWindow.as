package ui
{
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.window._WindowBase;
	
	import util.Util;
	
	public class TestWindow extends _WindowBase
	{
		private var _btn_close:Button;
		private var _btn_queding:Button;
		public function TestWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText( params.cls);
			
			if(_scene.btn_close){
				_btn_close=new Button(_scene.btn_close);
				_btn_close.addEventListener(TqtEvent.BUTTON_CLICK,close);
			}
			
			
			if(_scene.btn_queding){
				_btn_queding=new Button(_scene.btn_queding);
				_btn_queding.addEventListener(TqtEvent.BUTTON_CLICK,close);
			}
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			super.destory();
		}
	}
}