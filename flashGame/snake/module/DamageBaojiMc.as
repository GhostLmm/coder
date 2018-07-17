package snake.module
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	
	import ui.widget.NumFontStatic;
	
	import view.Base_Mc;
	
	public class DamageBaojiMc extends Base_Mc
	{
		public var _numMc:NumFontStatic;
		public function DamageBaojiMc()
		{
			super();
		}
		protected override function initModule():void
		{
			_numMc=new NumFontStatic(mcMaterial.num_shanghai);
		}
		protected override function registerEvent():void
		{
			
		}
		protected override function setShow():void
		{
			
		}
		public override function destory():void
		{
			_numMc.destory();
			_numMc=null;
			super.destory();
		}
		protected override function get mcClassName():Class
		{
			return McTextCri;
		}
		private function get mcMaterial():McTextCri
		{
			return m_mc as McTextCri;
		}
		public override function get width():Number
		{
			return _numMc._rect.x+_numMc.getTextWidth();
		}
		public var _bitdata:BitmapData;
		public function initBitData():void
		{
			_bitdata=new BitmapData(this.width,this.height,true,0);
			_bitdata.draw(m_mc as MovieClip);
		}
		protected override function isNeedSetText():Boolean
		{
			return false;
		}
	}
}