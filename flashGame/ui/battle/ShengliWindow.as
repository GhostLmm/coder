package ui.battle
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class ShengliWindow extends _WindowBase
	{
//		public var _fnt_exp:FontField;
//		public var _fnt_money:FontField;
		
		public var _pos_wupin:Position;
		public var _scr_wupin:ScrollControllerMax;
		
		public var _mc_stars:Array;
		
//		public var _fnt_passtimel_num:FontField;
//		public var _fnt_kill_num:FontField;
//		public var _fnt_remaind_hp_num:FontField;
		
		public var _mc_baoxiang:MovieClip;
		
		public var _btn_ok:Button;
		public var _btn_share:Button;
		
		public var _mc_bg:MovieClip;
		
		public var _mc_time:MovieClip;
		public var _mc_blood:MovieClip;
		public var _mc_shengli_jiangli:MovieClip;
		
		public var _fnt_passtimel_num:FontField;
		public var _fnt_remaind_hp_num:FontField;
		
		public var _fnt_time:FontField;
		public var _fnt_hp:FontField;
		
		public function ShengliWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowShengli);
			
			var mc:WindowShengli=_scene;
			
//			_fnt_passtimel_num=new FontField(mc.fnt_passtimel_num);
//			_fnt_kill_num=new FontField(mc.fnt_kill_num);
//			_fnt_remaind_hp_num=new FontField(mc.fnt_remaind_hp_num);
			_mc_baoxiang=mc.mc_baoxiang;
//			_fnt_exp=new FontField(mc.fnt_exp);
//			_fnt_money=new FontField(mc.fnt_money);
			_btn_ok=new Button(mc.btn_ok);
			_btn_share=new Button(mc.btn_share);
			_pos_wupin=new Position(mc.mc_shengli_jiangli.pos_wupin);
			_scr_wupin=new ScrollControllerMax(_pos_wupin,ScrollControllerMax.HORIZONTAL);
			
			_mc_stars=[];
			for (var index:int=1; index<=3; index++){
//				_mc_stars.push(new Position(mc["pos_star"+index]));
				_mc_stars.push(mc["pos_star"+index]);
			}
			_mc_bg=mc.mc_bg;
			
			_mc_time=mc.mc_time;
			_mc_blood=mc.mc_blood;
			_mc_shengli_jiangli=mc.mc_shengli_jiangli;
			
			_fnt_passtimel_num=new FontField(_mc_time.fnt_passtimel_num);
			_fnt_time=new FontField(_mc_time.fnt_time);
			_fnt_remaind_hp_num=new FontField(_mc_blood.fnt_remaind_hp_num);
			_fnt_hp=new FontField(_mc_blood.fnt_hp);
		}
		public override function destory():void{
//			if(_fnt_passtimel_num) {_fnt_passtimel_num.destory(); _fnt_passtimel_num=null;}
//			if(_fnt_kill_num) {_fnt_kill_num.destory(); _fnt_kill_num=null;}
//			if(_fnt_remaind_hp_num) {_fnt_remaind_hp_num.destory(); _fnt_remaind_hp_num=null;}
//			if(_mc_baoxiang) {_mc_baoxiang.destory(); _mc_baoxiang=null;}
			_mc_baoxiang=null;
//			if(_fnt_exp) {_fnt_exp.destory(); _fnt_exp=null;}
//			if(_fnt_money) {_fnt_money.destory(); _fnt_money=null;}
			if(_btn_ok) {_btn_ok.destory(); _btn_ok=null;}
			if(_btn_share) {_btn_share.destory(); _btn_share=null;}
			if(_pos_wupin) {_pos_wupin.destory(); _pos_wupin=null;}
			if(_scr_wupin) {_scr_wupin.destory(); _scr_wupin=null;}
			if(_fnt_passtimel_num) {_fnt_passtimel_num.destory(); _fnt_passtimel_num=null;}
			if(_fnt_remaind_hp_num) {_fnt_remaind_hp_num.destory(); _fnt_remaind_hp_num=null;}
			if(_fnt_time) {_fnt_time.destory(); _fnt_time=null;}
			if(_fnt_hp) {_fnt_hp.destory(); _fnt_hp=null;}
			_mc_time=null;
			_mc_blood=null;
			_mc_shengli_jiangli=null;
			_mc_stars=null;
			_mc_bg=null;
			super.destory();
		}
		protected override function beforeOpen():void
		{
			super.beforeOpen();
			Music.playFxDownBackMusic(Music.FX_Window_Win);
		}
		protected override function beforeClose():void
		{
			Music.stop(Music.FX_Window_Win);
			super.beforeClose();
		}
		
		
	}
}