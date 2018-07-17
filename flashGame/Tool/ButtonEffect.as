package Tool
{
//	import fl.*;
	
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Back;
	import com.greensock.easing.Bounce;
	import com.greensock.easing.Circ;
	import com.greensock.plugins.ShortRotationPlugin;
	import com.greensock.plugins.TransformAroundCenterPlugin;
	import com.greensock.plugins.TransformAroundPointPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class ButtonEffect
	{
		private static var _instance:ButtonEffect;
		
		
		public function ButtonEffect()
		{
		TweenPlugin.activate([TransformAroundCenterPlugin,TransformAroundPointPlugin,ShortRotationPlugin]);
//			TweenPlugin.activate([TransformAroundPointPlugin, ShortRotationPlugin, TransformAroundCenterPlugin]);

		}
		
		public static function getInstance():ButtonEffect
		{
			if(!_instance)
				_instance=new ButtonEffect();
			return _instance;
		}
		
		public function registEffect(sp:DisplayObject):void
		{
			sp.addEventListener(MouseEvent.MOUSE_DOWN,showMouseDownEffect);
			sp.addEventListener(MouseEvent.MOUSE_UP,showMouseUpEffect);
			sp.addEventListener(MouseEvent.MOUSE_OUT,showMouseUpEffect);
		}
		
		public function removeEffect(sp:DisplayObject):void
		{
			sp.removeEventListener(MouseEvent.MOUSE_DOWN,showMouseDownEffect);
			sp.removeEventListener(MouseEvent.MOUSE_UP,showMouseUpEffect);
			sp.removeEventListener(MouseEvent.MOUSE_OUT,showMouseUpEffect);
		}
		
		public function showMouseDownEffect(evt:Event):void
		{
			var sp:DisplayObject=evt.currentTarget as DisplayObject;
			TweenMax.to(sp,0.2,{colorMatrixFilter:{brightness:1.3,contrast:1.3}});
//			TweenMax.to(sp,0.2, {transformAroundCenter:{ scaleX:0.9, scaleY:0.9,ease:Bounce.easeOut}});
			TweenLite.to(sp, 0.2, {scaleX:0.9, scaleY:0.9,ease:Back.easeOut});
//			TweenMax.to(sp,0.2, {transformAroundPoint:{Point:new Point(200,400),scaleX:0.9, scaleY:0.9}});
			
//			sp.
//			var colorAdjust:AdjustColor = new AdjustColor();
//			colorAdjust.brightness = 0;// 亮度不变
//			colorAdjust.contrast = 0;//对比度增加50%
//			colorAdjust.saturation = -85;//饱和度降低25%
//			colorAdjust.hue = 0// 色相偏移90度
//			var colorFilter:ColorMatrixFilter = new ColorMatrixFilter(colorAdjust.CalculateFinalFlatArray());
//			p1.filters = [colorFilter];
		}
		
		public function showMouseUpEffect(evt:Event):void
		{
			var sp:DisplayObject=evt.currentTarget as DisplayObject;
			TweenMax.to(sp,0.2,{colorMatrixFilter:{brightness:1,contrast:1}});
			TweenLite.to(sp, 0.2, {scaleX:1, scaleY:1});
//			TweenMax.to(sp,0.2, {transformAroundCenter:{ scaleX:1, scaleY:1}});
//			TweenMax.to(sp,0.2, {transformAroundPoint:{Point:new Point(sp.x+sp.width/2,sp.y+sp.height/2),scaleX:1, scaleY:1}});
		}
		
		public function playBigSmallEffect(sp:DisplayObject):void
		{
			TweenMax.to(sp,0.1,{colorMatrixFilter:{brightness:1.3,contrast:1.3}});
			TweenLite.to(sp, 0.1, {scaleX:1.3, scaleY:1.3,ease:Back.easeOut});
//			TweenMax.to(sp,0.1, {transformAroundPoint:{Point:new Point(sp.x+sp.width/2,sp.y+sp.height/2),scaleX:1.3, scaleY:1.3}});
//			TweenMax.to(sp,0.1, {transformAroundCenter:{ scaleX:1.3, scaleY:1.3}});
			TweenLite.delayedCall(0.1,playBigSmall2,[sp]);
		}
		
		private function playBigSmall2(sp:DisplayObject):void
		{
			TweenMax.to(sp,0.1,{colorMatrixFilter:{brightness:1,contrast:1}});
//			TweenMax.to(sp,0.1, {transformAroundPoint:{Point:new Point(sp.x+sp.width/2,sp.y+sp.height/2),scaleX:1, scaleY:1}});
//			TweenMax.to(sp,0.1, {transformAroundCenter:{ scaleX:1, scaleY:1}});
			TweenLite.to(sp, 0.1, {scaleX:1, scaleY:1});
		}
		
		public function playSmallBigEffect(sp:DisplayObject):void
		{
			TweenMax.to(sp,0.1,{colorMatrixFilter:{brightness:1.3,contrast:1.3}});
			TweenLite.to(sp, 0.1, {scaleX:0.9, scaleY:0.9,ease:Back.easeOut});
			//			TweenMax.to(sp,0.1, {transformAroundPoint:{Point:new Point(sp.x+sp.width/2,sp.y+sp.height/2),scaleX:1.3, scaleY:1.3}});
			//			TweenMax.to(sp,0.1, {transformAroundCenter:{ scaleX:1.3, scaleY:1.3}});
			TweenLite.delayedCall(0.1,playBigSmall2,[sp]);
		}
	}
}