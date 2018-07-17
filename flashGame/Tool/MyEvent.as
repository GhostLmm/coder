package Tool
{
	import flash.events.Event;

	/**
	 * 自定义事件类
	 *@author 锋
	 *@version 1.0.0
	 *@创建时间:2012-10-25 下午4:56:41
	 * */
	public class MyEvent extends Event
	{
		/**
		 *	秒时间事件
		 */		
		public static const TICKEVENT:String = "tickEvent";
		
		/**
		 *	事件中携带的数据 
		 */		
		private var m_data:Object;
		
		/**
		 *	实例化自定义事件 
		 * @param type 事件类型
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function MyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 *	 
		 * @return 获取事件中携带的数据
		 * 
		 */		
		public function get data():Object
		{
			return m_data;
		}
		
		/**
		 * 
		 * @param _data 设置事件中携带的数据
		 * 
		 */		
		public function set data(_data:Object):void
		{
			m_data = _data;
		}
	}
}