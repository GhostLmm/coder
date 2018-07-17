package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.InputField;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BangJiesanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_quxiao:Button;
		public var _btn_chongzhi:Button;
		
		public var _fnt_pswd_old:InputField;
		public function BangJiesanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBangJiesan);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_quxiao=new Button(windowMaterial.btn_quxiao);
			_btn_chongzhi=new Button(windowMaterial.btn_chongzhi);
			
			_fnt_pswd_old=new InputField(windowMaterial.fnt_pswd_old);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_quxiao){_btn_quxiao.destory();_btn_quxiao=null;};
			if(_btn_chongzhi){_btn_chongzhi.destory();_btn_chongzhi=null;};
			
			if(_fnt_pswd_old){_fnt_pswd_old.destory();_fnt_pswd_old=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowBangJiesan 
		{
			return _scene as WindowBangJiesan; 
		}
	}
}
