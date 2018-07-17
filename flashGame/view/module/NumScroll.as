package view.module
{
	import com.ghostlmm.tool.ListenerAddProxy;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.utils.getDefinitionByName;
	import flash.utils.getTimer;
	
	public class NumScroll extends Sprite
	{
		protected var _listenerProxy:ListenerAddProxy;
		
		private var ROLLNUMBER_COUNT:int = 5;
		private static const MAX_ROLL_SPEED:Number = 200;
		private static const DECREASE_SPEED:Number = 200;
		
		private static const STATE_FULL_SPEED:int = 0;
		private static const STATE_DECREASE_SPEED:int = 1;
		private static const STATE_STOPING:int = 2;
		private static const STATE_STOPED:int = 3;
		
		private var _rollNumbers:Array = new Array();
		private var _rollNumberHeight:int = 0;
		private var _rollNumberMinY:int = 0;
		private var _rollSpeed:Vector.<Number> = new Vector.<Number>(ROLLNUMBER_COUNT);
		private var _decreaseDelay:Vector.<Number> = new Vector.<Number>(ROLLNUMBER_COUNT);
		private var _rollState:int = STATE_STOPED;
		private var _rollDestination:Vector.<int> = new Vector.<int>(ROLLNUMBER_COUNT);
		private var _rollDestinatoinNumber:int = 0;
		private var _rollSpeedSeting:Vector.<Number>=new Vector.<Number>(ROLLNUMBER_COUNT);
		
		private var Height:Number;
		public function NumScroll(_num:int,height:Number)
		{
			super();
			ROLLNUMBER_COUNT=_num;
			Height=height;
			init();
			registerEvent();
		}
		private function registerEvent():void
		{
			addTargetEvent(GlobalRef.stage,Event.ENTER_FRAME,onEnterFrame);
//			addTargetEvent(GlobalRef.stage,MouseEvent.CLICK,onMouseClicked);
		}
		public function setValueIm(_value:int):void
		{
			var leftNumber:int = _value;
			for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
				var rollNumber:int = leftNumber % 10;
				var rollNumberPos:int = -rollNumber * _rollNumberHeight;
				var rollLayer:Sprite = _rollNumbers[i] as Sprite;				
				rollLayer.y = rollNumberPos;
				leftNumber /= 10;
			}
			_rollState=STATE_STOPED;
			adjustPos();
		}
		private var oldNum:int=0;
		private var newNum:int=0;
		
		private var currentNum:int=0;
		private function onMouseClicked(evt:Event):void
		{
			oldNum=currentNum;
			setValueIm(currentNum);			
			currentNum+=1000*Math.random();
			newNum=currentNum;			
			setVisibleShow();
			setRollSpeed();
			playRollNumberAnimation();			
			rollNumberDestination=currentNum;			 
		}
		public function setValue(_value:int,_noAnimate:Boolean=false):void
		{
			if(_noAnimate)
			{
				setValueIm(currentNum);	
			}
			else
			{
				oldNum=currentNum;
				setValueIm(currentNum);			
				currentNum=_value;
				newNum=currentNum;			
				setVisibleShow();
				setRollSpeed();
				playRollNumberAnimation();			
				rollNumberDestination=currentNum;
			}
		}
		private function setVisibleShow():void
		{
			var maxVisibleNum:int=currentNum.toString().length;
			for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i)
			{
				var rollLayer:Sprite = _rollNumbers[i] as Sprite;
				if(i<maxVisibleNum)
				{
					rollLayer.visible=true;
				}
				else
				{
					rollLayer.visible=false;
				}
			}
			adjustPos();
		}
		private function getShowNumWidth():Number
		{
			var maxVisibleNum:int=currentNum.toString().length;
			var derW:Number=RnumWidth*Height/RnumHeight;
			return derW*(ROLLNUMBER_COUNT-maxVisibleNum/2.0);
		}
		private function setRollSpeed():void
		{
			var leftOldNumber:int = oldNum;
			var leftNewNumber:int=newNum;
			for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
				var rollNumber_old:int = leftOldNumber % 10;
				leftOldNumber /= 10;
				var rollNumber_new:int = leftNewNumber % 10;
				leftNewNumber /= 10;
				if(rollNumber_new!=rollNumber_old)
				{
					_rollSpeedSeting[i]=MAX_ROLL_SPEED;
				}
				else
				{
					_rollSpeedSeting[i]=0;
				}
			}
		}
		private function init():void
		{
			initContainer();
			initWH();
			initRollNum();
			initMask();
			adjustPos();
		}
		private function initWH():void
		{
			var numberItem:Object =new Bitmap(new (AssetManager.getAssetClass("huodong_num_0") as Class)());
			RnumHeight=numberItem.height;
			RnumWidth=numberItem.width;
		}
		private function adjustPos():void
		{
//			m_container.x=-m_container.width/2;
			m_container.x=-getShowNumWidth();
		}
		private function initMask():void
		{
			var derW:Number=RnumWidth*Height/RnumHeight;
			var mask:Sprite=new Sprite();
			mask.graphics.beginFill(0x000000);
			mask.graphics.drawRect(0,0,derW*ROLLNUMBER_COUNT,Height);
			mask.graphics.endFill();
			m_container.addChild(mask);
			m_container.mask=mask;
		}
		private var RnumWidth:Number;
		private var RnumHeight:Number;
		
		private function initRollNum():void
		{	
			_rollNumberHeight = Height;
			_rollNumberMinY = -_rollNumberHeight * 9;
			var derW:Number=RnumWidth*Height/RnumHeight;
			var numberItem:Object;
			if(_rollNumbers.length == 0){
				for(var i:int=0; i<ROLLNUMBER_COUNT; ++i){
					var rollLayer:Sprite = new Sprite();
					var rollPos:Sprite = new Sprite();
					rollPos.x=derW*(ROLLNUMBER_COUNT-1-i);
					rollPos.addChild(rollLayer);
					m_container.addChild(rollPos);
					_rollNumbers[i] = rollLayer;
					
					for(var j:int = 0; j<10; ++j){
						var cls:Object=getDefinitionByName(("huodong_num_"+j).toString()) as Object;
						numberItem = new Bitmap(new cls());	
						numberItem.height=Height;
						numberItem.width=derW;
						numberItem.y = j * _rollNumberHeight;
						rollLayer.addChild(numberItem as DisplayObject);
					}
					rollLayer.cacheAsBitmap = true;
				}
			}
		}
		private var _lastRollTime:int = 0;
		private function playRollNumberAnimation():void{
			if(STATE_STOPED != _rollState) return ;
			_lastRollTime = getTimer();			
			rollNumberState = STATE_FULL_SPEED;
		}
		public function set rollNumberState(state:int):void{
			_rollState = state;
			if(_rollState == STATE_FULL_SPEED){
				for(var i:int =0; i<ROLLNUMBER_COUNT; ++i){
					_rollSpeed[i] =_rollSpeedSeting[i];
					trace("滚动i速度"+_rollSpeedSeting[i]);
				}
			}
		}
		public function set rollNumberDestination(destination:int):void{
			if(destination < 0) return ;
			if(destination >= Math.pow(10, ROLLNUMBER_COUNT)){
				destination = Math.pow(10, ROLLNUMBER_COUNT);
			}
			var leftNumber:int = destination;
			for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
				var rollNumber:int = leftNumber % 10;
				var rollNumberPos:int = -rollNumber * _rollNumberHeight;
				_rollDestination[i] = rollNumberPos;
				_decreaseDelay[i] = i * 200;
				leftNumber /= 10;
			}
			_rollDestinatoinNumber = destination;
			_rollState = STATE_DECREASE_SPEED;
		}
		private function onEnterFrame(e:Event):void
		{			
			moveRollNumber();
		}
		private function moveRollNumber():void{
			if(STATE_STOPED == _rollState) return ;
			
			if(_rollNumbers.length == ROLLNUMBER_COUNT){
				var now:int = getTimer();
				var delta:int = now - _lastRollTime;
				_lastRollTime = now;
				
				var isAllRoll:Boolean = true;
				for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
					var rollLayer:Sprite = _rollNumbers[i] as Sprite;
					if(_rollState == STATE_STOPING && Math.abs(rollLayer.y - _rollDestination[i]) < 0.01){
						continue;
					}
					isAllRoll = false;
					var oldY:int = rollLayer.y;
					rollLayer.y -= _rollSpeed[i] * delta / 1000;
					if(rollLayer.y < _rollNumberMinY){
						rollLayer.y = 0;
					}
					
					if(_rollState == STATE_STOPING){
						if((_rollDestination[i] == _rollNumberMinY || _rollDestination[i] == 0) && rollLayer.y == 0 && oldY < 0){
							rollLayer.y = _rollDestination[i];
						}
						else if(oldY >= _rollDestination[i] && rollLayer.y <= _rollDestination[i]){
							rollLayer.y = _rollDestination[i];
						}
					}else if(_rollState == STATE_DECREASE_SPEED){
						if(_decreaseDelay[i] > 0){
							_decreaseDelay[i] -= delta;
						}else{
							_rollSpeed[i] *= 0.95;
							if(_rollSpeed[i] < DECREASE_SPEED){
								_rollState = STATE_STOPING;
							}
						}
					}else if(_rollState == STATE_STOPING){
						_rollSpeed[i] -= 10;
						if(_rollSpeed[i] < 20){
							_rollSpeed[i] = 20;
						}
					}
				}				
				if(isAllRoll){
					_rollState = STATE_STOPED;
					return ;
				}
			}
		}
		private function reset():void
		{
			resetRollNumberToZero();
		}
		public function resetRollNumberToZero():void{
			for(var i:int = 0; i<ROLLNUMBER_COUNT; ++i){
				var rollLayer:Sprite = _rollNumbers[i] as Sprite;
				rollLayer && (rollLayer.y = 0);
			}
			_rollState = STATE_STOPED;
		}
		private var m_container:Sprite;
		private function  initContainer():void
		{
			m_container=new Sprite();
			this.addChild(m_container);
		}
		public function setPos(_x:Number,_y:Number):void
		{
			
		}
		public function destory():void
		{			
			clearEvent();
			
			m_container.removeChildren();
			m_container=null;
			var index:int;
			for(index=0;index<_rollNumbers.length;index++)
			{
				var rollLayer:Sprite = _rollNumbers[index] as Sprite;
				rollLayer.removeChildren();
				rollLayer=null;
				_rollNumbers[index]=null;
			}
			_rollNumbers=null;
		}
		private var _listenerArray:Array;
		
		/**   添加注册事件，关闭窗口会自动回收
		 * */
		protected function addTargetEvent(target:EventDispatcher,type:String,listener:Function,useCapture:Boolean=false):void
		{
			if(_listenerArray==null) _listenerArray=[];
			
			target.addEventListener(type,listener,useCapture);
			
			_listenerArray.push({target:target,type:type,listener:listener,useCapture:useCapture});
		}
		
		private function clearEvent():void
		{
			if(_listenerArray==null) return ;
			for each(var obj:Object in _listenerArray)
			{
				obj.target.removeEventListener(obj.type,obj.listener,obj.useCapture);
				delete obj["target"];
				delete obj["listener"];
			}
			_listenerArray=null;
		}
	}
}