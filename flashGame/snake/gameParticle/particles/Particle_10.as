package snake.gameParticle.particles
{
	/** 加血的宝箱 **/
	public class Particle_10 extends Particle
	{
		public function Particle_10()
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
			//warning
			if (Math.abs(player.character_x - particle_x) < 30)
			{
				if (Math.abs(player.character_y - (particle_y + 30)) < 30)
				{
					if (player.character_health < player.character_maxHealth)
					{
						b = 0;
						while (b < 20)
						{
							
							addParticle(17, particle_x, particle_y, 0, particle_x, particle_y, 0, Math.random() * 10 - 5, Math.random() * -12, 0, Math.random() * 1 + 0.5, 1, 0, 0, 0);
							
							b  ++ ;
							
						}
//						playSoundEffect(56, 1, 0);
						removeParticle(a);
//						messageTime = 60;
//						messageText = "FULL HEAL";
//						character_health = character_maxHealth;
					}
				}
			}
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - 37;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 37;
//			trace(tempPoint);
			rect.x = 0;
			rect.y = 0;
			rect.width = 75;
			rect.height = 75;
			canvas.bm.copyPixels(assetConfig.health_bm, rect, tempPoint, null, null, true);
		}
	}
}