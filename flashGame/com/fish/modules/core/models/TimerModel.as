package com.fish.modules.core.models
{
	import com.ghostlmm.lightMVC.impl.Model;
	import com.ghostlmm.tool.GameSession;
	import com.ghostlmm.tool.ITickObj;
	
	import org.osflash.signals.Signal;
	
	public class TimerModel extends Model implements ITickObj
	{
		public static var instance:TimerModel;
		private var _tid:int;
		private var _initFlag:Boolean=false;
		public function TimerModel()
		{
			super();
			_tid=GameSession.createTickId();
			GameSession.instance.addTickObj(this);
			instance=this;
			secondTimer_SN=new Signal();
			frame_SN=new Signal(Number);
		}
		
//		public override function destory():void
//		{
//			secondTimer_SN.removeAll();
//			super.destory();
//		}
		
		private var _serverStartTime:Number;
		private var _runTime:Number;
		private var _serverTime:Number;
		private var _lasetServerTime:Number;
		
		/**  获取当前服务器时间
		 * */
		public function get serverTime():Number
		{
			return _serverTime;
		}
		
		/**   每秒钟 发送一个信号
		 * */
		public var secondTimer_SN:Signal;
		
		public var frame_SN:Signal;
		
		public function init($serverStartTime:Number):void
		{
			_serverStartTime=$serverStartTime;
			_lasetServerTime=Math.floor(_serverStartTime);
			_runTime=0;
			update(0);
			_initFlag=true;
		}
		
		public override function destory():void
		{
			GameSession.instance.removeTickObj(this);
			if( secondTimer_SN) { secondTimer_SN.removeAll(); secondTimer_SN=null;}
			if(frame_SN) {frame_SN.removeAll();frame_SN=null;}
			instance=null;
			_initFlag=false;
		}
		
		public function update(interval:Number):void
		{
			frame_SN.dispatch(interval);
			_runTime+=interval;
			_serverTime=_serverStartTime+_runTime;
			if(_serverTime-_lasetServerTime>=1000)
			{
				_lasetServerTime=Math.floor(_serverTime);
//				trace("系统时间："+serverTime);
				secondTimer_SN.dispatch();
				TimeFN.update(serverTime);
			}
		}
		
		/**  circleTime 秒
		 *  fn  function（）：void
		 *  loop <=0 ,无限循环, 否则正常循环次数
		 * */
		public function addTimerEvent(circleTime:int,fn:Function,loop:int=-1):void
		{
			TimeFN.addTimeFn(circleTime*1000,fn,_serverTime,loop);
		}
		
		public function removeTimerEvent(fn:Function):void
		{
			TimeFN.removeTimeFn(fn);
		}
		
		public function get tickActive():Boolean
		{
			return _initFlag;
		}
		public function get tickId():int
		{
			return _tid;
		}
	}
}
import flash.utils.Dictionary;

class TimeFN
{
	public var loop:int;
	public var fn:Function;
	public var startTime:Number;
	public var lastAcitvieTime:Number;
	public var circleTime:Number;
	
	public function TimeFN($cirTime:Number,$fn:Function,$startTime:Number,$loop:int)
	{
		fn=$fn;
		startTime=$startTime;
		circleTime=$cirTime;
		loop=$loop;
		lastAcitvieTime=startTime;
	}
	
	public function updateTime(now:Number):void
	{
		if(now-lastAcitvieTime>=circleTime){
			if(fn!=null){
				fn();
			}
			lastAcitvieTime=now;
			if(loop>0 && now-startTime>=circleTime*loop){
				destory();
			}
		}
	}
	
	public function destory():void
	{
		delete timerFnDic[fn];
		fn=null;
	}
	
	
	public static var timerFnDic:Dictionary=new Dictionary();
	public static function addTimeFn($cirTime:Number,$fn:Function,$startTime:Number,$loop:int):void
	{
		var t:TimeFN=timerFnDic[$fn];
		if(t){
			t.destory();
		}
		timerFnDic[$fn]=new TimeFN($cirTime,$fn,$startTime,$loop);
	}
	public static function removeTimeFn($fn:Function):void
	{
		if(timerFnDic[$fn]){
			(timerFnDic[$fn] as TimeFN).destory();
		}
	}
	
	public static function update(now:Number):void
	{
		for each(var timeFn:TimeFN in timerFnDic){
			timeFn.updateTime(now);
		}
	}
}