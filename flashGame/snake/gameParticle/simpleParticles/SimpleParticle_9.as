package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_9 extends SimpleParticle
	{
		public function SimpleParticle_9()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_p1 = simpleParticle_p1 + 0.5;
			if (simpleParticle_p1 > 10)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = 131;
			rect.height = 105;
			rect.x = int(simpleParticle_p1) * 131 + simpleParticle_p2 * 131 * 11;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX;
			tempPoint.y = simpleParticle_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_blood_impact_bm6, rect, tempPoint, null, null, false);
		}
	}
}