package snake.gameParticle.particles
{

	import snake.gameEnemys.Enemy;
	import snake.gameParticle.simpleParticles.SimpleParticle;

	/** 火箭弹 **/
	public class Particle_14 extends Particle
	{
		public function Particle_14()
		{
			super();
		}
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			b = 0;
			while (b < 4)
			{
				particle_x = particle_x + particle_velX * 0.25;
				particle_y = particle_y + particle_velY * 0.25;
				tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_frame = 1;
					b = 10;
				}
				else if (particle_p4 == 0)
				{
					bulletCollisions();
				}
				else
				{
					bulletCollisions_enemy();
				}
				
				b  ++ ;
				
			}
			if (particle_p2 < 15)
			{
				particle_velX = particle_velX * 1.1;
				particle_velY = particle_velY * 1.1;
				particle_p2++;
			}
			if((int(particle_frame) == 1)||(int(particle_frame) == 2))
			{
				SimpleParticle.addSimpleParticle(10, particle_x, particle_y, 0, 0, 0);
				b = 0;
				while (b < 30)
				{
					addParticle(2, particle_x - 6, particle_y - 6, 0, particle_x - 6, particle_y - 6, 0, Math.random() * 30 - 15, (-Math.random()) * 10, 0, 0, 0, 0, 0, Math.random() + 0.5);
					b  ++ ;
				}
				if (int(particle_frame) == 2)
				{
					b = 0;
					while (b < 4)
					{
						canvas.placeBloodSplatter(particle_x, particle_y, particle_p4);
						b  ++ ;
					}
				}
				// warning
				if(particle_p4 == 0)
				{
					c = 0;
					while (c < Enemy.enemyVect.length)
					{
						var target:Enemy=Enemy.enemyVect[c];
						d = Math.sqrt((target.enemy_x - particle_x) * (target.enemy_x - particle_x) + (target.enemy_y - 50 - particle_y) * (target.enemy_y - 50 - particle_y));
						if (int(d) < 250)
						{
							dealDamage(target,attackComputeData);
						}
						c  ++ ;	
					}
				}
				removeParticle(a);
			}
		}
		public override function excuteRender():void{
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			trans.createBox(1, 1, particle_r, canvas.interpFinal.x - canvas.cameraX, canvas.interpFinal.y - canvas.cameraY);
			canvas.bm.draw(assetConfig.gun_rocket, trans);
		}
	}
}