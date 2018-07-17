package snake.module
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	
	import view.Base_Mc;
	
	public class DamageShanbiMc extends Base_Mc
	{
		public function DamageShanbiMc()
		{
			super();
		}
		protected override function get mcClassName():Class
		{
			return McTextEva;
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