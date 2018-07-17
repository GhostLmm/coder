package com.ghostlmm.tool
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;

	public class ShakeTool
	{
		public function ShakeTool()
		{
		}
		
		private static var shakeDic:Dictionary=new Dictionary();
		private static var sp:Sprite;
		
		
		private var _target:DisplayObject;
		private var _degree:Number;
		private var _focus:Point;
		private var _endTime:int;
		
		private function __Shake():void{
			var sx:Number;
			var sy:Number;
			var c:int;
			sx = ((Math.random() * 10) + 10);
			sy = ((Math.random() * 10) + 10);
			c = int((Math.random() * 2));
			if (c == 0){
				sx = (sx * -1);
			};
			c = int((Math.random() * 2));
			if (c == 0){
				sy = (sy * -1);
			};
			sx = (sx * _degree);
			sy = (sy * _degree);
			
			if(_target){
				_target.x=_focus.x+sx;
				_target.y=_focus.y+sy;
			}
		}
		
		private function destory():void{
			if(_target){
				_target.x=_focus.x;
				_target.y=_focus.y;
			}
			_target=null;
		}
		
		
		public static function shake(target:DisplayObject,time:Number=0.5,degree:Number=1.0,focus:Point=null):void{
			var shakeTool:ShakeTool;
			if(shakeDic[target]==null){
				shakeDic[target]=new ShakeTool();
			}
			if(focus==null){
				focus=new Point();
			}
			shakeTool=shakeDic[target];
			shakeTool._target=target;
			shakeTool._degree=degree;
			shakeTool._focus=focus;
			shakeTool._endTime=getTimer()+time*1000;
			
			if(sp==null){
				sp=new Sprite();
				sp.addEventListener(Event.ENTER_FRAME,onFrame);
			}
		}
		
		public static function killShake(target:DisplayObject):void{
			if(shakeDic[target]!=null){
				var shakeTool:ShakeTool=shakeDic[target];
				delete shakeDic[target];
				shakeTool.destory();
			}
		}
		
		private static function onFrame(evt:Event):void{
			var now:int=getTimer();
			for each(var shakeTool:ShakeTool in shakeDic){
				if(shakeTool._endTime<now){
					delete shakeDic[shakeTool._target];
					shakeTool.destory();
				}else{
					shakeTool.__Shake();
				}
			}
		}
		
	}
}