package com.ghostlmm.story
{

	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * ...
	 * @author weoweo
	 * 
	 * component.text.BaseText
	 */
	public class BaseText extends Sprite
	{
		
		protected var _txt:TextField
		protected var _parent:DisplayObjectContainer;
		protected var _width:uint;
		protected var _height:uint;
		protected var _convas:Bitmap;
		protected var _convadata:BitmapData;
		
		public function BaseText(txt:TextField=null,par:DisplayObjectContainer=null) 
		{
			_txt = txt || new TextField();
			_parent = par;
			_width = _txt.width;
			_height = _txt.height;
			initialComponent();
		}
		
		
		// 原始宽度
		protected var _r_width:int;
		//--原始高度
		protected var _r_height:int;
		protected function initialComponent():void 
		{
		
			if (_txt) {
				
				
				if (_parent == null) _parent = _txt.parent;
				if (_parent != null) {
					//var index:uint = _parent.contains(_txt)?_parent.getChildIndex(_txt):_parent.numChildren;
					_parent.addChild(this);
				}
				
				this.x = _txt.x; this.y = _txt.y;
				_txt.x = _txt.y = 0;
			//	_txt.embedFonts=false;
				_txt.text="";
				_convas=new Bitmap();
				_parent.removeChild(_txt);
				addChild(_convas);
				
				_r_width=_txt.width;
				_r_height=_txt.height;
			}
			refreshBitData();
		}
		
		public function SetFormat(f:TextFormat):void
		{
			if (_txt == null) return;
			_txt.defaultTextFormat = f;
			_txt.setTextFormat(f);
			refreshBitData();
			
		}
	
		
		public function fillTextString(s:String):void {
			if (_txt == null) return;
			_txt.text = s;
			refreshBitData();
		}
		public function fillHtmlString(s:String):void {
			if (_txt == null) return;
			_txt.htmlText = s;
			refreshBitData();
		}
		
		public function getTextString():String {
			
			if (_txt == null) return null;
			return _txt.text;
		}
		public function set autoSize(s:String):void {
			
			if (_txt == null) return;
			
			_txt.autoSize = s;
			refreshBitData();
		}
		
		
		public function set wordWrap(v:Boolean):void {
			
			if (_txt == null) return;
			_txt.wordWrap = v;
			refreshBitData();
		}
		public function get wordWrap():Boolean {
			
			if (_txt == null) return false;
			return _txt.wordWrap;
		}
		
		override public function get width():Number 
		{
			return super.width;
			
		}
		
		override public function set width(value:Number):void 
		{
			
			if (this._txt == null) return;
			this._txt.width = value;
			super.width = value;
			refreshBitData();
		}
		
		override public function get height():Number 
		{
			return super.height;
		}
		
		override public function set height(value:Number):void 
		{
			super.height = value;
			if (this._txt == null) return;
			this._txt.height = value;
			refreshBitData();
		}
		
		public function get textWidth():uint 
		{
			if (_txt == null) return 0;
			return _txt.textWidth;
		}
		
		
		public function set multiline(v:Boolean):void {
			
			if (_txt == null) return;
			_txt.multiline = v;
		}
		
		public function get multiline():Boolean {
			
			if (_txt == null) return false;
			return _txt.multiline;
		}
		
		public function set condenseWhite(v:Boolean):void {
			if (_txt == null) return;
			_txt.condenseWhite = v;
			
		}
		public function get condenseWhite():Boolean {
			if (_txt == null) return false;
			return _txt.condenseWhite;
		}
		
		public function set maxChars(v:uint):void {
			
			if (_txt == null) return;
			_txt.maxChars = v;
			refreshBitData();
		}

		
		protected function refreshBitData():void{
			
			
			if(_convadata) _convadata.dispose();
			
			var rect:Rectangle=_txt.getBounds(_txt);
			_convadata=new BitmapData(rect.width,rect.height,true,0);
			
			_convadata.draw(_txt,new Matrix(1,0,0,1,-rect.x,-rect.y));
			_convas.bitmapData=_convadata;
			
			switch(_txt.autoSize){
				
				
				
				case "center":
					_convas.x=(_r_width-rect.width)/2;
					break;
			}
			
		}
		
		public function getBitmap():Bitmap{
			
			return _convas;
		}
		
		
		
	}

}