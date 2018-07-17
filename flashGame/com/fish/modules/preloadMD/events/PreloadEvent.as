package com.fish.modules.preloadMD.events
{
	import com.ghostlmm.lightMVC.LightEvent;
	
	public class PreloadEvent extends LightEvent
	{
		public static const StartPreload:String="startPreload";
		public static const StartLogin:String="startLogin";
		public static const GameStartup:String="gamestartup";
		public function PreloadEvent(type:String, $args:Object=null)
		{
			super(type, $args);
		}
	}
}