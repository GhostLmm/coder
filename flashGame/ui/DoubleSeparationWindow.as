package ui
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	
	import ui.window._WindowBase;
	
	public class DoubleSeparationWindow extends _WindowBase
	{
		public function DoubleSeparationWindow(params:Object=null)
		{
			super(params);
		}
		private var leftPart:MovieClip;
		private var rightPart:MovieClip;
		private var offsetX:Number;
		private var targetLeftX:Number;
		private var targetRightX:Number;
		
		protected override function beforeOpen():void{
			leftPart=_scene.mc_left;
			rightPart=_scene.mc_right;
			offsetX=rightPart.width-10;
			
			_scene.addChild(leftPart);
			targetLeftX=leftPart.x;
			targetRightX=rightPart.x;
//			rightPart.x=rightPart.x-offsetX;
			
//			leftPart.x=leftPart.x+leftPart.width/2;
			rightPart.x=leftPart.x+leftPart.width-rightPart.width;
			
			super.beforeOpen();
			
		}
		
		public function showRight():void{
			TweenLite.to(leftPart,0.5,{x:targetLeftX});
			TweenLite.to(rightPart,0.5,{x:targetRightX});
		}
		
		public override function destory():void{
			if(leftPart) {TweenLite.killTweensOf(leftPart);leftPart=null;}
			if(rightPart) {TweenLite.killTweensOf(rightPart);rightPart=null;}
			super.destory();
		}
		
	}
}