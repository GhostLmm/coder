package ui.widget
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import util.Util;
	
	public class MyMovie extends Sprite
	{
		private var _target:MovieClip;
		private var _rate:int;
		
		public function MyMovie($mc:MovieClip,$rate:int=20)
		{
			super();
			_target=$mc;
			Util.replace($mc,this);
			this.addChild($mc);
			
		}
	}
}