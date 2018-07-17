package ui.layer
{
	import ui.window.RootWindow;

	public class WindowLayer extends _LayerBase
	{
		public function WindowLayer()
		{
			super();
			_scene = new RootWindow;
			_scene.name = "RootWindow";
		}
		
		public function get rootWindow():RootWindow
		{
			return _scene;
		}
	}
}