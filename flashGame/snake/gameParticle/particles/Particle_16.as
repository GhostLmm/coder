package snake.gameParticle.particles
{

	import snake.gameEnemys.Enemy;
	import snake.gameParticle.simpleParticles.SimpleParticle;

	public class Particle_16 extends Particle
	{
		private static var gaussStartPoint_x:Number;
		private static var gaussStartPoint_y:Number;
		private static var gaussLength:int;
		public function Particle_16()
		{
			super();
		}
		
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			if (particle_p2 == 0)
			{
				gaussStartPoint_x = particle_x;
				gaussStartPoint_y = particle_y;
				gaussLength = 0;
				b = 0;
				while (b < 100)
				{
					
					gaussLength = gaussLength + 8;
					particle_x = particle_x + particle_velX * 0.5;
					particle_y = particle_y + particle_velY * 0.5;
					tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_frame = 1;
						b = 1000;
					}
					else
					{
						particle_frame = 0;
						if (particle_p4 == 0)
						{
							bulletCollisions();
						}
						else
						{
							bulletCollisions_enemy();
						}
						if (particle_frame != 0)
						{
							c = int(Math.random() * 5);
							if (c == 0)
							{
								if (particle_velX > 0)
								{
									SimpleParticle.addSimpleParticle(4, particle_x - 60, particle_y - 50, 0, 0, 1);
								}
								else
								{
									SimpleParticle.addSimpleParticle(4, particle_x - 215, particle_y - 50, 0, 0, 0);
								}
								c = int(Math.random() * 3);
								if (c == 0)
								{
									if (particle_velX > 0)
									{
										SimpleParticle.addSimpleParticle(9, particle_x - 127, particle_y - 25, 0, 0, 1);
									}
									else
									{
										SimpleParticle.addSimpleParticle(9, particle_x - 5, particle_y - 25, 0, 0, 0);
									}
								}
							}
							else if (c == 1)
							{
								SimpleParticle.addSimpleParticle(5, particle_x - 135, particle_y - 85, 0, 0, 0);
							}
							else if (c == 2)
							{
								if (particle_velX < 0)
								{
									SimpleParticle.addSimpleParticle(6, particle_x, particle_y, 3.14 + Math.random() * -0.3925, 0, -1);
								}
								else
								{
									SimpleParticle.addSimpleParticle(6, particle_x, particle_y, Math.random() * 0.785 - 0.3925, 0, 1);
								}
								c = int(Math.random() * 3);
								if (c == 0)
								{
									if (particle_velX > 0)
									{
										SimpleParticle.addSimpleParticle(9, particle_x - 127, particle_y - 25, 0, 0, 1);
									}
									else
									{
										SimpleParticle.addSimpleParticle(9, particle_x - 5, particle_y - 25, 0, 0, 0);
									}
								}
							}
							else if (c == 3)
							{
								SimpleParticle.addSimpleParticle(7, particle_x, particle_y, particle_r, 0, 0);
							}
							else if (c == 4)
							{
								SimpleParticle.addSimpleParticle(8, particle_x - 110, particle_y - 56, 0, 0, 0);
							}
							canvas.placeBloodSplatter(particle_x, particle_y, particle_p4);
						}
					}
					
					b  ++ ;
					
				}
				if (particle_p3 == 13)
				{
//					addParticle(19, gaussStartPoint_x, gaussStartPoint_y, particle_r, 0, 0, 0, 0, 0, 0, gaussLength, 0, 0, 100 - 100 * particle_p5 / 1.75, 0);
					addParticle(19, gaussStartPoint_x, gaussStartPoint_y, particle_r, 0, 0, 0, 0, 0, 0, gaussLength, 0, 4 - particle_p5 / 1.75 * 4, 100 - 100 * particle_p5 / 1.75, 0);
				}
				else
				{
//					addParticle(19, gaussStartPoint_x, gaussStartPoint_y, particle_r, 0, 0, 0, 0, 0, 0, gaussLength, 0, 0, 100 - 100 * particle_p5 / 1.75, 0);
					addParticle(19, gaussStartPoint_x, gaussStartPoint_y, particle_r, 0, 0, 0, 0, 0, 0, gaussLength, 0, 4 - particle_p5 / 1 * 4, 100 - 100 * particle_p5 / 1, 0);
				}
				particle_p2 = 1;
				addParticle(3, particle_x - assetConfig.smokeWidth * 0.5, particle_y - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, particle_x - assetConfig.smokeWidth * 0.5, particle_y - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, 0, Math.random() * 0.9 + 0.2, 5, 1.5 + Math.random() * 0.5, 0, 0, 0, 0);
				b = 0;
				while (b < 6)
				{
					
					addParticle(2, particle_x - 6, particle_y - 6, 0, particle_x - 6, particle_y - 6, 0, (-particle_velX) * Math.random(), (-Math.random()) * 8, 0, 0, 0, 0, 0, Math.random() + 0.5);
					
					b  ++ ;
					
				}
			}
		}

		public override function excuteRender():void{
			
		}
	}
}