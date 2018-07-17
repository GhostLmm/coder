package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.api.ICommand;
	import com.ghostlmm.lightMVC.api.ICommandMap;
	import com.ghostlmm.lightMVC.api.IInjector;
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	public class CommandMap implements ICommandMap
	{	
		private var _inject:IInjector;
		private var _coreDispatcher:IEventDispatcher;
		private var _evtMap:EventMap;
		private var _commandDic:Dictionary;
		public function CommandMap($inject:IInjector)
		{
			_inject=$inject;
			_coreDispatcher=_inject.getInstance(IEventDispatcher);
			_evtMap=new EventMap();
			_commandDic=new Dictionary();
		}
		
		public function map(evtName:String,evtType:Class,commandType:Class,once:Boolean=false):void
		{
			_commandDic[getDescString(evtName,evtType)]={ct:commandType,once:once};
			_evtMap.mapListener(_coreDispatcher,evtName,listener,evtType);
		}
		
		private function listener(evt:Event):void
		{
			var desc:String=getDescString(evt.type,evt["constructor"]);
			var obj:Object=_commandDic[desc];
			if(obj!=null){
				
				_inject.mapSingletonValue(evt["constructor"],evt);
				_inject.mapSingleton(obj.ct,obj.ct);
				var command:ICommand=_inject.createInstance(obj.ct);
				command.excute();
				_inject.unmap(obj.ct);
				_inject.unmap(evt["constructor"]);
				if(obj.once){
					unmap(evt.type,evt["constructor"]);
				}
			}
		}
		
		private static function getDescString(evtName:String,evtType:Class):String
		{
			return evtName+"$"+evtType;
		}
		public function unmap(evtName:String,evtType:Class):void
		{
			var desc:String=getDescString(evtName,evtType);
			var obj:Object=_commandDic[desc];
			if(obj){
				_evtMap.unmapListener(_coreDispatcher,evtName,listener,evtType);
//				obj.ct=null;
				delete _commandDic[desc];
			}
			
		}
		
	}
}