package snake.gameParticle.particles
{
	public class Particle_20 extends Particle
	{
		public function Particle_20()
		{
			super();
		}
		
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_x = particle_x + particle_velX;
			particle_velX = particle_velX * 0.98;
			particle_r = particle_r + particle_velX * 0.05;
			if (particle_r > 15)
			{
				particle_r = 0;
			}
			if (particle_r < 0)
			{
				particle_r = 15;
			}
			if (particle_velX < 0)
			{
				tileOn = int(particle_y / 50) * level.level_width + int((particle_x - 15) / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_velX = particle_velX * -1;
					particle_x = particle_x + particle_velX;
				}
			}
			else
			{
				tileOn = int(particle_y / 50) * level.level_width + int((particle_x + 15) / 50);
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
				if (particle_velY < 0)
				{
					tileOn = int((particle_y - 10) / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_y = int(particle_y / 50) * 50 + 10;
						particle_xOld = particle_x;
						particle_yOld = particle_y;
						particle_velY = 1;
					}
				}
				else
				{
					tileOn = int((particle_y + 10) / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_y = int((particle_y + 10) / 50) * 50 - 10;
						particle_xOld = particle_x;
						particle_yOld = particle_y;
						if (particle_velY > 1)
						{
							particle_velY = particle_velY * -0.5;
						}
						else
						{
							tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
							if (level.level_collidable[level.level[tileOn]] == 0)
							{
								tempPoint.x = particle_x - 17;
								tempPoint.y = particle_y - 16;
								rect.x = int(particle_r) * 35 + particle_p1 * 560;
								rect.y = 0;
								rect.width = 35;
								rect.height = 32;
								canvas.copyToLevelBm(assetConfig.bean_gib_eye, rect, tempPoint, null, null, true);
							}
							particle_p3 = 1;
						}
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
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - 17;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 16;
			rect.x = int(particle_r) * 35 + particle_p1 * 560;
			rect.y = 0;
			rect.width = 35;
			rect.height = 32;
			canvas.bm.copyPixels(assetConfig.bean_gib_eye, rect, tempPoint, null, null, true);
		}
	}
}