package ui.widget
{
	import flash.display.MovieClip;
	
	public class TextTipItem2 extends TextTipItem
	{
		public function TextTipItem2($mc:MovieClip=null)
		{
			super($mc);
		}
		
		protected override function get itemClassName():Class{
			return McScrollFnt2;
		}
	}
}