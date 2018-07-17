package ui.baoshi
{
	import ui.widget.Button;
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class BaoshiTishiWindow extends _WindowBase
	{
		
		public static const OP_Zhuanbei:String="zhuangbei";
		public static const OP_Xiexia:String="xiexia";
		
		public var _btn_close:Button;
		public var _pos_item:Position;
		public var _fnt_name:FontField;
		public var _shuxingFntArray:Array;
		public var _btn_update:Button;
		public var _btn_xiangqian:ButtonMax;
		
		public function BaoshiTishiWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowBaoshiTishi);
			
			var mc:WindowBaoshiTishi=_scene;
			_btn_close=new Button(mc.btn_close);
			_pos_item=new Position(mc.pos_item);
			_fnt_name=new FontField(mc.fnt_name);
			
			_shuxingFntArray=[];
			for (var index:int=1; index<=2; index++){
				var fnt:FontField=new FontField(mc["fnt_shuxing"+index]);
				_shuxingFntArray.push(fnt);
			}
			
			_btn_update=new Button(mc.btn_queding);
			_btn_xiangqian=new ButtonMax(mc.btn_quxiao);
		}
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_pos_item) {_pos_item.destory(); _pos_item=null;}
			if(_fnt_name) {_fnt_name.destory(); _fnt_name=null;}
			if(_shuxingFntArray){
				for each(var ft:FontField in _shuxingFntArray){
					ft.destory();
				}
				_shuxingFntArray=null;
			}
			if(_btn_update) {_btn_update.destory(); _btn_update=null;}
			if(_btn_xiangqian) {_btn_xiangqian.destory(); _btn_xiangqian=null;}
			super.destory();
		}
	}
}