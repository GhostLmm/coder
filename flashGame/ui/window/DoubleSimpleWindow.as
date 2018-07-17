package ui.window
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.geom.Point;

	public class DoubleSimpleWindow extends _WindowBase
	{
		private var leftPart:MovieClip;
		private var rightPart:MovieClip;
		
		private var targetLeftX:Number;
		private var targetRightX:Number;
		private var startX:Number;
		
		public var hasShowLeft:Boolean=false;
		
		private static const ShowTime:Number=0.5;
		
		public function DoubleSimpleWindow(params:Object=null)
		{
			super(params);
		}
		
		protected override function beforeOpen():void{
			
			super.beforeOpen();
//			return ;
			leftPart=_scene.mc_left;
			rightPart=_scene.mc_right;
			
			_scene.addChild(rightPart);
			
			targetLeftX=leftPart.x;
			targetRightX=rightPart.x;
			
			startX=-rightPart.width/2;
			
			rightPart.x=startX;
			leftPart.x=startX;
			leftPart.visible=false;
			
			hasShowLeft=false;
		}
		
		public function showLeft():void{
			if(hasShowLeft) {
				trace("左边窗口已经显示");
				return ;
			}
			hasShowLeft=true;
			leftPart.visible=true;
			TweenLite.to(leftPart,ShowTime,{x:targetLeftX});
			TweenLite.to(rightPart,ShowTime,{x:targetRightX});
		}
		
		public override function destory():void{
			if(leftPart){
				TweenLite.killTweensOf(leftPart);
				leftPart=null;
			}
			if(rightPart){
				TweenLite.killTweensOf(rightPart);
				rightPart=null;
			}
			super.destory();
		}
		
		
		
	}
}