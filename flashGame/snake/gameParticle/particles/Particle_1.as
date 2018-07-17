package snake.gameParticle.particles
{

	import snake.gameEnemys.Enemy;
	import snake.gameEnemys.Enemy_1;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.viewdata.battle.AttackComputeData;

	/**
	 *     手枪子弹射线
	 */
	public class Particle_1 extends Particle
	{
		public function Particle_1()
		{
			super();
		}
		
	
		
		/*protected override function bulletCollisions():void{
			c=0;
			while(c<Enemy.enemyVect.length){
				var target:Enemy=Enemy.enemyVect[c];
				if (target.enemy_markedForRemoval == false){
					if (Math.abs((particle_x - target.enemy_x)) < 25){
						if (Math.abs((particle_y - (target.enemy_y - 50))) < 50){
							if (target.enemy_face == 0){
								
								bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].head_x[target.enemy_fr]));
								bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].head_y[target.enemy_fr]));
								if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
									particle_frame = 2;
									if (particle_type != 16){
										b = 100;
									};
									
									dealDamage(target,attackComputeData);
//									target.enemy_health_head = (target.enemy_health_head - particle_p5);
//									//Fantasy
//									showDamage(target,particle_p5);
//									//
									target.enemy_damagedBy = particle_p3;
									if (particle_type == 12){
										target.enemy_statusEffect = 1;
										target.enemy_statusEffect_atp = 0.1;
									};
									c = (Enemy.enemyVect.length + 1);
								}
								else {
									bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].body_x[target.enemy_fr]));
									bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].body_y[target.enemy_fr]));
									if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
										particle_frame = 2;
										if (particle_type != 16){
											b = 100;
										};
										dealDamage(target,attackComputeData);
//										target.enemy_health_body = (target.enemy_health_body - particle_p5);
//										//Fantasy
//										showDamage(target,particle_p5);
//										//
										target.enemy_damagedBy = particle_p3;
										if (particle_type == 12){
											target.enemy_statusEffect = 1;
											target.enemy_statusEffect_atp = 0.1;
										};
										c = (Enemy.enemyVect.length + 1);
									}
									else {
										bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].foot2_x[target.enemy_fr]));
										bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot2_y[target.enemy_fr]));
										if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
											particle_frame = 2;
											if (particle_type != 16){
												b = 100;
											};
											dealDamage(target,attackComputeData);
//											target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
//											//Fantasy
//											showDamage(target,particle_p5);
//											//
											target.enemy_damagedBy = particle_p3;
											if (particle_type == 12){
												target.enemy_statusEffect = 1;
												target.enemy_statusEffect_atp = 0.1;
											};
											c = (Enemy.enemyVect.length + 1);
										}
										else {
											bullet_dx = (particle_x - (target.enemy_x + Enemy.charAnimDataVect[target.enemy_anim].foot1_x[target.enemy_fr]));
											bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot1_y[target.enemy_fr]));
											if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
												particle_frame = 2;
												if (particle_type != 16){
													b = 100;
												};
												dealDamage(target,attackComputeData);
//												target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
//												//Fantasy
//												showDamage(target,particle_p5);
//												//
												target.enemy_damagedBy = particle_p3;
												if (particle_type == 12){
													target.enemy_statusEffect = 1;
													target.enemy_statusEffect_atp = 0.1;
												};
												c = (Enemy.enemyVect.length + 1);
											};
										};
									};
								};
							}
							else {
								bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].head_x[target.enemy_fr]));
								bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].head_y[target.enemy_fr]));
								if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 20){
									particle_frame = 2;
									if (particle_type != 16){
										b = 100;
									};
									dealDamage(target,attackComputeData);
//									target.enemy_health_head = (target.enemy_health_head - particle_p5);
//									//Fantasy
//									showDamage(target,particle_p5);
//									//
									target.enemy_damagedBy = particle_p3;
									if (particle_type == 12){
										target.enemy_statusEffect = 1;
										target.enemy_statusEffect_atp = 0.1;
									};
									c = (Enemy.enemyVect.length + 1);
								}
								else {
									bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].body_x[target.enemy_fr]));
									bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].body_y[target.enemy_fr]));
									if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 16){
										particle_frame = 2;
										if (particle_type != 16){
											b = 100;
										};
										dealDamage(target,attackComputeData);
										
//										target.enemy_health_body = (target.enemy_health_body - particle_p5);
//										//Fantasy
//										showDamage(target,particle_p5);
//										//
										
										target.enemy_damagedBy = particle_p3;
										if (particle_type == 12){
											target.enemy_statusEffect = 1;
											target.enemy_statusEffect_atp = 0.1;
										};
										c = (Enemy.enemyVect.length + 1);
									}
									else {
										bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].foot2_x[target.enemy_fr]));
										bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot2_y[target.enemy_fr]));
										if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
											particle_frame = 2;
											if (particle_type != 16){
												b = 100;
											};
											dealDamage(target,attackComputeData);
//											target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
//											//Fantasy
//											showDamage(target,particle_p5);
//											//
											target.enemy_damagedBy = particle_p3;
											if (particle_type == 12){
												target.enemy_statusEffect = 1;
												target.enemy_statusEffect_atp = 0.1;
											};
											c = (Enemy.enemyVect.length + 1);
										}
										else {
											bullet_dx = (particle_x - (target.enemy_x - Enemy.charAnimDataVect[target.enemy_anim].foot1_x[target.enemy_fr]));
											bullet_dy = (particle_y - (target.enemy_y + Enemy.charAnimDataVect[target.enemy_anim].foot1_y[target.enemy_fr]));
											if (Math.sqrt(((bullet_dx * bullet_dx) + (bullet_dy * bullet_dy))) < 12){
												particle_frame = 2;
												if (particle_type != 16){
													b = 100;
												};
												dealDamage(target,attackComputeData);
//												target.enemy_health_foot = (target.enemy_health_foot - particle_p5);
//												//Fantasy
//												showDamage(target,particle_p5);
//												//
												target.enemy_damagedBy = particle_p3;
												if (particle_type == 12){
													target.enemy_statusEffect = 1;
													target.enemy_statusEffect_atp = 0.1;
												};
												c = (Enemy.enemyVect.length + 1);
											};
										};
									};
								};
							};
						};
					};
				};
				c++;
			}
			
		}*/
		/*public static function dealDamage(_enemy:Enemy,_data:AttackComputeData):void
		{
			if(null==_enemy)
			{
				return;
			}
			if(_enemy is Enemy_1){
				(_enemy as Enemy_1).dealDamage(_data);
			}
			
		}*/
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			b = 0;
			while (b < 5)
			{
				// 子弹防止穿透 使用 5次计算
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
				if (particle_frame != 2)
				{
					tileOn = int(particle_y / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						// 撞到障碍物
						particle_frame = 1;
						b = 100;
					}
				}
				
				b  ++ ;
				
			}
			if (int(particle_frame) == 1)
			{
				if (int(particle_p2) == 0)
				{
					// warning  为什么这么写呢
					// 打到墙上 起的烟雾
					addParticle(3, particle_x - assetConfig.smokeWidth * 0.5, particle_y - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, particleVect[particleVect.length-1].particle_x,
						particleVect[particleVect.length-1].particle_y, 0, 0, Math.random() * 0.9 + 0.2, 5, 1.5 + Math.random() * 0.5, 0, 0, 0, 0);
					b = 0;
					while (b < 6)
					{
						//  打到墙上的火光
						addParticle(2, particle_x - 6, particle_y - 6, 0, particle_x - 6, particle_y - 6, 0, (-particle_velX) * Math.random(), (-Math.random()) * 8, 0, 0, 0, 0, 0, Math.random() + 0.5);
						
						b  ++ ;
						
					}
				}
				else
				{
					SimpleParticle.addSimpleParticle(3, particle_x - 32, particle_y - 32, 0, 0, 0);
				}
				c = Math.random() * 3;
				if (c == 0)
				{
					sound.getVolume(particle_x, particle_y);
					sound.playSoundEffect(int(Math.random() * 3) + 35, sound.tempVol, 0);
				}
				removeParticle();
			}
			else if (int(particle_frame) == 2)
			{
				if (sound.numberOfBloodSplatSFX < 1)
				{
					sound.getVolume(particle_x, particle_y);
					sound.playSoundEffect(int(Math.random() * 4) + 45, sound.tempVol * 2, 0);
					
					sound.numberOfBloodSplatSFX  ++ ;
					
				}
				c = int(Math.random() * 5);
				if (c == 0)
				{
					if (particle_velX > 0)
					{
						SimpleParticle.addSimpleParticle(4, particle_x - 60, particle_y - 50, 0, 0, 1);
					}
					else
					{
						SimpleParticle.addSimpleParticle(4, particle_x - 215, particle_y - 50, 0, 0, 0);
					}
					c = int(Math.random() * 3);
					if (c == 0)
					{
						if (particle_velX > 0)
						{
							SimpleParticle.addSimpleParticle(9, particle_x - 127, particle_y - 25, 0, 0, 1);
						}
						else
						{
							SimpleParticle.addSimpleParticle(9, particle_x - 5, particle_y - 25, 0, 0, 0);
						}
					}
				}
				else if (c == 1)
				{
					SimpleParticle.addSimpleParticle(5, particle_x - 135, particle_y - 85, 0, 0, 0);
				}
				else if (c == 2)
				{
					if (particle_velX < 0)
					{
						SimpleParticle.addSimpleParticle(6, particle_x, particle_y, 3.14 + Math.random() * -0.3925, 0, -1);
					}
					else
					{
						SimpleParticle.addSimpleParticle(6, particle_x, particle_y, Math.random() * 0.785 - 0.3925, 0, 1);
					}
					c = int(Math.random() * 3);
					if (c == 0)
					{
						if (particle_velX > 0)
						{
							SimpleParticle.addSimpleParticle(9, particle_x - 127, particle_y - 25, 0, 0, 1);
						}
						else
						{
							SimpleParticle.addSimpleParticle(9, particle_x - 5, particle_y - 25, 0, 0, 0);
						}
					}
				}
				else if (c == 3)
				{
					SimpleParticle.addSimpleParticle(7, particle_x, particle_y, particle_r, 0, 0);
				}
				else if (c == 4)
				{
					SimpleParticle.addSimpleParticle(8, particle_x - 110, particle_y - 56, 0, 0, 0);
				}
				canvas.placeBloodSplatter(particle_x, particle_y, particle_p4);
				if (particle_p3 != 10)
				{
					removeParticle();
				}
				else
				{
					particle_p5 = particle_p5 * 0.4;
					if (particle_p5 < 4)
					{
						removeParticle();
					}
					else
					{
						particle_frame = 0;
					}
				}
			}
		}
		public override function excuteRender():void{
			rect.width = assetConfig.boolitWidth;
			rect.height = assetConfig.gun_boolit.height;
			rect.x = int(particle_p1) * assetConfig.boolitWidth;
			rect.y = 0;
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - rect.width * 0.5;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - rect.height * 0.5;
			canvas.bm.copyPixels(assetConfig.gun_boolit, rect, tempPoint, null, null, false);
		}
	}
}