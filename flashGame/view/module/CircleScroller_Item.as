package view.module
{
	import view.Base_Item;
	
import flash.display.MovieClip
	public class CircleScroller_Item extends Base_Item
	{
		private var _radius:Number;
		public function CircleScroller_Item()
		{
			super();
		}
		protected override function initModule():void
		{
			
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			
		}
		protected override function get itemClassName():Class
		{
			return (AssetManager.getAssetClass("McItemtest") as Class); 
		}
		public function set radius(_value:Number):void
		{
			_radius=_value;
		}
		public function get radius():Number
		{
			return _radius;
		}
		protected var m_angle:Number;
		public function set angle(_value:Number):void
		{
			m_angle=_value;
			this.x=_radius*Math.cos(m_angle);
			this.y=_radius*Math.sin(m_angle);
		}
		public function get angle():Number
		{
			return m_angle;
		}
	}
}
