package snake.gameParticle.particles
{
	import snake.gameParticle.simpleParticles.SimpleParticle;

	public class Particle_21 extends Particle
	{
		public function Particle_21()
		{
			super();
		}
		public override function excuteLogic():void{
			// warning
			if (player.character_hurtTime != 30)
			{
				bulletCollisions_enemy();
//				return ;
				if (int(particle_frame) == 2)
				{
					if (sound.numberOfBloodSplatSFX < 1)
					{
						sound.getVolume(particle_x, particle_y);
						sound.playSoundEffect(int(Math.random() * 4) + 45, sound.tempVol * 2, 0);
						
						sound.numberOfBloodSplatSFX  ++ ;
						
					}
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
			removeParticle(a);
		}
		
		public override function excuteRender():void{
			
		}
	}
}