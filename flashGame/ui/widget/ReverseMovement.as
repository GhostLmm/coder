package ui.widget
{
	import com.greensock.TweenLite;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import util.Util;

	public class ReverseMovement
	{
		private var _from:DisplayObject;
		private var _to:DisplayObject;
		
		private var _rect:Rectangle;
		private var _percent:Number = 1;
		private var _width:int;
		private var _target:Sprite;
		
		private var _progress:Number=0;
		
		public function ReverseMovement($target:Sprite,$from:DisplayObject,$to:DisplayObject)
		{
			_target=$target;
			_to=$to;
			_from=$from;
		}
		
		private function beforeRun():void
		{
			if(_rect == null) {
				_rect = new Rectangle(_from.x,_from.y,_from.width,_from.height);
			}
			_from.x = _rect.x;
			_from.y = _rect.y;
			_from.width = _rect.width;
			_from.height = _rect.height;
			if(Sprite(_target).contains(_from) == false) {
				Sprite(_target).addChild(_from);
			}
			if(Sprite(_target).contains(_to)) {
				Sprite(_target).removeChild(_to);
			}
			progress=0;
		}
		
		private function afterStop():void
		{
			progress=-1;
		}
		
		public function createTween(time:Number):TweenLite
		{
			return TweenLite.to(this,time,{onStart:beforeRun,onComplete:afterStop,progress:1});
		}
		
		
		public function destory():void
		{
			TweenLite.killTweensOf(this);
			_target=null;
			_to=null;
			_from=null;
		}
		
		public function stopTween():void
		{
			TweenLite.killTweensOf(this);
		}
		
		public function get progress():Number
		{
			return _progress;
		}
		public function set progress(value:Number):void
		{
			var percent:Number = Math.cos(Math.PI*progress);
			
			var from:DisplayObject = _percent > 0 ? _from : _to;
			var to:DisplayObject = percent > 0 ? _from : _to;
			
			if(from != to) {
				Util.replace(from,to);
				from.x = _rect.x;
				from.y = _rect.y;
				from.width = _rect.width;
				from.height = _rect.height;
			}
			to.x = _rect.x;
			to.y = _rect.y;
			to.width = _rect.width;
			to.height = _rect.height;
			
			to.width = Math.abs(percent * _rect.width);
			to.x = _rect.x + _rect.width/2 - to.width/2;
			_percent = percent;
		}
		
		
	}
}