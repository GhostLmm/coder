package ui.window.mail
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.window._WindowBase;
	public class YoujianWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _mc_youjian_tishi:MovieClip;
		public var _pos_item_youjian:Position;
		
		public var _btn_tag1:Button;
		public var _btn_tag2:Button;
		public var _btn_tag3:Button;
		
		public var _mc_tishi1:MovieClip;
		public var _mc_tishi2:MovieClip;
		public var _mc_tishi3:MovieClip;
		
		public var _btn_yijianlingqu:Button;
		
		public function YoujianWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowYoujian);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_mc_youjian_tishi=windowMaterial.mc_youjian_tishi;
			_pos_item_youjian=new Position(windowMaterial.pos_item_youjian);
			
			_btn_tag1=new Button(windowMaterial.btn_tag1);
			_btn_tag2=new Button(windowMaterial.btn_tag2);
			_btn_tag3=new Button(windowMaterial.btn_tag3);
			
			_mc_tishi1=windowMaterial.btn_tag1.mc_tishi;
			_mc_tishi2=windowMaterial.btn_tag2.mc_tishi;
			_mc_tishi3=windowMaterial.btn_tag3.mc_tishi;
			
			_btn_yijianlingqu=new Button(windowMaterial.btn_yijianlingqu);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_pos_item_youjian){_pos_item_youjian.destory();_pos_item_youjian=null;};
			if(_btn_tag1){_btn_tag1.destory();_btn_tag1=null;};
			if(_btn_tag2){_btn_tag2.destory();_btn_tag2=null;};
			if(_btn_tag3){_btn_tag3.destory();_btn_tag3=null;};
			if(_btn_yijianlingqu){_btn_yijianlingqu.destory();_btn_yijianlingqu=null;};
			_mc_youjian_tishi=null;
			
			_mc_tishi1=null;
			_mc_tishi2=null;
			_mc_tishi3=null;
		}
		private function get windowMaterial():WindowYoujian		{
			return _scene as WindowYoujian;		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
	}
}
