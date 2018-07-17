package ui.widget
{
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	
	import util.Util;
	
	public class ProgressManager  implements IComponent
	{
		public static const NORMAL:int = 1;
		public static const LIMIT:int = 2;
		public static const SUPPLY:int = 3;
		private var _view:MovieClip;
		private var _textField:TextInterface;
		private var _type:int;
		private var _progress:Number;
		private var _devider:Number;
		private var _format:Function;
		
		
		
		public function ProgressManager(view:MovieClip,textField:TextInterface=null,type:int=NORMAL,formatFunction:Function=null)
		{
			_view = view;
			_textField = textField;
			_type = type;
			_format = formatFunction;
			if(_textField != null && _format == null) {
				_format = defaultText;
			}
			_progress = 0;
			_devider = 1;
			update();
		}
		
		public function get view():DisplayObject
		{
			return _view;
		}
		
		public function get progress():int
		{
			return _progress;
		}
		
		public function set progress(progress:int):void
		{
			_progress = progress;
			update();
		}
		
		public function get devider():int
		{
			return _devider;
		}
		
		public function set devider(value:int):void
		{
			if(value < 0) {
				value = 0;
			}
			_devider = value;
			update();
		}

		private function update():void
		{
			var position:Number = 1;
			if(_devider != 0) {
				position = _progress / _devider;
			}
			if(position > 1) {
				position = 1;
			}
			if(position < 0) {
				position = 0;
			}
			if(_view != null) {
				_view.gotoAndStop(int(position*_view.totalFrames));
			}
			if(_textField != null) {
				_textField.text = _format(_progress,_devider);
			}
			var textColor:uint = 0XFF0000;
			switch(_type)
			{
				case LIMIT:
				{
					if(progress <= devider) {
						textColor = _textField.defaultColor;
					}
					if(_textField.textColor != textColor) {
						_textField.textColor = textColor;
					}
					break;
				}
				case SUPPLY:
				{
					if(progress >= devider) {
						textColor = _textField.defaultColor;
					}
					if(_textField.textColor != textColor) {
						_textField.textColor = textColor;
					}
					break;
				}
				case NORMAL:
				default:
				{
					break;
				}
			}
		}
		
		public static function defaultText(progress:Number,devider:Number):String
		{
			if(devider == 0) {
				return "";
			}
			return Util.stringFormat("{0}/{1}",progress,devider);
		}
		
		public static function percentText(progress:Number,devider:Number):String
		{
			if(devider == 0) {
				return "";
			}
			return Util.stringFormat("{0}%",Math.round(progress/devider*100));
		}
		
		public static function progressText(progress:Number,devider:Number):String
		{
			if(devider == 0) {
				return "";
			}
			return Util.stringFormat("{0}",progress);
		}
		public function destory():void
		{
			_view=null;
			_textField=null;
			_format=null;
		}
				
	}
}