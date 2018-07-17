package ui.choujiang
{
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	
	public class DanchouWindow extends _WindowBase
	{
		public var _btn_fanhui:Button;
		public var _btn_zaichouyici:Button;
		public var _pos_cost:Position;
		public var _fnt_cost:FontField;
		public var _pos_baoxiang:Position;
		public var _pos_item:Position;
		
		public function DanchouWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowChouyici);
			initModule();
		}
		private function initModule():void
		{
			_btn_fanhui=new Button(windowMaterial.btn_fanhui);
			_btn_zaichouyici=new Button(windowMaterial.btn_zaichouyici);
			_pos_cost=new Position(windowMaterial.pos_cost);
			_fnt_cost=new FontField(windowMaterial.fnt_cost);
			_pos_baoxiang=new Position(windowMaterial.pos_baoxiang);
			_pos_item=new Position(windowMaterial.pos_item);
		}
		private function destroyMc():void
		{
			if(_btn_fanhui){_btn_fanhui.destory();_btn_fanhui=null;};
			if(_btn_zaichouyici){_btn_zaichouyici.destory();_btn_zaichouyici=null;};
			if(_pos_cost){_pos_cost.destory();_pos_cost=null;};
			if(_fnt_cost){_fnt_cost.destory();_fnt_cost=null;};
			if(_pos_baoxiang){_pos_baoxiang.destory();_pos_baoxiang=null;};
			if(_pos_item){_pos_item.destory();_pos_item=null};
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():WindowChouyici
		{
			return _scene as WindowChouyici;
		}
	}
}