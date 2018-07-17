package com.fish.modules.core.events
{
	import com.ghostlmm.lightMVC.LightEvent;
	
	public class CoreViewEvent extends LightEvent
	{
		public static const JumpScene:String="jumpScene";
		public static const ShowZhuanpan:String="showzhuangpan";

		public static const RefreshWindow:String="refreshWindow";
		
		public static const HideZhuanpan:String="hideZhuanpan";
		public static const ZhuanpanJiangli:String="ZhuanpanJiangli";
		
		
		public function CoreViewEvent(type:String, $args:Object=null)
		{
			super(type, $args);
		}
		
		public var windowType:Class;
		
		public var scene:String;
		public var label:int=0;
		public var data:Object;
	}
}