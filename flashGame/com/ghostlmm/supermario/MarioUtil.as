package com.ghostlmm.supermario
{
	import com.ghostlmm.supermario.gameobject.Mario;
	
	import flash.ui.Keyboard;
	
	import citrus.core.CitrusEngine;
	

	public class MarioUtil
	{
		public function MarioUtil()
		{
		}
		
		public static function addKeyAction():void
		{
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.SHOOT, Keyboard.X, Mario.MarioChanel);
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.MELEE, Keyboard.Z, Mario.MarioChanel);
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.SHOOT, Keyboard.L, Mario.MarioChanel);
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.MELEE, Keyboard.K, Mario.MarioChanel);
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.JUMP, Keyboard.UP, Mario.MarioChanel);
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.LEFT, Keyboard.A, Mario.MarioChanel);
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.RIGHT, Keyboard.D, Mario.MarioChanel);
			CitrusEngine.getInstance().input.keyboard.addKeyAction(Mario.JUMP, Keyboard.W, Mario.MarioChanel);
		}
		
		public static function removeKeyAction():void{
			
		}
		
	}
}