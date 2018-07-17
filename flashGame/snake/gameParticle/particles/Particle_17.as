package snake.gameParticle.particles
{
	public class Particle_17 extends Particle
	{
		public function Particle_17()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_x = particle_x + particle_velX;
			particle_y = particle_y + particle_velY;
			particle_velX = particle_velX * 0.98;
			particle_velY = particle_velY + 0.5;
			particle_frame = particle_frame + particle_p1 * 2;
			if (particle_frame > 29)
			{
				removeParticle(a);
			}
		}
		
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - 4;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 4;
			rect.x = 8 * int(particle_frame);
			rect.y = 0;
			rect.width = 8;
			rect.height = 8;
			if (particle_p2 == 0)
			{
				canvas.bm.copyPixels(assetConfig.collectStar_yellow_bm, rect, tempPoint, null, null, true);
			}
			else if (particle_p2 == 1)
			{
				canvas.bm.copyPixels(assetConfig.collectStar_red_bm, rect, tempPoint, null, null, true);
			}
			else if (particle_p2 == 2)
			{
				canvas.bm.copyPixels(assetConfig.collectStar_blue_bm, rect, tempPoint, null, null, true);
			}
			else if (particle_p2 == 3)
			{
				canvas.bm.copyPixels(assetConfig.collectStar_white_bm, rect, tempPoint, null, null, true);
			}
		}
	}
}