package snake.gameParticle.simpleParticles
{
	import snake.gameParticle.particles.Particle;

	/** 枪口 火花**/
	public class SimpleParticle_0 extends SimpleParticle
	{
		public function SimpleParticle_0()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_p2++;
			if (simpleParticle_p2 > 1)
			{
				Particle.addParticle(3, simpleParticle_x + Math.cos(simpleParticle_r) * 20 - assetConfig.smokeWidth * 0.5 + Math.random() * 20 - 10, 
					simpleParticle_y + Math.sin(simpleParticle_r) * 20 - assetConfig.gun_flash_smoke_bm.height * 0.5 + Math.random() * 20 - 10, 0, 
					simpleParticle_x + Math.cos(simpleParticle_r) * 20 - assetConfig.smokeWidth * 0.5 + Math.random() * 20 - 10, 
					simpleParticle_y + Math.sin(simpleParticle_r) * 20 - assetConfig.gun_flash_smoke_bm.height * 0.5 + Math.random() * 20 - 10, 0, 0, Math.random() * 0.9 + 0.2, 0, (Math.random() * 0.9 + 0.2) * 2, 0, 0, 0, 0);
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			trans.createBox(1, 1, simpleParticle_r, simpleParticle_x - canvas.cameraX, simpleParticle_y -  canvas.cameraY);
			canvas.bm.draw(assetConfig.gun_flash[simpleParticle_p1], trans);
		}
	}
}