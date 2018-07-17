package Tool.platform
{
	import com.ghostlmm.androidToolAne.AndroidToolHelper;
	import com.ghostlmm.androidToolAne.PhoneCallEvent;

	public class ListenerPhoneCall
	{
		public function ListenerPhoneCall()
		{
		}
		public static function startListener():void
		{
			AndroidToolHelper.instance.addEventListener(PhoneCallEvent.PhoneCallChange,onPhoneCall);
		}
		private function onPhoneCall(evt:PhoneCallEvent):void
		{
			if(evt.callState==1)
			{
				GameExitPlatform.exitGame();
			}
		}
	}
}