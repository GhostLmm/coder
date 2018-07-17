package ui.window.huodong
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	public class HuodongNewWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _pos_huodong:Position;
		
		public var _pos_scroll_v_touxiang:Position;
		public var _touxiangController:ScrollControllerMax;
		
		public function HuodongNewWindow(params:Object=null)
		{
			//TODO: implement function
			super(params);
			_scene=AssetManager.createMCForText(WindowHuodongNew);; 
			initModule();
		}
		private function initModule():void
		{
			var windowMaterial:flash.display.MovieClip=_scene; 
			_btn_close=new Button(windowMaterial.btn_close);
			_pos_huodong=new Position(windowMaterial.pos_huodong);
			
			_pos_scroll_v_touxiang=new Position(windowMaterial.pos_scroll_v_touxiang);
			_touxiangController=new ScrollControllerMax(_pos_scroll_v_touxiang,ScrollController.VERTICAL);
		}
		
		public override function destory():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_pos_huodong){_pos_huodong.destory();_pos_huodong=null;};
			
			if(_pos_scroll_v_touxiang) {_pos_scroll_v_touxiang.destory();_pos_scroll_v_touxiang=null;}
			if(_touxiangController) {_touxiangController.destory();_touxiangController=null;}
			super.destory();
		}
		
		
		
	}
}
