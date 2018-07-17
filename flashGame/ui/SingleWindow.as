package ui
{
	import com.greensock.TweenLite;
	
	import ui.window._WindowBase;
	
	public class SingleWindow extends _WindowBase
	{
		protected var tweenTime:Number=0.5;
		public var startX:Number;
		public var endX:Number;
		
		public function SingleWindow(params:Object=null)
		{
			super(params);
		}
		
		protected override function beforeOpen():void{
			super.beforeOpen();
			initTweenPostion();
			initTweenObj();
		}
		
		protected function initTweenPostion():void{
			startX=-_scene.width;
			endX=0;			
		}
		private function initTweenObj():void
		{
			tweenObj={"currentX":startX};
		}
		
		private var tweenObj:Object;
		
		protected override function afterOpen():void{
			tweenObj={"currentX":startX};
			TweenLite.to(tweenObj,tweenTime,{"currentX":endX,onUpdate:updateTween,onComplete:tweenOpenComplete});
		}
		protected override function beforeClose():void
		{
			TweenLite.killTweensOf(tweenObj);
		}
		public function playCloseMovie(_completeFuc:Function=null):void
		{
			tweenObj={"currentX":endX};
			TweenLite.to(tweenObj,tweenTime,{"currentX":startX,onUpdate:updateTween,onComplete:function():void{
				if(_completeFuc)
				{
					_completeFuc.apply()
				}
				else
				{
					close();
				}
			}});
		}
		protected function tweenCloseComplete():void
		{
			
		}
		protected function tweenOpenComplete():void{
			
		}
		
		private function updateTween():void{
			_scene.x=tweenObj.currentX;
		}
		
		public override function destory():void{
			TweenLite.killTweensOf(tweenObj);
			super.destory();
		}
	}
}