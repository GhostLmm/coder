package ui.equip
{
	import flash.display.MovieClip;
	
	import ui.DoubleWindow;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.widget.ScrollerControllerMatrix;
	import ui.window._WindowBase;
	
	public class EquipRonglianWindow extends DoubleWindow
	{
		public var _btn_close:Button;
		private var _pos_scroll:Position;
		public var _scr_equip:ScrollerControllerMatrix;
		
		public var _scn_ronglian:NumFontScroll;
		public var _posArray:Array;
		
		public var _btn_tianjia:Button;
		public var _btn_queding:Button;
		
		public var _mc_ronglianzhi:MovieClip;
		public var _fnt_ronglianzhi:FontField;
		public var _fnt_ronglianzhi_vip:FontField;
		public var _btn_qianwang:Button;
		public function EquipRonglianWindow(params:Object=null)
		{
			super(params);
			
			
			
			_scene=AssetManager.createMCForText(WindowRonglian);
			
			var mc:WindowRonglian=_scene;
			
			var left:MovieClip=mc.mc_left;
			var right:MovieClip=mc.mc_right;
			
			_pos_scroll=new Position(left.pos_scroll);
			_scr_equip=new ScrollerControllerMatrix(_pos_scroll);
			
			_btn_close=new Button(right.btn_close);
			
			_scn_ronglian=new NumFontScroll(right.scn_zhanli);
			_posArray=[];
			for(var index:int=1; index<=6; index++){
				var pos:Position=new Position(right["pos_"+index]);
				_posArray.push(pos);
			}
			
			_btn_tianjia=new Button(right.btn_tianjia);
			_btn_queding=new Button(right.btn_queding);
			
			_mc_ronglianzhi=right.mc_ronglianzhi;
			_fnt_ronglianzhi=new FontField(_mc_ronglianzhi.fnt_ronglianzhi);
			_fnt_ronglianzhi_vip=new FontField(_mc_ronglianzhi.fnt_ronglianzhi_vip);
			_mc_ronglianzhi.visible=false;
//			_fnt_ronglianzhi.text="";
//			_fnt_ronglianzhi_vip.text="";
			_btn_qianwang=new Button(right.btn_qianwang);
		}
		
		protected override function beforeOpen():void{
			Music.playFX(Music.FX_ronglianwindow);
			super.beforeOpen();
		}
		
		public override function destory():void{
			_mc_ronglianzhi=null;
			if(_fnt_ronglianzhi) {_fnt_ronglianzhi.destory(); _fnt_ronglianzhi=null;}
			if(_fnt_ronglianzhi_vip) {_fnt_ronglianzhi_vip.destory(); _fnt_ronglianzhi_vip=null;}
			if(_pos_scroll) {_pos_scroll.destory(); _pos_scroll=null;}
			if(_scr_equip) {_scr_equip.destory(); _scr_equip=null;}
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_scn_ronglian) {_scn_ronglian.destory(); _scn_ronglian=null;}
			if(_btn_qianwang) {_btn_qianwang.destory(); _btn_qianwang=null;}
			if(_posArray){
				for each(var pos:Position in _posArray){
					pos.destory();
				}
				_posArray=null;
			}
			if(_btn_tianjia) {_btn_tianjia.destory(); _btn_tianjia=null;}
			if(_btn_queding) {_btn_queding.destory(); _btn_queding=null;}
			super.destory();
		}
	}
}