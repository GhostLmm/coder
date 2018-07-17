package com.ghostlmm.lightMVC
{
	import com.ghostlmm.lightMVC.api.ICommandMap;
	import com.ghostlmm.lightMVC.api.IInjector;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.ghostlmm.lightMVC.api.IMediatorMap;
	import com.ghostlmm.lightMVC.api.IModelMap;
	import com.ghostlmm.lightMVC.impl.CommandMap;
	import com.ghostlmm.lightMVC.impl.Logger;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.lightMVC.impl.MediatorMap;
	import com.ghostlmm.lightMVC.impl.ModelMap;
	import com.ghostlmm.lightMVC.impl.MyInjector;
	import com.ghostlmm.lightMVC.impl.SwiftInjector;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class Context
	{
		
		private var _inject:IInjector;
		private var _coreDispatcher:IEventDispatcher;
		private var _commandMap:ICommandMap;
		private var _mediatorMap:IMediatorMap;
		private var _modelMap:IModelMap;
		private var _logger:ILogger;
		private var _viewDispatcher:ViewDispatcher;
		
		public function Context()
		{
			if(_instance!=null){
				return ;
			}
			_inject=new MyInjector();
//			_inject.map(IInjector).toValue(_inject);
			_inject.mapSingletonValue(IInjector,_inject);
			
			
			_coreDispatcher=new EventDispatcher();
//			_inject.map(IEventDispatcher).toValue(_coreDispatcher);
			_inject.mapSingletonValue(IEventDispatcher,_coreDispatcher);
//			_inject.map(ILogger).toSingleton(Logger);
			_inject.mapSingleton(ILogger,Logger);
//			_inject.map(Context).toValue(this);
			_inject.mapSingletonValue(Context,this);
			
			
//			_inject.map(ICommandMap).toValue(new CommandMap(_inject));
			_inject.mapSingletonValue(ICommandMap,new CommandMap(_inject));
//			_mediatorMap=new MediatorMap();
//			_inject.map(IMediatorMap).toSingleton(MediatorMap);
//			_inject.mapSingleton(IMediatorMap,MediatorMap);
			_inject.mapSingletonValue(IMediatorMap,new MediatorMap(_inject));
//			_inject.map(IModelMap).toValue(new ModelMap(_inject));
			_inject.mapSingletonValue(IModelMap,new ModelMap(_inject));
			_viewDispatcher=ViewDispatcher.getInstance();
			
//			_inject.map(ViewDispatcher).toValue(_viewDispatcher);
			_inject.mapSingletonValue(ViewDispatcher,_viewDispatcher);
			
			_logger=_inject.createInstance(ILogger);
			_coreDispatcher=_inject.createInstance(IEventDispatcher);
			_commandMap=_inject.createInstance(ICommandMap);
			_mediatorMap=_inject.createInstance(IMediatorMap);
			_modelMap=_inject.createInstance(IModelMap);
			_instance=this;
		}
		
		public function checkMediatorClear():void
		{
			(mediatorMap as MediatorMap).checkMap();
		}
		
		public static var logLevel:uint=32;
		
		public static function init():void
		{
			Context.getInsance();
		}
		
		private static var _instance:Context;
		
		public static function getInsance():Context
		{
			if(_instance==null){
				_instance=new Context();
			}
			return _instance;
		}
		
		public function get viewDispatcher():ViewDispatcher
		{
			return _viewDispatcher;
		}
		
		public function get logger():ILogger
		{
			return _logger;
		}
		public function get mediatorMap():IMediatorMap
		{
			return _mediatorMap;
		}
		public function get commandMap():ICommandMap
		{
			return _commandMap;
		}
		public function get coreDispatcher():IEventDispatcher
		{
			return _coreDispatcher;
		}
		public function get modelMap():IModelMap
		{
			return _modelMap;
		}
		public function get inject():IInjector
		{
			return _inject;
		}
		
		public static function getInjectInstance(cls:Class):*
		{
			if(_instance._inject.hasMapping(cls)){
				return Context._instance._inject.getInstance(cls);
			}
			return null;
		}
		
	}
}