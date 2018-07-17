package Tool.platform
{
	import flash.events.Event;
	
	public class PlatformEvent extends Event
	{
		public function PlatformEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var data:Object;
		
		public static const GetItemDetailComplete:String="getItemDetailComplete";
		public static const ShareSuccess:String="shareSuccess";
		public static const ShareFail:String="shareFail";
		
		/**  充值成功后，返回的的事件， {}
		 * */
		public static const ChongziSuccess:String="chongziSuccess";
		
	}
}