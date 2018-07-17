package ui.leitai
{
	import ui.widget.Position;
	import ui.window._WindowBase;
	
	public class LeitaiPkWindow extends _WindowBase
	{
		public var _POS_A:Position;
		public var _POS_B:Position;
		
		public function LeitaiPkWindow(params:Object=null)
		{
			super(params);
			_scene=AssetManager.createMCForText(LeitaiMovie);
			initModule()
		}
		private function initModule():void
		{
			_POS_A=new Position(windowMaterial.POS_A);
			_POS_B=new Position(windowMaterial.POS_B);
		}
		private function destroyMc():void
		{
			if(_POS_A){_POS_A.destory();_POS_A=null;};
			if(_POS_B){_POS_B.destory();_POS_B=null;};
		}
		public override function destory():void
		{
			destroyMc();
			super.destory();
		}
		private function get windowMaterial():LeitaiMovie
		{
			return _scene as LeitaiMovie;
		}
		/**
		 * 背景透明度
		 */
		protected override function get backColorAlpha():Number
		{
			return 1;
		}
		/**
		 * 绘制背景
		 */
		protected override function get backTransparant():Number
		{
			return 1;
		}
		/**
		 * 背景是否支持渐变
		 */
		protected override function get isNeedGradualChange():Boolean
		{
			return false;
		}
	}
}