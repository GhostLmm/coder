package snake.gameParticle.simpleParticle_bgs
{
	public class SimpleParticle_bg_0 extends SimpleParticle_bg
	{
		public function SimpleParticle_bg_0()
		{
			super();
		}
		public override function excuteLogic():void{
//			return ;
			tileOn = int(simpleParticle_bg_y / 50) * level.level_width + int(simpleParticle_bg_x / 50);
			if (level.level[(tileOn + 1)] == 60)
			{
				simpleParticle_bg_p1 = simpleParticle_bg_p1 - simpleParticle_bg_p2;
				simpleParticle_bg_p2 = simpleParticle_bg_p2 + 0.35;
				if (simpleParticle_bg_p1 < -50)
				{
					if (tileSet.id == 1)
					{
						level.level[(tileOn + 1) + level.level_width * 2] = 20;
					}
					else if (tileSet.id == 2)
					{
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
					else if (tileSet.id == 3)
					{
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
					else if (tileSet.id == 4)
					{
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
					else if (tileSet.id == 5)
					{
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
				}
				if (simpleParticle_bg_p1 < -100)
				{
					if (tileSet.id == 1)
					{
						level.level[(tileOn + 1) + level.level_width] = 20;
						level.level[(tileOn + 1) + level.level_width * 2] = 20;
					}
					else if (tileSet.id == 2)
					{
						level.level[(tileOn + 1) + level.level_width] = 1;
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
					else if (tileSet.id == 3)
					{
						level.level[(tileOn + 1) + level.level_width] = 1;
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
					else if (tileSet.id == 4)
					{
						level.level[(tileOn + 1) + level.level_width] = 1;
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
					else if (tileSet.id == 5)
					{
						level.level[(tileOn + 1) + level.level_width] = 1;
						level.level[(tileOn + 1) + level.level_width * 2] = 1;
					}
				}
				if (simpleParticle_bg_p1 < -150)
				{
					if (tileSet.id == 1)
					{
						level.level[(tileOn + 1)] = 20;
					}
					else if (tileSet.id == 2)
					{
						level.level[(tileOn + 1)] = 1;
					}
					else if (tileSet.id == 3)
					{
						level.level[(tileOn + 1)] = 1;
					}
					else if (tileSet.id == 4)
					{
						level.level[(tileOn + 1)] = 1;
					}
					else if (tileSet.id == 5)
					{
						level.level[(tileOn + 1)] = 1;
					}
					removeSimpleParticle_bg(a);
				}
			}
		}
		
		public override function excuteRender():void{
			rect.width = 58;
			rect.height = 150;
			rect.x = 0;
			rect.y = -simpleParticle_bg_p1;
			tempPoint.x = simpleParticle_bg_x - canvas.cameraX;
			tempPoint.y = simpleParticle_bg_y - canvas.cameraY;
//			trace(te);
			canvas.bm.copyPixels(assetConfig.door_bm, rect, tempPoint, null, null, false);
		}
	}
}