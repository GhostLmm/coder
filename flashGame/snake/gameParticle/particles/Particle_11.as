package snake.gameParticle.particles
{
	/** 添加时间的 **/
	public class Particle_11 extends Particle
	{
		public function Particle_11()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_y = particle_y - particle_velY;
			if (particle_p1 == 0)
			{
				particle_velY = particle_velY - 0.1;
				if (particle_velY < -1.2)
				{
					particle_p1 = 1;
				}
			}
			else
			{
				particle_velY = particle_velY + 0.1;
				if (particle_velY > 1.2)
				{
					particle_p1 = 0;
				}
			}
			//waring 
			if (Math.abs(player.character_x - (particle_x + 25)) < 30)
			{
				if (Math.abs(player.character_y - (particle_y + 25)) < 75)
				{
//					playSoundEffect(89, 2, 0);
					b = 0;
					while (b < 20)
					{
						
						addParticle(17, particle_x, particle_y, 0, particle_x, particle_y, 0, Math.random() * 10 - 5, Math.random() * -12, 0, Math.random() * 1 + 0.5, 0, 0, 0, 0);
						
						b  ++ ;
						
					}
					removeParticle(a);
//					messageTime = 60;
//					messageText = "TIME INCREASE: @1:00";
//					timeRemaining = timeRemaining + 1800;
				}
			}
		}
		
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 50;
			rect.x = 0;
			rect.y = 0;
			rect.width = 50;
			rect.height = 85;
			canvas.bm.copyPixels(assetConfig.time_bm, rect, tempPoint, null, null, true);
		}
	}
}