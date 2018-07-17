package ui.animate
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import util.Util;

	public class ReverseAnimate extends _AnimateBase
	{
		private var _from:DisplayObject;
		private var _to:DisplayObject;
		
		private var _rect:Rectangle;
		private var _percent:Number = 1;
		private var _width:int;
		
		/**
		 * @param params: {duration: animate duration,onStart:callback on start, onComplete: callback on complete}
		 * 
		 * */
		public function ReverseAnimate(target:Sprite,duration:int,params:Object=null)
		{
			super(target,duration,params);
			
			_from = _params["from"];
			_to = _params.hasOwnProperty("to") ? _params["to"] : _params["from"];
		}
		
		override public function get relatedObjects():Array
		{
			return [_target,_from,_to];
		}
		
		override protected function beforeRun():void
		{
			if(_params.hasOwnProperty("rect")) {
				_rect = _params["rect"];
			}
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
			_loop = false;
		}
		
		override protected function afterStop():void
		{
			render(0,-1);
		}
		
		override protected function render(round:int,progress:Number):void
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