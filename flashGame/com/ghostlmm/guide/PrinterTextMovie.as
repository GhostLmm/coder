package com.ghostlmm.guide
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextLineMetrics;
	
	import org.osflash.signals.Signal;
	
	import ui.widget.BitdataChache;
	import ui.widget.FontField;
	
	import util.Util;

	public class PrinterTextMovie extends Sprite
	{
		private var __x:Number;
		private var __y:Number;
		private var tf:FontField;
		private var text:String;
		
		private var _textIndex:int=-1;
		
		private var _cursor:Bitmap;
		
		private var _sourceTf:TextField;
		
		private static const FR:Number=6;
		private static const StopTime:Number=4;
		
		
		public var textMovieComplete_SN:Signal=new Signal();
		
		private var step:int;
		
		public function PrinterTextMovie($tf:TextField)
		{
			Util.replace($tf,this);
			_sourceTf=$tf;
			this.addChild($tf);
			__x=$tf.x;
			__y=$tf.y;
			$tf.text="";
			tf=new FontField($tf);
			_cursor=new Bitmap();
			this.addChild(_cursor);
		}
		
		public function get textIndex():int{
			return _textIndex;
		}
		public function set textIndex(value:int):void{
			if(value!=_textIndex){
				_textIndex=value;
				var bit:BitmapData;
				if(_textIndex<text.length){
					bit=BitdataChache.getBitdata("guanbiao1");
					stopFlash();
				}else{
					bit=BitdataChache.getBitdata("guanbiao2");
					flash();
				}
				tf.text=text.substr(0,_textIndex);
				_cursor.bitmapData=bit;
				var p:Point=getLastFontPoint(_sourceTf);
				_cursor.x=p.x+__x;
				_cursor.y=p.y+__y;
				if(_textIndex>=text.length && text.length>0){
					_cursor.y=p.y+__y+getLastFontHeight()-_cursor.height;
				}
			}
		}
		private var isFlash:Boolean;
		private function flash():void{
			if(isFlash) return;
			isFlash=true;
			_cursor.alpha=1;
			TweenMax.to(_cursor, 0.75, {alpha:0,repeat:-1});
//			timeLine=new TimelineLite();
//			timeLine.add(TweenMax.to(_cursor, 0.75, {alpha:0,repeat:-1}));
//			timeLine.addPause("+="+StopTime,onComplete);
		}
		
		private function step3():void{
			step=3;
			clearTween();
			textMovieComplete_SN.dispatch();
		}
		
		private function stopFlash():void{
			isFlash=false;
			TweenMax.killTweensOf(_cursor);
			_cursor.alpha=1;
		}
		
		public function startShow($text:String):void{
			text=$text;
			step=0;
			step1();
		}
		
		private function clearTween():void{
			TweenLite.killDelayedCallsTo(step3);
			TweenLite.killTweensOf(this);
		}
		
		public function goNextStep():void{
			step++;
			switch (step){
				case 2:
					step2();
					break;
				case 3:
					step3();
					break;
			}
		}
		
		public function step1():void{
			step=1;
			clearTween();
			textIndex=0;
			_cursor.alpha=1;
			TweenLite.to(this,text.length/FR,{textIndex:(text.length+1),onComplete:step2});
		}
		
		public function step2():void{
			step=2;
			clearTween();
			textIndex=text.length+1;
			TweenLite.delayedCall(StopTime,step3);
		}
		
		public function getLastFontPoint($tf:TextField):Point{
			var p:Point=new Point();
			if($tf.text.length==0){
				return p;
			}
			
			for(var index:int=0; index<$tf.numLines-1; index++){
				p.y+=$tf.getLineMetrics(index).height;
			}
			
			p.x=$tf.getLineMetrics($tf.numLines-1).width;
			return p;
		}
		
		public function destory():void{
			clearTween();
			textMovieComplete_SN.removeAll();
			if(tf) {tf.destory();tf=null;}
		}
		
		private function getLastFontHeight():Number{
			if(_sourceTf.numLines){
				return _sourceTf.getLineMetrics(_sourceTf.numLines-1).height;
			}
			return 0;
		}
		
	}
}