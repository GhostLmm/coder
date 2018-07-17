package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class BanghuiShangchengWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_zhenpin:Button;
		public var _btn_daoju:Button;
		
		public var _fnt_shangchenglv:FontField;
		public var _fnt_daojishi:FontField;
		public var _fnt_zonggongxian:FontField;
		public var _fnt_shengjisuoxu:FontField;
		public var _fnt_dangqiangongxian:FontField;
		
		public var _pos_tab_liebiao:Position;
		
		public var _fnt_shuaxin_daojishi:FontField;
		
		public function BanghuiShangchengWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(banghuishangcheng);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_zhenpin=new Button(windowMaterial.btn_zhenpin);
			_btn_daoju=new Button(windowMaterial.btn_daoju);
			
			_fnt_shangchenglv=new FontField(windowMaterial.fnt_shangchenglv);
			_fnt_daojishi=new FontField(windowMaterial.fnt_daojishi);
			_fnt_zonggongxian=new FontField(windowMaterial.fnt_zonggongxian);
			_fnt_shengjisuoxu=new FontField(windowMaterial.fnt_shengjisuoxu);
			_fnt_dangqiangongxian=new FontField(windowMaterial.fnt_dangqiangongxian);
			
			_pos_tab_liebiao=new Position(windowMaterial.pos_tab_liebiao);
			
			_fnt_shuaxin_daojishi=new FontField(windowMaterial.fnt_shuaxin_daojishi);
			
			windowMaterial.btn_daoju.mc_tishi.visible=false;
			windowMaterial.btn_zhenpin.mc_tishi.visible=false;
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_zhenpin){_btn_zhenpin.destory();_btn_zhenpin=null;};
			if(_btn_daoju){_btn_daoju.destory();_btn_daoju=null;};
			
			if(_fnt_shangchenglv){_fnt_shangchenglv.destory();_fnt_shangchenglv=null;};
			if(_fnt_daojishi){_fnt_daojishi.destory();_fnt_daojishi=null;};
			if(_fnt_zonggongxian){_fnt_zonggongxian.destory();_fnt_zonggongxian=null;};
			if(_fnt_shengjisuoxu){_fnt_shengjisuoxu.destory();_fnt_shengjisuoxu=null;};
			if(_fnt_dangqiangongxian){_fnt_dangqiangongxian.destory();_fnt_dangqiangongxian=null;};
			
			if(_pos_tab_liebiao){_pos_tab_liebiao.destory();_pos_tab_liebiao=null;};
			
			if(_fnt_shuaxin_daojishi){_fnt_shuaxin_daojishi.destory();_fnt_shuaxin_daojishi=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():banghuishangcheng 
		{
			return _scene as banghuishangcheng; 
		}
	}
}
