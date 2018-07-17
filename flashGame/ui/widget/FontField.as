package ui.widget
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import util.Util;

	public class FontField extends Sprite implements TextInterface , IComponent
	{
		private var _textField:TextField;
		private var _defaultColor:uint;
		private var _defaultText:String;
		private var _bitmapData:BitmapData;
		private var _bitmap:Bitmap;
		
		private var useBitmap:Boolean=true;
		
		public function FontField(textField:TextField)
		{
			this.mouseChildren=false;
			this.mouseEnabled=false;
			_textField = textField;
			var f:TextFormat=Util.cloneTextformat(_textField.defaultTextFormat);
//			f.font="FntHeiti";
			_textField.defaultTextFormat=f;
//			_textField.embedFonts=true;
			_defaultColor = textField.textColor;
			_defaultText = textField.text;
			mouseChildren=false;
			mouseEnabled=false;
			if(_textField.filters && _textField.filters.length>0){
				useBitmap=true;
			}else{
				useBitmap=false;
			}
			
			if(useBitmap){
				Util.replace(textField,this);
				
				_bitmapData = new BitmapData(_textField.width+4,_textField.height+4,true,_textField.backgroundColor);
				_bitmapData.draw(textField);
				_bitmap = new Bitmap(_bitmapData,"auto",true);
				_bitmap.x = _textField.x-1;
				_bitmap.y = _textField.y-1;
				addChild(_bitmap);
			}else{
				Util.replace(textField,this);
				this.addChild(textField);
			}
		
		}
		
		
		
		private function update():void
		{
			if(useBitmap){
				_bitmapData.fillRect(_bitmapData.rect, 0);
				_bitmapData.draw(_textField);
			}
		}
		
		public function setAutoSize(autoSize:String):void{
			if(_textField){
				_textField.autoSize=autoSize;
				update();
			}
		}
		
		public function get text():String
		{
			return _textField.text;
		}
		
		public function set text(value:String):void
		{
			if(_textField.text!=value)
			{
				_textField.text = value;
				update();
			}
			
		}
		public function set htmlText(value:String):void
		{
			if(_textField.htmlText!=value)
			{
				_textField.htmlText = value;
				update();
			}
		}
		public function get htmlText():String
		{
			return _textField.htmlText;
		}
		
		public function get textColor():uint
		{
			return _textField.textColor;
		}
		
		public function set textColor(value:uint):void
		{
			_textField.textColor = value;
			update();
		}

		public function get defaultColor():uint
		{
			return _defaultColor;
		}

		public function get defaultText():String
		{
			return _defaultText;
		}
		public function destory():void{
			if(_bitmapData){
				_bitmapData.dispose();
				_bitmapData=null;
			}
			this._bitmap=null;
			_textField=null;
			this.removeChildren();
		}
		
		public function getSourceText():TextField{
			return _textField;
		}
		
	}
}