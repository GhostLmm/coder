package ui.widget
{
	import com.adobe.utils.StringUtil;
	import com.greensock.TweenLite;
	import com.greensock.plugins.EndArrayPlugin;
	import com.greensock.plugins.TweenPlugin;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormatAlign;
	
	import util.Util;
	
	public class NumFontScroll extends Sprite implements IComponent
	{
		private var maxLength:int;
		
		private var _align:String;
		private var _fntType:String;
		private var _rect:Rectangle;
		
		private var _bitdata:BitmapData;
		
		private var fontWidth:Number;
		private var fontHeight:Number;
		private var matrix:Matrix;
		
		private var nums:Array;
		
		private var _num:int;
		
		public function NumFontScroll(tf:TextField)
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
			
			maxLength=_rect.width/fontWidth;
			
			nums=[];
			for(var index:int=0; index<maxLength; index++){
				nums.push(0.0);
			}
			updateDraw();
		}

		private function set fontType($ft:String):void{
			_fntType=$ft;
			matrix=new Matrix();
			fontHeight=_rect.height;
			fontWidth=fontHeight/AssetManager.getFontHeight(_fntType)*AssetManager.getFontWidth(_fntType);
			matrix.scale(fontHeight/AssetManager.getFontHeight(_fntType),fontHeight/AssetManager.getFontHeight(_fntType));
		}
		
		private function intToArray(value:int):Array{
			var array:Array=new Array(maxLength);
			var xishu:int=1;
			for(var index:int=0; index<maxLength; index++){
				array[maxLength-index-1]=Number(int(value/xishu));
				xishu*=10;
			}
			return array;
		}
		
		private function calcTextLength(array:Array):int
		{
			var numLength:int=maxLength;
			for each(var n:Number in array){
				if(n<=0.1){
					numLength--;
				}else{
					break;
				}
			}
//			trace("长度： "+numLength);
			if(numLength==0) numLength=1;
			return numLength;
			
		}
		
		
		
		private function updateDraw():void{
			if(_bitdata==null) return;
			_bitdata.fillRect(_bitdata.rect,0);
//			trace(nums);
			var offsetX:Number=0;
			var textLength:int=calcTextLength(nums);
			if(_align==TextFormatAlign.CENTER){
				offsetX=(_rect.width-textLength*fontWidth)/2;
			}
			if(_align==TextFormatAlign.RIGHT){
				offsetX=_rect.width-textLength*fontWidth;
			}
			for(var index:int=maxLength-textLength; index<maxLength; index++){
				var n:Number=nums[index];
				var bit1:BitmapData;
				var bit2:BitmapData;
				if(n==0 && index!=maxLength-1){
					continue;
				}
				var t:Array=n.toString().split(".");
				var newN:Number=Number(t[0].charAt(t[0].length-1)+"."+((t.length>1)?t[1]:"0"));
				var floor:int=Math.floor(newN);
				var ceil:int=Math.ceil(newN);
				
				bit1=AssetManager.getFontBitdata(floor.toString(),_fntType);
				bit2=AssetManager.getFontBitdata((ceil==10)?"0":ceil.toString(),_fntType);
				
				if(n<=1 && index!=maxLength-1){
					bit1=AssetManager.getFontBitdata(" ",_fntType);
				}
				
				matrix.tx=offsetX+(index-maxLength+textLength)*fontWidth;
				matrix.ty=(floor-newN)*fontHeight;
				_bitdata.draw(bit1,matrix);
				matrix.tx=offsetX+(index-maxLength+textLength)*fontWidth;
				matrix.ty=(ceil-newN)*fontHeight;
				_bitdata.draw(bit2,matrix);
			}
		}
		
		public function get num():int
		{
			return _num;
		}
		public function set num(value:int):void
		{
			if(_num!=value){
				_num=value;
				var target:Array=intToArray(_num);
				TweenPlugin.activate([EndArrayPlugin]);
				TweenLite.to(nums,1,{endArray:target,onUpdate:updateDraw});
			}
		}
		
	
		
		
		
		public function destory():void{
			if(_bitdata){_bitdata.dispose();_bitdata=null;}
			this.removeChildren();
			TweenLite.killTweensOf(nums);
		}
	}
}