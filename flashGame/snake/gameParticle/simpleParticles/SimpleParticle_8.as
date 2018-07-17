package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_8 extends SimpleParticle
	{
		public function SimpleParticle_8()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_p1++;
			if (simpleParticle_p1 > 7)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = 215;
			rect.height = 135;
			rect.x = int(simpleParticle_p1) * 215;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX;
			tempPoint.y = simpleParticle_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_blood_impact_bm5, rect, tempPoint, null, null, false);
		}
	}
}