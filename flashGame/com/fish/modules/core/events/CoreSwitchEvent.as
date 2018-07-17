package com.fish.modules.core.events
{
	import com.ghostlmm.lightMVC.LightEvent;
	
	public class CoreSwitchEvent extends LightEvent
	{
		public static const SwitchToBattle:String="switchToBattle";
//		public static const SwitchToMining:String="switchToMining";
		
		/** 选人 **/
		public static const BT_Select:String="select";
		public static const BT_Copy:String="map";
		public static const BT_Leitai:String="leitai";
		public static const BT_Lueduo:String="lueduo";
		public static const BT_Maoxian:String="maoxian";
		public static const BT_Shengjiang:String="shengjiang";
		
		public static const BT_Boss:String="boss";
		public static const BT_Monv:String="monv";
		public static const BT_JinkuangQugan:String="jinkuangQugan";
		public static const BT_JinkuangLveduo:String="jinkuangLveduo";
		
		
		public static const BT_Mining:String="mining";
		
		public function CoreSwitchEvent(type:String, $args:Object=null)
		{
			super(type, $args);
		}
		public var battleType:String;
		
		public var needBackZhucheng:Boolean=false;
//		public var id2:int;
//		public var id3:int;
	}
}