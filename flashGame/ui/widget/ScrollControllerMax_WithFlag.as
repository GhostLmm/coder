package ui.widget
{
	import flash.display.MovieClip;

	public class ScrollControllerMax_WithFlag extends ScrollControllerMax
	{
		private var leftFlag:MovieClip;
		private var rightFlag:MovieClip
		public function ScrollControllerMax_WithFlag(position:Position, $leftFlag:MovieClip,$rightFlag:MovieClip,align:int=VERTICAL, moveTop:Boolean=false)
		{
			leftFlag=$leftFlag;
			rightFlag=$rightFlag;
			super(position, align, moveTop);
		}
		
		
		
	}
}