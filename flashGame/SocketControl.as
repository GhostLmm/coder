package
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.events.CoreEvent;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.StatusEvent;
	
	import air.net.SocketMonitor;

	public class SocketControl
	{
		public function SocketControl()
		{
		}
//		public static var 
		private static var socketMonitor:SocketMonitor;
		public static function init():void{
			C2SEmitter.connectCom_SN.add(onConectCom);
			C2SEmitter.connectError_SN.add(onConnectError);
//			NativeApplication.nativeApplication.addEventListener(Event.NETWORK_CHANGE, onNetworkChange); 
		}
		
		private static function onNetworkChange(event:Event=null):void
		{ 
			//Check resource availability 
			trace("network change ");
			
		} 
		
		private static function checkSocket():void{
			try{
				clearSocketMonitor();
				if(UrlConfig.serverUrl!=null){
					socketMonitor=new SocketMonitor(UrlConfig.serverUrl,UrlConfig.port);
					socketMonitor.addEventListener(StatusEvent.STATUS, socketMonitorHandler);  
					socketMonitor.start(); 
				}
			}catch(e:Error){};
			
			
		}
		
		private static function socketMonitorHandler(e:StatusEvent):void  
		{  
			trace("socketMonitor:"+e.code+"\t"+socketMonitor.available);  
			clearSocketMonitor();
			
		}
		
		private static function clearSocketMonitor():void{
			try{
				if(socketMonitor){
					socketMonitor.removeEventListener(StatusEvent.STATUS, socketMonitorHandler); 
					socketMonitor.stop();
					socketMonitor=null;
				}
			}catch(e:Error){}
			
		}
		
		public static function start():void{
			TopTip.showBattleWait();
			C2SEmitter.startConectSocket(UrlConfig.serverUrl,UrlConfig.port);
			
		}
		
		private static function onConectCom():void{
			Context.getInsance().coreDispatcher.dispatchEvent(new CoreEvent(CoreEvent.StartInitGame));
			clear();
		}
		private static function onConnectError(errorCode:int):void{
			
		}
		
		public static function clear():void{
			C2SEmitter.connectCom_SN.remove(onConectCom);
			C2SEmitter.connectError_SN.remove(onConnectError);
		}
	}
}