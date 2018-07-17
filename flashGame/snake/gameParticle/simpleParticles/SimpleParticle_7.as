package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_7 extends SimpleParticle
	{
		public function SimpleParticle_7()
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
			trans.createBox(1, 1, simpleParticle_r, simpleParticle_x - canvas.cameraX, simpleParticle_y - canvas.cameraY);
			canvas.bm.draw(assetConfig["gun_blood_impact4_fr" + int(simpleParticle_p1)], trans);
		}
	}
}