package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class GuangongRewardHuodeWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_sure:Button;
		
		public var _fnt_tili:FontField;
		
		public var _pos_item1:Position;
		public var _pos_item2:Position;
		
		public function GuangongRewardHuodeWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(window_guangongreward_huode);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_sure=new Button(windowMaterial.btn_sure);
			
			_fnt_tili=new FontField(windowMaterial.fnt_tili);
			
			_pos_item1=new Position(windowMaterial.pos_item1);
			_pos_item2=new Position(windowMaterial.pos_item2);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_sure){_btn_sure.destory();_btn_sure=null;};
			
			if(_fnt_tili){_fnt_tili.destory();_fnt_tili=null;};
			
			if(_pos_item1){_pos_item1.destory();_pos_item1=null;};
			if(_pos_item2){_pos_item2.destory();_pos_item2=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():window_guangongreward_huode 
		{
			return _scene as window_guangongreward_huode; 
		}
	}
}
