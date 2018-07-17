package ui.battle
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class ShibaiWindow extends _WindowBase
	{
//		public var _fnt_exp:FontField;
//		public var _fnt_money:FontField;
		public var _mc_shibai:MovieClip;
		public var _mc_shibaitishi:MovieClip;
		public var _btn_bianqiang:Button;
		public var _btn_ok:Button;
		
		public var _mc_leitaihuode:MovieClip;
		public var _fnt_desc_kexi:FontField;
		public var _fnt_money:FontField;
		public var _fnt_rongyu:FontField;
		
		public function ShibaiWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText(WindowShibai);
			
			var mc:WindowShibai=_scene;
			
//			_fnt_exp = new FontField(mc.fnt_exp);
//			_fnt_money = new FontField(mc.fnt_money);
			_mc_shibai = mc.mc_shibai;
			_mc_shibaitishi=mc.mc_shibaitishi;
			
			_btn_bianqiang=new Button(_mc_shibaitishi.btn_bianqiang);
			_btn_ok=new Button(windowMaterial.btn_ok)
			_mc_leitaihuode=windowMaterial.mc_leitaihuode;
			_fnt_desc_kexi=new FontField(windowMaterial.fnt_desc_kexi);
			_fnt_money=new FontField(_mc_leitaihuode.fnt_money);
			_fnt_rongyu=new FontField(_mc_leitaihuode.fnt_rongyu);
		}
		
		protected override function beforeOpen():void
		{
			super.beforeOpen();
			Music.playFxDownBackMusic(Music.FX_Window_Lose);
		}
		protected override function beforeClose():void
		{
			Music.stop(Music.FX_Window_Lose);
			super.beforeClose();
		}
		public override function destory():void
		{
//			if(_fnt_exp) {_fnt_exp.destory(); _fnt_exp=null;};
//			if(_fnt_money) {_fnt_money.destory(); _fnt_money=null;};
			if(_btn_bianqiang) {_btn_bianqiang.destory(); _btn_bianqiang=null;};
			if(_btn_ok) {_btn_ok.destory(); _btn_ok=null;};
			_mc_shibai=null;
			_mc_shibaitishi=null;
			_mc_leitaihuode=null;
			if(_fnt_desc_kexi) {_fnt_desc_kexi.destory(); _fnt_desc_kexi=null;};
			if(_fnt_money) {_fnt_money.destory(); _fnt_money=null;};
			if(_fnt_rongyu) {_fnt_rongyu.destory(); _fnt_rongyu=null;};
			super.destory();
		}
		private function get windowMaterial():WindowShibai
		{
			return _scene as WindowShibai;
		}
	}
}