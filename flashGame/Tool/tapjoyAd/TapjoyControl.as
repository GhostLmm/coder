package Tool.tapjoyAd
{
	import com.tapjoy.extensions.TapjoyAIR;

	public class TapjoyControl
	{
		public function TapjoyControl()
		{
		}
		
		public static function setup(appId:String,appKey:String):void{
			TapjoyAIR.requestTapjoyConnect(appId,appKey);
		}
		
	}
}