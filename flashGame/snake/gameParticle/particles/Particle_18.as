package snake.gameParticle.particles
{

	import snake.gameEnemys.Enemy;
	import snake.gameParticle.simpleParticles.SimpleParticle;

	public class Particle_18 extends Particle
	{
		public function Particle_18()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			c = Math.random() * 5;
			if (c == 0)
			{
				SimpleParticle.addSimpleParticle(11, particle_x - 15 + Math.random() * 30, particle_y - 15 + Math.random() * 30, 0, 0, int(Math.random() * 3));
			}
			if (sound.artifactSfx < 1)
			{
				sound.getVolume(particle_x, particle_y);
				if (sound.tempVol > sound.closestArtifact_dist)
				{
					sound.closestArtifact_dist = sound.tempVol;
				}
			}
			particle_x = particle_x + particle_velX * 0.4;
			particle_y = particle_y + particle_velY * 0.4;
			tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
			if (level.level_collidable[level.level[tileOn]] == 1)
			{
				particle_frame = 1;
				b = 10;
			}
			else
			{
				if(particle_p4 == 0)
				{
					bulletCollisions();
					if (particle_frame == 2)
					{
						c = 0;
						while (c < Enemy.enemyVect.length)
						{
							var target:Enemy=Enemy.enemyVect[c];
							d = Math.sqrt((target.enemy_x - particle_x) * (target.enemy_x - particle_x) + (target.enemy_y - 50 - particle_y) * (target.enemy_y - 50 - particle_y));
							if (int(d) < 25)
							{
								dealDamage(target,attackComputeData);
							}
							c  ++ ;
						}
						canvas.placeBloodSplatter(particle_x, particle_y, particle_p4);
						particle_frame = 0;
					}
				}
				else
				{
					bulletCollisions_enemy();
					if (particle_frame == 2)
					{
						if(null!=player)
						{
							d = Math.sqrt((player.character_x - particle_x) * (player.character_x - particle_x) + (player.character_y - 50 - particle_y) * (player.character_y - 50 - particle_y));
							if (int(d) < 25)
							{
								dealDamage(target,attackComputeData);
							}
						}
						canvas.placeBloodSplatter(particle_x, particle_y, particle_p4);
						particle_frame = 0;
					}
				}

			}
			if (int(particle_frame) == 1)
			{
				SimpleParticle.addSimpleParticle(10, particle_x, particle_y, 0, 0, 0);
				b = 0;
				while (b < 30)
				{
					
					addParticle(2, particle_x - 6, particle_y - 6, 0, particle_x - 6, particle_y - 6, 0, Math.random() * 30 - 15, (-Math.random()) * 10, 0, 0, 0, 0, 0, Math.random() + 0.5);
					b  ++ ;
				}
				removeParticle(a);
			}
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - 15;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - 15;
			particle_p2++; // 这是 什么意思
			
			
			if (particle_p2 > 6)
			{
				particle_p2 = 0;
			}
			if (particle_p2 < 3)
			{
				rect.x = 0;
			}
			else
			{
				rect.x = int(particle_p3) * 40;
				if ((particle_p3 < 13)&&(particle_p3 > 0))
				{
					particle_p3 = particle_p3 + 0.4;
					if (particle_p3 > 12)
					{
						particle_p3 = 0;
					}
				}
				else
				{
					if ((particle_p3 < 25)&&(particle_p3 > 12))
					{
						particle_p3 = particle_p3 + 0.4;
						if (particle_p3 > 24)
						{
							particle_p3 = 0;
						}
					}
					else
					{
						c = int(Math.random() * 60);
						if (c == 0)
						{
							particle_p3 = 1;
						}
						else if (c == 1)
						{
							particle_p3 = 13;
						}
						else
						{
							particle_p3 = int(Math.random() * 5) + 25;
						}
					}
				}
			}
			rect.y = 0;
			rect.width = 40;
			rect.height = 40;
			canvas.bm.copyPixels(assetConfig.gun_blackhole_bm, rect, tempPoint, null, null, true);
		}
	}
}