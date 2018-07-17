package ui.window
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.widget.Button;
	import ui.widget.FontField;

import flash.display.MovieClip
	public class JinggaoWindow extends _WindowBase
	{
		public var _btn_close:Button;
		public var _btn_queding:Button;
		public var _btn_quxiao:Button;
		public var _fnt_desc:FontField;
		
		private var _proxy:ListenerAddProxy;
		
		private var _listernArray:Array;
		
		private var _okFn:Function;
		private var _cancelFn:Function;
		private var _okArgs:Array;
		private var _cancelArgs:Array;
		
		
		public function JinggaoWindow(params:Object=null)
		{
			_proxy=new ListenerAddProxy();
			_listernArray=[];
			super(params);
			_scene = AssetManager.createMCForText(WindowJinggao);
			
			CONFIG::UseSwc{
				var wm:flash.display.MovieClip=_scene; 
			}
			CONFIG::UseSwf{
				var wm:MovieClip=_scene;
			}
			
			_btn_queding = new Button(wm.btn_queding);
			_btn_quxiao = new Button(wm.btn_quxiao);
			_fnt_desc = new FontField(wm.fnt_desc);
			
			_fnt_desc.text = params.data.msg;
			
			_proxy.addListener(_btn_queding,TqtEvent.BUTTON_CLICK,onOK,false,0,true);
			_proxy.addListener(_btn_quxiao,TqtEvent.BUTTON_CLICK,onCancel,false,0,true);
			
			_okArgs=params.data.okArgs;
			_okFn=params.data.okFn;
			_cancelArgs=params.data.cancelArgs;
			_cancelFn=params.data.cancelFn;
			WindowManager.currentAlert=this;
		}		
		private function onOK(evt:TqtEvent):void
		{
			if(_okFn!=null){
				_okFn.apply(null,_okArgs);
			}
//			PlayerGuideManager.getInstance().createFadeButtonClick("btn_queding");
			dispatchEvent(new TqtEvent(TqtEvent.ALERT_OK));
			close();
		}
		
		private function clearFn():void
		{
			_okArgs=null;
			_okFn=null;
			_cancelArgs=null;
			_cancelFn=null;
		}
		
		public override function destory():void{
			clearFn();
			if(_btn_queding) {_btn_queding.destory();_btn_queding=null;}
			if(_btn_quxiao) {_btn_quxiao.destory(); _btn_quxiao=null;}
			if(_btn_queding) {_btn_queding.destory(); _btn_queding=null;}
			if(_fnt_desc) {_fnt_desc.destory(); _fnt_desc=null;}
			if(_proxy) {_proxy.clear(); _proxy=null;}
			
			if(_listernArray){
				for each(var obj:Object in _listernArray){
					removeEventListener(obj.type,obj.listener,obj.useCapture);
				}
				_listernArray=null;
			}
			WindowManager.currentAlert=null;
			super.destory();
		}
		
		public override function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_listernArray.push({type:type, listener:listener,useCapture:useCapture,priority:priority,useWeakReference:useWeakReference});
			super.addEventListener(type,listener,useCapture,priority,useWeakReference);
		}
		
		private function onCancel(evt:TqtEvent):void
		{
			if(_cancelFn!=null){
				_cancelFn.apply(null,_cancelArgs);
			}
			dispatchEvent(new TqtEvent(TqtEvent.ALERT_CANCEL));
			close();
		}
	}
}
