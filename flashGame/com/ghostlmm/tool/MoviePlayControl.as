package com.ghostlmm.tool
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import util.Util;

	public class MoviePlayControl
	{
		public function MoviePlayControl()
		{
		}
		
		public static function playMovieCls(mcCls:Class,time:Number,layer:Sprite=null):void{
			var mc:MovieClip=new mcCls();
			if(layer){
				layer.addChild(mc);
			}
			var comFn:Function=function():void{
				Util.stopAllMovie(mc);
//				mc.stopAllMovieClips();
				if(mc.parent){
					mc.parent.removeChild(mc);
				}
			}
			TweenLite.delayedCall(time,comFn);
		}
	}
}