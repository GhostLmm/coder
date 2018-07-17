package ui.chaonengli
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class ChaonengliJinhuaWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_jiesuo:Button;
		
		public var _fnt_needstar_num:FontField;
		public var _fnt_needmoney_num:FontField;
		
		public var _pos_xingxing_item:Position;
		public var _pos_jinbi_item:Position;
		public var _pos_item:Position;
		public var _scroller:ScrollControllerMax;
		
		
		
		public function ChaonengliJinhuaWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowChaonenglijinhua);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_jiesuo=new Button(windowMaterial.btn_jiesuo);
			
			_fnt_needstar_num=new FontField(windowMaterial.fnt_needstar_num);
			_fnt_needmoney_num=new FontField(windowMaterial.fnt_needmoney_num);
			
			_pos_xingxing_item=new Position(windowMaterial.pos_xingxing_item);
			_pos_jinbi_item=new Position(windowMaterial.pos_jinbi_item);
			_pos_item=new Position(windowMaterial.pos_item);
			
			_scroller=new ScrollControllerMax(_pos_item,ScrollControllerMax.HORIZONTAL);
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_jiesuo){_btn_jiesuo.destory();_btn_jiesuo=null;};
			
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
		private function get windowMaterial():WindowChaonenglijinhua
		{
			return _scene as WindowChaonenglijinhua;
		}
	}
}