package ui.widget
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import core.event.TqtEvent;
	
	import flash.display.Sprite;
	import flash.utils.Dictionary;
		
	public class TabController extends Sprite  implements IComponent
	{
		private var _focused:ButtonInterface;
		private var _tagParams:Dictionary;
		private var _container:Sprite;
		
		private var _proxy:ListenerAddProxy;
		
		public function TabController(container:Sprite)
		{
			super();
			_proxy=new ListenerAddProxy();
			_tagParams = new Dictionary;
			_container = container;
		}
				
		public function destory():void
		{
			if(_proxy){
				_proxy.clear();
				_proxy=null;
			}
			if(_container){
				_container.removeChildren();
				_container=null;
			}
			_tagParams=null;
		}
		
		public function registerTab(tag:ButtonInterface,page:Sprite,params:Object=null):Boolean
		{
			if(page == null) {
				return false;
			}
			if(params == null) {
				params = new Object;
			}
			params["page"] = page;
			_tagParams[tag] = params;
			_proxy.addListener(tag,TqtEvent.BUTTON_CLICK, function(evt:TqtEvent=null):void {
				selectTab(tag);
			});
			return true;
		}
		
		public function selectTab(tag:ButtonInterface):Boolean
		{
			if(_tagParams[tag] == null)
				return false;
			if(_focused != null) {
				if(_focused == tag) {
					return true;
				}
				_container.removeChild(_tagParams[_focused]["page"]);
				if(_tagParams[_focused].hasOwnProperty("onRemove")) {
					_tagParams[_focused]["onRemove"](_tagParams[_focused]["page"]);
				}
				_focused.isSelected = false;
			}
			
			_focused = tag;
			
			_focused.isSelected = true;
			_container.addChild(_tagParams[_focused]["page"]);
//			if(_container.hasOwnProperty("rect")) {
//				Util.reshapeAsRect(_tagParams[_focused]["page"],_container["rect"]);
//			}
			if(_tagParams[_focused].hasOwnProperty("onAdd")) {
				_tagParams[_focused]["onAdd"](_tagParams[_focused]["page"]);
			}
			
			return true;
		}
	}
}