package ui.jinkuang
{
	import flash.geom.Point;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollController;
	import ui.window._WindowBase;

	public class JinkuangWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_lingqu:Button;
		public var _fnt_name:FontField;
		public var _pos_jinkuang:Position;
		public var _scroller:ScrollController
		
		public function JinkuangWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowJinkuang);
			adjustPos();
			initModule();
		}
		private function initModule():void
		{
			_btn_close=new Button(windowMaterial.btn_close);
			_btn_lingqu=new Button(windowMaterial.btn_lingqu);
			_fnt_name=new FontField(windowMaterial.fnt_name);
			_pos_jinkuang=new Position(windowMaterial.pos_jinkuang);
			_scroller=new ScrollController(_pos_jinkuang,ScrollController.HORIZONTAL);
			_pos_jinkuang.removeChildren();
			_pos_jinkuang.addChild(_scroller);
		}
		private function adjustPos():void
		{
			var posPoint:Point=new Point(GlobalRef.width/2-windowMaterial.btn_close.width-10,-GlobalRef.height/2+10);
			var target:Point=globalToLocal(posPoint);
//			windowMaterial.btn_close.x=target.x;
//			windowMaterial.btn_close.y=target.y;
			
			posPoint=new Point(-GlobalRef.width/2+30,-GlobalRef.height/2+30);
			target=globalToLocal(posPoint);
			windowMaterial.btn_lingqu.x=target.x;
			windowMaterial.btn_lingqu.y=target.y;
		}
		private function destroyMc():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			if(_btn_lingqu){_btn_lingqu.destory();_btn_lingqu=null;};
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_pos_jinkuang){_pos_jinkuang.destory();_pos_jinkuang=null;};
			if(_scroller){_scroller.destory();_scroller=null;};
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():WindowJinkuang		{
			return _scene as WindowJinkuang;		}
		protected override function get isAdjustCloseBtn():Boolean
		{
			return true;
		}
	}
}
