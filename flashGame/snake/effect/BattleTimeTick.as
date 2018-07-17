package snake.effect
{
	import flash.display.Sprite;
	import flash.utils.Dictionary;

	public class BattleTimeTick
	{
		private var showDic:Dictionary=new Dictionary();
		private var layer:Sprite;
		public function BattleTimeTick($layer:Sprite)
		{
			layer=$layer;
		}
		
		public function show(time:int):void{
			if(time<=9 && time>=0){
				if(showDic[time]!=null) return ;
				var timeEffect:TimeShowEffect=new TimeShowEffect();
				timeEffect.show(time,layer);
				showDic[time]=timeEffect;
			}
		}
		
		public function destory():void{
			if(showDic){
				for each(var tiemEffect:TimeShowEffect in showDic){
					tiemEffect.destory();
				}
				showDic=null;
			}
		}
		
	}
}
import com.greensock.TimelineLite;
import com.greensock.TweenLite;

import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.display.Sprite;

import snake.BattleLayer;


class TimeShowEffect{
	
	private static const StepTime_1:Number=0.1;
	private static const StepTime_2:Number=0.2;
	private static const StepTime_3:Number=0.4;
	private static const StepTime_4:Number=0.3;
	private static const BigScale:Number=4;
	private var timeLine:TimelineLite;
	public var mc:Sprite;
	
	public function show(time:int,layer:Sprite):void{
		mc=new Sprite();
		mc.x=GlobalRef.width/2;
		mc.y=GlobalRef.height/2;
		layer.addChild(mc);
		mc.scaleX=0;
		mc.scaleY=0;
		if(time<=9 && time>0){
			var bmp:Bitmap=new Bitmap();
			bmp.bitmapData=AssetManager.getFontBitdata(time.toString(),AssetManager.FT_5);
			bmp.x=-bmp.width/2;
			bmp.y=-bmp.height/2;
			mc.addChild(bmp);
		}
		if(time==0){
			var timeOut:McTimeOut=new McTimeOut();
//			timeOut.x=-timeOut.width/2;
//			timeOut.y=-timeOut.height/2;
			mc.addChild(timeOut);
		}
//		mc.alpha
		
		timeLine=new TimelineLite({onComplete:onCom});
		timeLine.add(TweenLite.to(mc,StepTime_1,{scaleX:BigScale,scaleY:BigScale}));
		timeLine.add(TweenLite.to(mc,StepTime_2,{scaleX:1,scaleY:1}));
		timeLine.add(TweenLite.to(mc,StepTime_4,{alpha:0.3}),"+="+StepTime_3);
	}
	
	private function onCom():void{
		destory();
	}
	
	public function destory():void{
		if(mc){
			TweenLite.killTweensOf(mc);
			mc.removeChildren();
			if(mc.parent){
				mc.parent.removeChild(mc);
			}
			mc=null;
		}
		
		if(timeLine){
			timeLine.kill();
			timeLine=null;
		}
	}
}
