package snake.gameParticle.particles
{
	public class Particle_portal extends Particle
	{
		public function Particle_portal()
		{
			super();
		}
		public override function excuteLogic():void{
			
		}
		
		public override function excuteRender():void{
			
			
			if (((((simpleParticle_bg_x - canvas.cameraX) > -200)) && (((simpleParticle_bg_x - canvas.cameraX) < (canvas.screenWidth + 200))))){
				if (((((simpleParticle_bg_y - canvas.cameraY) > -200)) && (((simpleParticle_bg_y - canvas.cameraY) < (canvas.screenHeight + 200))))){
					canvas.bm.copyPixels(assetConfig.portalMovie.bm, rect, tempPoint, null, null, true);
				}
			}
		}
	}
}