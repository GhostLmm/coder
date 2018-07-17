package com.ghostlmm.lightMVC
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ViewDispatcher extends EventDispatcher
	{
		public function ViewDispatcher()
		{
			if(_instance)
			{
				throw new Error("ViewDispatcher 已经实例化了");
			}
			
		}
		
		private static var _instance:ViewDispatcher;
		public static function getInstance():ViewDispatcher
		{
			if(_instance==null) _instance=new ViewDispatcher();
			return _instance;
		}
	}
}