package Tool
{
	import com.greensock.TweenLite;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	public class TextFieldScroll
	{
		private var target:TextField;
		private var height:Number;
		private var width:Number;
		
		private var container:Sprite;
		private var mask:Shape;
		
		private var stage:Stage;
		
		private var state:int=1;
		public function TextFieldScroll(_target:TextField,_width:Number=-1,_height:Number=-1)
		{
			width=_width;
			height=_height;
			if(width<0)  width=_target.width;
			if(height<0) height=_target.height;
			target=_target;
			container=new Sprite();
			container.x=target.x;
			container.y=target.y;
			var index:int=target.parent.getChildIndex(target);
			target.parent.addChildAt(container,index);
			target.x=0;target.y=0;
			mask=new Shape();
			mask.graphics.beginFill(0,0);
			mask.graphics.drawRect(0,0,width,height);
			container.addChild(target);
			container.addChild(mask);
			container.mask=mask;
			
			container.addEventListener(MouseEvent.MOUSE_DOWN,onDown);
		}
		private var mouseY:Number;
		private function onDown(evt:MouseEvent):void{
			if(stage==null) stage=container.stage;
			if(state!=1){
				trace("文本正在滚动中，mouseDown无效");
				return ;
			}
			stage.addEventListener(MouseEvent.MOUSE_UP,onUp);
			stage.addEventListener(Event.DEACTIVATE,onDeActivity);
			mouseY=container.mouseY;
			stage.addEventListener(Event.ENTER_FRAME,onFrame);
			state=2;
		}
		private function onFrame(evt:Event):void{
			var derY:Number=container.mouseY-mouseY;
			mouseY=container.mouseY;
			updateTextPos(derY);
		}
		private function onDeActivity(evt:Event):void{
			clearListern();
			adjustTextPos();
		}
		private function onUp(evt:MouseEvent):void{
			clearListern();
			adjustTextPos();
		}
		private function updateTextPos(derY:Number):void{
			target.y+=derY;
		}
		private function adjustTextPos():void{
			var min:Number=height-target.height;
			var max:Number=0;
			var tY:Number=Math.min(target.y,max);
			tY=Math.max(min,tY);
			TweenLite.to(target,1,{y:tY,onComplete:scrollOver});
			state=3;
		}
		
		public function rejust():void{
			var min:Number=height-target.height;
			var max:Number=0;
			var tY:Number=Math.min(target.y,max);
			tY=Math.max(min,tY);
			target.y=tY;
		}
		
		private function scrollOver():void{
			
			state=1;
		}
		private function clearListern():void{
			if(stage){
				stage.removeEventListener(MouseEvent.MOUSE_UP,onUp);
				stage.removeEventListener(Event.DEACTIVATE,onDeActivity);
				stage.removeEventListener(Event.ENTER_FRAME,onFrame);
			}
			stage=null;
		}
		
		public function clear():void{
			clearListern();
			if(container!=null){
				container.removeEventListener(MouseEvent.MOUSE_DOWN,onDown);
			}
			container=null;
			mask=null;
		}
	}
}