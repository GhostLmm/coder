package ui.widget
{
	import com.riaidea.text.RichTextField;
	import com.riaidea.text.plugins.ShortcutPlugin;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import util.Util;
	
	public class ImageTextField extends Sprite
	{
		private var richText:RichTextField;
		private var wordWrap:Boolean;
		
		public function ImageTextField($tf:TextField)
		{
			super();
			richText=new RichTextField();
			richText.defaultTextFormat=$tf.defaultTextFormat;
			richText.setSize($tf.width,$tf.height);
//			richText.setSize(300,400);
			richText.x=$tf.x;
			richText.y=$tf.y;
			richText.autoScroll=false;
//			richText.addPlugin(ImageShortcutPlungin.plungin);
			wordWrap=$tf.wordWrap;
			this.addChild(richText);
			Util.replace($tf,this);
		}
		
		public function clearText():void{
			richText.clear();
		}
		
		public function appendText(text:String,forceUpdate:Boolean=false):void{
			var textArray:Array=ImageShortcutPlungin.resetText(text);
			richText.append(textArray[0],textArray[1],wordWrap,null);
//			if(forceUpdate){
//				richText.forceRender();
//			}
			
		}
		
		public function appendTextSprits(text:String,sps:Array=null):void{
			richText.append(text,sps);
		}
		
//		public function forceRender():void{
//			richText.forceRender();
//		}
		
		public function setText(text:String,forceUpdate:Boolean=false):void{
			richText.clear();
			appendText(text,forceUpdate);
		}
		
		public function destory():void{
			if(richText){
				richText.destory();
				richText=null;
			}
		}
	}
}