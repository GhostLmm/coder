package snake.module
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.getTimer;

	public class DamageData extends EventDispatcher
	{
		public static const DuringTime:Number=0.2;
		public static const DuringMili:Number=DuringTime*1000;
		
		public var mc:Object;
		public var damage:Number;
		public var posX:Number;
		public var posY:Number;
		public var targetX:Number;
		public var targetY:Number;
		public var startX:Number;
		public var startY:Number;
		
		private var startTime:Number;
		
		public function DamageData(_posX:Number,_posY:Number,_targetX:Number,_targetY:Number,_damage:Number,_isBaoji:Boolean,_isShanbi:Boolean)
		{
			if(_isShanbi)
			{
				mc=new DamageShanbiMc();
			}
			else if(_isBaoji)
			{
				mc=new DamageBaojiMc();
			}
			else
			{
				mc=new DamageMc();	
			}
//			mc=new DamageShanbiMc();
			damage=Math.floor(_damage);
			init();
			posX=_posX;
			posX-=mc.width/2;
			posY=_posY;
			startX=posX;
			startY=posY;
			targetX=_targetX;
			targetX-=mc.width/2;
			targetY=_targetY;
			startTime=getTimer();
		}
		private function registerEvent():void
		{
			mc.addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		private function onEnterFrame(evt:Event):void
		{
			var derTime:Number=getTimer()-startTime;
			posY=startY+derTime/DuringMili*(targetY-startY);
			posX=startX+derTime/DuringMili*(targetX-startX);
		}
		private function removeEvent():void
		{
			mc.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		public function init():void
		{
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			
		}
		private function setShow():void
		{
			if(mc.hasOwnProperty("_numMc"))
			{
				mc._numMc.text=damage.toString();
			}
			mc.initBitData();
		}
		public function destroy():void
		{
			removeEvent();
			mc.destory();
			mc=null;
		}
	}
}