package ui.digWindow
{
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import ui.widget.ButtonMax;
	import ui.widget.FontField;
	import ui.window._WindowBase;
	
	public class AlertWindow extends _WindowBase
	{
		public var _fnt_desc:FontField;
		public var _btn_queding:ButtonMax;
		public var _btn_quxiao:ButtonMax;
		public function AlertWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(WindowJinggao);
			
			var wm:WindowJinggao=_scene;
			_fnt_desc=new FontField(wm.fnt_desc);
			_btn_queding=new ButtonMax(wm.btn_queding);
			_btn_quxiao=new ButtonMax(wm.btn_quxiao);
			
			_btn_queding.addEventListener(TqtEvent.BUTTON_CLICK,onQueding);
			_btn_quxiao.addEventListener(TqtEvent.BUTTON_CLICK,onQiuxiao);
			
			if(params){
				if(params.desc){
					_fnt_desc.text=params.desc;
				}
			}
		}
		private function onQueding(evt:Event):void{
			if(_params && _params.okFn){
				(_params.okFn as Function).apply(null,_params.okArgs);
			}
			close();
		}
		private function onQiuxiao(evt:Event):void{
			if(_params && _params.cancelFn){
				(_params.cancelFn as Function).apply(null,_params.cancelArgs);
			}
			close();
		}
		
		public override function destory():void
		{
			if(_fnt_desc) {_fnt_desc.destory();_fnt_desc=null;}
			if(_btn_queding) {_btn_queding.destory();_btn_queding.removeEventListener(TqtEvent.BUTTON_CLICK,onQueding);_btn_queding=null;}
			if(_btn_quxiao) {_btn_quxiao.destory();_btn_quxiao.removeEventListener(TqtEvent.BUTTON_CLICK,onQiuxiao);_btn_quxiao=null;}
			super.destory();
		}
	}
}