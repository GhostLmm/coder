package snake.gameParticle.simpleParticles
{
	import snake.gameParticle.particles.Particle;

	public class SimpleParticle_3 extends SimpleParticle
	{
		public function SimpleParticle_3()
		{
			super();
		}
		public override function excuteLogic():void{
//			var _loc_1:* = simpleParticle_p1;
//			var _loc_2:* = a;
//			var _loc_3:* = simpleParticle_p1 + 1;
//			_loc_1[_loc_2] = _loc_3;
			simpleParticle_p1++;
			b = 0;
			while (b < 3)
			{
				
				Particle.addParticle(2, simpleParticle_x + 10 + Math.random() * 45, simpleParticle_y + 10 + Math.random() * 45, 0,
					simpleParticle_x + 10 + Math.random() * 45, simpleParticle_y + 10 + Math.random() * 45, 0, (Math.random() * 20 - 10) * 0.5, (-Math.random()) * 8, 0, 0, 0, 0, 0, Math.random() + 0.5);
				
				b  ++ ;
				
			}
			if (int(simpleParticle_p1) == 1)
			{
				b = 0;
				while (b < 8)
				{
					
					Particle.addParticle(3, simpleParticle_x + 10 + Math.random() * 45 - assetConfig.smokeWidth * 0.5, simpleParticle_y + 10 + Math.random() * 45 - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, 0,0, 0, 0, Math.random() * 0.9 + 0.2, 0, (Math.random() * 0.9 + 0.2) * 2, 0, 0, 0, 0);
					Particle.addParticle(2, simpleParticle_x + 10 + Math.random() * 45, simpleParticle_y + 10 + Math.random() * 45, 0, 0,0, 0, (Math.random() * 20 - 10) * 2, (-Math.random()) * 8, 0, 0, 0, 0, 0, Math.random() + 0.5);
					Particle.addParticle(2, simpleParticle_x + 10 + Math.random() * 45, simpleParticle_y + 10 + Math.random() * 45, 0, 0,0, 0, (Math.random() * 20 - 10) * 2, (-Math.random()) * 8, 0, 0, 0, 0, 0, Math.random() + 0.5);
					
					b  ++ ;
					
				}
			}
			if (simpleParticle_p1 > 6)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = 65;
			rect.height = 65;
			rect.x = int(simpleParticle_p1) * 65;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX;
			tempPoint.y = simpleParticle_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_incindary_impact_bm, rect, tempPoint, null, null, false);
		}
	}
}