package ui.gonghui
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.InputField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
	import util.Util;
	
import flash.display.MovieClip
	public class BanghuiShenqingWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_chuangjianbanghui:Button;

		public var _pos_TabLiebiaoMask:Position;
		public var _mc_liaotian:MovieClip;
		public var _btn_fasong:Button;
		public var _fnt_shuru:InputField;
		public var _scrollController:ScrollController;
		public var _InitX:Number;
		
		public function BanghuiShenqingWindow(params:Object=null)
		{
			super(params);
			_uiStatus = {"s":true,"t":false,"u":true};
			_scene=AssetManager.createMCForText(WindowBanghuiShenqingMain);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_chuangjianbanghui=new Button(windowMaterial.btn_chuangjianbanghui);
			
			_pos_TabLiebiaoMask=new Position(windowMaterial.pos_TabLiebiaoMask);
			_scrollController=new ScrollController(_pos_TabLiebiaoMask);
			_pos_TabLiebiaoMask.removeChildren();
			_pos_TabLiebiaoMask.addChild(_scrollController);
			
			_mc_liaotian=windowMaterial.mc_liaotian;
			_btn_fasong=new Button(windowMaterial.mc_liaotian.btn_fasong);
			windowMaterial.mc_liaotian.fnt_shuru.text=Util.getLanguage("请输入需要搜索的工会名字");
			_fnt_shuru=new InputField(windowMaterial.mc_liaotian.fnt_shuru);
			
			_InitX=windowMaterial.mc_liaotian.x;
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_chuangjianbanghui){_btn_chuangjianbanghui.destory();_btn_chuangjianbanghui=null;};
			
			if(_pos_TabLiebiaoMask){_pos_TabLiebiaoMask.destory();_pos_TabLiebiaoMask=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			
			if(_btn_fasong){_btn_fasong.destory();_btn_fasong=null;};
			if(_fnt_shuru){_fnt_shuru.destory();_fnt_shuru=null;};
			if(_mc_liaotian){_mc_liaotian=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowBanghuiShenqingMain 
		{
			return _scene as WindowBanghuiShenqingMain; 
		}
	}
}
