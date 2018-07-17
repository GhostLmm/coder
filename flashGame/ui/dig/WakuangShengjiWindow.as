package ui.dig
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class WakuangShengjiWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _fnt_money_num:FontField;
		public var _btn_shengji:Button;
		public var _fnt_shengji_desc:FontField;
		
		public var _shouyiMC1:MCWakuangShengjiShouyi;
		public var _shouyiMC2:MCWakuangShengjiShouyi;
		
		public var _mc_item:MovieClip;
		public var _pos_item:Position;
		public var _fnt_item_num:FontField;
		
		public function WakuangShengjiWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText(WindowWakuangShengji);
			var mc:WindowWakuangShengji=_scene;
			
			_btn_close=new Button(mc.btn_close);
			_fnt_money_num=new FontField(mc.fnt_money_num);
			_btn_shengji=new Button(mc.btn_shengji);
			_fnt_shengji_desc=new FontField(mc.fnt_shengji_desc);
			
			_shouyiMC1=new MCWakuangShengjiShouyi(mc.mc_shouyi1);
			_shouyiMC2=new MCWakuangShengjiShouyi(mc.mc_shouyi2);
			
			_mc_item=mc.mc_item;
			_pos_item=new Position(_mc_item.pos_item);
			_fnt_item_num=new FontField(_mc_item.fnt_item_num);
			
		}
		
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_fnt_money_num) {_fnt_money_num.destory(); _fnt_money_num=null;}
			if(_fnt_shengji_desc) {_fnt_shengji_desc.destory(); _fnt_shengji_desc=null;}
			if(_shouyiMC1) {_shouyiMC1.destory(); _shouyiMC1=null;}
			if(_shouyiMC2) {_shouyiMC2.destory(); _shouyiMC2=null;}
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
			if(_fnt_item_num) {_fnt_item_num.destory(); _fnt_item_num=null;}
			_mc_item=null;
			super.destory();
		}
	}
}