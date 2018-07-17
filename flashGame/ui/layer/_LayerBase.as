package ui.layer
{
	import flash.display.Sprite;
	
	import ui.mc._McBase;
	
//	import util.Density;

	public class _LayerBase extends _McBase
	{
		public function _LayerBase()
		{
			super();
			_scene = new Sprite;
//			Density.zoom(this);
		}
	}
}