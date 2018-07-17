package ui.widget
{
	import com.greensock.TweenLite;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	public class SuperTextField
	{
		private var tf:TextField;
		private var defaultTextformat:TextFormat;
		private var html:XML;
		
		private var formats:Array;
		private var strings:Array;
		private var totalLength:int;
		
		public var effectCom_SN:Signal;
		public function SuperTextField($tf:TextField)
		{
			tf=$tf;
			defaultTextformat=Util.cloneTextformat(tf.defaultTextFormat);
			effectCom_SN=new Signal();
		}
		
		public function setHtml($html:XML):void{
			html=$html;
			strings=[];
			formats=[];
			totalLength=0;
			for each(var fonts:XML in html.tf){
				var format:TextFormat=Util.cloneTextformat(defaultTextformat);
				
				if(fonts.@color!=null){
					format.color=uint(fonts.@color);
				}
				if(fonts.@size!=null){
					format.size=int(fonts.@size);
				}
				
				formats.push(format);
				
				var f:String=String(fonts);
				while(f.indexOf("{b}")!=-1){
					f=f.replace("{b}","\n");
				}
				
				strings.push(f);
				totalLength+=f.length;
			}
		}
		
		private var _fontIndex:int=-1;
		public function get fontIndex():int{
			return _fontIndex;
		}
		public function set fontIndex(value:int):void{
			if(_fontIndex!=value){
				_fontIndex=value;
				show(_fontIndex);
			}
		}
		public function destory():void{
			TweenLite.killTweensOf(this);
			tf=null;
			html=null;
			if(effectCom_SN) {effectCom_SN.removeAll();}
		}
		
		public function showEffect(time:Number=0):void{

			fontIndex=0;
			if(time==0) time=totalLength/15;
			TweenLite.to(this,time,{onComplete:onCom,fontIndex:totalLength});
		}
		
		private function onCom():void{
			fontIndex=totalLength;
			effectCom_SN.dispatch();
		}
		
		
		public function show(endIndex:int=-1):void{
			if(endIndex<=-1) endIndex=totalLength;
			if(endIndex>totalLength) endIndex=totalLength;
			var inedex:int=0;
			var fontIndex:int=0;
			var s:String="";
			while(fontIndex<endIndex){
				var ts:String=strings[inedex];
				inedex++;
				if(fontIndex+ts.length<endIndex){
					s+=ts;
					fontIndex+=ts.length;
					
				}else{
					s+=ts.substr(0,endIndex-fontIndex);
					break;
				}
			}
			tf.text=s;
			var beginX:int=0;
			for(var id:int=0; id<inedex; id++){
				var tt:int=strings[id].length+beginX;
				if(tt>s.length){
					tt=s.length;
				}
				tf.setTextFormat(formats[id],beginX,tt);
				beginX=tt;
			}
		}
		
		
	}
}