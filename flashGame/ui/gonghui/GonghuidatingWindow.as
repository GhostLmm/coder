package ui.gonghui
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	public class GonghuidatingWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _pos_jianshe_item:Position;
		public var _scrollController:ScrollController;
		
		public var _banghui_juntuandating:MovieClip;
		public var _fnt_lv:FontField;
		public var _fnt_jianshedu:FontField;
		public var _fnt_shengjiexp:FontField;
		
		public var _fnt_zongganxian:FontField;
		public var _fnt_money:FontField;
		public var _fnt_cash:FontField;
		public var _fnt_juanxianjilu:TextField;
		
		public function GonghuidatingWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBanghuidating);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_pos_jianshe_item=new Position(windowMaterial.pos_jianshe_item);
			_scrollController=new ScrollController(_pos_jianshe_item);
			_pos_jianshe_item.removeChildren();
			_pos_jianshe_item.addChild(_scrollController);
			
			_banghui_juntuandating=windowMaterial.banghui_juntuandating;
			_fnt_lv=new FontField(windowMaterial.banghui_juntuandating.fnt_lv);
			_fnt_jianshedu=new FontField(windowMaterial.banghui_juntuandating.fnt_jianshedu);
			_fnt_shengjiexp=new FontField(windowMaterial.banghui_juntuandating.fnt_shengjiexp);
			
			_fnt_zongganxian=new FontField(windowMaterial.fnt_zongganxian);
			_fnt_money=new FontField(windowMaterial.fnt_money);
			_fnt_cash=new FontField(windowMaterial.fnt_cash);
			_fnt_juanxianjilu=windowMaterial.fnt_juanxianjilu;
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_pos_jianshe_item){_pos_jianshe_item.destory();_btn_close=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			if(_fnt_jianshedu){_fnt_jianshedu.destory();_fnt_jianshedu=null;};
			if(_fnt_shengjiexp){_fnt_shengjiexp.destory();_fnt_shengjiexp=null;};
			if(_fnt_zongganxian){_fnt_zongganxian.destory();_fnt_zongganxian=null;};
			if(_fnt_money){_fnt_money.destory();_fnt_money=null;};
			if(_fnt_cash){_fnt_cash.destory();_fnt_cash=null;};
			if(_fnt_juanxianjilu){_fnt_juanxianjilu=null;};
			_banghui_juntuandating=null;
		}
		public override function destory():void
		{
			destoryMc();	
			super.destory();
		}
		private function get windowMaterial():WindowBanghuidating 
		{
			return _scene as WindowBanghuidating; 
		}
	}
}
