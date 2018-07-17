package ui.equip
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.widget.ScrollerControllerMatrix;
	import ui.window.DoubleSimpleWindow;
	
	public class ChuanchengWindow extends DoubleSimpleWindow
	{
		public var _btn_close:Button;
		public var _chuanchengDescArray:Array;
		public var _fnt_money_num:FontField;
//		public var _pos_1:Position;
//		public var _pos_2:Position;
		
		public var sourceAddItem:EquipAddItemMc;
		public var targetAddItem:EquipAddItemMc;
		
		private var _pos_scroll:Position;
		public var _scr_equip:ScrollerControllerMatrix;
		
		public var _btn_chuancheng:Button;
		public function ChuanchengWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowChuancheng);
			
			var mc:WindowChuancheng=_scene;
			var left:MovieClip=mc.mc_left;
			var right:MovieClip=mc.mc_right;
			
			_btn_close=new Button(right.btn_close);
			_chuanchengDescArray=[];
			for(var index:int=1; index<=2; index++){
				var fnt:FontField=new FontField(right["fnt_desc_chuancheng"+index]);
				_chuanchengDescArray.push(fnt);
			}
			_fnt_money_num=new FontField(right.fnt_money_num);
			sourceAddItem=new EquipAddItemMc(right.pos_1);
			targetAddItem=new EquipAddItemMc(right.pos_2);
//			_pos_1=new Position(right.pos_1);
//			_pos_2=new Position(right.pos_2);
			
			
			_pos_scroll=new Position(left.pos_scroll);
			_scr_equip=new ScrollerControllerMatrix(_pos_scroll);
			
			_btn_chuancheng=new Button(right.btn_chuancheng);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory();_btn_close=null;}
			if(_fnt_money_num) {_fnt_money_num.destory();_fnt_money_num=null;}
//			if(_pos_1) {_pos_1.destory();_pos_1=null;}
//			if(_pos_2) {_pos_2.destory();_pos_2=null;}
			if(_pos_scroll) {_pos_scroll.destory();_pos_scroll=null;}
			if(_scr_equip) {_scr_equip.destory();_scr_equip=null;}
			if(_chuanchengDescArray){
				for each(var ft:FontField in _chuanchengDescArray){
					ft.destory();
				}
				_chuanchengDescArray=null;
			}
			if(sourceAddItem) {sourceAddItem.destory();sourceAddItem=null;}
			if(targetAddItem) {targetAddItem.destory();targetAddItem=null;}
			if(_btn_chuancheng) {_btn_chuancheng.destory(); _btn_chuancheng=null;}
			super.destory();
		}
		
		
	}
}