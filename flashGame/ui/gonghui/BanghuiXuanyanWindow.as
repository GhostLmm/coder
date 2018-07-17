package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.InputField;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BanghuiXuanyanWindow extends _WindowBase
	{
		public static const MaxNum:int=50;
		public var _btn_close:Button;
		public var _btn_quxiao:Button;
		public var _btn_chongzhi:Button;
		
		public var _fnt_shuru_gonggao:InputField;
		
		public function BanghuiXuanyanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBanghuixuanyan);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_chongzhi=new Button(windowMaterial.btn_chongzhi);
			_btn_quxiao=new Button(windowMaterial.btn_quxiao);
			
			_fnt_shuru_gonggao=new InputField(windowMaterial.fnt_shuru_gonggao,MaxNum);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_chongzhi){_btn_chongzhi.destory();_btn_chongzhi=null;};
			if(_btn_quxiao){_btn_quxiao.destory();_btn_quxiao=null;};
			
			if(_fnt_shuru_gonggao){_fnt_shuru_gonggao.destory();_fnt_shuru_gonggao=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowBanghuixuanyan 
		{
			return _scene as WindowBanghuixuanyan; 
		}
	}
}
