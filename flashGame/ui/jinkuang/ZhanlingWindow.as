package ui.jinkuang
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	public class ZhanlingWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_qugan:Button;
		public var _btn_lveduo:Button;
		public var _btn_chetui:Button;
		public var _btn_shouhuo:Button;
		
		public var _pos_item:Position;
		
		
		public var _fnt_name:FontField;
		public var _fnt_user_name:FontField;
		public var _fnt_lv:FontField;
		
		public var _fnt_chanliang_mcLveduo:FontField;
		public var _fnt_lveduo_mcLveduo:FontField;
		
		public var _fnt_chanliang_mcShouhuo:FontField;
		public var _fnt_time_mcShouhuo:FontField;
		public var _fnt_shouhuo_mcShouhuo:FontField;
		
		public var _mc_shouhuo:MovieClip;
		public var _mc_luvduo:MovieClip;
		
		public var _fnt_zhanli:FontField;
		
		public function ZhanlingWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowZhanling);
			initModule();
		}
		private function initModule():void
		{
			_mc_luvduo=windowMaterial.mc_luvduo;
			_mc_shouhuo=windowMaterial.mc_shouhuo;
			
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_qugan=new Button(windowMaterial.mc_luvduo.btn_qugan);
			_btn_lveduo=new Button(windowMaterial.mc_luvduo.btn_lveduo);
			_btn_chetui=new Button(windowMaterial.mc_shouhuo.btn_chetui);
			_btn_shouhuo=new Button(windowMaterial.mc_shouhuo.btn_shouhuo);
			_pos_item=new Position(windowMaterial.pos_item);
			
			
			_fnt_name=new FontField(windowMaterial.fnt_name);
			_fnt_user_name=new FontField(windowMaterial.fnt_user_name);
			_fnt_lv=new FontField(windowMaterial.fnt_lv);
			
			_fnt_chanliang_mcLveduo=new FontField(windowMaterial.mc_luvduo.fnt_chanliang);
			_fnt_lveduo_mcLveduo=new FontField(windowMaterial.mc_luvduo.fnt_lveduo);
			
			_fnt_chanliang_mcShouhuo=new FontField(windowMaterial.mc_shouhuo.fnt_chanliang);
			_fnt_time_mcShouhuo=new FontField(windowMaterial.mc_shouhuo.fnt_time);
			_fnt_shouhuo_mcShouhuo=new FontField(windowMaterial.mc_shouhuo.fnt_shouhuo);
			
			_fnt_zhanli=new FontField(windowMaterial.fnt_zhanli);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_qugan){_btn_qugan.destory();_btn_qugan=null;};
			if(_btn_lveduo){_btn_lveduo.destory();_btn_lveduo=null;};
			if(_btn_chetui){_btn_chetui.destory();_btn_chetui=null;};
			if(_btn_shouhuo){_btn_shouhuo.destory();_btn_shouhuo=null;};
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_user_name){_fnt_user_name.destory();_fnt_user_name=null;};
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			
			if(_fnt_chanliang_mcLveduo){_fnt_chanliang_mcLveduo.destory();_fnt_chanliang_mcLveduo=null;};
			if(_fnt_lveduo_mcLveduo){_fnt_lveduo_mcLveduo.destory();_fnt_lveduo_mcLveduo=null;};
			
			if(_fnt_chanliang_mcShouhuo){_fnt_chanliang_mcShouhuo.destory();_fnt_chanliang_mcShouhuo=null;};
			if(_fnt_time_mcShouhuo){_fnt_time_mcShouhuo.destory();_fnt_time_mcShouhuo=null;};
			if(_fnt_shouhuo_mcShouhuo){_fnt_shouhuo_mcShouhuo.destory();_fnt_shouhuo_mcShouhuo=null;};
			if(_fnt_zhanli){_fnt_zhanli.destory();_fnt_zhanli=null;};
			
			_mc_luvduo=null;
			_mc_shouhuo=null;
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowZhanling 
		{
			return _scene as WindowZhanling; 
		}
	}
}
