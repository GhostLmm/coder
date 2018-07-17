package ui.jinkuang
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class JinkuangNoOccupiedWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_haoyou:Button;
		public var _btn_fushu:Button;
		public var _btn_zhanling:Button;
		
		public var _fnt_name:FontField;
		public var _fnt_chanliang:FontField;
		public var _fnt_vip_limit:FontField;
		public var _fnt_mainUserName:FontField;
		
		public var _mc_vip:MovieClip;
		public var _mc_user:MovieClip;
		
		public function JinkuangNoOccupiedWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowShouhuo);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_fushu=new Button(windowMaterial.btn_fushu);
			_btn_haoyou=new Button(windowMaterial.mc_user.btn_haoyou);
			_btn_zhanling=new Button(windowMaterial.btn_zhanling);
			
			_fnt_name=new FontField(windowMaterial.fnt_name);
			_fnt_chanliang=new FontField(windowMaterial.fnt_chanliang);
			_fnt_vip_limit=new FontField(windowMaterial.mc_vip.fnt_vip_limit);
			_fnt_mainUserName=new FontField(windowMaterial.mc_user.fnt_name);
			
			_mc_vip=windowMaterial.mc_vip;
			_mc_user=windowMaterial.mc_user;
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_fushu){_btn_fushu.destory();_btn_fushu=null;};
			if(_btn_haoyou){_btn_haoyou.destory();_btn_haoyou=null;};
			if(_btn_zhanling){_btn_zhanling.destory();_btn_zhanling=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_chanliang){_fnt_chanliang.destory();_fnt_chanliang=null;};
			if(_fnt_vip_limit){_fnt_vip_limit.destory();_fnt_vip_limit=null;};
			if(_fnt_mainUserName){_fnt_mainUserName.destory();_fnt_mainUserName=null;};
			
			_mc_user=null;
			_mc_vip=null;			
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():WindowShouhuo 
		{
			return _scene as WindowShouhuo; 
		}
	}
}
