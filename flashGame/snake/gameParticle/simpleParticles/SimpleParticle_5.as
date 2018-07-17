package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_5 extends SimpleParticle
	{
		public function SimpleParticle_5()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_p1++;
			if (simpleParticle_p1 > 12)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = 300;
			rect.height = 170;
			rect.x = int(simpleParticle_p1) * 300;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX;
			tempPoint.y = simpleParticle_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_blood_impact_bm2, rect, tempPoint, null, null, false);
		}
	}
}