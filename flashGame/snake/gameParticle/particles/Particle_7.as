package snake.gameParticle.particles
{
	/** 骷髅头 **/
	public class Particle_7 extends Particle
	{
		public function Particle_7()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_x = particle_x + particle_velX;
			particle_velX = particle_velX * 0.98;
			if (int(particle_p2) == 1)
			{
				particle_r = particle_r + particle_velX * 0.05;
			}
			else
			{
				particle_r = particle_r - particle_velX * 0.05;
			}
			if (particle_velX < 0)
			{
				tileOn = int(particle_y / 50) * level.level_width + int((particle_x - assetConfig.giblet_height[int(particle_p1)]) / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_velX = particle_velX * -1;
					particle_x = particle_x + particle_velX;
				}
			}
			else
			{
				tileOn = int(particle_y / 50) * level.level_width + int((particle_x + assetConfig.giblet_height[int(particle_p1)]) / 50);
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
					tileOn = int((int(particle_y / 50) * 50 - assetConfig.giblet_height[int(particle_p1)]) / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_y = int(particle_y / 50) * 50 + assetConfig.giblet_height[int(particle_p1)];
						particle_xOld = particle_x;
						particle_yOld = particle_y;
						particle_velY = 1;
					}
				}
				else
				{
					tileOn = int(int((particle_y + assetConfig.giblet_height[int(particle_p1)]) / 50) * 50 / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_y = int((particle_y + assetConfig.giblet_height[int(particle_p1)]) / 50) * 50 - assetConfig.giblet_height[int(particle_p1)];
						particle_xOld = particle_x;
						particle_yOld = particle_y;
						if (particle_velY > 6)
						{
							particle_velY = particle_velY * -0.5;
							c = Math.random() * 8;
							if (c == 0)
							{
								particle_velX = particle_velX * -1;
							}
						}
						else
						{
							tileOn = int((int(particle_y / 50) * 50 + assetConfig.giblet_height[int(particle_p1)]) / 50) * level.level_width + int(particle_x / 50);
							if (level.level_collidable[level.level[tileOn]] == 0)
							{
								if (particle_p2 == 1)
								{
									particle_p2 = 1;
								}
								else
								{
									particle_p2 = -1;
								}
								trans.createBox(particle_p2, 1, particle_r, particle_x, particle_y);
								canvas.drawToLevelBm(assetConfig.giblets_human_sprites[int(particle_p1)], trans);
							}
							particle_p3 = 1;
						}
					}
				}
				
				b  ++ ;
				
			}
			if (particle_p3 == 1)
			{
				removeParticle();
			}
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			trans.createBox(particle_p2, 1, particle_r, canvas.interpFinal.x - canvas.cameraX, canvas.interpFinal.y - canvas.cameraY);
			canvas.bm.draw(assetConfig.giblets_human_sprites[int(particle_p1)], trans);
		}
	}
}