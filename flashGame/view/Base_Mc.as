package view
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	
	import util.Util;
	
	public class Base_Mc extends Sprite
	{
		protected var m_data:Object;
		protected var m_mc:Object;
		protected var m_blocker:Sprite;
		
		public function Base_Mc($mc:Object=null)
		{
			super();
			m_mc=$mc;
			if(isNeedBlock())
			{
				addBlock();
			}
			if(m_mc==null){
				m_mc=new mcClassName();
			}
			if(isNeedSetText())
			{
				Util.setStaticText(m_mc as DisplayObjectContainer);
			}
			addChild(m_mc as DisplayObject);
			initModule();
			registerEvent();
		}
		public function loadData($data:Object):*{
			m_data=$data;
			setShow();
			return this;
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
		public function destory():void
		{
			removeBlock();
			clearEvent();
			m_data=null;
			this.removeChildren();
			CommonControlFun.clearMaterial(m_mc as DisplayObjectContainer);
			m_mc.removeChildren();
			m_mc=null;			
		}
		/** 窗口素材类，需要子类改写
		 * */
		protected function get mcClassName():Class
		{
			throw new Error("子类必须改写");
			return null;
		}
		protected function isNeedBlock():Boolean
		{
			return false;
		}
		protected function isBlockMiddle():Boolean{
			return false;
		}
		private function removeBlock():void
		{
			if(m_blocker&&(this.contains(m_blocker)))
			{
				this.removeChild(m_blocker);
				m_blocker=null;
			}
		}
		private function addBlock():void
		{
			if(m_blocker&&(this.contains(m_blocker)))
			{
				return;
			}
			if(null==m_blocker)
			{
				m_blocker = new Sprite;
				var graphics:Graphics = m_blocker.graphics;
				graphics.lineStyle(0, 0x000000, 0.5);
				graphics.beginFill(0x000000, 0.7);
				if(isBlockMiddle()){
					graphics.drawRect(-GlobalRef.width/2,-GlobalRef.height/2,GlobalRef.width,GlobalRef.height);
				}else{
					graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
				}
				
				graphics.endFill();
			}
			this.addChild(m_blocker);
		}
		
		protected function isNeedSetText():Boolean
		{
			return true;
		}
	}
}