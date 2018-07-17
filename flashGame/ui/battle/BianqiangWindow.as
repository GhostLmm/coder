package ui.battle
{
	import ui.widget.Button;
	import ui.window._WindowBase;
	
	public class BianqiangWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_choujiang:Button;
		public var _btn_qianghua:Button;
		public var _btn_shengxing:Button;
		public var _btn_xiangqian:Button;
		public var _btn_chaonengli:Button;
		public function BianqiangWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBianqiang);
			
			var mc:WindowBianqiang=_scene;
			_btn_close=new Button(mc.btn_close);
			_btn_choujiang=new Button(mc.btn_choujiang);
			_btn_qianghua=new Button(mc.btn_qianghua);
			_btn_shengxing=new Button(mc.btn_shengxing);
			_btn_xiangqian=new Button(mc.btn_xiangqian);
			_btn_chaonengli=new Button(mc.btn_chaonengli);
			
		}
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_btn_choujiang) {_btn_choujiang.destory(); _btn_choujiang=null;}
			if(_btn_qianghua) {_btn_qianghua.destory(); _btn_qianghua=null;}
			if(_btn_shengxing) {_btn_shengxing.destory(); _btn_shengxing=null;}
			if(_btn_xiangqian) {_btn_xiangqian.destory(); _btn_xiangqian=null;}
			if(_btn_chaonengli) {_btn_chaonengli.destory(); _btn_chaonengli=null;}
			super.destory();
		}
	}
}