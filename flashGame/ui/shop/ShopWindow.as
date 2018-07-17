package ui.shop
{
	import ui.widget.Button;
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class ShopWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_tag1:Button;
		public var _btn_tag2:Button;
		public var _btn_tag3:Button;
		
		public var _scn_money:NumFontScroll;
		public var _scn_cash:NumFontScroll;
		
		public var _pos_shop:Position;
		
		public function ShopWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowShop);
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_tag1=new Button(windowMaterial.btn_tag1);
			_btn_tag2=new Button(windowMaterial.btn_tag2);
			_btn_tag3=new Button(windowMaterial.btn_tag3);
			_scn_money=new NumFontScroll(windowMaterial.scn_money);
			_scn_cash=new NumFontScroll(windowMaterial.scn_cash);
			_pos_shop=new Position(windowMaterial.pos_shop);
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_tag1){_btn_tag1.destory();_btn_tag1=null;};
			if(_btn_tag2){_btn_tag2.destory();_btn_tag2=null;};
			if(_btn_tag3){_btn_tag3.destory();_btn_tag3=null;};
			if(_scn_money){_scn_money.destory();_scn_money=null;};
			if(_scn_cash){_scn_cash.destory();_scn_cash=null;};
			if(_pos_shop){_pos_shop.destory();_pos_shop=null;};
		}
		
		protected override function beforeOpen():void{
			Music.playFX(Music.FX_shop);
			super.beforeOpen();
		}
		
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():WindowShop
		{
			return _scene as WindowShop;
		}
	}
}