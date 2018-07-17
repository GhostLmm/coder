package ui.choujiang
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontScroll;
	import ui.window._WindowBase;
	
	public class ChoujiangXuanzeWindow extends _WindowBase
	{
		public var _btn_close:Button;
		
		public var _mc_haixuan:MovieClip;
		public var _mc_haixuanshilianchou:MovieClip;
		public var _mc_jingxuan:MovieClip;
		
		public var _fnt_haixuan_time:FontField;
		public var _fnt_haixuan_money:FontField;
		public var _fnt_haixuanshilianchou_money:FontField;
		public var _fnt_jingxuan_time:FontField;
		public var _fnt_jingxuan_money:FontField;
		public var _fnt_haixuan_mianfei:FontField;
		public var _fnt_jingxuan_mianfei:FontField;
		
		public var _scn_fnt_ronglianzhi:NumFontScroll;
		public var _btn_add:Button;
		
		public var _mc_anim_haixuan:MovieClip;
		public var _mc_anim_haixuanshilian:MovieClip;
		public var _mc_anim_jingxuan:MovieClip;
		
		public function ChoujiangXuanzeWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowChoujiang);
			initModule();
		}
		private function initModule():void
		{
			_btn_close = new Button(windowMaterial.btn_close);
			
			_mc_haixuan=windowMaterial.mc_chouqu1;
			_mc_haixuanshilianchou=windowMaterial.mc_chouqu2;
			_mc_jingxuan=windowMaterial.mc_chouqu3;
			_mc_haixuan.mouseChildren=false;
			_mc_haixuanshilianchou.mouseChildren=false;
			_mc_jingxuan.mouseChildren=false;
			
			
			
			_fnt_haixuan_time = new FontField(_mc_haixuan.fnt_time);
			_fnt_haixuan_money=new FontField(_mc_haixuan.fnt_money);
			
			_fnt_haixuanshilianchou_money=new FontField(_mc_haixuanshilianchou.fnt_money);
			
			_fnt_jingxuan_time = new FontField(_mc_jingxuan.fnt_time);
			_fnt_jingxuan_money=new FontField(_mc_jingxuan.fnt_money);		
			
			_fnt_haixuan_mianfei=new FontField(_mc_haixuan.fnt_mianfei);
			_fnt_jingxuan_mianfei=new FontField(_mc_jingxuan.fnt_mianfei);
			
			_scn_fnt_ronglianzhi=new NumFontScroll(windowMaterial.scn_fnt_ronglianzhi);
			_btn_add=new Button(windowMaterial.btn_add);
			
			_mc_anim_haixuan=_mc_haixuan.mc_anim;
			_mc_anim_haixuanshilian=_mc_haixuanshilianchou.mc_anim;
			_mc_anim_jingxuan=_mc_jingxuan.mc_anim;
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_fnt_haixuan_time){_fnt_haixuan_time.destory();_fnt_haixuan_time=null;};
			if(_fnt_haixuan_money){_fnt_haixuan_money.destory();_fnt_haixuan_money=null;};
			if(_fnt_haixuanshilianchou_money){_fnt_haixuanshilianchou_money.destory();_fnt_haixuanshilianchou_money=null;};
			if(_fnt_jingxuan_time){_fnt_jingxuan_time.destory();_fnt_jingxuan_time=null;};
			if(_fnt_jingxuan_money){_fnt_jingxuan_money.destory();_fnt_jingxuan_money=null;};
			
			if(_mc_haixuan){_mc_haixuan=null;};
			if(_mc_haixuanshilianchou){_mc_haixuan=null;};
			if(_mc_jingxuan){_mc_haixuan=null;};
			
			if(_fnt_haixuan_mianfei){_fnt_haixuan_mianfei.destory();_fnt_haixuan_mianfei=null;};
			if(_fnt_jingxuan_mianfei){_fnt_jingxuan_mianfei.destory();_fnt_jingxuan_mianfei=null;};
			
			if(_scn_fnt_ronglianzhi){_scn_fnt_ronglianzhi.destory();_scn_fnt_ronglianzhi=null;};
			if(_btn_add){_btn_add.destory();_btn_add=null;};
			
			if(_mc_anim_haixuan){_mc_anim_haixuan=null;};
			if(_mc_anim_haixuanshilian){_mc_anim_haixuanshilian=null;};
			if(_mc_anim_jingxuan){_mc_anim_jingxuan=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowChoujiang
		{
			return _scene as WindowChoujiang;
		}
		protected override function get isAdjustCloseBtn():Boolean
		{
			return true;
		}
	}
}