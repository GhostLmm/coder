package ui.equip
{
	import flash.display.MovieClip;
	
	import ui.DoubleWindow;
	import ui.widget.Button;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	
	import view.module.LabelSwitch;
	
	public class EquipCaozuoWindow extends DoubleWindow
	{
		public static const LB_Bianqiang:String="bianqiang";
		public static const LB_Shengxin:String="shengxin";
		public static const LB_Xiangqian:String="xiangqian";
		public static const LB_Shengqi:String="shengqi";
		
		public static const LBArray:Array=[LB_Bianqiang,LB_Shengxin,LB_Xiangqian,LB_Shengqi];
		
		public var _btn_close:Button;
		private var _pos_man:Position;
		public var _scr_equip:ScrollControllerMax;
		private var _pos_panel:Position;
		private var _btnArray:Array;
		public var _labelSwitch:LabelSwitch;
		public var _panelClassArray:Array;
		
		public var _notOpenButton:Button;
		
		public function EquipCaozuoWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowEquipNew);
			
			var left:MovieClip=_scene.mc_left;
			var right:MovieClip=_scene.mc_right;
			
			_btn_close=new Button(right.btn_close);
			_pos_man=new Position(left.pos_scroll);
			_scr_equip=new ScrollControllerMax(_pos_man);
			
			_pos_panel=new Position(right.pos_scroll_bag);
			
			_btnArray=[];
			
			for(var index:int=1; index<=3; index++){
				var button:Button=new Button(right["btn_tag"+index]);
				_btnArray.push(button);
			}
			_notOpenButton=new Button(right.btn_tag4);
			_panelClassArray=[EquipBianqiangPanel,EquipShengxingPanel,EquipBaoshiPanel];
			_labelSwitch=new LabelSwitch(_pos_panel,_btnArray,_panelClassArray);
			
			
		}
		
		public override function destory():void{
			if(_pos_man) {_pos_man.destory(); _pos_man=null;}
			if(_scr_equip) {_scr_equip.destory(); _scr_equip=null;}
			if(_pos_panel) {_pos_panel.destory(); _pos_man=null;}
			if(_notOpenButton) {_notOpenButton.destory(); _notOpenButton=null;}
			if(_btnArray){
				for each(var btn:Button in _btnArray){
					btn.destory();
				}
				_btnArray=null;
			}
			if(_labelSwitch) {_labelSwitch.destory(); _labelSwitch=null;}
			super.destory();
		}
	}
}