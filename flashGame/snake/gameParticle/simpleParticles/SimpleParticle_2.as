package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_2 extends SimpleParticle
	{
		public function SimpleParticle_2()
		{
			super();
		}
		
		public override function excuteLogic():void{
			
		}
		
		public override function excuteRender():void{
			rect.width = assetConfig.gunCasingWidth[int(simpleParticle_p1)];
			rect.height = rect.width;
			rect.x = simpleParticle_p2;
			rect.y = 0;
			tempPoint.x = simpleParticle_x - canvas.cameraX;
			tempPoint.y = simpleParticle_y - canvas.cameraY;
			canvas.bm.copyPixels(assetConfig.gun_casing_bits[int(simpleParticle_p1)], rect, tempPoint, null, null, false);
		}
	}
}