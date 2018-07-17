package Tool
{	
	import flash.events.EventDispatcher;

	/**
	 * 事件管理器
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-10-25 下午4:49:39
	 * */
	public class MyEventManager extends EventDispatcher
	{
		private static var m_instance:MyEventManager;
		public function MyEventManager()
		{
		}
		/**
		 * 
		 * @return MyEventManager单例
		 * 
		 */		
		public static function getInstance():MyEventManager
		{
			if(null==m_instance)
			{
				m_instance=new MyEventManager();
			}
			return m_instance;
		}
		/**
		 *	事件管理器派发事件 
		 * @param type 事件类型
		 * @param _data	事件中携带的数据
		 * 
		 */		
		public function dispatchMyEvent(type:String, _data:Object = null):void
		{
			var myEvent:MyEvent = new MyEvent(type);
			myEvent.data = _data;
			dispatchEvent(myEvent);
		}
	}
}