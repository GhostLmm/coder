package com.ghostlmm.tool
{
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	public class AsyExcute
	{
		private var _fn:Function;
		private var _arg:Object;
		private var _limitTime:int;
		private var _completeFn:Function;
		private var _time:int;
		public function AsyExcute($fn:Function,$completeFn:Function,$arg:Object,$limitTime:int)
		{
			_completeFn=$completeFn;
			_arg=$arg;
			_fn=$fn;
			_limitTime=$limitTime;
		}
		
		private function excute():void
		{
			_time=getTimer();
			while(true){
				if(_fn(_arg)){
					removeFn(this._fn,true);
					break;
				}else{
					if(getTimer()-_time>=_limitTime){
						break;
					}
				}
			}
		}
		
		private function excuteCompleteFn():void
		{
			if(_completeFn!=null){
				_completeFn(_arg);
			}
		}
		private function destory():void
		{
			_fn=null;
			_arg=null;
			_completeFn=null;
		}
		public static var asyDic:Dictionary;
		public static function initStage($stage:Stage):void
		{
			asyDic=new Dictionary();
			$stage.addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		private static function onFrame(evt:Event):void
		{
			for each(var asy:AsyExcute in asyDic){
				asy.excute();
			}
		}
		
		public static function excute(fn:Function,completeFn:Function,arg:Object,limitTime:int=20):void
		{
			if(asyDic[fn]!=null){
				trace("异步执行有问题");
			}
			var asy:AsyExcute=new AsyExcute(fn,completeFn,arg,limitTime);
			asyDic[fn]=asy;
			asy.excute();
		}
		
		public static function removeFn(fn:Function,complete:Boolean=false):void
		{
			var asy:AsyExcute=asyDic[fn];
			if(asy!=null)
			{
				asyDic[fn]=null;
				delete asyDic[fn];
				if(complete){
					asy.excuteCompleteFn();
				}
				asy.destory();
			}
		}
	}
}