package view
{
	import flash.display.MovieClip;

	public class Base_Module
	{
		public var material:MovieClip;
		public var data:Object;
		
		public function Base_Module(_mc:MovieClip)
		{
			material=_mc;
			initModule();
			registerEvent();			
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
		public function setData(_data:Object):void
		{
			data=_data;
			setShow();
		}
		public function destory():void
		{
			material=null;
			data=null;
		}
	}
}