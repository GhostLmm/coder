package view
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	
	import ui.widget.IGridItem;
	import ui.widget.IGridItemMax;
	
	import util.Util;
	
	public class Base_Item extends Sprite
	{
		protected var _listenerProxy:ListenerAddProxy;
		protected var m_data:Object;
		protected var m_mc:Object;
		protected var m_param:Object;
		
		public function Base_Item($mc:MovieClip=null)
		{
			super();
			_listenerProxy=new ListenerAddProxy();
			if($mc==null){
				m_mc=new itemClassName();
				addChild(m_mc as DisplayObject);
			}else{
				m_mc=$mc;
			}
			
			Util.setStaticText(m_mc as DisplayObjectContainer);
			
			initModule();
			registerEvent();
			
		}
		protected  function initModule():void
		{
			
		}
		
		public function loadData($data:Object):*{
			m_data=$data;
			setShow();
			return this;
		}
		
		public function setParam(_param:Object):void
		{
			m_param=_param;
		}
		protected function registerEvent():void
		{
			
		}
		protected function setShow():void
		{
			
		}
		
		
		/**   添加注册事件，关闭窗口会自动回收
		 * */
		protected function addTargetEvent(target:EventDispatcher,type:String,listener:Function,useCapture:Boolean=false):void
		{
			_listenerProxy.addListener(target,type,listener,useCapture);
		}
		
		public function destory():void
		{
			if(_listenerProxy) {_listenerProxy.clear();_listenerProxy=null;}
			m_data=null;
			m_param=null;
			this.removeChildren();
			CommonControlFun.clearMaterial(m_mc as DisplayObjectContainer);
			m_mc.removeChildren();
			m_mc=null;
		}
		
		
		
		/** 窗口素材类，需要子类改写
		 * */
		protected function get itemClassName():Class
		{
			throw new Error("子类必须改写");
			return null;
		}
		
	}
}