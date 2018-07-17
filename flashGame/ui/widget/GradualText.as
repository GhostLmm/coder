package ui.widget
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class GradualText  implements IComponent
	{
		private var _textField:TextField;
		private var _fontRate:int;
		private var _callBack:Function;
		public function GradualText($textField:TextField)
		{
			_textField=$textField;
			_textField.mouseEnabled=false;
			_textField.selectable=false;
			text="";
			_textField.text="";
		}
		
		
		private var _text:String;
		public function set text(value:String):void
		{
			_text=value;
		}
		public function get text():String{
			return _text;
		}
		public function showText():void
		{
			_textField.text=_text;
		}
		
		private var _textIndex:int;
		public function get textIndex():int{
			return _textIndex;
		}
		public function set textIndex(value:int):void
		{
			if(_textIndex!=value){
				_textIndex=value;
				_textField.text=_text.substr(0,_textIndex);
			}
		}
		private function onTextMovieComplete():void{
			showText();
			TweenLite.killTweensOf(this);
			if(_callBack!=null){
				_callBack();
				_callBack=null;
			}
		}
		public function forceComplete():void
		{
			onTextMovieComplete();
		}
		public function showGradual($text:String,$fontRate:int=15,$comCallBack:Function=null):TweenLite
		{
			_callBack=$comCallBack;
			_fontRate=$fontRate;
			text=$text;
			return TweenLite.to(this,_text.length/_fontRate,{textIndex:_text.length+1,onComplete:onTextMovieComplete});
		}
		
		public function destory():void
		{
			_textField=null;
			_callBack=null;
			TweenLite.killTweensOf(this);
		}
	}
}