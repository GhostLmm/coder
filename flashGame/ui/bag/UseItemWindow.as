package ui.bag
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class UseItemWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_desc:FontField;
		public var _btn_chushou:Button;
		public var _btn_shiyong:Button;
		public function UseItemWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowUseItem);
			
			var mc:WindowUseItem=_scene;
			_btn_close=new Button(mc.btn_close);
			_fnt_desc=new FontField(mc.fnt_desc);
			_btn_chushou=new Button(mc.btn_chushou);
			_btn_shiyong=new Button(mc.btn_shiyong);
		}
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			if(_btn_chushou) {_btn_chushou.destory(); _btn_chushou=null;}
			if(_btn_shiyong) {_btn_shiyong.destory(); _btn_shiyong=null;}
			super.destory();
		}
	}
}