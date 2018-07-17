package ui.widget
{
	import com.adobe.utils.StringUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormatAlign;
	
	import util.Util;
	
	/**
	 *   静态的数字文本
	 */
	public class NumFontStatic extends Sprite implements IComponent,TextInterface
	{
		private var _align:String;
		private var _fntType:String;
		public var _rect:Rectangle;
		private var _text:String;
		
		
		private var _bitdata:BitmapData;
		
		private var fontWidth:Number;
		private var fontHeight:Number;
		private var matrix:Matrix;
		public function NumFontStatic(tf:TextField)
		{
			super();
			Util.replace(tf,this);
			_rect=new Rectangle(tf.x,tf.y,tf.width,tf.height);
			_align=tf.defaultTextFormat.align;
			
			
			_bitdata=new BitmapData(_rect.width,_rect.height,true,0);
			var _bitmap:Bitmap=new Bitmap(_bitdata);
			_bitmap.x=_rect.x;
			_bitmap.y=_rect.y;
			this.addChild(_bitmap);
			fontType=StringUtil.trim(tf.text);
		}
		
		public function set text(value:String):void{
			if(_text!=value){
				_text=value;
				updateDraw();
			}
		}
		private var _textWidth:Number=0;
		public function getTextWidth():Number
		{
			return _textWidth;
		}
		public function set autoSize(type:String):void
		{
			_align=type;
			updateDraw();
		}
		public function set fontType($ft:String):void{
			_fntType=$ft;
			matrix=new Matrix();
			fontHeight=_rect.height;
			fontWidth=fontHeight/AssetManager.getFontHeight(_fntType)*AssetManager.getFontWidth(_fntType);
			matrix.scale(fontHeight/AssetManager.getFontHeight(_fntType),fontHeight/AssetManager.getFontHeight(_fntType));
//			matrix.scale(AssetManager.getFontHeight(_fntType)/fontHeight,AssetManager.getFontHeight(_fntType)/fontHeight);
		}
		
		public function get text():String
		{
			return _text;
		}
		
		private function updateDraw():void{
			_bitdata.fillRect(_bitdata.rect,0);
			if(_text==null || _text==""){
				return ;
			}
			var offsetX:Number=0;
			if(_align==TextFormatAlign.CENTER){
				offsetX=(_rect.width-_text.length*fontWidth)/2;
			}
			if(_align==TextFormatAlign.RIGHT){
				offsetX=_rect.width-_text.length*fontWidth;
			}
			for(var index:int=0; index<_text.length; index++){
				var char:String=_text.charAt(index);
				var bit:BitmapData=AssetManager.getFontBitdata(char,_fntType);
				matrix.tx=offsetX+index*fontWidth;
				matrix.ty=0;
				_bitdata.draw(bit,matrix);
			}
			_textWidth=fontWidth*_text.length;
		}
		
		private var _color:uint;
		public function get textColor():uint{
			return _color;
		}
		public function set textColor(value:uint):void{
			_color=value;
		}
		public function get defaultColor():uint{
			return _color;
		}
		public function get defaultText():String{
			return _text;
		}
	
		
		public function destory():void
		{
			this.removeChildren();
			if(_bitdata) {_bitdata.dispose();_bitdata=null;}
			
		}
	}
}