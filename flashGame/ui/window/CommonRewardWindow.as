package ui.window
{	
	import ui.widget.Button;
	import ui.widget.FontField;
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;

	public class CommonRewardWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_queding:Button;
		
		private var _pos_scroll_jiangli:Position;
		
		public var _fnt_desc:FontField;
//		public var _fnt_title:FontField;
		public var _scroll_jiangli:ScrollControllerMax;
		
		public function CommonRewardWindow(params:Object=null)
		{
			super(params);
			_scene=new (AssetManager.getAssetClass("WindowReward") as Class)(); 
			_btn_close = new Button(_scene.btn_close);
			_btn_queding = new Button(_scene.btn_queding);
			_pos_scroll_jiangli=new Position(_scene.pos_scroll_reward);
			_scroll_jiangli=new ScrollControllerMax(_pos_scroll_jiangli,ScrollControllerMax.HORIZONTAL);
			_fnt_desc=new FontField(_scene.fnt_desc);
//			_fnt_title=new FontField(_scene.fnt_title);
		}
		public override function destory():void
		{
			if(_btn_close){_btn_close.destory();_btn_close=null};
			if(_btn_queding){_btn_queding.destory();_btn_queding=null};
			if(_pos_scroll_jiangli){_pos_scroll_jiangli.destory();_pos_scroll_jiangli=null};
			if(_scroll_jiangli){_scroll_jiangli.destory();_scroll_jiangli=null};
			if(_fnt_desc){_fnt_desc.destory();_fnt_desc=null;}
//			if(_fnt_title) {_fnt_title.destory();_fnt_title=null;}
			super.destory();
		}
	}
}
