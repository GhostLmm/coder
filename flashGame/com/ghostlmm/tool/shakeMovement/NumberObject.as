package com.ghostlmm.tool.shakeMovement
{
	import flash.display.SimpleButton;
	import flash.geom.Point;
	
	public class NumberObject
	{
		
		/**
		 *返回N个数中，随机一个数字 
		 * @param rest
		 * @return 
		 * 
		 */
		public static function random(...rest):Number
		{
			return rest[Math.floor(Math.random() * rest.length)];
		}
		
	}
}