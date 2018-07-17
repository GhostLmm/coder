package view
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	
	import util.Util;
	
	public class Panel_Base
	{
		private var m_panelMaterial:Object;
		private var m_container:Sprite;
		public function Panel_Base()
		{
			m_container=new Sprite();
			m_panelMaterial=new panelClassName();
			Util.setStaticText(m_panelMaterial as DisplayObjectContainer);
			m_container.addChild(m_panelMaterial as DisplayObject);
			initModule();
			registerEvent();
			setShow();
		}
		public function update():void
		{
			
		}
		protected function initModule():void
		{
			
		}
		protected function registerEvent():void
		{
			
		}
		protected function setShow():void
		{
			
		}
		/**
		 *  回收，必须执行父类函数
		 */
		public function clear():void
		{
			clearEvent();
			m_container.removeChildren();
			m_panelMaterial.removeChildren();
			m_panelMaterial=null;
		}
		/** 窗口素材类，需要子类改写
		 * */
		protected function get panelClassName():Class
		{
			throw new Error("子类必须改写");
			return null;
		}
		private var _listenerArray:Array;
		
		/**   添加注册事件，关闭窗口会自动回收
		 * */
		protected function addTargetEvent(target:EventDispatcher,type:String,listener:Function,useCapture:Boolean=false):void
		{
			if(_listenerArray==null) _listenerArray=[];
			
			target.addEventListener(type,listener,useCapture);
			
			_listenerArray.push({target:target,type:type,listener:listener,useCapture:useCapture});
		}
		
		private function clearEvent():void
		{
			if(_listenerArray==null) return ;
			for each(var obj:Object in _listenerArray)
			{
				obj.target.removeEventListener(obj.type,obj.listener,obj.useCapture);
				delete obj["target"];
				delete obj["listener"];
			}
			_listenerArray=null;
		}
		public function get panelContainer():Sprite
		{
			return m_container;
		}
		public function get material():Object
		{
			return m_panelMaterial;
		}
	}
}