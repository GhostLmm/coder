package snake.gameParticle.particles
{
	public class Particle_13 extends Particle
	{
		public function Particle_13()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_x = particle_x + particle_velX;
			particle_y = particle_y + particle_velY;
			particle_velX = particle_velX * 0.9;
			particle_velY = particle_velY + 2;
			particle_frame = particle_frame + particle_p5;
			if (particle_p2 != 1)
			{
				tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_p2 = 1;
				}
			}
			if (sound.acidSfx < 1)
			{
				sound.acidSfx = 3;
				sound.getVolume(particle_x, particle_y);
				sound.playSoundEffect(78 + int(Math.random() * 3), sound.tempVol * 2, 0);
			}
			if ((particle_frame > 7)||((particle_p2 == 1)))
			{
				removeParticle(a);
			}
			
		}
		
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - 15;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 18;
			rect.x = 31 * int(particle_frame) + 248 * particle_p1;
			rect.y = 0;
			rect.width = 31;
			rect.height = 36;
			canvas.bm.copyPixels(assetConfig.gun_acidBomb_drip, rect, tempPoint, null, null, true);
		}
	}
}