package Tool
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;

	public class ComponentShowControl
	{
		public function ComponentShowControl()
		{
		}
		public static function stopMovie(mc:DisplayObjectContainer):void
		{			
			var index:int=0;
			while(index<mc.numChildren)
			{
				var display:DisplayObject=mc.getChildAt(index);
				if(display is MovieClip)
				{
					(display as MovieClip).stop();
					//					stop(display as MovieClip);
				}
				if(display is DisplayObjectContainer)
				{
					stopMovie(display as DisplayObjectContainer );
				}
				index++;
			}
		}
	}
}