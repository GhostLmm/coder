package ui.animate
{
	import flash.display.Sprite;
	
	
	public class ProgressAnimate extends _AnimateBase
	{
//		private var _target:*;
		public function ProgressAnimate(target:*, duration:int, params:Object=null)
		{
			var sprite:Sprite = new Sprite;
			GlobalRef.stage.addChild(sprite);
			super(sprite, duration, params);
			
			_target = target;
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
				_target[key] = _params["to"][key];
			}
		}
		
		override protected function render(round:int,progress:Number):void
		{
			for(var key:String in _params["to"])
			{
				_target[key] = int(_params["from"][key] + (_params["to"][key] - _params["from"][key]) * progress);
			}
		}
	}
}