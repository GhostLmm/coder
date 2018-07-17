package snake.gameParticle.particles
{
	import flash.geom.Matrix;

	public class Particle_19 extends Particle
	{
		public function Particle_19()
		{
			super();
		}
		public override function excuteLogic():void{
//			trace("particle_p3"+particle_p3);
			
			particle_p4++;
			particle_p2++;
			
			if (particle_p2 > 10)
			{
				particle_p3++;
				particle_p2 = 0;
			}
			if (particle_p3 > 4)
			{
				removeParticle(a);
			}
		}
		
		public override function excuteRender():void{
			trans = new Matrix();
			assetConfig.gaussTrail.trail.scaleX = particle_p1 * 0.01;
			assetConfig.gaussTrail.trail.alpha = 1 - particle_p4 * 0.02;
			assetConfig.gaussTrail.trail.gotoAndStop(int(particle_p3));
			trans.createBox(1, 1, particle_r, particle_x - canvas.cameraX, particle_y -  canvas.cameraY);
			canvas.bm.draw(assetConfig.gaussTrail, trans, null, null, null, false);
		}
	}
}