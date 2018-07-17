package ui.widget
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.TouchEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	import core.event.TQTTouchEvent;

	public class InputField  implements IComponent
	{
		/**
		 * 不能输入中文
		 */
		public static const Ristrict_Str_CN:String="0-9a-zA-Z";
		private var _textField:TextField;
		private var _defaultColor:uint;
		private var _defaultText:String;
		private var _limit:int;
		private var _proxy:ListenerAddProxy;
		
		public function get textField():TextField
		{
			return _textField;
		}
		
		public function InputField(textField:TextField,limit:int=0)
		{
			_proxy=new ListenerAddProxy();
			_textField = textField;
			_limit = limit;
			_defaultText = textField.text;
//			Util.replace(textField,this);
//			addChild(_textField);
			_textField.type = TextFieldType.INPUT;
			_textField.alpha = 0.5;
			_textField.maxChars = limit;
			_textField.restrict = "0-9a-zA-Z\u4e00-\u9fa5";
			
//			_textField.selectable=true;
//			_textField.mouseEnabled=true;
//			_textField.addEventListener(TQTTouchEvent.TOUCH_END,onTouchEnd,false,0,true);
//			_textField.addEventListener(FocusEvent.FOCUS_OUT,onFocusOut,false,0,true);
//			_textField.addEventListener(FocusEvent.FOCUS_IN,onFocusIn,false,0,true);
			_proxy.addListener(_textField,TQTTouchEvent.TOUCH_END,onTouchEnd,false,0,true);
			_proxy.addListener(_textField,FocusEvent.FOCUS_OUT,onFocusOut,false,0,true);
			_proxy.addListener(_textField,FocusEvent.FOCUS_IN,onFocusIn,false,0,true);
		}
		/**
		 * 设置输入限制
		 */
		public function setRestrict(_value:String):void
		{
			_textField.restrict=_value;
		}
		public function destory():void
		{
			if(_proxy){
				_proxy.clear();
				_proxy=null;
			}
			_textField=null;
		}
		
		protected function onTouchEnd(evt:Event):void
		{
			_textField.stage.focus = _textField;
		}
		
		protected function onFocusIn(evt:Event):void
		{
			if(_textField.alpha == 0.5) {
				_textField.alpha = 1;
				_textField.text = "";
				_textField.displayAsPassword=displayAsPassword;
			}
		}
		
		private var _displayAsPassword:Boolean=false;
		public function set displayAsPassword(value:Boolean):void{
			if(_displayAsPassword!=value){
				_displayAsPassword=value;
				
			}
		}
		public function get displayAsPassword():Boolean{
			return _displayAsPassword;
		}
		
		protected function onFocusOut(evt:Event):void
		{
			if(_textField.text.length == 0) {
				_textField.alpha = 0.5;
				_textField.text = _defaultText;
				_textField.displayAsPassword=false;
			}
		}
		
		public function isInputed():Boolean
		{
			return (_textField.alpha == 1);
		}
		
		public function get text():String
		{
			return _textField.text;
		}
		
		public function set text(value:String):void
		{
			_textField.text = value;
			_textField.alpha = 1;
		}
	}
}