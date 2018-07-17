package ui.layer
{
	import util.Queue;

import flash.display.MovieClip
	public class WaitLayer extends _LayerBase
	{
		private var _loadingMask:flash.display.MovieClip; 
		private var _waiting:Queue;
		
		public function WaitLayer()
		{
			super();
			
			_loadingMask = new (AssetManager.getAssetClass("MaskLoading") as Class); 
			_waiting = new Queue;
		}
		public function addLoading(key:*):void
		{
			_waiting.push(key);
			addChild(_loadingMask);
		}
		
		public function removeLoading(key:*):void
		{
			_waiting.remove(key);
			if(_waiting.length == 0 && contains(_loadingMask) ) {
				removeChild(_loadingMask);
			}
		}

	}
}
