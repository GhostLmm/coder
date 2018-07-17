package ui.equip
{
	import flash.display.MovieClip;
	
	import ui.DoubleSeparationWindow;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontScroll;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class EquipChuandaiWindow extends DoubleSeparationWindow
	{
		public var _btn_close:Button;
		
//		public var _mc_touxiang:MovieClip;
		public var _equipItem:Item_Equip;
		
		public var _fnt_dengjixianzhi:FontField;
		
		
		public var _equipAttrBar1:EquipShuxingBar;
		public var _equipAttrBar2:EquipShuxingBar;
		
		public var _equipAttrBars:Array;
		
		public var _btn_chuandai:Button;
		
		public var _equipNbMc:EquipNBMC;
		
		public function EquipChuandaiWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText(WindowEquipChuandai);
			
			var mc:MovieClip=_scene.mc_left;
			_btn_close=new Button(mc.btn_close);
			_equipItem=new Item_Equip(mc.mc_touxiang);
			_fnt_dengjixianzhi=new FontField(mc.fnt_dengjixianzhi);
			
			_equipAttrBar1=new EquipShuxingBar(mc.mc_shuxing1);
			_equipAttrBar2=new EquipShuxingBar(mc.mc_shuxing2);
			
			_equipAttrBars=[_equipAttrBar1,_equipAttrBar2];
			
			_btn_chuandai=new Button(mc.btn_chuandai);
			_equipNbMc=new EquipNBMC(_scene.mc_right);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_equipItem) {_equipItem.destory(); _equipItem=null;}
			if(_fnt_dengjixianzhi) {_fnt_dengjixianzhi.destory(); _fnt_dengjixianzhi=null;}
			if(_equipAttrBar1) {_equipAttrBar1.destory(); _equipAttrBar1=null;}
			if(_equipAttrBar2) {_equipAttrBar2.destory(); _equipAttrBar2=null;}
			if(_btn_chuandai) {_btn_chuandai.destory(); _btn_chuandai=null;}
			if(_equipNbMc) {_equipNbMc.destory();_equipNbMc=null;}
			_equipAttrBars=null;
			super.destory();
		}
	}
}