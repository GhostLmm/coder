package ui
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class AddMoneyWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_cishu:FontField;
		public var _fnt_num_cash:FontField;
		public var _fnt_num_money:FontField;
		public var _btn_goumai:Button;
		public function AddMoneyWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowAddMoney);
			
			var mc:WindowAddMoney=_scene;
			_btn_close=new Button(mc.btn_quxiao);
			_fnt_cishu=new FontField(mc.fnt_cishu);
			_fnt_num_cash=new FontField(mc.fnt_num_cash);
			_fnt_num_money=new FontField(mc.fnt_num_money);
			_btn_goumai=new Button(mc.btn_goumai);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_fnt_cishu) {_fnt_cishu.destory();_fnt_cishu=null;}
			if(_fnt_num_cash) {_fnt_num_cash.destory();_fnt_num_cash=null;}
			if(_fnt_num_money) {_fnt_num_money.destory();_fnt_num_money=null;}
			if(_btn_goumai) {_btn_goumai.destory();_btn_goumai=null;}
			super.destory();
		}
	}
}