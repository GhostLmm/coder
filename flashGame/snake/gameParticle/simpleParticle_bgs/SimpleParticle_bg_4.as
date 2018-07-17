package snake.gameParticle.simpleParticle_bgs
{
	public class SimpleParticle_bg_4 extends SimpleParticle_bg
	{
		public function SimpleParticle_bg_4()
		{
			super();
		}
		public override function excuteLogic():void{
			// warning
			/*if (int(simpleParticle_bg_p1) != 2)
			{
				simpleParticle_bg_p1 = 0;
				if (Math.abs(character_x - (simpleParticle_bg_x + 50)) < 75)
				{
					if (Math.abs(character_y - 50 - simpleParticle_bg_y) < 75)
					{
						simpleParticle_bg_p1 = 1;
						keyHeadsUp_visible = true;
					}
				}
				if (int(simpleParticle_bg_p1) == 1)
				{
				}
				if (kD[5] == true)
				{
					simpleParticle_bg_p1 = 2;
					playSoundEffect(81, 2, 0);
					tileOn = int(simpleParticle_bg_y / 50) * level_width + int(simpleParticle_bg_x / 50);
					level[(tileOn - 1)] = 60;
					level[(tileOn - 1) - level_width] = 60;
					level[(tileOn - 1) - level_width * 2] = 60;
					rect.width = 50;
					rect.height = 50;
					rect.x = 450 + 50 * int(simpleParticle_bg_p1);
					rect.y = 0;
					tempPoint.x = simpleParticle_bg_x;
					tempPoint.y = simpleParticle_bg_y;
					level_bm.copyPixels(door_lock_bm, rect, tempPoint, null, null, false);
					removeSimpleParticle_bg(a);
				}
			}*/
		}
		
		public override function excuteRender():void{
			rect.width = 50;
			rect.height = 50;
			rect.x = 450 + 50 * int(simpleParticle_bg_p1);
			rect.y = 0;
			tempPoint.x = simpleParticle_bg_x - canvas.cameraX;
			tempPoint.y = simpleParticle_bg_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.door_lock_bm, rect, tempPoint, null, null, false);
		}
	}
}