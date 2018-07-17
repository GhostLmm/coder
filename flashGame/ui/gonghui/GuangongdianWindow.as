package ui.gonghui
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
import flash.display.MovieClip
	public class GuangongdianWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_jiangliyulan:Button;
		public var _btn_canbai:Button;
		
		public var _fnt_lv:FontField;
		public var _fnt_jianshedu:FontField;
		public var _fnt_shengjiexp:FontField;
		public var _fnt_fenshu:FontField;
		public var _fnt_costgongxian:FontField;
		public var _fnt_zongganxian:FontField;
		public var _fnt_money:FontField;
		public var _fnt_cash:FontField;
		public var _fnt_canbai_time:FontField;
		
		public function GuangongdianWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(window_guangongdian);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_jiangliyulan=new Button(windowMaterial.btn_jiangliyulan);
			_btn_canbai=new Button(windowMaterial.btn_canbai);
			
			_fnt_lv=new FontField(windowMaterial.fnt_lv);
			_fnt_jianshedu=new FontField(windowMaterial.fnt_jianshedu);
			_fnt_shengjiexp=new FontField(windowMaterial.fnt_shengjiexp);
			_fnt_fenshu=new FontField(windowMaterial.fnt_fenshu);
			_fnt_costgongxian=new FontField(windowMaterial.fnt_costgongxian);
			_fnt_zongganxian=new FontField(windowMaterial.fnt_zongganxian);
			_fnt_money=new FontField(windowMaterial.fnt_money);
			_fnt_cash=new FontField(windowMaterial.fnt_cash);
			_fnt_canbai_time=new FontField(windowMaterial.fnt_canbai_time);
		}
		private function destoryMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_jiangliyulan){_btn_jiangliyulan.destory();_btn_jiangliyulan=null;};
			if(_btn_canbai){_btn_canbai.destory();_btn_canbai=null;};
			
			if(_fnt_lv){_fnt_lv.destory();_fnt_lv=null;};
			if(_fnt_jianshedu){_fnt_jianshedu.destory();_fnt_jianshedu=null;};
			if(_fnt_shengjiexp){_fnt_shengjiexp.destory();_fnt_shengjiexp=null;};
			if(_fnt_fenshu){_fnt_fenshu.destory();_fnt_fenshu=null;};
			if(_fnt_costgongxian){_fnt_costgongxian.destory();_fnt_costgongxian=null;};
			
			if(_fnt_zongganxian){_fnt_zongganxian.destory();_fnt_zongganxian=null;};
			if(_fnt_money){_fnt_money.destory();_fnt_money=null;};
			if(_fnt_cash){_fnt_cash.destory();_fnt_cash=null;};
			if(_fnt_canbai_time){_fnt_canbai_time.destory();_fnt_canbai_time=null;};
		}
		public override function destory():void
		{
			destoryMc();
			super.destory();
		}
		private function get windowMaterial():window_guangongdian 
		{
			return _scene as window_guangongdian; 
		}
	}
}
