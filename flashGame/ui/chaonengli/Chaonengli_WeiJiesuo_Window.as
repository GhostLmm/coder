package ui.chaonengli
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class Chaonengli_WeiJiesuo_Window extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_jiesuo:Button;
		
		public var _fnt_nengli_name:FontField;
		public var _fnt_need_lv:FontField;
		public var _fnt_add_nengli:FontField;
		public var _fnt_nengli_desc:FontField;		
		public var _fnt_needstar_num:FontField;
		public var _fnt_needmoney_num:FontField;
		
		public var _pos_skill:Position;
		public var _pos_xingxing_item:Position;
		public var _pos_jinbi_item:Position;
		public var _pos_item:Position;
		public var _scroller:ScrollControllerMax;
		

		
		public function Chaonengli_WeiJiesuo_Window(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(wnd_nengli_weijiesuo);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_jiesuo=new Button(windowMaterial.btn_jiesuo);
			
			_fnt_nengli_name=new FontField(windowMaterial.fnt_nengli_name);
			_fnt_need_lv=new FontField(windowMaterial.fnt_need_lv);
			_fnt_add_nengli=new FontField(windowMaterial.fnt_add_nengli);
			_fnt_nengli_desc=new FontField(windowMaterial.fnt_nengli_desc);
			_fnt_needstar_num=new FontField(windowMaterial.fnt_needstar_num);
			_fnt_needmoney_num=new FontField(windowMaterial.fnt_needmoney_num);
			
			_pos_skill=new Position(windowMaterial.pos_skill);
			_pos_xingxing_item=new Position(windowMaterial.pos_xingxing_item);
			_pos_jinbi_item=new Position(windowMaterial.pos_jinbi_item);
			_pos_item=new Position(windowMaterial.pos_item);
			
			_scroller=new ScrollControllerMax(_pos_item,ScrollControllerMax.HORIZONTAL);
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_jiesuo){_btn_jiesuo.destory();_btn_jiesuo=null;};
			
			if(_fnt_nengli_name){_fnt_nengli_name.destory();_fnt_nengli_name=null;};
			if(_fnt_need_lv){_fnt_need_lv.destory();_fnt_need_lv=null;};
			if(_fnt_add_nengli){_fnt_add_nengli.destory();_fnt_add_nengli=null;};
			if(_fnt_nengli_desc){_fnt_nengli_desc.destory();_fnt_nengli_desc=null;};
			if(_fnt_needstar_num){_fnt_needstar_num.destory();_fnt_needstar_num=null;};
			if(_fnt_needmoney_num){_fnt_needmoney_num.destory();_fnt_needmoney_num=null;};
			
			if(_pos_skill){_pos_skill.destory();_pos_skill=null;};
			if(_pos_xingxing_item){_pos_xingxing_item.destory();_pos_xingxing_item=null;};
			if(_pos_jinbi_item){_pos_jinbi_item.destory();_pos_jinbi_item=null;};
			if(_pos_item){_pos_item.destory();_pos_item=null;};
			
			if(_scroller){_scroller.destory();_scroller=null;};
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():wnd_nengli_weijiesuo
		{
			return _scene as wnd_nengli_weijiesuo;
		}
	}
}