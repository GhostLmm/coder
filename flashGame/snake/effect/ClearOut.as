package snake.effect
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	

	public class ClearOut
	{
		private var mc:McAllClear;
//		private var bg:MovieClip;
		
		private static const StepTime_1_1:Number=0.2;
		private static const StepTime_1_2:Number=0.2;
		private static const StepTime_2:Number=2;
		private static const StepTime_3:Number=0.5;
		
		private static const BigScale:Number=4;
		
		private var timeLine:TimelineLite;
		
		public function ClearOut()
		{
			mc=new McAllClear();
//			bg=mc.mc_shanguang;
		}
		
		
		public function startShow(layer:Sprite):void{
			layer.addChild(mc);
			mc.x=GlobalRef.width/2;
			mc.y=GlobalRef.height/2;
//			bg.visible=false;
//			bg.stop();
			
			mc.scaleX=0;
			mc.scaleY=0;
//			bg.visible=false;
			
			
			timeLine=new TimelineLite({onComplete:onCom});
			timeLine.add(TweenLite.to(mc,StepTime_1_1,{scaleX:BigScale,scaleY:BigScale}));
			timeLine.add(TweenLite.to(mc,StepTime_1_2,{scaleX:1,scaleY:1,onComplete:onStep1Com}));
			timeLine.add(TweenLite.to(mc,StepTime_3,{alpha:0.3}),"+="+StepTime_2);
		}
		
		public function stopShow():void{
			if(timeLine){
				timeLine.clear();
				timeLine.stop();
				timeLine=null;
			}
			if(mc){
				if(mc.parent){
					mc.parent.removeChild(mc);
				}
				TweenLite.killTweensOf(mc);
			}
		}
		
		private function onStep1Com():void{
//			bg.visible=true;
//			bg.play();
		}
		
		private function onCom():void{
			destory();
		}
		
		public function destory():void{
			if(mc){
				if(mc.parent){
					mc.parent.removeChild(mc);
				}
				TweenLite.killTweensOf(mc);
			}
//			if(bg){
//				bg.stop();
//			}
		}
		
		
		
	}
}