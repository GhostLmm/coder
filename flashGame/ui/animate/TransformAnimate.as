package ui.animate
{
	import flash.utils.getTimer;

	public class TransformAnimate extends _AnimateBase
	{
		public function TransformAnimate(target:*, duration:int, params:Object=null)
		{
			super(target, duration, params);
			
			if(!_params.hasOwnProperty("to")) {
				_params["to"] = new Object;
			}
		}
		
		override protected function beforeRun():void
		{
			super.beforeRun();
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
			super.afterStop();
			for(var key:String in _params["to"])
			{
				_target[key] = _params["to"][key];
			}
		}
		
		override protected function render(round:int,progress:Number):void
		{
			super.render(round,progress);
			for(var key:String in _params["to"])
			{
				_target[key] = _params["from"][key] + (_params["to"][key] - _params["from"][key]) * progress;
			}
		}
	}
}