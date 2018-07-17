package ui.widget
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.LocationChangeEvent;
	import flash.geom.Rectangle;
	import flash.media.StageWebView;
	
//	import core.platform.PlatformManager;
	
	public class WebViewer extends Sprite  implements IComponent
	{
		private var webView:StageWebView;
		private var _url:String;
		private var _rect:Rectangle;
		
		protected var _proxy:ListenerAddProxy;
		public function WebViewer(url:String,rect:Rectangle)
		{
			super();
			_proxy=new ListenerAddProxy();
			_url = url;
			_rect = rect;
		}
		
		public function destory():void
		{
			if(_proxy){
				_proxy.clear();
				_proxy=null;
			}
		}
		
		protected function onComplete(event:Event):void
		{
			trace("web view complete")
		}
		
		protected function onChanging(event:LocationChangeEvent):void
		{
			trace("web view changing",event.location)
		}
		
		protected function onError(event:ErrorEvent):void
		{
			trace("web view error",_url)
		}
		
		public function open():void
		{
			if(webView != null) {
				return;
			}
			webView = new StageWebView();
			webView.stage = this.stage;
			webView.viewPort = _rect;
			_proxy.addListener(webView,ErrorEvent.ERROR,onError);
			_proxy.addListener(webView,LocationChangeEvent.LOCATION_CHANGING,onChanging);
			_proxy.addListener(webView,Event.COMPLETE,onComplete);
//			webView.loadURL("http://"+PlatformManager.platform.serverURL+"/page/"+_url);
		}
		
		public function close():void
		{
			if(webView==null) {
				return;
			}
			_proxy.removeListener(webView,ErrorEvent.ERROR,onError);
			_proxy.removeListener(webView,LocationChangeEvent.LOCATION_CHANGING,onChanging);
			_proxy.removeListener(webView,Event.COMPLETE,onComplete);
			webView.viewPort=null;
			webView.dispose();
			webView=null;
			destory();
		}
	}
}