package snake.gameParticle.particles
{
	import snake.gameEnemys.Enemy;

	/** 子弹 **/
	public class Particle_12 extends Particle
	{
		public function Particle_12()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			b = 0;
			while (b < 2)
			{
				
				particle_x = particle_x + particle_velX;
				particle_y = particle_y + particle_velY;
				if (particle_p4 == 0)
				{
					bulletCollisions();
				}
				else
				{
					bulletCollisions_enemy();
				}
				addParticle(13, particle_x, particle_y, 0, particle_x, particle_y, 0, particle_velX * 0.75, Math.random() * -8, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
				if (particle_frame != 2)
				{
					tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_frame = 1;
						b = 100;
					}
				}
				
				b  ++ ;
				
			}
			particle_velY = particle_velY + 0.5;
			if (int(particle_frame) == 1)
			{
				addParticle(3, particle_x - assetConfig.smokeWidth * 0.5, particle_y - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, 
					particle_x - assetConfig.smokeWidth * 0.5, particle_y - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, 0, Math.random() * 0.9 + 0.2, 5, 1.5 + Math.random() * 0.5, 0, 0, 0, 0);
				b = 0;
				while (b < 25)
				{
					
					addParticle(13, particle_x, particle_y, 0, particle_x, particle_y, 0, Math.random() * 20 - 10, Math.random() * -16, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
					
					b  ++ ;
					
				}
				// warning
				if (particle_p4 == 0)
				{
					c = 0;
					while (c < Enemy.enemyVect.length)
					{
						var target:Enemy=Enemy.enemyVect[c];
						d = Math.sqrt((target.enemy_x - particle_x) * (target.enemy_x - particle_x) + (target.enemy_y - 50 - particle_y) * (target.enemy_y - 50 - particle_y));
						if (int(d) < 150)
						{
							target.enemy_statusEffect = 1;
							if (target.enemy_statusEffect_atp < (200 - d) * 5E-5)
							{
								target.enemy_statusEffect_atp = (200 - d) * 5E-5;
							}
						}
						
						c  ++ ;
						
					}
				}
				sound.getVolume(particle_x, particle_y);
				sound.playSoundEffect(77, sound.tempVol * 2, 0);
				removeParticle(a);
			}
			else if (int(particle_frame) == 2)
			{
				b = 0;
				while (b < 25)
				{
					
					addParticle(13, particle_x, particle_y, 0, particle_x, particle_y, 0, Math.random() * 20 - 10, Math.random() * -16, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
					
					b  ++ ;
					
				}
				b = 0;
				while (b < 6)
				{
					
					addParticle(3, particle_x + Math.random() * 20 - 10 - assetConfig.smokeWidth * 0.5, particle_y + Math.random() * 20 - 10 - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, 
						particle_x + Math.random() * 20 - 10 - assetConfig.smokeWidth * 0.5, particle_y + Math.random() * 20 - 10 - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, 0, Math.random() * 3 + 2, 5, 1.5 + Math.random() * 0.5, 0, 0, 0, 0);
					
					b  ++ ;
					
				}
				// warning
				if (particle_p4 == 0)
				{
					c = 0;
					while (c < Enemy.enemyVect.length)
					{
						var target:Enemy=Enemy.enemyVect[c];
						d = Math.sqrt((target.enemy_x - particle_x) * (target.enemy_x - particle_x) + (target.enemy_y - 50 - particle_y) * (target.enemy_y - 50 - particle_y));
						if (int(d) < 150)
						{
							target.enemy_statusEffect = 1;
							if (target.enemy_statusEffect_atp < (200 - d) * 5E-5)
							{
								target.enemy_statusEffect_atp = (200 - d) * 5E-5;
							}
						}
						
						c  ++ ;
						
					}
				}
				canvas.placeBloodSplatter(particle_x, particle_y, particle_p4);
				sound.getVolume(particle_x, particle_y);
				sound.playSoundEffect(77, sound.tempVol * 2, 0);
				removeParticle(a);
			}
		}
		
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = 	canvas.interpFinal.x - 	canvas.cameraX - 9;
			tempPoint.y = 	canvas.interpFinal.y - 	canvas.cameraY - 9;
			rect.x = 0;
			rect.y = 0;
			rect.width = 18;
			rect.height = 18;
			canvas.bm.copyPixels(assetConfig.gun_acidBomb, rect, tempPoint, null, null, true);
		}
	}
}