package ui.window
{	
	import flash.display.MovieClip;
	
	import ui.widget.FontField;

import flash.display.MovieClip
	public class ShengjiWindow extends _WindowBase
	{
		public var _fnt_chika:FontField;
		public var _fnt_chika_up:FontField;
		public var _fnt_friend:FontField;
		public var _fnt_friend_up:FontField;
		public var _fnt_lv:FontField;
		public var _fnt_lv_up:FontField;
		
		public var _fnt_tili:FontField;
		public var _fnt_yongqi:FontField;
		
		public var _mc_item1:MovieClip;
		public var _mc_item2:MovieClip;
		public var _mc_item3:MovieClip;
		public var _mc_item4:MovieClip;
		public var _mc_item5:MovieClip;
		
		public function ShengjiWindow(params:Object=null)
		{
			
			super(params);
			_uiStatus = {"s":false,"t":false,"u":false};
			_scene = new (AssetManager.getAssetClass("WindowShengji") as Class); 
			_fnt_chika = new FontField(_scene.mc_shengji_item2.fnt_chika);
			_fnt_chika_up = new FontField(_scene.mc_shengji_item2.fnt_chika_up);
			_fnt_friend = new FontField(_scene.mc_shengji_item3.fnt_friend);
			_fnt_friend_up = new FontField(_scene.mc_shengji_item3.fnt_friend_up);
			_fnt_lv = new FontField(_scene.mc_shengji_item1.fnt_lv);
			_fnt_lv_up = new FontField(_scene.mc_shengji_item1.fnt_lv_up);
			_fnt_tili=new FontField(_scene.mc_shengji_item4.fnt_tili);
			_fnt_yongqi=new FontField(_scene.mc_shengji_item5.fnt_yongqi);
			
			_mc_item1=_scene.mc_shengji_item1;
			_mc_item2=_scene.mc_shengji_item2;
			_mc_item3=_scene.mc_shengji_item3;
			_mc_item4=_scene.mc_shengji_item4;
			_mc_item5=_scene.mc_shengji_item5;
		}
		private function destoryMc():void
		{
			if(_fnt_chika){_fnt_chika.destory();_fnt_chika=null};
			if(_fnt_chika_up){_fnt_chika_up.destory();_fnt_chika_up=null};
			if(_fnt_friend){_fnt_friend.destory();_fnt_friend=null};
			if(_fnt_friend_up){_fnt_friend_up.destory();_fnt_friend_up=null};
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null};
			if(_fnt_lv_up){_fnt_lv_up.destory();_fnt_lv_up=null};
			if(_fnt_tili){_fnt_tili.destory();_fnt_tili=null};
			if(_fnt_yongqi){_fnt_yongqi.destory();_fnt_yongqi=null};
			
			_mc_item1=null;
			_mc_item2=null;
			_mc_item3=null;
			_mc_item4=null;
			_mc_item5=null;
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		protected override function beforeOpen():void
		{
			super.beforeOpen();
			Music.playFxDownBackMusic(Music.FX_Window_LevelUp);
		}
		protected override function beforeClose():void
		{
			Music.stop(Music.FX_Window_LevelUp);
			super.beforeClose();
		}
	}
}
