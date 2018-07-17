package ui.gonghui
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.geom.Point;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;

	public class BanghuiMainWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_guanli:Button;
		public var _btn_chengyuan:Button;
		public var _btn_qita:Button;
		public var _btn_liaotian:Button;
		public var _btn_shenqing:Button;
		public var _btn_hongbao:Button;
		
		public var _btn_juntuandating:SimpleButton;
		public var _btn_juntuanshangcheng:SimpleButton;
		public var _btn_guangongdian:SimpleButton;
		
		public var _pos_banghui_icon:Position;
		
		public var _fnt_banghuidengji:FontField;
		public var _fnt_banghuiming:FontField;
		public var _fnt_bangpairenshu:FontField;
		public var _fnt_gerengongxian:FontField;
		public var _fnt_bangpaijianshedu:FontField;
		public var _fnt_banghuixuanyan_value:FontField;
		
		public var _fnt_juntuandating_lv:FontField;
		public var _fnt_juntuanshangcheng_lv:FontField;
		public var _fnt_guangongdian_lv:FontField;
		
		public var _btn_juntuandating_lvup:Button;
		public var _btn_juntuanshangcheng_lvup:Button;
		public var _btn_guangongdian_lvup:Button;
				
		public var _btn_tuichu:Button;
		
		public var _btn_banghuizhan:SimpleButton;		
		public var _fnt_buff_num:FontField;
		public var _mc_tongqian_buff:MovieClip;
		
		
		public function BanghuiMainWindow(params:Object=null)
		{
			super(params);
			_uiStatus = {"s":false,"t":false,"u":false};
			_scene=AssetManager.createMCForText(WindowBanghuiMain);
			adjustPos();
			initModule();
		}
		private function adjustPos():void
		{
			var posPoint:Point;
			var target:Point;	
			windowMaterial.mc_right.x=GlobalRef.width/2;
			
			var scal:Number=GlobalRef.height/windowMaterial.mc_left.height;
			windowMaterial.mc_left.height=GlobalRef.height;
			windowMaterial.mc_left.width*=scal;
			
			windowMaterial.mc_left.y=-GlobalRef.height/2;
			windowMaterial.mc_left.x=-GlobalRef.width/2-windowMaterial.mc_left.width;
			
			TweenLite.to(windowMaterial.mc_left,0.3,{x:-GlobalRef.width/2,ease:Back.easeIn});
			
			windowMaterial.mc_image.y=-GlobalRef.height/2;
			
			windowMaterial.btn_qita.y=-GlobalRef.height/2;
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			
			_btn_guanli=new Button(windowMaterial.mc_right.btn_guanli);
			_btn_chengyuan=new Button(windowMaterial.mc_left.btn_chakanchengyuan);
			_btn_qita=new Button(windowMaterial.btn_qita);
			_btn_liaotian=new Button(windowMaterial.mc_right.btn_liaotian);
			_btn_shenqing=new Button(windowMaterial.mc_right.btn_shenqing);
			_btn_hongbao=new Button(windowMaterial.mc_right.btn_hongbao);
				
			_btn_juntuandating=windowMaterial.mc_right.btn_juntuandating;
			_btn_juntuanshangcheng=windowMaterial.mc_right.btn_juntuanshangcheng;
			_btn_guangongdian=windowMaterial.mc_right.btn_guangongdian;	
			
			_pos_banghui_icon=new Position(windowMaterial.mc_left.pos_banghui_icon);
			
			_fnt_banghuidengji=new FontField(windowMaterial.mc_left.fnt_banghuidengji);
			_fnt_banghuiming=new FontField(windowMaterial.mc_left.fnt_banghuiming);
			_fnt_bangpairenshu=new FontField(windowMaterial.mc_left.fnt_bangpairenshu);
			_fnt_gerengongxian=new FontField(windowMaterial.mc_left.fnt_gerengongxian);
			_fnt_bangpaijianshedu=new FontField(windowMaterial.mc_left.fnt_bangpaijianshedu);
			_fnt_banghuixuanyan_value=new FontField(windowMaterial.mc_right.fnt_banghuixuanyan_value);
			
			_fnt_juntuandating_lv=new FontField(windowMaterial.mc_right.fnt_juntuandating_lv);
			_fnt_guangongdian_lv=new FontField(windowMaterial.mc_right.fnt_guangongdian_lv);
			_fnt_juntuanshangcheng_lv=new FontField(windowMaterial.mc_right.fnt_juntuanshangcheng_lv);
			
			_btn_juntuandating_lvup=new Button(windowMaterial.mc_right.btn_juntuandating_lvup);
			_btn_juntuanshangcheng_lvup=new Button(windowMaterial.mc_right.btn_juntuanshangcheng_lvup);
			_btn_guangongdian_lvup=new Button(windowMaterial.mc_right.btn_guangongdian_lvup);
			
			
			_btn_tuichu=new Button(windowMaterial.mc_left.btn_tuichu);
			
			_btn_banghuizhan=windowMaterial.mc_right.btn_banghuizhan;
			_fnt_buff_num=new FontField(windowMaterial.mc_tongqian_buff.fnt_buff_num);
			_mc_tongqian_buff=windowMaterial.mc_tongqian_buff;
		}
		private function destoryMc():void
		{	
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_guanli){_btn_guanli.destory();_btn_guanli=null;};
			if(_btn_chengyuan){_btn_chengyuan.destory();_btn_chengyuan=null;};
			if(_btn_qita){_btn_qita.destory();_btn_qita=null;};
			if(_btn_liaotian){_btn_liaotian.destory();_btn_liaotian=null;};
			if(_btn_shenqing){_btn_shenqing.destory();_btn_shenqing=null;};
			if(_btn_hongbao){_btn_hongbao.destory();_btn_hongbao=null;};
			
			if(_btn_juntuandating){_btn_juntuandating=null;};
			if(_btn_juntuanshangcheng){_btn_juntuanshangcheng=null;};
			if(_btn_guangongdian){_btn_guangongdian=null;};
			
			if(_pos_banghui_icon){_pos_banghui_icon.destory();_pos_banghui_icon=null;};
			
			if(_fnt_banghuidengji){_fnt_banghuidengji.destory();_fnt_banghuidengji=null;};
			if(_fnt_banghuiming){_fnt_banghuiming.destory();_fnt_banghuiming=null;};
			if(_fnt_bangpairenshu){_fnt_bangpairenshu.destory();_fnt_bangpairenshu=null;};
			if(_fnt_gerengongxian){_fnt_gerengongxian.destory();_fnt_gerengongxian=null;};
			if(_fnt_bangpaijianshedu){_fnt_bangpaijianshedu.destory();_fnt_bangpaijianshedu=null;};
			if(_fnt_banghuixuanyan_value){_fnt_banghuixuanyan_value.destory();_fnt_banghuixuanyan_value=null;};
			
			
			if(_fnt_juntuandating_lv){_fnt_juntuandating_lv.destory();_fnt_juntuandating_lv=null;};
			if(_fnt_guangongdian_lv){_fnt_guangongdian_lv.destory();_fnt_guangongdian_lv=null;};
			if(_fnt_juntuanshangcheng_lv){_fnt_juntuanshangcheng_lv.destory();_fnt_juntuanshangcheng_lv=null;};
			
			if(_btn_juntuandating_lvup){_btn_juntuandating_lvup.destory();_btn_juntuandating_lvup=null;};
			if(_btn_juntuanshangcheng_lvup){_btn_juntuanshangcheng_lvup.destory();_btn_juntuanshangcheng_lvup=null;};
			if(_btn_guangongdian_lvup){_btn_guangongdian_lvup.destory();_btn_guangongdian_lvup=null;};
			
			
			if(_btn_tuichu){_btn_tuichu.destory();_btn_tuichu=null;};
			
			if(_btn_banghuizhan){_btn_banghuizhan=null;};
			if(_fnt_buff_num){_fnt_buff_num.destory();_btn_banghuizhan=null;};
			if(_mc_tongqian_buff){_mc_tongqian_buff=null;};
		}
		public override function destory():void
		{
			TweenLite.killTweensOf(windowMaterial.mc_left);
			destoryMc();
			super.destory();
		}
		public function get windowMaterial():WindowBanghuiMain		{
			return _scene as WindowBanghuiMain;		}	
		protected override function get isAdjustCloseBtn():Boolean
		{
			return true;
		}
	}
}
