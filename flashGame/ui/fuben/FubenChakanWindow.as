package ui.fuben
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	import ui.widget.NumFontStatic;
	import ui.widget.Position;
	import ui.widget.ScrollControllerCenterMax;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	import view.module.NumScroll;
	
	public class FubenChakanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _num_money:NumFontStatic;
		public var _num_exp:NumFontStatic;
		public var _num_cishu:NumFontStatic;
		public var _num_tili:NumFontStatic;
		public var _btn_tiaozhanshici:ButtonMax;
		public var _btn_tiaozhan:Button;
		public var _desc_arrays:Array;
		
//		public var _mc_star1:MovieClip;
//		public var _mc_star2:MovieClip;
//		public var _mc_star3:MovieClip;
		
		public var _mc_stars:Array;
		
		private var _pos_scroll_item:Position;
		public var _scr_item:ScrollControllerCenterMax;
		
		public var _mc_lengque:MovieClip;
		public var _fnt_lengque:FontField;
		
		public var _fnt_title:FontField;
		
		private var _pos_scroll_paiming:Position;
		public var _scr_paiming:ScrollControllerMax;
		public var _fnt_name:FontField;
		
		public var _btn_my_paiming:Button;
		
		public function FubenChakanWindow(params:Object=null)
		{
			super(params);
			showUserInfo=true;
			_scene=AssetManager.createMCForText(WindowFubenChakan);
			
			var mc:WindowFubenChakan=_scene;
			_btn_close=new Button(mc.btn_close);
			_num_money=new NumFontStatic(mc.num_money);
			_num_exp=new NumFontStatic(mc.num_exp);
			_num_cishu=new NumFontStatic(mc.num_cishu);
			_num_tili=new NumFontStatic(mc.num_tili);
			_btn_tiaozhanshici=new ButtonMax(mc.btn_tiaozhanshici);
			_btn_tiaozhan=new Button(mc.btn_tiaozhan);
			_fnt_title=new  FontField(mc.fnt_title);
			_mc_stars=[];
			_mc_stars.push(mc.mc_star1,mc.mc_star2,mc.mc_star3);
//			_mc_star1=mc.mc_star1;
//			_mc_star1.stop();
//			_mc_star2=mc.mc_star2;
//			_mc_star2.stop();
//			_mc_star3=mc.mc_star3;
//			_mc_star3.stop();
			_desc_arrays=[];
			_desc_arrays.push(new FontField(mc.fnt_language1),new FontField(mc.fnt_language2),new FontField(mc.fnt_language3));
			
			
			_pos_scroll_item=new Position(mc.pos_scroll_item);
			_scr_item=new ScrollControllerCenterMax(_pos_scroll_item,ScrollControllerMax.HORIZONTAL);
			
			_mc_lengque=mc.mc_lengque;
			_fnt_lengque=new FontField(_mc_lengque.fnt_lengque);
			
			_pos_scroll_paiming=new Position(mc.pos_scroll_paiming);
			_scr_paiming=new ScrollControllerMax(_pos_scroll_paiming);
			_fnt_name=new FontField(mc.fnt_name);
			
			_btn_my_paiming=new Button(mc.btn_my_paiming);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_num_money) {_num_money.destory(); _num_money=null;}
			if(_num_exp) {_num_exp.destory(); _num_exp=null;}
			if(_num_cishu) {_num_cishu.destory(); _num_cishu=null;}
			if(_num_tili) {_num_tili.destory(); _num_tili=null;}
			if(_btn_tiaozhanshici) {_btn_tiaozhanshici.destory(); _btn_tiaozhanshici=null;}
			if(_btn_tiaozhan) {_btn_tiaozhan.destory(); _btn_tiaozhan=null;}
			
			if(_pos_scroll_item) {_pos_scroll_item.destory(); _pos_scroll_item=null;}
			if(_scr_item) {_scr_item.destory(); _scr_item=null;}
			if(_fnt_lengque) {_fnt_lengque.destory();_fnt_lengque=null;}
			
			if(_desc_arrays){
				for each(var ft:FontField in _desc_arrays){
					ft.destory();
				}
				_desc_arrays=null;
			}
			if(_fnt_title) {_fnt_title.destory();_fnt_title=null;}
			_mc_lengque=null;
			_mc_stars=null;
			
			if(_pos_scroll_paiming) {_pos_scroll_paiming.destory();_pos_scroll_paiming=null;}
			if(_scr_paiming) {_scr_paiming.destory();_scr_paiming=null;}
			if(_fnt_name) {_fnt_name.destory();_fnt_name=null;}
			if(_btn_my_paiming) {_btn_my_paiming.destory();_btn_my_paiming=null;}
//			_mc_star1=null;
//			_mc_star2=null;
//			_mc_star3=null;
			super.destory();
		}
	}
}