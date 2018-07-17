package com.ghostlmm.supermario.gameobject
{
	import citrus.objects.platformer.box2d.Hero;
	
	public class Mario extends Hero
	{
		public static const MarioChanel:int=1;
		
		public static const IDLE:String = "idle";
		public static const JUMP:String = "jump";
		public static const WALK:String="walk";
		public static const SHOOT:String = "shoot";
		public static const MELEE:String = "melee";
		public static const LEFT:String = "left";
		public static const RIGHT:String = "right";
		
		public function Mario(name:String, params:Object=null)
		{
			super(name, params);
		}
	}
}