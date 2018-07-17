package ui.animate
{
	public class RollAnimate extends _AnimateBase
	{
		private var _from:Object;
		private var _to:Object;
		
		public function RollAnimate(target:*, duration:int, params:Object=null)
		{
			super(target, duration, params);
			
			if(!_params.hasOwnProperty("delta")) {
				_params["delta"] = new Object;
			}
		}
		
		override protected function beforeRun():void
		{
			if(!_params.hasOwnProperty("from")) {
				_params["from"] = new Object;
			}
			for(var key:String in _params["delta"])
			{
				if(!_params["from"].hasOwnProperty(key)) {
					_params["from"][key] = _target[key];
				}
			}
			_loop = false;
		}
		
		override protected function afterStop():void
		{
			for(var key:String in _params["from"])
			{
				_target[key] = _params["from"][key]
			}
		}
		
		override protected function render(round:int,progress:Number):void
		{
			for(var key:String in _params["delta"])
			{
				_target[key] = _params["from"][key] + _params["delta"][key] * Math.sin(Math.PI*progress);
			}
		}
	}
}