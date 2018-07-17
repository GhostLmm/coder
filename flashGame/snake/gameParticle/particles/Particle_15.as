package snake.gameParticle.particles
{
	import snake.gameEnemys.Enemy;


	public class Particle_15 extends Particle
	{
		public function Particle_15()
		{
			super();
		}
		
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_r = 0;
			b = 0;
			while (b < 2)
			{
				
				particle_x = particle_x + particle_velX * 0.5;
				tileOn = int((particle_y - 2) / 50) * level.level_width + int(particle_x / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_x = particle_x - particle_velX;
					particle_velX = particle_velX * -0.8;
					particle_p2 = 1;
				}
				particle_y = particle_y + particle_velY * 0.5;
				tileOn = int((particle_y + 2) / 50) * level.level_width + int(particle_x / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					if (particle_velY < 0)
					{
						particle_y = int((particle_y + 2) / 50) * 50 + 50;
					}
					else
					{
						particle_y = int((particle_y + 2) / 50) * 50 - 2;
					}
					particle_p2 = 1;
					particle_velX = particle_velX * 0.8;
					if (particle_velY > 0)
					{
						if (particle_velY > 2)
						{
							particle_velY = particle_velY * -0.5;
						}
						else
						{
							particle_velY = 0;
							particle_r = 1;
						}
					}
					else
					{
						particle_velY = particle_velY * -0.5;
					}
				}
				if (particle_p2 == 0)
				{
					if (particle_p4 == 0)
					{
						bulletCollisions();
					}
					else
					{
						bulletCollisions_enemy();
					}
					if (particle_frame == 2)
					{
						particle_velX = particle_velX * -0.95;
						particle_frame = 0;
						particle_p2 = 1;
					}
				}
				
				b  ++ ;
				
			}
			if ((int(particle_velX) == 0)&&(particle_r == 1))
			{
				tempPoint.x = particle_x - 2;
				tempPoint.y = particle_y - 2;
				rect.x = 0;
				rect.y = 0;
				rect.width = 5;
				rect.height = 5;
				canvas.copyToLevelBm(assetConfig.airsoftPellet, rect, tempPoint, null, null, true);
				removeParticle(a);
			}
			else
			{
				if (particle_p2 == 1)
				{
					particle_velY = particle_velY + 2;
				}
				else
				{
					particle_velY = particle_velY + 0.25;
				}
			}
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - 2;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 2;
			rect.x = 0;
			rect.y = 0;
			rect.width = 5;
			rect.height = 5;
			canvas.bm.copyPixels(assetConfig.airsoftPellet, rect, tempPoint, null, null, true);
		}
	}
}