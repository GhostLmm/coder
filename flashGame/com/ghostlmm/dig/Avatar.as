package com.ghostlmm.dig
{
	import com.ghostlmm.tool.WheelControl;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;


	/**
	 *   游戏角色替身， 控制走路，
	 */
	public class Avatar
	{
		private var _roleMC:RoleMC;
		private var _dirllMc:MovieClip;
		private var _width:Number;
		
		private var _state:String;
		public static const ST_Biulding:String="building";
		public static const ST_Diging:String="diging";
		
		public function setState($state:String):void{
			_state=$state;
			turn(WheelControl.DIR_None);
		}
		
		public function Avatar()
		{
			_container=new Sprite();
			_roleMC=new RoleMC();
			_roleMC.init();
			setState(ST_Biulding);
			_roleMC.play(_state,WheelControl.DIR_None);
			
			_width=_roleMC.display.width;
			_container.addChild(_roleMC.display);
		}
		
		private var _container:Sprite;
		
		
		public function showDrill():void{
			if(_dirllMc==null){
				_dirllMc=new (AssetManager.getAssetClass("McZuan") as Class)(); 
			}
			_dirllMc.play();
			_container.removeChildren();
			_container.addChild(_dirllMc);
		}
		public function hideDrill():void{
			if(_dirllMc){
				_dirllMc.stop();
			}
			_container.removeChildren();
			_container.addChild(_roleMC.display);
		}
		
		
		public function get display():DisplayObject{
			return _container;
		}
		public function get width():Number{
			return _width;
		}
		public function get height():Number{
			return _container.height;
		}
		public function get x():Number{
			return _container.x;
		}
		public function get y():Number{
			return _container.y;
		}
		public function set x(value:Number):void{
			_container.x=value;
		}
		public function set y(value:Number):void{
			_container.y=value;
		}
		
		public function turn($dir:String):void{
			_roleMC.play(_state,$dir);
			
		}
		
		public function stopRun():void{
			turn(WheelControl.DIR_None);
		}
		
		public function toLeft(durTime:Number,speed:Number):void{
			turn(WheelControl.DIR_Left);
			_container.x+=-speed*GameConstConfig.Tile_Width/1000
				*durTime;
		}
		
		public function toRight(durTime:Number,speed:Number):void{
			turn(WheelControl.DIR_Right);
			_container.x+=speed*GameConstConfig.Tile_Width/1000*durTime;
		}
		public function toDown(durTime:Number,speed:Number):void{
			//trace("[下降]"+durTime);
			_container.y+=speed*GameConstConfig.Tile_Height/1000*durTime;
		}
		public function destory():void{
			if(_roleMC){
				_roleMC.destory();
				_roleMC=null;
			}
			if(_dirllMc){
				_dirllMc.stop();
				_dirllMc=null;
			}
			if(_container){
				_container.removeChildren();
				_container=null;
			}
		}
		
		public function pause():void{
			
		}
		
	}
}
import com.ghostlmm.dig.Avatar;
import com.ghostlmm.tool.WheelControl;

import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.Sprite;

class RoleMC
{
	
	private var _container:Sprite;
	
	private var _stopMC:MovieClip;
	private var _runMC:MovieClip;
	private var _digMC:MovieClip;
	
	private var targetMC:MovieClip;
	
	private var mcMap:Object;
	
	public function get display():DisplayObject{
		return _container;
	}
	
	public function init():void{
		_container=new Sprite();
//		mc_npc1_2
		_stopMC=new (AssetManager.getAssetClass("mc_npc1_2") as Class)(); 
		_runMC=new (AssetManager.getAssetClass("mc_npc1_1") as Class)(); 
		_digMC=new (AssetManager.getAssetClass("mc_npc1_3") as Class)(); 
		
		_stopMC.stop();
		_runMC.stop();
		_digMC.stop();
		
		mcMap={};
		mcMap[Avatar.ST_Biulding+WheelControl.DIR_Left]=_runMC;
		mcMap[Avatar.ST_Biulding+WheelControl.DIR_None]=_stopMC;
		mcMap[Avatar.ST_Biulding+WheelControl.DIR_Right]=_runMC;
		
		mcMap[Avatar.ST_Diging+WheelControl.DIR_Left]=_digMC;
		mcMap[Avatar.ST_Diging+WheelControl.DIR_None]=_digMC;
		mcMap[Avatar.ST_Diging+WheelControl.DIR_Right]=_digMC;
		
	}
	
	public function destory():void{
		mcMap=null;
		if(_container) {_container.removeChildren(); _container=null;}
		_runMC=null;
		_stopMC=null;
		_digMC=null;
	}
	
	public function play($state:String,$dir:String):void{
		var mc:MovieClip=mcMap[$state+$dir];
		if($dir==WheelControl.DIR_Left){
			_container.scaleX=1;
		}
		if($dir==WheelControl.DIR_Right){
			_container.scaleX=-1;
		}
		if(mc!=targetMC){
			_container.removeChildren();
			_container.addChild(mc);
			if(targetMC!=null){
				targetMC.stop();
			}
			targetMC=mc;
			if(!targetMC.isPlaying){
				targetMC.play();
			}
		}
//		trace("切换roleMovie：\t"+mc);
	}
}


