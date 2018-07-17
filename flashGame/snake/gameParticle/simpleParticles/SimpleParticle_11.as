package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_11 extends SimpleParticle
	{
		public function SimpleParticle_11()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_p1 = simpleParticle_p1 + 0.4;
			if (simpleParticle_p1 > 13)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = 65;
			rect.height = 65;
			rect.x = simpleParticle_p2 * 910 + int(simpleParticle_p1) * 65;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX - 33;
			tempPoint.y = simpleParticle_y - canvas.cameraY - 33;
			canvas.bm.copyPixels(assetConfig.gun_blackhole_fx_bm, rect, tempPoint, null, null, false);
		}
	}
}