package ui.shezhi
{
	import flash.display.MovieClip;
	
	import ui.widget.Button;
	import ui.widget.InputField;
	import ui.window._WindowBase;
	public class CdKeyWindow extends _WindowBase
	{
		
		public var _btn_close:Button;
		public var _fnt_shuru_cdkey:InputField
		public var _btn_queding:Button;
		public var _btn_zhantie:Button;
		
		public function CdKeyWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowCdkey); 
			this.addChild(_scene);
			var wm:flash.display.MovieClip=_scene; 
			_btn_close=new Button(wm.btn_close);
			_fnt_shuru_cdkey=new InputField(wm.fnt_shuru_cdkey);
			_btn_queding=new Button(wm.btn_queding);
			
			_btn_zhantie=new Button(wm.btn_zhantie);
		}
		
		public override function destory():void{
			if(_btn_close) {_btn_close.destory(); _btn_close=null;}
			if(_fnt_shuru_cdkey) {_fnt_shuru_cdkey.destory(); _fnt_shuru_cdkey=null;}
			if(_btn_queding) {_btn_queding.destory(); _btn_queding=null;}
			if(_btn_zhantie) {_btn_zhantie.destory();_btn_zhantie=null;}
			super.destory();
		}
		
		
	}
}
