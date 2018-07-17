package ui.mc
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import view.CommonControlFun;

	public class _McBase extends Sprite 
	{
		protected var _scene:*;
//		protected var _data:*;
//		protected var _autoRefresh:Boolean;
//		protected var _loaded:Boolean;
		
		public function _McBase()
		{
//			_data = data;
//			_autoRefresh = false;
//			_loaded = false;
			addEventListener(Event.ADDED_TO_STAGE,onInit,false,0,true);
		}
		
		private final function onInit(evt:Event):void
		{
//			removeEventListener(Event.ADDED_TO_STAGE,onInit);
			addChild(_scene);
			onAddToStage();
//			addEventListener(Event.ADDED_TO_STAGE,onAddToStage,false,0,true);
			addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage,false,0,true);
		}
		
		protected function onAddToStage(evt:Event=null):void
		{
//			if(_loaded == false || _autoRefresh/* && _data != null*/) {
//				loadData();
//			}
//			dispatchEvent(new TqtEvent(TqtEvent.MC_ADD_TO_STAGE,this.name,true));
		}
		
		protected function onRemoveFromStage(evt:Event=null):void
		{
			
		}

		public function get scene():*
		{
			return _scene;
		}
		
		public function destory():void
		{
			removeEventListener(Event.ADDED_TO_STAGE,onInit,false);
			removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage,false);
			this.removeChildren();
			if(_scene)
			{
				CommonControlFun.clearMaterial(_scene as DisplayObjectContainer);
			}
			_scene=null;
		}
		
	/*	protected function loadData():void
		{
			_loaded = true;
		}
		
		public final function updateData(data:*):void
		{
			_data = data;
			_loaded = false;
		}*/
	}
}