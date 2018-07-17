package snake.gameParticle.particles
{
	/**
	 *    墙面 流血
	 */
	public class Particle_6 extends Particle
	{
		public function Particle_6()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_p1 = particle_p1 - 0.01;
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_y = particle_y + particle_velY;
			particle_velY = particle_velY * 0.99;
			tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
			if ((level.level_collidable[level.level[tileOn]] != 1)||(particle_velY >= 0.1)||(particle_p1 < 0.01))
			{
				removeParticle();
			}
			
			
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			trans.createBox(particle_p1, particle_p1, 0, canvas.interpFinal.x - particle_p1, canvas.interpFinal.y - particle_p1);
			canvas.drawToLevelBm(assetConfig.blood_drop, trans, null, "multiply", null, false);
		}
	}
}