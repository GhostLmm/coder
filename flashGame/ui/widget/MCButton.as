package ui.widget
{
	import flash.display.MovieClip;
	
	public class MCButton extends Button 
	{
		private var _x:Number;
		private var _y:Number;
		
		public function MCButton(view:MovieClip)
		{
			super(view);
		}
		
		override protected function updateStatus():void
		{
			if(isEnabled && isPressed) {
				super.x = _x+2;
				super.y = _y+2;
			} else {
				super.x = _x;
				super.y = _y;
			}
		}
		
		override public function set x(value:Number):void
		{
			_x = value;
			super.x = value;
		}
		
		override public function set y(value:Number):void
		{
			_y = value;
			super.y = value;
		}
		
		
	}
}