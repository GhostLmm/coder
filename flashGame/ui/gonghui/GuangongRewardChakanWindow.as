package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class GuangongRewardChakanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _scrollController:ScrollController;
		public var _pos_itemreward:Position;
		
		public function GuangongRewardChakanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(window_guangongreward_chakan);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_pos_itemreward=new Position(windowMaterial.pos_itemreward);
			_scrollController=new ScrollController(_pos_itemreward);
			_pos_itemreward.removeChildren();
			_pos_itemreward.addChild(_scrollController);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_pos_itemreward){_pos_itemreward.destory();_pos_itemreward=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():window_guangongreward_chakan 
		{
			return _scene as window_guangongreward_chakan; 
		}
	}
}
