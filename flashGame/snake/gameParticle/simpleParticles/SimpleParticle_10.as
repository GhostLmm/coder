package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_10 extends SimpleParticle
	{
		public function SimpleParticle_10()
		{
			super();
		}
		public override function excuteLogic():void{
			if (simpleParticle_p1 == 0)
			{
				sound.getVolume(simpleParticle_x, simpleParticle_y);
				sound.playSoundEffect(87, sound.tempVol * 3, 0);
			}
			simpleParticle_p1++;
			if (simpleParticle_p1 > 32)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			rect.width = 151;
			rect.height = 151;
			rect.x = int(simpleParticle_p1) * 151;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX - 75;
			tempPoint.y = simpleParticle_y - canvas.cameraY - 75;
			canvas.bm.copyPixels(assetConfig.explosion, rect, tempPoint, null, null, false);
		}
		
	}
}