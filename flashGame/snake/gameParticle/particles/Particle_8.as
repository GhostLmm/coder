package snake.gameParticle.particles
{
	import snake.KFC;

	/** 公文包，收集道具**/
	public class Particle_8 extends Particle
	{
		public function Particle_8()
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
			if (Math.abs(player.character_x - particle_x) < 30)
			{
				if (Math.abs(player.character_y - (particle_y + 25)) < 50)
				{
					sound.playSoundEffect(85, 2, 0);
					KFC.messageTime2 = 70;
					KFC.messageText2 = "OBJECTIVE COMPLETE: FIND SECRET BRIEFCASE";
					objective.objective_briefcase_collected = true;
					//warning
//					objective.scoreTally = scoreTally + 100;
//					tempScoreQue = "";
//					tempScoreQue = tempScoreQue + scoreNames[7];
//					scoreQue.push(tempScoreQue);
//					if (scoreQue.length > 3)
//					{
//						scoreQue.splice(0, 1);
//					}
//					scoreQueTime = 60;
//					multiplier_countdown = max_multiplier_countdown;
					b = 0;
					while (b < 20)
					{
						
						addParticle(17, particle_x, particle_y, 0, particle_x, particle_y, 0, Math.random() * 10 - 5, Math.random() * -12, 0, Math.random() * 1 + 0.5, 3, 0, 0, 0);
						
						b  ++ ;
						
					}
					removeParticle(a);
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
			canvas.bm.copyPixels(assetConfig.briefcase_bm, rect, tempPoint, null, null, true);
		}
	}
}