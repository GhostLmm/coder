package snake.gameParticle.particles
{
	/**
	 *   枪打到墙上激起的烟雾
	 */
	public class Particle_3 extends Particle
	{
		public function Particle_3()
		{
			super();
		}
		
		public override function excuteLogic():void{
			
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_y = particle_y - particle_velY;
			particle_frame = particle_frame + particle_p1;
			if (particle_frame > 20)
			{
				removeParticle();
			}
		}
		
		public override function excuteRender():void{
			rect.width = assetConfig.smokeWidth;
			rect.height = assetConfig.gun_flash_smoke_bm.height;
			rect.x = int(particle_frame) * assetConfig.smokeWidth;
			rect.y = 0;
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_flash_smoke_bm, rect, tempPoint, null, null, false);
		}
	}
}