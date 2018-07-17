package ui.widget
{
	import com.greensock.TweenLite;
	import com.iflashigame.talk.TalkField;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	
	import org.osflash.signals.Signal;
	
	import util.Util;
	
	public class MyRichText extends Sprite
	{
		public static const FontsRate:Number=15;
		
		private var _talkTf:TalkField;
		private var _showIndex:int;
		
		public var showMoveCom_SN:Signal=new Signal();
		public function MyRichText(_tf:TextField)
		{
			super();
			Util.replace(_tf,this);
			_tf.text="";
			x=_tf.x;
			y=_tf.y;
			_tf.x=0;
			_tf.y=0;
			_talkTf=new TalkField(_tf);
			this.addChild(_talkTf);
//			_talkTf=new TalkField(_tf.width,_tf.height,null,_tf.defaultTextFormat.leading,_tf.textColor);
		}
		
		public function setText(text:String):void{
			_talkTf.setText(text);
			_showIndex=_talkTf.getTfText().length;
		}
		
		public function showMoveText(text:String=null):void{
			if(text!=null) _talkTf.setText(text);
			showIndex=0;
			TweenLite.to(this,getText().length/FontsRate,{showIndex:getText().length+1,onComplete:onMoveCom});
		}
		private function onMoveCom():void{
			showIndex=getText().length+1;
			showMoveCom_SN.dispatch();
		}
		
		public function getText():String{
			return _talkTf.getTfText();
		}
		
		public function get showIndex():int{
			return _showIndex;
		}
		public function set showIndex(value:int):void{
			if(_showIndex!=value){
				_showIndex=value;
				if(_talkTf) _talkTf.showTextIndex(_showIndex);
			}
		}
		
		public function destory():void{
			showMoveCom_SN.removeAll();
			TweenLite.killTweensOf(this);
			if(_talkTf) {_talkTf.destory(); _talkTf=null;}
			this.removeChildren();
		}
	}
}