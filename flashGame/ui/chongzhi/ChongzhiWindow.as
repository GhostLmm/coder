package ui.chongzhi
{
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollerControllerMatrix;
	import ui.window._WindowBase;
	
	public class ChongzhiWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_shouchong:Button;
		public var _btn_vip:Button;
		public var _pos_chongzhi:Position;
		public var _scr_chongzhi:ScrollerControllerMatrix;
		
		public function ChongzhiWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText(WindowChongzhi);
			
			var mc:WindowChongzhi=_scene;
			_btn_close=new Button(mc.btn_close);
			_btn_shouchong=new Button(mc.btn_shouchong);
			_btn_vip=new Button(mc.btn_vip);
			_pos_chongzhi=new Position(mc.pos_chongzhi);
			_scr_chongzhi=new ScrollerControllerMatrix(_pos_chongzhi);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_btn_shouchong) {_btn_shouchong.destory(); _btn_shouchong=null;}
			if(_btn_vip) {_btn_vip.destory(); _btn_vip=null;}
			if(_pos_chongzhi) {_pos_chongzhi.destory(); _pos_chongzhi=null;}
			if(_scr_chongzhi) {_scr_chongzhi.destory(); _scr_chongzhi=null;}
			super.destory();
		}
		
	}
}