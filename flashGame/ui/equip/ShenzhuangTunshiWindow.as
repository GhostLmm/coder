package ui.equip
{
	import flash.display.MovieClip;
	
	import ui.DoubleWindow;
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.NumFontStatic;
	import ui.widget.Position;
	import ui.widget.ProgressManager;
	import ui.widget.ProgressManagerMax;
	import ui.widget.ScrollControllerMax;
	import ui.widget.ScrollerControllerMatrix;
	import ui.window.DoubleSimpleWindow;
	import ui.window._WindowBase;
	
	public class ShenzhuangTunshiWindow extends DoubleSimpleWindow
	{
		
		public var _btn_close:Button;
		public var _equipAddItemArray:Array;
		public var _mainAddItem:EquipAddItemMc;
		public var _descFntArray:Array;
		public var _fnt_lv:FontField;
		
		private var _fnt_exp:NumFontStatic;
		
		public var _prg_exp:ProgressManagerMax;
		
		public var _btn_yijianxuanze:Button;
		public var _btn_tunshi:Button;
		
		private var _pos_scroll:Position;
		public var _scr_equip:ScrollerControllerMatrix;
		public function ShenzhuangTunshiWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText(WindowTunshi);
			
			var mc:WindowTunshi=_scene;
			var right:MovieClip=mc.mc_right;
			var left:MovieClip=mc.mc_left;
			
			_mainAddItem=new EquipAddItemMc(right.pos_main,0);
			_btn_close=new Button(right.btn_guanbi);
			_equipAddItemArray=[];
			for (var index:int=1; index<=6; index++){
				var addItem:EquipAddItemMc=new EquipAddItemMc(right["pos_"+index],index);
				_equipAddItemArray.push(addItem);
			}
			_descFntArray=[];
			for(var index:int=1; index<=2; index++){
				var ft:FontField=new FontField(right["fnt_desc"+index]);
				_descFntArray.push(ft);
			}
			_fnt_lv=new FontField(right.fnt_lv);
			
			_fnt_exp=new NumFontStatic(right.fnt_exp);
			_prg_exp=new ProgressManagerMax(right.prg_lv,_fnt_exp);
			_btn_yijianxuanze=new Button(right.btn_yijianxuanze);
			_btn_tunshi=new Button(right.btn_tunshi);
			
			_pos_scroll=new Position(left.pos_scroll);
			_scr_equip=new ScrollerControllerMatrix(_pos_scroll);
			
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_equipAddItemArray){
				for each(var addItem:EquipAddItemMc in _equipAddItemArray){
					addItem.destory();
				}
				_equipAddItemArray=null;
			}
			if(_descFntArray){
				for each(var ft:FontField in _descFntArray){
					ft.destory();
				}
				_descFntArray=null;
			}
			if(_fnt_lv) {_fnt_lv.destory(); _fnt_lv=null;}
			if(_fnt_exp) {_fnt_exp.destory(); _fnt_exp=null;}
			if(_prg_exp) {_prg_exp.destory(); _prg_exp=null;}
			if(_btn_yijianxuanze) {_btn_yijianxuanze.destory(); _btn_yijianxuanze=null;}
			if(_btn_tunshi) {_btn_tunshi.destory(); _btn_tunshi=null;}
			if(_pos_scroll) {_pos_scroll.destory(); _pos_scroll=null;}
			if(_scr_equip) {_scr_equip.destory(); _scr_equip=null;}
			if(_mainAddItem) {_mainAddItem.destory();_mainAddItem=null;}
			super.destory();
		}
		
		public function getAddItemByIndex(index:int):EquipAddItemMc{
			return _equipAddItemArray[index-1]; 
		}
	}
}