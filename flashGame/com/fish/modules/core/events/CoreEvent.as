package com.fish.modules.core.events
{
	import com.ghostlmm.lightMVC.LightEvent;
	
	public class CoreEvent extends LightEvent
	{
		public static const StartInitGame:String="startInitGame";
		public static const GameInitComplete:String="gameInitComplete";
//		public static const SwitchToBattle:String="SwitchToBattle";
		
		public var data:Object;
		public function CoreEvent(type:String, $args:Object=null)
		{
			super(type, $args);
		}
	}
}