package snake.gameParticle.particles
{
	public class Particle_2 extends Particle
	{
		public function Particle_2()
		{
			super();
		}
		
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_x = particle_x + particle_velX;
			particle_y = particle_y + particle_velY;
			particle_velX = particle_velX * 0.9;
			particle_velY=(particle_velY + 1);
			particle_frame = particle_frame + particle_p5;
			if (particle_frame > 15)
			{
				removeParticle();
			}
		}
		
		public override function excuteRender():void{
			tempPoint.x = particle_x - canvas.cameraX;
			tempPoint.y = particle_y - canvas.cameraY;
			rect.width = 12;
			rect.height = 12;
			rect.x = 12 * int(particle_frame);
			rect.y = 0;
			canvas.bm.copyPixels(assetConfig.spark_bm, rect, tempPoint, null, null, false);
		}
	}
}