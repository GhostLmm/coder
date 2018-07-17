package com.ghostlmm.guide
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	public class SceneCaption extends Sprite
	{
		private var mc:SceneYindaoStory;
		private var printer:PrinterTextMovie;
		private var textArray:Array;
		
		public var captionCom_SN:Signal=new Signal();
		public function SceneCaption()
		{
			super();
			mc=new SceneYindaoStory();
			this.addChild(mc);
			printer=new PrinterTextMovie(mc.fnt_desc);
		}
		
//		public function showDesc(text:String):void{
//			printer.startShow(text);
//		}
		
		
		public function startShow():void{
			textArray=Util.getLanguage("新手进场描述").split("$||$").reverse();
			printer.textMovieComplete_SN.add(showText);
			showText();
			addEventListener(TQTTouchEvent.TOUCH_TAP,onTap);
		}
		
		private function onTap(evt:Event):void{
			if(printer){
				printer.goNextStep();
			}
		}
		
		private function showText():void{
			if(textArray.length){
				printer.startShow(textArray.pop());
			}else{
				captionCom_SN.dispatch();
			}
		}
		
		public function destory():void{
			removeEventListener(TQTTouchEvent.TOUCH_TAP,onTap);
			captionCom_SN.removeAll();
			if(printer){
				printer.destory();
				printer=null;
			}
		}
	}
}