package com.fish.modules.core.commands
{
	import com.fish.GameSwitchSceneController;
	import com.fish.modules.core.events.CoreSwitchEvent;
	import com.ghostlmm.lightMVC.impl.Command;
	import com.greensock.TweenLite;
	
	public class CoCnd_SwitchToBattle extends Command
	{
		[Inject]
		public var evt:CoreSwitchEvent;
		public function CoCnd_SwitchToBattle()
		{
			super();
		}
		public override function excute():void
		{
//			SwitchSceneController.getInstance().enterBattle(evt.battleType);
//			TweenLite.delayedCall(0.1,GameSwitchSceneController.getInstance().enterBattle,[evt.battleType]);
			if(evt.type==CoreSwitchEvent.SwitchToBattle){
				if(evt.battleType==CoreSwitchEvent.BT_Mining){
					GameSwitchSceneController.getInstance().enterMining();
				}else{
					GameSwitchSceneController.getInstance().enterBattle(evt.battleType);
				}
				
			}
		}
	}
}