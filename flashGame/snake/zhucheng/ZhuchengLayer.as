package snake.zhucheng
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;

	public class ZhuchengLayer
	{
		public var mc:DisplayObject;
		public function ZhuchengLayer($mc:DisplayObject,$relativeFactor:Number)
		{
			mc=$mc;
			relativeFactor=$relativeFactor;
			x=mc.x;
			y=mc.y;
			
		}
		
		public var relativeFactor:Number;
		
		public var x:Number=0;
		public var y:Number=0;
		
		public function render(offsetX:Number,offsetY:Number):void{
			x-=relativeFactor*offsetX;
			y-=offsetY;
			mc.x=x;
			mc.y=y;
		}
		
		public function destory():void{
			
		}
	}
}