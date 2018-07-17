package ui.gonghui
{
	import ui.widget.Button;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BanghuiGuanliWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_xuanyan:Button;
		public var _btn_mima:Button;
		public var _btn_shenhe:Button;
		public var _btn_jiesan:Button;
		public var _btn_tuichu:Button;
		
		public function BanghuiGuanliWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBanghuiGuanli);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_xuanyan=new Button(windowMaterial.btn_xuanyan);
			_btn_mima=new Button(windowMaterial.btn_mima);
			_btn_shenhe=new Button(windowMaterial.btn_shenhe);
			_btn_jiesan=new Button(windowMaterial.btn_jiesan);
			_btn_tuichu=new Button(windowMaterial.btn_tuichu);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_xuanyan){_btn_xuanyan.destory();_btn_xuanyan=null;};
			if(_btn_mima){_btn_mima.destory();_btn_mima=null;};
			if(_btn_shenhe){_btn_shenhe.destory();_btn_shenhe=null;};
			if(_btn_jiesan){_btn_jiesan.destory();_btn_jiesan=null;};
			if(_btn_tuichu){_btn_tuichu.destory();_btn_tuichu=null;};
		}
		private function get windowMaterial():WindowBanghuiGuanli 
		{
			return _scene as WindowBanghuiGuanli; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
	}
}
