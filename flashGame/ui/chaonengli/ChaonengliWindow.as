package ui.chaonengli
{
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;
	
	public class ChaonengliWindow extends _WindowBase
	{
		public var _btn_close:Button;
		
		public var _btn_left:Button;
		public var _btn_right:Button;
		
		public var _fnt_body_part:FontField;
		
		public var _scn_zhanli:NumFontScroll;
		public var _scn_money:NumFontScroll;
		public var _scn_star:NumFontScroll;
		
		public var _pos_item:Position;
		public var _scroller:ScrollController;
		
		public var _mc_huadong_pos:Position;
		
		public var _mc_superskill_bodypart:MovieClip;
		
		public var _btn_jinhua:Button;
		
		public function ChaonengliWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(wnd_superskill);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_left=new Button(windowMaterial.btn_left);
			_btn_right=new Button(windowMaterial.btn_right);
			
			_fnt_body_part=new FontField(windowMaterial.fnt_body_part);
			
			_scn_zhanli=new NumFontScroll(windowMaterial.scn_zhanli);
			_scn_money=new NumFontScroll(windowMaterial.scn_money);
			_scn_star=new NumFontScroll(windowMaterial.scn_star);
			
			_pos_item=new Position(windowMaterial.pos_item);
			_scroller=new ScrollController(_pos_item,ScrollController.HORIZONTAL);
			_pos_item.removeChildren();
			_pos_item.addChild(_scroller);
			
			_mc_huadong_pos=new Position(windowMaterial.mc_huadong_pos);
			
			_mc_superskill_bodypart=windowMaterial.mc_superskill_bodypart;
			_mc_superskill_bodypart.stop();
			
			_btn_jinhua=new Button(windowMaterial.btn_jinhua);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_left){_btn_left.destory();_btn_left=null;};
			if(_btn_right){_btn_right.destory();_btn_right=null;};
			
			if(_fnt_body_part){_fnt_body_part.destory();_fnt_body_part=null;};
			
			if(_scn_zhanli){_scn_zhanli.destory();_scn_zhanli=null;};
			if(_scn_money){_scn_money.destory();_scn_money=null;};
			if(_scn_star){_scn_star.destory();_scn_star=null;};
			
			if(_mc_huadong_pos){_mc_huadong_pos.destory();_mc_huadong_pos=null;};
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			if(_scroller){_scroller.destory();_scroller=null;};
			
			_mc_superskill_bodypart=null;
			
			if(_btn_jinhua){_btn_jinhua.destory();_btn_jinhua=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():wnd_superskill
		{
			return _scene as wnd_superskill;
		}
	}
}