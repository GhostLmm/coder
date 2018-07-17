package ui
{
	import com.greensock.TweenLite;
	import com.greensock.easing.Bounce;
	
	import flash.display.MovieClip;
	
	import org.osflash.signals.Signal;
	
	import ui.window._WindowBase;
	
	public class DoubleWindow extends _WindowBase
	{
		protected var tweenTime:Number=0.5;
		private var leftMC:MovieClip;
		private var rightMC:MovieClip;
		
		private var leftStartX:Number;
//		private var leftStartY:Number;
		private var rightStartX:Number;
//		private var rightStartY:Number;
		
		private var leftEndX:Number;
//		private var leftEndY:Number;
		private var rightEndX:Number;
//		private var rightEndY:Number;
		
		public var tweenCom_SN:Signal=new Signal();
		
		public var showMovieCompleteFlag:Boolean=false;
		
		public function DoubleWindow(params:Object=null)
		{
			super(params);
		}
		
		protected override function beforeOpen():void{
			super.beforeOpen();
			leftMC=_scene.mc_left;
			rightMC=_scene.mc_right;
			initTweenPostion();
		}
		
		private function initTweenPostion():void{
			leftEndX=leftMC.x;
			rightEndX=rightMC.x;
			
			leftStartX=leftEndX-GlobalRef.width/2;
			rightStartX=rightEndX+GlobalRef.width/2;
			
			leftMC.x=leftStartX;
			rightMC.x=rightStartX;
			
			tweenObj={leftX:leftStartX,rightX:rightStartX};
		}
		
		private var tweenObj:Object;
		
		protected override function afterOpen():void{
			mouseChildren=false;
			TweenLite.to(tweenObj,tweenTime,{leftX:leftEndX,rightX:rightEndX,onUpdate:updateTween,onComplete:tweenOpenComplete});
		}
		
		protected function tweenOpenComplete():void{
			mouseChildren=true;
			showMovieCompleteFlag=true;
			tweenCom_SN.dispatch();
		}
		
		private function updateTween():void{
			leftMC.x=tweenObj.leftX;
			rightMC.x=tweenObj.rightX;
		}
		
		public override function destory():void{
			TweenLite.killTweensOf(tweenObj);
			tweenCom_SN.removeAll();
			super.destory();
		}
	}
}