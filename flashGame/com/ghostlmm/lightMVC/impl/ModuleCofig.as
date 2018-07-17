package com.ghostlmm.lightMVC.impl
{
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.api.ICommandMap;
	import com.ghostlmm.lightMVC.api.ILogger;
	import com.ghostlmm.lightMVC.api.IMediatorMap;
	import com.ghostlmm.lightMVC.api.IModelMap;
	import com.ghostlmm.lightMVC.api.IModuleConfig;
	
	public class ModuleCofig implements IModuleConfig
	{
		private var _name:String;
		protected var modelMap:IModelMap;
		protected var mediatorMap:IMediatorMap;
		protected var logger:ILogger;
		protected var commandMap:ICommandMap;
		
		public function ModuleCofig($name:String)
		{
			_name=$name;
			modelMap=Context.getInsance().modelMap;
			mediatorMap=Context.getInsance().mediatorMap;
			logger=Context.getInsance().logger;
			commandMap=Context.getInsance().commandMap;
		}
		
//		public function get name():String
//		{
//			return _name;
//		}
		
		public function registerMVC():void
		{
			registerModel();
			registerMediator();
			regitserCommand();
		}
		
		public function unRegisterMVC():void
		{
			unRegisterCommand();
			unRegisterMediator();
			unRegisterModel();
		}
		
		/**   注册model
		 * */
		protected function registerModel():void
		{
		}
		protected function registerMediator():void
		{
		}
		protected function regitserCommand():void
		{
		}
		
		protected function unRegisterCommand():void
		{
		}
		protected function unRegisterMediator():void
		{
		}
		protected function unRegisterModel():void
		{
		}
		/*
		protected override function registerModel():void
		{
		}
		protected override function registerMediator():void
		{
		}
		protected override function regitserCommand():void
		{
		}
		
		protected override function unRegisterCommand():void
		{
		}
		protected override function unRegisterMediator():void
		{
		}
		protected override function unRegisterModel():void
		{
		}
		*/
		
		public function destroy():void
		{
			modelMap=null;
			mediatorMap=null;
			commandMap=null;
			logger=null;
		}
	}
}