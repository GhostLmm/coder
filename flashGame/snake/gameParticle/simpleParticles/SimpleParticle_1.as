package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_1 extends SimpleParticle
	{
		public function SimpleParticle_1()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_y = simpleParticle_y - simpleParticle_p2 * 2;
			simpleParticle_p1 = simpleParticle_p1 + simpleParticle_p2 * 2;
			if (simpleParticle_p1 > 20)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = assetConfig.smokeWidth;
			rect.height = assetConfig.gun_flash_smoke_bm.height;
			rect.x = int(simpleParticle_p1) * assetConfig.smokeWidth;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX;
			tempPoint.y = simpleParticle_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_flash_smoke_bm, rect, tempPoint, null, null, false);
		}
	}
}