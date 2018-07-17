package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_4 extends SimpleParticle
	{
		public function SimpleParticle_4()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_p1++;
			if (simpleParticle_p1 > 11)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = 275;
			rect.height = 170;
			rect.x = int(simpleParticle_p1) * 275 + simpleParticle_p2 * 275 * 12;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX;
			tempPoint.y = simpleParticle_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_blood_impact_bm1, rect, tempPoint, null, null, false);
		}
	}
}