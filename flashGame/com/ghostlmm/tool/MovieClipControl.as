package com.ghostlmm.tool
{
	import flash.display.MovieClip;
	import flash.utils.Dictionary;

	
	public class MovieClipControl 
	{
		private static var opDic:Dictionary=new Dictionary();
		
		public static function controlMovieClip(target:MovieClip,callBack:Function=null,frameRate:int=0,loop:int=0,autoRemove:Boolean=false):void
		{
			if(target==null) return ;
			
			if(opDic[target]){
				(opDic[target] as MovieClipControlOP).destory();
			}
			var op:MovieClipControlOP=new MovieClipControlOP(target,frameRate,loop,autoRemove);
			if(callBack!=null){
				op.sn_PlayConpletes.add(callBack); 
			}
			
			op.sn_PlayConpletes.add(removeOP);
			op.start();
			opDic[target]=op;
		}
		
		private static function removeOP(target:MovieClip):void
		{
			delete opDic[target];	
		}
		
		public static function stopControlMovie(target:MovieClip):void
		{
			if(opDic[target])
			{
				(opDic[target] as MovieClipControlOP).destory();
				removeOP(target);
			}
		}
	}
}



import com.ghostlmm.tool.GameSession;
import com.ghostlmm.tool.ITickObj;

import flash.display.MovieClip;

import org.osflash.signals.Signal;

class MovieClipControlOP implements ITickObj
{
	private var _tickId:int;
	private var _active:Boolean;
	public var _mc:MovieClip;
	private var _frameRate:int;
	private var _loop:int;
	private var _totalFrame:int;
	private var _samp:Number;
	
	public var sn_PlayConpletes:Signal=new Signal(MovieClip);
	
	private var _autoRemove:Boolean;
	
	public function MovieClipControlOP($mc:MovieClip,$frameRate:int=0,$loop:int=0,$autoRemove:Boolean=false)
	{
		_autoRemove=$autoRemove;
		_tickId=GameSession.createTickId();
		_mc=$mc;
		_mc.gotoAndStop(1);
		if($frameRate<=0)
		{
			$frameRate=GameSession.frameRate;
		}
		_frameRate=$frameRate;
		_loop=$loop;
		_totalFrame=_mc.totalFrames;
	}
	
	public function start():void
	{
		_active=true;
		_samp=0;
		GameSession.instance.addTickObj(this);
	}
	
	public function update(interval:Number):void
	{
		_samp+=interval;
		
		var frames:int=Math.round(_samp/1000*_frameRate);
		var nowFrame:int=(frames/_totalFrame-int(frames/_totalFrame))*_totalFrame+1;
		
		
		
		if(_loop>0)
		{
			if(frames>=_loop*_totalFrame)
			{
				_mc.gotoAndStop(_totalFrame);
				_active=false;
				if(_autoRemove){
					if(_mc.parent){
						_mc.parent.removeChild(_mc);
					}
				}
				sn_PlayConpletes.dispatch(this._mc);
				destory();
				return ;
			}
		}
		if(nowFrame!=_mc.currentFrame)
		{
			_mc.gotoAndStop(nowFrame);
//			trace("帧数 ："+nowFrame+"/"+_totalFrame);
		}
		
	}
	
	public function get tickActive():Boolean
	{
		return _active;
	}
	
	public function get tickId():int
	{
		return _tickId;
	}
	
	public function destory():void
	{
		GameSession.instance.removeTickObj(this);
		if(sn_PlayConpletes){
			sn_PlayConpletes.removeAll();
			sn_PlayConpletes=null;
		}
		_mc=null;
	}
}