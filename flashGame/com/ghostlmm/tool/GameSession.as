package com.ghostlmm.tool
{

	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	public class GameSession extends EventDispatcher
	{
		public function GameSession()
		{
		}
		
		public static var frameRate:int=30;
		
		public var stage:Stage;
		public var root:Sprite;
		private var tickObjDic:Dictionary=new Dictionary();
		
		private var timestamp:int;
		
		private static var _instance:GameSession;
		
		public static function get instance():GameSession
		{
			if(_instance==null) _instance=new GameSession();
			return _instance;
		}
		
		public function setStageAndRoot($stage:Stage,$root:Sprite):void
		{
			
			stage=$stage;
			root=$root;
		}
		
		public function startTick():void
		{
			timestamp=getNowMinTime();
			stage.addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		private function getNowMinTime():Number{
//			trace( new Date().toLocaleTimeString());
			return new Date().time;
		}
		
		private function onFrame(evt:Event):void
		{
			var now:int=getNowMinTime();
			var interval:Number=now-timestamp;
			if(interval<0){
				interval=1;
			}
//			trace("间隔时间： "+interval);
			timestamp=now;
			for each(var tickObj:ITickObj in tickObjDic)
			{
				if(tickObj && tickObj.tickActive){
					tickObj.update(interval);
				}else{
					continue;
				}
			}
		}
		
		private static var nowTickId:int=1000;
		public static function createTickId():int
		{
			nowTickId++;
			return nowTickId;
		}
		
		public function addTickObj(tickObj:ITickObj):void
		{
			if(tickObj){
				tickObjDic[tickObj.tickId]=tickObj;
			}
		}
		
		public function removeTickObj(tickObj:ITickObj):void
		{
			if(tickObj){
				delete tickObjDic[tickObj.tickId];
			}
		}
	}
}