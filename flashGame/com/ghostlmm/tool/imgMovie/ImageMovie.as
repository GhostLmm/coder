package com.ghostlmm.tool.imgMovie
{
	import com.ghostlmm.tool.GameSession;
	import com.ghostlmm.tool.ITickObj;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class ImageMovie extends Sprite implements ITickObj
	{
		private var bitmap:Bitmap;
//		private var frameRate:int;
		private var bitdatVect:Vector.<BitmapData>;
		private var _movieName:String;
		
		private var lifeState:int=-1;
		private var _tickId:int;
		
		private var _frameRate:int;
		private var _loop:int;
		private var _totalFrame:int;
		private var _samp:Number;
		
		private var _currentFrame:int;
		
		private var isPlay:Boolean=false;
		
		private var _autoClear:Boolean=false;
		
		public function ImageMovie($movieName:String,$rate:int=24)
		{
			
			super();
			_movieName=$movieName;
			_frameRate=$rate;
			bitmap=new Bitmap();
			this.addChild(bitmap);
			addEventListener(Event.ADDED_TO_STAGE,onAddtoStage);
			_tickId=GameSession.createTickId();
			GameSession.instance.addTickObj(this);
		}
		
		private function onAddtoStage(evt:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,onAddtoStage);
			bitdatVect=ImgAssetConrol.getInstance().movieApply(_movieName);
			lifeState=1;
		}
		
		public function play(loop:int=-1,autoClear:Boolean=false):void
		{
			isPlay=true;
			_samp=0;
			_currentFrame=1;
			_loop=loop;
			if(stage && bitdatVect && bitdatVect.length){
				bitmap.bitmapData=bitdatVect[0];
			}
			_autoClear=autoClear;
		}
		
		public function update(interval:Number):void
		{
			if(!isPlay) return ;
			if(!bitdatVect) return ;
			if(bitdatVect.length==0) return ;
			if(_totalFrame==0) _totalFrame=bitdatVect.length;
			
			
			_samp+=interval;
			
			var frames:int=Math.round(_samp/1000*_frameRate);
			var nowFrame:int=(frames/_totalFrame-int(frames/_totalFrame))*_totalFrame;
			
			if(nowFrame!=_currentFrame)
			{
				_currentFrame=nowFrame;
//				_mc.gotoAndStop(nowFrame);
				if(stage){
					bitmap.bitmapData=bitdatVect[_currentFrame];
				}
			}
			
			if(_loop>0)
			{
				if(frames>_loop*_totalFrame)
				{
//					_active=false;
					isPlay=false;
//					sn_PlayConpletes.dispatch(this._mc);
//					destory();
					if(_autoClear){
						if(this.parent)
						{
							parent.removeChild(this);
							destory();
						}
					}
				}
			}
		}
		public function get tickActive():Boolean
		{
			return true;
		}
		public function get tickId():int
		{
			return _tickId;
		}
		
		
		public function destory():void
		{
			if(lifeState==1)
			{
				ImgAssetConrol.getInstance().movieRevoke(_movieName);
				bitmap.bitmapData=null;
				bitmap=null;
				lifeState=2;
			}
		}
		
	}
}