package ui.leitai
{
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	
	import core.event.TQTTouchEvent;
	
	public class MDI_LeitaiPk extends Mediator
	{
		[Inject]
		public var window:LeitaiPkWindow;
		
		public var _fightPlayerA:Mc_FightPlayer;
		public var _fightPlayerB:Mc_FightPlayer;
		
		public function MDI_LeitaiPk()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
//			Music.stop(Music.curBackMusic);
			Music.playFX(Music.FX_readygo);
		}
		private function initModule():void
		{
			
		}
		private function registerEvent():void
		{
			addViewListener(window,TQTTouchEvent.TOUCH_TAP,closeWindow);
		}
		private function setShow():void
		{
			_fightPlayerA=new Mc_FightPlayer();
			_fightPlayerA.setType(Mc_FightPlayer.MyHero);
			_fightPlayerA.x=window._POS_A.rect.x;
			_fightPlayerA.y=window._POS_A.rect.y;
			window._POS_A.addChild(_fightPlayerA);
			_fightPlayerB=new Mc_FightPlayer();
			_fightPlayerB.setType(Mc_FightPlayer.EnemyHero);
			_fightPlayerB.x=window._POS_B.rect.x;
			_fightPlayerB.y=window._POS_B.rect.y;
			window._POS_B.addChild(_fightPlayerB);
			TweenLite.delayedCall(3,closeWindow);
		}
		private function closeWindow(evt:Event=null):void
		{
			Context.getInsance().coreDispatcher.dispatchEvent( new CoreSwitchEvent(CoreSwitchEvent.SwitchToBattle,{battleType:CoreSwitchEvent.BT_Leitai}) );
		}
		public override function destroy():void
		{
			TweenLite.killDelayedCallsTo(closeWindow);
			super.destroy();
		}
	}
}