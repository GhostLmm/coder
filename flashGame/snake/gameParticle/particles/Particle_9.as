package snake.gameParticle.particles
{
	/**  掉落的脑浆  **/
	public class Particle_9 extends Particle
	{
		public function Particle_9()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_p2 = particle_p2 + particle_velX * 0.1;
			if (particle_p2 > 7)
			{
				particle_p2 = 0;
			}
			if (particle_p2 < 0)
			{
				particle_p2 = 7;
			}
			particle_x = particle_x + particle_velX;
			particle_velX = particle_velX * 0.98;
			if (particle_velX < 0)
			{
				tileOn = int(particle_y / 50) * level.level_width + int((particle_x - 3) / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_velX = particle_velX * -1;
					particle_x = particle_x + particle_velX;
				}
			}
			else
			{
				tileOn = int(particle_y / 50) * level.level_width + int((particle_x + 3) / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_velX = particle_velX * -1;
					particle_x = particle_x + particle_velX;
				}
			}
			particle_velY = particle_velY + 1.5;
			b = 0;
			while (b < 2)
			{
				
				particle_y = particle_y + particle_velY * 0.5;
				tileOn = int((particle_y - 10) / 50) * level.level_width + int(particle_x / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_velY = particle_velY * -0.5;
				}
				tileOn = int((particle_y + 6) / 50) * level.level_width + int(particle_x / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_y = int((particle_y + 6) / 50) * 50 - 6;
					if (particle_velY > 6)
					{
						particle_velY = particle_velY * -0.4;
					}
					else
					{
						tileOn = int((int(particle_y / 50) * 50 + 3) / 50) * level.level_width + int(particle_x / 50);
						if (level.level_collidable[level.level[tileOn]] == 0)
						{
							tempPoint.x = particle_x;
							tempPoint.y = particle_y;
							rect.x = 80 * int(particle_p1) + 10 * int(particle_p2);
							rect.y = 0;
							rect.width = 10;
							rect.height = 10;
							canvas.copyToLevelBm(assetConfig.giblets_small_bm, rect, tempPoint, null, null, true);
						}
						particle_p3 = 1;
					}
				}
				
				b  ++ ;
				
			}
			if (particle_p3 == 1)
			{
				removeParticle(a);
			}
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY;
			rect.x = 80 * int(particle_p1) + 10 * int(particle_p2);
			rect.y = 0;
			rect.width = 10;
			rect.height = 10;
			canvas.bm.copyPixels(assetConfig.giblets_small_bm, rect, tempPoint, null, null, true);
		}
	}
}