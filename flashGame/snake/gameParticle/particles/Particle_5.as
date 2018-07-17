package snake.gameParticle.particles
{
	import snake.KFC;

	public class Particle_5 extends Particle
	{
		public function Particle_5()
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
				if (Math.abs(player.character_y - (particle_y + 30)) < 30)
				{
					// warning 
					/*if (particle_frame == 0)
					{
						KFC.messageTime = 60;
						KFC.messageText = "COLLECTED: GUN FRAME";
						objective_collectables_collected[0] = 1;
					}
					else if (particle_frame == 1)
					{
						messageTime = 60;
						messageText = "COLLECTED: GUN BARREL";
						objective_collectables_collected[1] = 1;
					}
					else if (particle_frame == 2)
					{
						messageTime = 60;
						messageText = "COLLECTED: GUN TRIGGER GROUP";
						objective_collectables_collected[2] = 1;
					}
					else if (particle_frame == 3)
					{
						messageTime = 60;
						messageText = "COLLECTED: GUN ACTION";
						objective_collectables_collected[3] = 1;
					}
					if (objective_collectables_collected[0] == 1)
					{
					}
					if (objective_collectables_collected[1] == 1)
					{
					}
					if (objective_collectables_collected[2] == 1)
					{
					}
					if (objective_collectables_collected[3] == 1)
					{
						playSoundEffect(85, 2, 0);
						messageTime2 = 70;
						messageText2 = "OBJECTIVE COMPLETE: COLLECT 4 GUN PARTS";
						scoreTally = scoreTally + 100;
						tempScoreQue = "";
						tempScoreQue = tempScoreQue + scoreNames[7];
						scoreQue.push(tempScoreQue);
						if (scoreQue.length > 3)
						{
							scoreQue.splice(0, 1);
						}
						scoreQueTime = 60;
						multiplier_countdown = max_multiplier_countdown;
					}
					else
					{
						playSoundEffect(86, 2, 0);
					}*/
					b = 0;
					while (b < 20)
					{
						
						addParticle(17, particle_x, particle_y, 0, particle_x, particle_y, 0, Math.random() * 10 - 5, Math.random() * -12, 0, Math.random() * 1 + 0.5, 2, 0, 0, 0);
						
						b  ++ ;
						
					}
					removeParticle();
				}
			}
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - 37;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 37;
//			trace(tempPoint);
			rect.x = particle_frame * 75;
			rect.y = 0;
			rect.width = 75;
			rect.height = 75;
			canvas.bm.copyPixels(assetConfig.collectable_gunPiece_bm, rect, tempPoint, null, null, true);
		}
	}
}