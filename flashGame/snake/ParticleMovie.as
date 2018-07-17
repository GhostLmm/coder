package snake
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.geom.Matrix;

	public class ParticleMovie
	{
		public function ParticleMovie()
		{
		}
		
		public var width:Number;
		public var height:Number;
		
		public var frameNum:int;
		
		public var bm:BitmapData;
		
		
		public function initMovie(mc:MovieClip):void{
			frameNum=mc.totalFrames;
			width=mc.width;
			height=mc.height;
			bm=new BitmapData(frameNum*width,height,true,0);
			var matrx:Matrix=new Matrix();
			
			var a:int=1;
			while(a<=frameNum){
				mc.gotoAndStop(a);
				bm.draw(mc,matrx);
				matrx.translate(width,0);
				a++;
			}
		}
		
		public function destory():void{
			if(bm){
				bm.dispose();
				bm=null;
			}
		}
		
	}
}