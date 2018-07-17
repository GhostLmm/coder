package com.fish.modules.core.commands
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ViewControl;
	import com.ghostlmm.lightMVC.impl.Command;
	
	public class CoCnd_StartInit extends Command
	{
		public function CoCnd_StartInit()
		{
			super();
		}
		
		public override function excute():void
		{
			C2SEmitter.startInitGame();
			ViewControl.init();
		}
	}
}