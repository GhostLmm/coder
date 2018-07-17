package Tool.platform.meijiPlat
{
	import com.ghostlmm.tool.HttpRequest;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.osflash.signals.Signal;

	public class CycleRequest
	{
		private var url:String;
		private var arg:Object;
		public var result_SN:Signal;
		private static var timer:Timer=new Timer(1000);
		private var spanArray:Array;
		private var requestCount:int=-1;
		private var timeTick:int;
		public function CycleRequest($url:String,$arg:Object,$spanArray:Array)
		{
			spanArray=$spanArray;
			timeTick=0;
			
			url=$url;
			arg=$arg;
			result_SN=new Signal(Object);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			if(!timer.running){
				timer.start();
			}
			request();
		}
		
		private function request():void{
			requestCount++;
			trace("**********\t第"+requestCount+"次请求");
			HttpRequest.getInstance().getRequest(url,arg,onCallBack);
		}
		private function onCallBack(data:Object):void{
			result_SN.dispatch(data);
		}
		
		private function onTimer(evt:Event):void{
			timeTick++;
			if(requestCount>=spanArray.length){
				stop();
				return ;
			}
			if(timeTick>=spanArray[requestCount]){
				request();
			}
			
		}
		
		private function stop():void{
			timer.removeEventListener(TimerEvent.TIMER,onTimer);
			result_SN.removeAll();
		}
		
		public function destory():void{
			timer.removeEventListener(TimerEvent.TIMER,onTimer);
			result_SN.removeAll();
		}
	}
}