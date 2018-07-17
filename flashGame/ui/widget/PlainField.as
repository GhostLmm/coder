package ui.widget
{
	import flash.text.TextField;
	
	public class PlainField implements TextInterface  implements IComponent
	{
		private var _textField:TextField;
		private var _defaultColor:uint;
		private var _defaultText:String;
		
		public function PlainField(textField:TextField)
		{
			_textField = textField;
			_defaultColor = textField.textColor;
			_defaultText = textField.text;
			
			_textField.cacheAsBitmap = true;
			_textField.selectable = false;
			_textField.doubleClickEnabled = false;
		}
		
		public function destory():void
		{
			_textField=null;
		}
		
		public function get text():String
		{
			return _textField.text;
		}
		
		public function set text(value:String):void
		{
			_textField.text = value;
		}
		
		public function get textColor():uint
		{
			return _textField.textColor;
		}
		
		public function set textColor(value:uint):void
		{
			_textField.textColor = value;
		}
		
		public function get visible():Boolean
		{
			return _textField.visible;
		}
		
		public function set visible(value:Boolean):void
		{
			_textField.visible = value;
		}
		
		public function get defaultColor():uint
		{
			return _defaultColor;
		}
		
		public function get defaultText():String
		{
			return _defaultText;
		}
	}
}