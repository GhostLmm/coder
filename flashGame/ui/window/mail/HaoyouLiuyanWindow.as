package ui.window.mail
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.InputField;
	import ui.window._WindowBase;
	
	import flash.display.MovieClip
	public class HaoyouLiuyanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_quxiao:Button;
		public var _btn_queding:Button;
		
		public var _fnt_to_player:FontField;
		public var _fnt_mail:InputField;
		
		private static const MaxInputNum:int=150;
		
		public function HaoyouLiuyanWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowHaoyouLiuyan);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_queding=new Button(windowMaterial.btn_queding);
			_btn_quxiao=new Button(windowMaterial.btn_quxiao);
			
			_fnt_to_player=new FontField(windowMaterial.fnt_to_player);
			_fnt_mail=new InputField(windowMaterial.fnt_mail,MaxInputNum);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_queding){_btn_queding.destory();_btn_queding=null;};
			if(_btn_quxiao){_btn_quxiao.destory();_btn_quxiao=null;};
			
			if(_fnt_to_player){_fnt_to_player.destory();_fnt_to_player=null;};
			if(_fnt_mail){_fnt_mail.destory();_fnt_mail=null;};
		}
		private function get windowMaterial():flash.display.MovieClip 
		{
			return _scene as flash.display.MovieClip;		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
	}
}
