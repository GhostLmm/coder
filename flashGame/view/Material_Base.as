package view
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;

	public class Material_Base extends Sprite
	{
		protected var m_windowMaterial:Object;
		public function Material_Base()
		{
			initBase();
			initModule();
		}
		private function initBase():void
		{
			m_windowMaterial=new windowMaterialName();
			addChild(m_windowMaterial as DisplayObject);
		}
		protected function initModule():void
		{
			
		}
		public function destory():void
		{
			if(m_windowMaterial&&contains(m_windowMaterial as DisplayObject))
			{
				removeChild(m_windowMaterial as DisplayObject);
				
				CommonControlFun.clearMaterial(m_windowMaterial as DisplayObjectContainer);
				m_windowMaterial.removeChildren();
				m_windowMaterial=null;
			}
			m_windowMaterial=null;
		}
		/** 窗口素材类，需要子类改写
		 * */
		protected function get windowMaterialName():Class
		{
			throw new Error("子类必须改写");
			return null;
		}
	}
}