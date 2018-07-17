package com.ghostlmm.lightMVC
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.ghostlmm.lightMVC.api.IModuleConfig;
	
	import flash.utils.Dictionary;
	
	
	

	public class ModuleManager
	{
		private var _logger:ILogger;
		public function ModuleManager()
		{
			_logger=Context.getInsance().logger;
		}
		
		private static var _instance:ModuleManager;
		public static function getInstance():ModuleManager{
			if(_instance==null) _instance=new ModuleManager();
			return _instance;
		}
		
		private var clsDic:Dictionary=new Dictionary();
		private var moduleDic:Dictionary=new Dictionary();
		
		
		public function checkLoad($moduleName:String):Boolean
		{
			if(moduleDic[$moduleName]){
				return true;
			}
			return false;
		}
		
		public function loadmodule($moduleName:String):void
		{
			
			if(moduleDic[$moduleName])
			{
				_logger.debug("模块已经加载过了，重复加载： {0}",[$moduleName]);
				return ;
			}
			var cls:Class=clsDic[$moduleName];
			if(cls==null){
				_logger.error("模块类没有 : {0}",[$moduleName]);
				return ;
			}
			var module:IModuleConfig=new cls();
			module.registerMVC();
			moduleDic[$moduleName]=module;
			_logger.debug("模块注册完成： {0}",[$moduleName]);
		}
		
		public function unLoadmodule($moduleName:String):void
		{
			if(moduleDic[$moduleName]){
				(moduleDic[$moduleName] as IModuleConfig).unRegisterMVC();
				(moduleDic[$moduleName] as IModuleConfig).destroy();
				moduleDic[$moduleName] = null;
				delete moduleDic[$moduleName];
				
				_logger.debug("模块卸载完成： {0}",[$moduleName]);
				return ;
			}
			
		}
		
		//-----------------------------------------------------------
		//---------------  注册模块 类-----------------------------------
		//-------------------------------------------------------------
		
		
		public function registerModule($moduleName:String,$moduleClass:Class):void
		{
			clsDic[$moduleName]=$moduleClass;
		}
		
	}
}