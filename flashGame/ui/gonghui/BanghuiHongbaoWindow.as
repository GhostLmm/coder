package ui.gonghui
{
	import flash.text.TextField;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BanghuiHongbaoWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btnchongzhi:Button;
		
		public var _fnt_percent:FontField;
		
		public var _pos_item_lingqu:Position;
		public var _scroller:ScrollController;
		
		public var _fnt_chongzhijilu:TextField;
		public var _fnt_lingqujilu:TextField;
		
		public function BanghuiHongbaoWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBanghuiHongbao);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btnchongzhi=new Button(windowMaterial.btnchongzhi);
			
			_fnt_percent=new FontField(windowMaterial.fnt_percent);
			_fnt_chongzhijilu=windowMaterial.fnt_chongzhijilu;
			_fnt_lingqujilu=windowMaterial.fnt_lingqujilu;
			
			_pos_item_lingqu=new Position(windowMaterial.pos_item_lingqu);
			_scroller=new ScrollController(_pos_item_lingqu);
			_pos_item_lingqu.removeChildren();
			_pos_item_lingqu.addChild(_scroller);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btnchongzhi){_btnchongzhi.destory();_btnchongzhi=null;};
			
			if(_fnt_percent){_fnt_percent.destory();_fnt_percent=null;};
			if(_fnt_chongzhijilu){_fnt_chongzhijilu=null;};
			if(_fnt_lingqujilu){_fnt_lingqujilu=null;};
			
			if(_pos_item_lingqu){_pos_item_lingqu.destory();_pos_item_lingqu=null;};
			if(_scroller){_scroller.destory();_scroller=null;};
		}
		private function get windowMaterial():WindowBanghuiHongbao 
		{
			return _scene as WindowBanghuiHongbao; 
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
	}
}
