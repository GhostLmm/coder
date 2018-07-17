package ui.widget
{
	public class TextTipData
	{
		public function TextTipData()
		{
		}
		
		public var text:String;
		private var _color:uint;
		public var useDefaultColor:Boolean=true;
		public var autoSize:String;
		
		
		public function get color():uint{
			return _color;
		}
		public function set color(value:uint):void{
			_color=value;
			useDefaultColor=false;
		}
	}
}