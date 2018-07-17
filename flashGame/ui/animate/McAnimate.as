package ui.animate
{
	import flash.display.MovieClip;

	public class McAnimate extends _AnimateBase
	{
		public function McAnimate(target:MovieClip, duration:int, params:Object=null)
		{
			super(target, duration, params);
			if(!_params.hasOwnProperty("to")) {
				_params["to"] = new Object;
			}
		}
		
		override protected function beforeRun():void
		{
			if(!_params.hasOwnProperty("from")) {
				_params["from"] = new Object;
			}
			for(var key:String in _params["to"])
			{
				if(!_params["from"].hasOwnProperty(key)) {
					_params["from"][key] = _target[key];
				}
			}
			_loop = false;
		}
		
		override protected function afterStop():void
		{
			for(var key:String in _params["to"])
			{
				_target[key] = _params["to"][key]
			}
			_target.stop();
//			_target.parent.removeChild(_target);
		}
		
		override protected function render(round:int,progress:Number):void
		{
			for(var key:String in _params["to"])
			{
				_target[key] = int(_params["from"][key] + (_params["to"][key] - _params["from"][key]) * progress);
			}
			_target.gotoAndStop(int(_target.totalFrames*progress));
		}
		
		/*private function get target():MovieClip
		{
			return _target;
		}*/
	}
}