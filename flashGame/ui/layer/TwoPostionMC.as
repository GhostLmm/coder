package ui.layer
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;

	public class TwoPostionMC
	{
		public function TwoPostionMC()
		{
		}
		public var firstPos:Point;
		public var secondPos:Point;
		public var target:DisplayObject;
		
		public var posState:String;
		
		public static const PS_First:String="inFirst";
		public static const PS_Second:String="inSecond";
		public static const PS_ToFirst:String="toFirst";
		public static const PS_ToSecond:String="toSecond";
		
		public function init($target:DisplayObject,$first:Point,$second:Point):void{
			target=$target;
			firstPos=$first;
			secondPos=$second;
			target.x=firstPos.x;
			target.y=firstPos.y;
			posState=PS_First;
		}
		
		public function showToFirst(time:Number):void{
			if(posState==PS_First || posState==PS_ToFirst){
				return ;
			}
			if(time>0){
				posState=PS_ToFirst;
				TweenLite.to(target,time,{x:firstPos.x,y:firstPos.y,onCompete:toFirstComplete});
			}else{
				toFirstComplete();
			}
			
		}
		private function toFirstComplete():void{
			posState=PS_First;
			target.x=firstPos.x;
			target.y=firstPos.y;
		}
		
		public function showToSecond(time:Number):void{
			if(posState==PS_Second || posState==PS_ToSecond){
				return ;
			}
			if(time>0){
				posState=PS_Second;
				TweenLite.to(target,time,{x:secondPos.x,y:secondPos.y,onCompete:toSecondComplete});
			}else{
				toSecondComplete();
			}
			
		}
		private function toSecondComplete():void{
			posState=PS_ToSecond;
			target.x=secondPos.x;
			target.y=secondPos.y;
		}
		
		public function destory():void{
			if(target){
				TweenLite.killTweensOf(target);
				target=null;
			}
		}
	}
}