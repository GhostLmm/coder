package core
{
	//	import flash.display.Sprite;
	import com.ghostlmm.tool.MovieClipControl;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import ui.layer.FloatLayer;
	import ui.layer.GuideLayer;
	import ui.layer.LiaotianLayer;
	import ui.layer.SceneLayer;
	import ui.layer.UiLayer;
	import ui.layer.WaitLayer;
	import ui.layer.WebWaitLayer;
	import ui.layer.WindowLayer;
	import ui.layer.WorldLayer;
	import ui.layer._LayerBase;
	
	import util.Util;
	
	public class LayerController
	{
		private static var _instance:LayerController;
		public static function get instance():LayerController
		{
			if(_instance==null) _instance=new LayerController();
			return _instance;
		}
		private var _worldLayer:WorldLayer;
		
		private var _sceneLayer:SceneLayer;
		
		private var _windowLayer:WindowLayer;
		
		public var liaotianLayer:LiaotianLayer;
		
		private var _uiLayer:UiLayer;
		private var _guideLayer:GuideLayer;
		
		private var _storyLayer:Sprite;
		
		private var _floatLayer:Sprite;
		private var _waitLayer:WaitLayer;
		
		private var _registerLayer:Sprite;
		
		private var _webWaiter:WebWaitLayer;
		
//		private var _guochangLayer:GuochangLayer;
		
		public function LayerController()
		{
			
		}
		
		public function get registerLayer():Sprite
		{
			return _registerLayer;
		}
		
		public function init(container:Sprite):void
		{
			_worldLayer=new WorldLayer();
			_worldLayer.name="worldLayer";
//			_worldLayer.mouseEnabled=false;
			
			_sceneLayer=new SceneLayer();
			_sceneLayer.name="sceneLayer";
			
			_windowLayer = new WindowLayer;
			_windowLayer.name="windowLayer";
			_windowLayer.mouseEnabled=false;
			liaotianLayer=new LiaotianLayer();
			_uiLayer = new UiLayer;
			_uiLayer.name="uiLayer";
			_uiLayer.mouseEnabled=false;
			_guideLayer = new GuideLayer;
			_guideLayer.mouseEnabled=false;
//			_guideLayer.mouseChildren
			_guideLayer.name="guideLayer";
			_storyLayer=new Sprite();
			_storyLayer.name="storyLayer";
			
			_floatLayer = new Sprite;
			Util.setMouseUnable(_floatLayer);
			_waitLayer = new WaitLayer;
			_waitLayer.mouseEnabled=false;
			_waitLayer.name="waiterLayer";
//			_guochangLayer=new GuochangLayer();
//			Util.setMouseUnable(_guideLayer);
//			_guochangLayer.name="guochangLayer";
			_registerLayer=new Sprite();
			_registerLayer.mouseEnabled=false;
			_registerLayer.name="registerLayer";
			container.addChild(_worldLayer);
			container.addChild(_sceneLayer);
			container.addChild(_uiLayer);
			
			container.addChild(_windowLayer);
			container.addChild(liaotianLayer);
			container.addChild(_guideLayer);
			container.addChild(_storyLayer);
			container.addChild(_waitLayer);
			
			container.addChild(_registerLayer);
			//			removeLayer(battleLayer);
			container.addChild(_floatLayer);
			
//			container.addChild(_guochangLayer);
			
			_webWaiter=new WebWaitLayer();
			_webWaiter.mouseEnabled=false;
			container.addChild(_webWaiter);
		}
		
		private function removeLayer(layer:*):void
		{
			if(layer && layer.parent){
				layer.parent.removeChild(layer);
				try{
					layer.destory();
				}catch(e:Error){}
			}
		}
		public function clear():void
		{
			//			removeLayer(_stageLayer);
			removeLayer(_worldLayer);
			if(_sceneLayer){
				_sceneLayer.destory();
				if(_sceneLayer.parent){
					_sceneLayer.parent.removeChild(_sceneLayer);
				}
				_sceneLayer=null;
			}
			removeLayer(_windowLayer);
			removeLayer(_uiLayer);
			removeLayer(_guideLayer);
			removeLayer(_waitLayer);
			//			removeLayer(battleLayer);
			removeLayer(_floatLayer);
			
			removeLayer(_webWaiter);
			
//			if(_guochangLayer){
//				removeLayer(_guochangLayer);
//				_guochangLayer=null;
//			}
			
			//			removeLayer(_registerLayer);
			if(_registerLayer){
				_registerLayer.removeChildren();
				if(_registerLayer.parent){
					_registerLayer.parent.removeChild(_registerLayer);
				}
			}
			_registerLayer=null;
			//			_stageLayer=null;
			_worldLayer=null;
			_sceneLayer=null;
			_windowLayer=null;
			_uiLayer=null;
			_guideLayer=null;
			_waitLayer=null;
			_floatLayer=null;
			_webWaiter=null;
			_storyLayer=null;
			if(liaotianLayer){
				liaotianLayer.destory();
				if(liaotianLayer.parent){
					liaotianLayer.parent.removeChild(liaotianLayer);
				}
				liaotianLayer=null;
			}
		}
		
		
		public function showMoneyMovie():void{
			
		}
		
		
//		public function get guochangLayer():GuochangLayer{
//			return _guochangLayer;
//		}
		
		public function get storyLayer():Sprite{
			return _storyLayer;
		}
		public function get windowLayer():WindowLayer
		{
			return _windowLayer;
		}
		public function set windowLayer(_layer:WindowLayer):void
		{
			_windowLayer=_layer;
		}
		public function get sceneLayer():SceneLayer{
			return _sceneLayer;
		}
		
		public function get worldLayer():WorldLayer{
			return _worldLayer;
		}
		
		public function get guideLayer():GuideLayer
		{
			return _guideLayer;
		}
		
		public function get floatLayer():Sprite
		{
			return _floatLayer;
		}
		public function set floatLayer(value:Sprite):void
		{
			_floatLayer=value;
		}
		
		public function get waitLayer():WaitLayer
		{
			return _waitLayer;
		}
		
		public function get uiLayer():UiLayer
		{
			return _uiLayer;
		}
		
		public function get webWaiterLayer():WebWaitLayer
		{
			return _webWaiter;
		}
	}
}