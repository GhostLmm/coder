package com.ghostlmm.tool
{
	import com.ghostlmm.dig.DigGameControl;
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.easing.Circ;
	import com.greensock.easing.Ease;
	
	import flash.display.DisplayObject;
	import flash.geom.Point;
	
	import core.LayerController;
	
	import util.Util;

	public class FlyAnimate
	{
		public function FlyAnimate()
		{
		}
		
		public static function fly(source:DisplayObject,target:DisplayObject,completeFn:Function=null,completeArg:Array=null):void{
			var onCompete:Function=function():void{
				if(source.parent){
					source.parent.removeChild(source);
				}
				TweenLite.killTweensOf(source);
				if(completeFn){
					completeFn.apply(null,completeArg);
				}
			};
			var onStart:Function=function():void{
				var p:Point=Util.getRelativePostion(source,DigGameControl.instance.gameLayer.effectLayer,new Point());
				source.x=p.x;
				source.y=p.y;
				DigGameControl.instance.gameLayer.effectLayer.addChild(source);
			};
			
			var targetPoint:Point=Util.getRelativePostion(target,DigGameControl.instance.gameLayer.effectLayer,new Point());
			
			var timeLine:TimelineLite=new TimelineLite({onComplete:onCompete,onStart:onStart});
		
			var step_1:TweenLite=TweenLite.to(source,0.5,{x:targetPoint.x,y:targetPoint.y,ease:Circ.easeOut,width:target.width,height:target.height,alpha:0.5});
			timeLine.add(step_1);
		}
		
		public static function flyToPos(source:DisplayObject,targetPoint:Point,completeFn:Function=null,completeArg:Array=null):void{
			var onCompete:Function=function():void{
				if(source.parent){
					source.parent.removeChild(source);
				}
				TweenLite.killTweensOf(source);
				if(completeFn){
					completeFn.apply(null,completeArg);
				}
			};
			var onStart:Function=function():void{
				var p:Point=Util.getRelativePostion(source,DigGameControl.instance.gameLayer.effectLayer,new Point());
				source.x=p.x;
				source.y=p.y;
				DigGameControl.instance.gameLayer.effectLayer.addChild(source);
			};
			var width:Number=source.width/4;
			var height:Number=source.height/4;
			
			var timeLine:TimelineLite=new TimelineLite({onComplete:onCompete,onStart:onStart});
			
			var step_1:TweenLite=TweenLite.to(source,0.5,{x:targetPoint.x,y:targetPoint.y,ease:Circ.easeOut,width:width,height:height,alpha:0.5});
			timeLine.add(step_1);
		}
	}
}