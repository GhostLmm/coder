package ui.widget
{
	import flash.display.Sprite;

	public class LabaControl
	{
//		private static const ROLLNUMBER_COUNT:int = 5;
		private static const MAX_ROLL_SPEED:Number = 1000;
		private static const DECREASE_SPEED:Number = 200;
		
		private static const STATE_FULL_SPEED:int = 0;
		private static const STATE_DECREASE_SPEED:int = 1;
		private static const STATE_STOPING:int = 2;
		private static const STATE_STOPED:int = 3;
		
		private var rollLayer:Sprite;
		
		public function LabaControl()
		{
		}
		
		public function initLaba():void{
			
		}
	}
}