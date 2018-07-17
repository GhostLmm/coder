package ui.battle
{
	import com.ghostlmm.tool.MovieClipControl;
	import com.ghostlmm.tool.ShakeTool;
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	import ui.widget.Position;

	public class ShengliStar
	{
		private var container:Sprite;
		private var mc:MovieClip;
		
		public var showTime:Number;
		private var state:int;
		private var backMc:MovieClip;
		
		public function ShengliStar($backMc:MovieClip,$container:Sprite,$state:int)
		{
			backMc=$backMc;
			backMc.visible=false;
			container=$container;
			state=$state;
			if(state==1 || state==0){
				showTime=0.3;
			}else{
				showTime=0.5;
			}
		}
		
		public function show():void{
			if(state==0){
				backMc.visible=true;
				backMc.alpha=0;
				TweenLite.to(backMc,0.5,{alpha:1});
				return ;
			}
			mc=new mc_star_get();
			backMc.parent.addChild(mc);
			mc.x=backMc.x;
			mc.y=backMc.y;
			if(state==1){
				mc.gotoAndStop(mc.totalFrames);
				mc.alpha=0;
				TweenLite.to(mc,0.5,{alpha:1});
			}
			if(state==2){
				MovieClipControl.controlMovieClip(mc,onPlayCom,30,1);
			}
		}
		
		private function onPlayCom($mc:MovieClip):void{
//			ShakeTool.shake(container,0.4,0.2,new Point(GlobalRef.width/2,GlobalRef.height/2));
		}
		
		public function destory():void{
			if(backMc) {TweenLite.killTweensOf(backMc); backMc=null;}
			if(container) {ShakeTool.killShake(container); container=null;}
			if(mc) {TweenLite.killTweensOf(mc); mc.stop(); MovieClipControl.stopControlMovie(mc); mc=null;}
		}
	}
}