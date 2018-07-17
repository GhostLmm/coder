package ui.chongzhi
{
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class ShouchongWindow extends _WindowBase
	{
		public var _btn_close:Button;
		private var _pos_jiangli:Position;
		public var _scr_jiangli:ScrollControllerMax;
		public var _btn_chongzhi:ButtonMax;
		public function ShouchongWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowShouchong);
			
			var mc:WindowShouchong=_scene;
			_btn_close=new Button(mc.btn_close);
			_pos_jiangli=new Position(mc.pos_jiangli);
			_scr_jiangli=new ScrollControllerMax(_pos_jiangli,ScrollControllerMax.HORIZONTAL);
			_btn_chongzhi=new ButtonMax(mc.btn_chongzhi);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_pos_jiangli) {_pos_jiangli.destory(); _pos_jiangli=null;}
			if(_scr_jiangli) {_scr_jiangli.destory(); _scr_jiangli=null;}
			if(_btn_chongzhi) {_btn_chongzhi.destory(); _btn_chongzhi=null;}
			super.destory();
		}
	}
}