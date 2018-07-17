package ui.equip
{
	import flash.display.MovieClip;
	
	import ui.DoubleSeparationWindow;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class EquipOpenWindow extends DoubleSeparationWindow
	{
		public var _btn_close:Button;
		public var _itemEquip:Item_Equip;
		public var _btn_qianghua:Button;
		public var _btn_shengxing:Button;
		public var _btn_xiangqian:Button;
	
		public var _btn_xiexia:Button;
		
		public var _fnt_dengjixianzhi:FontField;
		
		public var _equipShuxinBars:Array;
		
		public var equipNbMc:EquipNBMC;
		
		
		public function EquipOpenWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowEquipOpen);
			
			var mc:MovieClip=_scene.mc_left;
			_btn_close=new Button(mc.btn_close);
			_itemEquip=new Item_Equip(mc.mc_equip);
			_btn_qianghua=new Button(mc.btn_qianghua);
			_btn_shengxing=new Button(mc.btn_shengxing);
			_btn_xiangqian=new Button(mc.btn_xiangqian);

			_btn_xiexia=new Button(mc.btn_xiexia);
			
			equipNbMc=new EquipNBMC(_scene.mc_right);

			_fnt_dengjixianzhi=new FontField(mc.fnt_dengjixianzhi);
			_equipShuxinBars=[];
			for(var index:int=1; index<=2; index++){
				var bar:EquipShuxingBar=new EquipShuxingBar(mc["mc_shuxing"+index]);
				_equipShuxinBars.push(bar);
			}
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_itemEquip) {_itemEquip.destory();_itemEquip=null;}
			if(_btn_qianghua) {_btn_qianghua.destory();_btn_qianghua=null;}
			if(_btn_shengxing) {_btn_shengxing.destory();_btn_shengxing=null;}
			if(_btn_xiangqian) {_btn_xiangqian.destory();_btn_xiangqian=null;}

			if(_btn_xiexia) {_btn_xiexia.destory();_btn_xiexia=null;}
			if(equipNbMc) {equipNbMc.destory(); equipNbMc=null;}

			if(_fnt_dengjixianzhi) {_fnt_dengjixianzhi.destory();_fnt_dengjixianzhi=null;}
			if(_equipShuxinBars){
				for each(var bar:EquipShuxingBar in _equipShuxinBars){
					bar.destory();
				}
				_equipShuxinBars=null;
			}
			super.destory();
		}
	}
}