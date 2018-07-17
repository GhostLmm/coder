package ui.shop
{
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.window._WindowBase;
	
	public class RongyuchakanWindow extends _WindowBase
	{
		public var _btn_close:Button;
		
		public var _fnt_name:FontField;
		public var _fnt_desc:FontField;
		
		public var _pos_image:Position;
		public var _pos_cailiaodiaoluo:Position;
		
		public var _scrollController:ScrollControllerMax;
		
		public function RongyuchakanWindow(params:Object=null)
		{
			super(params);
			
			_scene=AssetManager.createMCForText(WindowHuodeTujing);
			
			var mc:WindowHuodeTujing=_scene;
			_btn_close=new Button(mc.btn_close);
			_fnt_name=new FontField(mc.fnt_name);
			_fnt_desc=new FontField(mc.fnt_desc);
			_pos_image=new Position(mc.pos_xiangqian);
			_pos_cailiaodiaoluo=new Position(mc.pos_scroll_fuben);
			_scrollController=new ScrollControllerMax(_pos_cailiaodiaoluo);
		}
		
		public override function destory():void{
			if(_btn_close){_btn_close.destory();_btn_close=null;};
			
			if(_fnt_name){_fnt_name.destory();_fnt_name=null;};
			if(_fnt_desc){_fnt_desc.destory();_fnt_desc=null;};
			
			if(_pos_image){_pos_image.destory();_pos_image=null;};
			if(_pos_cailiaodiaoluo){_pos_cailiaodiaoluo.destory();_pos_cailiaodiaoluo=null;};
			
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			super.destory();
		}
	}
}