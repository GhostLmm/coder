package ui.digWindow
{
	import flash.display.MovieClip;
	
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class LevelUpWindow extends _WindowBase
	{
		public var _mc_shengji_item1:MovieClip;
		public var _fnt_lv:FontField;
		public var _fnt_lv_up:FontField;
		
		
		public var _mc_shengji_item2:MovieClip;
		public var _fnt_friend:FontField;
		public var _fnt_friend_up:FontField;
		
		public var _mc_shengji_item3:MovieClip;
		public var _fnt_desc:FontField;
		
		public var _btn_queding:ButtonMax;
		public function LevelUpWindow(params:Object=null)
		{
			super(params);
			_scene=new WindowShengji();
			
			var wm:WindowShengji=_scene;
			
			_mc_shengji_item1=wm.mc_shengji_item1;
			_fnt_lv=new FontField(_mc_shengji_item1.fnt_lv);
			_fnt_lv_up=new FontField(_mc_shengji_item1.fnt_lv_up);
			
			_mc_shengji_item2=wm.mc_shengji_item2;
			_fnt_friend=new FontField(_mc_shengji_item2.fnt_friend);
			_fnt_friend_up=new FontField(_mc_shengji_item2.fnt_friend_up);
			
			_mc_shengji_item3=wm.mc_shengji_item3;
			_fnt_desc=new FontField(_mc_shengji_item3.fnt_desc);
			
			_btn_queding=new ButtonMax(wm.btn_queding);
		}
		
		public override function destory():void{
			_mc_shengji_item1=null;
			_mc_shengji_item2=null;
			_mc_shengji_item3=null;
			if(_fnt_lv) { _fnt_lv.destory(); _fnt_lv=null;}
			if(_fnt_lv_up) { _fnt_lv_up.destory(); _fnt_lv_up=null;}
			if(_fnt_friend) { _fnt_friend.destory(); _fnt_friend=null;}
			if(_fnt_friend_up) { _fnt_friend_up.destory(); _fnt_friend_up=null;}
			if(_mc_shengji_item3) { _mc_shengji_item3.destory(); _mc_shengji_item3=null;}
			if(_fnt_desc) { _fnt_desc.destory(); _fnt_desc=null;}
			if(_btn_queding) { _btn_queding.destory(); _btn_queding=null;}
			super.destory();
		}
	}
}