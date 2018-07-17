package ui.task
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import ui.widget.Position;
	import ui.widget.ScrollControllerMax;
	import ui.widget.ScrollerControllerMatrix;
	
	public class TaskBasePanel extends Sprite
	{
		protected var _pos:Position;
		public var _scroll:ScrollControllerMax;
		
		public function TaskBasePanel()
		{
			super();
			var shape:MovieClip=new MovieClip();
			shape.graphics.drawRect(0,0,TaskWindow.panelRect.width,TaskWindow.panelRect.height);
			addChild(shape);
			_pos=new Position(shape);
			_scroll=new ScrollControllerMax(_pos,ScrollerControllerMatrix.VERTICAL);
			initMoulde();
			setShow();
		}
		public function get panelContainer():Sprite
		{
			return this;
		}
		protected function initMoulde():void{
			
		}
		protected function setShow():void{
			
		}
		
		public function update():void{
			
		}
		
		public function clear():void{
			if(_pos) {_pos.destory(); _pos=null;}
			if(_scroll) {_scroll.destory();_scroll=null}
		}
	}
}