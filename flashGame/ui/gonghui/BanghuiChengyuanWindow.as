package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BanghuiChengyuanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_liebiao:Button;
		public var _btn_chuangjian:Button;
		
		public var _pos_gonghuichengyuan:Position;
		
		public function BanghuiChengyuanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBanghuiChengyuan);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_liebiao=new Button(windowMaterial.btn_liebiao);
			_btn_chuangjian=new Button(windowMaterial.btn_chuangjian);
			
			_pos_gonghuichengyuan=new Position(windowMaterial.pos_gonghuichengyuan);
			
			windowMaterial.btn_chuangjian.mc_tishi.visible=false;
			windowMaterial.btn_liebiao.mc_tishi.visible=false;
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_liebiao){_btn_liebiao.destory();_btn_liebiao=null;};
			if(_btn_chuangjian){_btn_chuangjian.destory();_btn_chuangjian=null;};
			
			if(_pos_gonghuichengyuan){_pos_gonghuichengyuan.destory();_pos_gonghuichengyuan=null;};
		}
		private function get windowMaterial():WindowBanghuiChengyuan 
		{
			return _scene as WindowBanghuiChengyuan; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
	}
}
