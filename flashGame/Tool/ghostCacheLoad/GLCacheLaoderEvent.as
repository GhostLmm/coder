package Tool.ghostCacheLoad
{
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	public class GLCacheLaoderEvent extends Event
	{
		public function GLCacheLaoderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var data:ByteArray;
		
		/**  加载完成时触发
		 * */ 
		public static const COMPLETE:String="glCacheComplete";
		/**   出现加载错误的时候触发
		 * */
		public static const NETERROR:String="glCacheNeterror";
		/**  重新设置哈希值的时候会触发
		 * */
		public static const FORCESTOP:String="glCacheForcestop";
	}
}