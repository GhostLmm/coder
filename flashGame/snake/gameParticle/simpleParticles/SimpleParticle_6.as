package snake.gameParticle.simpleParticles
{
	public class SimpleParticle_6 extends SimpleParticle
	{
		public function SimpleParticle_6()
		{
			super();
		}
		public override function excuteLogic():void{
			simpleParticle_p1++;
			if (simpleParticle_p1 > 14)
			{
				removeSimpleParticle(a);
			}
		}
		
		public override function excuteRender():void{
			trans.createBox(1, int(simpleParticle_p2), simpleParticle_r, simpleParticle_x - canvas.cameraX, simpleParticle_y - canvas.cameraY);
			canvas.bm.draw(assetConfig["gun_blood_impact3_fr"+int(simpleParticle_p1)], trans);
		}
	}
}