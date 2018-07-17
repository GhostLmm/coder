package core
{
	import com.ghostlmm.tool.MovieClipControl;
	import com.greensock.TimelineLite;
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	
	import ui.layer._LayerBase;
	
	/**
	 *   过场动画 
	 */
	public class GuochangLayer extends _LayerBase
	{
		public function GuochangLayer()
		{
			super();
			back=new Shape();
			_scene=new Sprite();
			back.graphics.beginFill(0xffffff);
			back.graphics.drawRect(0,0,GlobalRef.width,GlobalRef.height);
			back.graphics.endFill();
		}
		
		private var _comFn:Function;
		private var back:Shape;
		private var mc:MovieClip;
		private var timeLine:TimelineMax;
		
		public function showHuojianGuochang1(midFn:Function,comFn:Function,$x:Number,$y:Number):void{
			_comFn=comFn;
			mc=new McHuojian();
			mc.x=$x;
			mc.y=$y;
			addChild(back);
			back.alpha=0;
			this.addChild(mc);
			
			MovieClipControl.controlMovieClip(mc,onHuojianPlayComplete,30,1);
			
			timeLine=new TimelineMax();
			
			var label:String="start";
			var time:Number=0;
			
			timeLine.addLabel(label);
			
			timeLine.addCallback(MovieClipControl.controlMovieClip,label+"+="+time,[mc,onHuojianPlayComplete,30,1]);
			time+=0.5;
			
			timeLine.add(TweenLite.to(back,0.7,{alpha:1}),label+"+="+time);
			
			time+=0.8;
			timeLine.addCallback(midFn,label+"+="+time);
		}
		
		
		
		public function showHuojianGuochang2():void{
			TweenLite.to(back,0.8,{alpha:0,onComplete:onComplete});
			
		}
		
		private function showHuojianGuochang(midFn:Function,comFn:Function,$x:Number,$y:Number):void{
			
			_comFn=comFn;
			mc=new McHuojian();
			mc.x=$x;
			mc.y=$y;
			addChild(back);
			back.alpha=0;
			this.addChild(mc);
			
			MovieClipControl.controlMovieClip(mc,onHuojianPlayComplete,30,1);
			
			timeLine=new TimelineMax({onComplete:onComplete});
			
			var label:String="start";
			var time:Number=0;
			
			timeLine.addLabel(label);
			
			timeLine.addCallback(MovieClipControl.controlMovieClip,label+"+="+time,[mc,onHuojianPlayComplete,30,1]);
			time+=0.5;
			
			timeLine.add(TweenLite.to(back,0.7,{alpha:1}),label+"+="+time);
			
			time+=0.8;
			timeLine.addCallback(midFn,label+"+="+time);
			
			timeLine.add(TweenLite.to(back,0.8,{alpha:0}),label+"+="+time);
				
		}
		
		
		
		private function destoryTimeLine():void{
			if(timeLine){
				timeLine.stop();
				timeLine=null;
			}
		}
		
		private function onComplete():void{
			
			if(_comFn){
				_comFn();
			}
			if(contains(back)){
				removeChild(back);
			}
		}
		
		public override function destory():void{
			destoryTimeLine();
			_comFn=null;
			if(back) {TweenLite.killTweensOf(back);}
			if(mc){MovieClipControl.stopControlMovie(mc); mc=null;}
			
		}

		
		private function onHuojianPlayComplete($mc:MovieClip):void{
			if(mc){
				if(this.addChild(mc)){
					removeChild(mc);
				}
				mc=null;
			}
		}
		
	}
}