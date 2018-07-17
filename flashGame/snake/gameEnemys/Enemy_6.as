package snake.gameEnemys
{

	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.viewdata.battle.AttackComputeData;

	public class Enemy_6 extends Enemy
	{
//		private var zombieData.computeData:AttackComputeData;
		public function Enemy_6()
		{
			
			super();
//			zombieData.computeData=new AttackComputeData();
//			zombieData.computeData.atk=20;
		}
		public override function excuteLogic():void{
//			trace("状态： "+enemy_aiState+"/ "+enemy_anim);
			var zombieAsset:ZombieAsset=assetConfig.getZombieAssetBySprite(enemy_spriteSet);
			
			if ((((((enemy_health_body > 0)) && ((enemy_health_head > 0)))) && ((enemy_health_foot > 0)))){
//				if (enemy_statusEffect == 1){
//					enemy_health_head = (enemy_health_head - enemy_statusEffect_atp);
//					enemy_health_body = (enemy_health_body - (enemy_statusEffect_atp * 0.95));
//					enemy_health_headOld = enemy_health_head;
//					enemy_health_bodyOld = enemy_health_body;
//					Particle.addParticle(13, ((enemy_x + (Math.random() * 40)) - 20), ((enemy_y - (Math.random() * 40)) - 40), 0, Particle.particleLastX, Particle.particleLastY, 0, ((Math.random() * 20) - 10), 0, 0, int((Math.random() * 4)), 0, 0, 0, ((Math.random() * 0.5) + 0.25),zombieData.computeData);
//					c = int((Math.random() * 2));
//					if (c == 0){
//						Particle.addParticle(3, (Particle.particleLastX - (assetConfig.smokeWidth * 0.5)), (Particle.particleLastY - (assetConfig.gun_flash_smoke_bm.height * 0.5)), 0, Particle.particleLastX, Particle.particleLastY, 0, 0, ((Math.random() * 3) + 2), 5, (1.5 + (Math.random() * 0.5)), 0, 0, 0, 0,zombieData.computeData);
//					};
//					if (enemy_statusEffect_atp > 0.001){
//						Particle.addParticle(13, ((enemy_x + (Math.random() * 40)) - 20), ((enemy_y - (Math.random() * 40)) - 40), 0, Particle.particleLastX, Particle.particleLastY, 0, ((Math.random() * 20) - 10), 0, 0, int((Math.random() * 4)), 0, 0, 0, ((Math.random() * 0.5) + 0.25),zombieData.computeData);
//						if (enemy_statusEffect_atp > 0.005){
//							Particle.addParticle(13, ((enemy_x + (Math.random() * 40)) - 20), ((enemy_y - (Math.random() * 40)) - 40), 0, Particle.particleLastX, Particle.particleLastY, 0, ((Math.random() * 20) - 10), 0, 0, int((Math.random() * 4)), 0, 0, 0, ((Math.random() * 0.5) + 0.25),zombieData.computeData);
//						};
//					};
//				};
				if (enemy_lineOfSightCountdown > 5){
					enemy_dX = (enemy_x - player.character_x);
					enemy_dY = (enemy_y - player.character_y);
					enemy_radTo = Math.atan2(enemy_dY, enemy_dX);
					enemy_headRot = enemy_radTo;
					enemy_tempRise = (Math.sin(enemy_headRot) * -25);
					enemy_tempRun = (Math.cos(enemy_headRot) * -25);
					enemy_lineOfSightCountdown = 0;
					enemy_dist = Math.sqrt(((enemy_dX * enemy_dX) + (enemy_dY * enemy_dY)));
					enemy_dist = Math.abs(int((enemy_dist / 25)));
					enemy_hasLineOfSight = true;
					if (enemy_aiState == 0){
						enemy_dist=0;
						if(Math.abs(enemy_dY)>50){
							enemy_hasLineOfSight=false;
						}
						/*if (enemy_face == 0){
							if (player.character_x > (enemy_x + 25)){
								if (enemy_dist > 6){
									enemy_hasLineOfSight = false;
									enemy_dist = 6;
								};
							}
							else {
								if (enemy_dist > 1){
									enemy_hasLineOfSight = false;
									enemy_dist = 1;
								};
							};
						}
						else {
							if (player.character_x < (enemy_x - 25)){
								if (enemy_dist > 6){
									enemy_hasLineOfSight = false;
									enemy_dist = 6;
								};
							}
							else {
								if (enemy_dist > 1){
									enemy_hasLineOfSight = false;
									enemy_dist = 1;
								};
							};
						};*/
					}
					else {
						if (enemy_dist > 20){
							enemy_dist = 20;
						};
					};
					b = 0;
					while (b < enemy_dist) {
						tileOn = ((int((((enemy_y - 20) + (enemy_tempRise * b)) / 50)) * level.level_width) + int(((enemy_x + (enemy_tempRun * b)) / 50)));
						if (level.level_collidable[level.level[tileOn]] == 1){
							enemy_hasLineOfSight = false;
							b = 50;
						};
						b++;
					};
					if (enemy_hasLineOfSight == true){
						enemy_aiState = 1;
					}
					else {
						if (enemy_aiState == 1){
							enemy_aiState = 2;
						};
					};
				}
				else {
//					_local_1 = enemy_lineOfSightCountdown;
//					_local_2 = a;
//					_local_3 = (_local_1[_local_2] + 1);
//					_local_1[_local_2] = _local_3;
					enemy_lineOfSightCountdown++;
				};
				
				if (enemy_initialized == 0){
					enemy_anim = (int((Math.random() * 3)) + 1);
					enemy_face = int((Math.random() * 2));
					enemy_initialized = 1;
					b = 0;
					/*while (b < 50) {
//						_local_1 = enemy_y;
//						_local_2 = a;
//						_local_3 = (_local_1[_local_2] + 1);
//						_local_1[_local_2] = _local_3;
						enemy_y++;
						tileOn = ((int(((enemy_y - 2) / 50)) * level.level_width) + int((enemy_x / 50)));
						if (level.level_collidable[level.level[tileOn]] == 1){
							b = 100;
						};
						b++;
					};*/
					enemy_hasLineOfSight = false;
//					c = int((Math.random() * 4));
//					if (c == 0){
//						enemy_aiState = 2;
//					}
//					else {
//						enemy_aiState = 0;
//					};
					enemy_aiState=2;
//					enemy_engagementDistance = ((Math.random() * 4) + 1);
				};
				enemy_xOld = enemy_x;
				enemy_yOld = enemy_y;
				switch (enemy_aiState){
					case 0:
						break;
					case 1:
						if (enemy_jump == false){
							if (enemy_anim < 5){
								if (enemy_x > (player.character_x + 60)){
									if (enemy_face != 1){
										enemy_face = 1;
									};
									if (enemy_velX > -(enemy_engagementDistance)){
//										_local_1 = enemy_velX;
//										_local_2 = a;
//										_local_3 = (_local_1[_local_2] - 1);
//										_local_1[_local_2] = _local_3;
										enemy_velX--;
									}
									else {
										enemy_velX = -(enemy_engagementDistance);
									};
								}
								else {
									if (enemy_x < (player.character_x - 60)){
										if (enemy_face != 0){
											enemy_face = 0;
										};
										if (enemy_velX < enemy_engagementDistance){
//											_local_1 = enemy_velX;
//											_local_2 = a;
//											_local_3 = (_local_1[_local_2] + 1);
//											_local_1[_local_2] = _local_3;
											enemy_velX++;
										}
										else {
											enemy_velX = enemy_engagementDistance;
										};
									}
									else {
										/*if (enemy_velX > 1){
//											_local_1 = enemy_velX;
//											_local_2 = a;
//											_local_3 = (_local_1[_local_2] - 1);
//											_local_1[_local_2] = _local_3;
											enemy_velX--;
										}
										else {
											if (enemy_velX < -1){
//												_local_1 = enemy_velX;
//												_local_2 = a;
//												_local_3 = (_local_1[_local_2] + 1);
//												_local_1[_local_2] = _local_3;
												enemy_velX++;
											}
											else {
												enemy_velX = 0;
												if (enemy_anim < 5){
													c = (Math.random() * 10);
													if (c == 0){
														enemy_anim = (int((Math.random() * 3)) + 5);
														enemy_fr = 0;
													}
													else {
														if (enemy_anim != 1){
															enemy_anim = 1;
															enemy_fr = 0;
														};
													};
												};
											};
										};*/
										enemy_velX = 0;
										if (enemy_anim < 5){
											c = (Math.random() * 10);
											if (c == 0){
												enemy_anim = (int((Math.random() * 3)) + 5);
												enemy_fr = 0;
											}
											else {
												if (enemy_anim != 1){
													enemy_anim = 1;
													enemy_fr = 0;
												};
											};
										};
									};
								};
								if (enemy_spriteSet == 4){
									c = (Math.random() * 20);
									if (c == 0){
										enemy_anim = 8;
										enemy_fr = 0;
										enemy_velX = 0;
									};
								};
							};
						}
						else {
							enemy_velY = (enemy_velY + 2);
							if (enemy_velY > 25){
								enemy_velY = 25;
							};
							if (enemy_velX > 1){
//								_local_1 = enemy_velX;
//								_local_2 = a;
//								_local_3 = (_local_1[_local_2] - 1);
//								_local_1[_local_2] = _local_3;
								enemy_velX--;
							}
							else {
								if (enemy_velX < -1){
//									_local_1 = enemy_velX;
//									_local_2 = a;
//									_local_3 = (_local_1[_local_2] + 1);
//									_local_1[_local_2] = _local_3;
									enemy_velX++;
								}
								else {
									enemy_velX = 0;
								};
							};
						};
						break;
					case 2:
						if (enemy_jump == false){
							if (enemy_face == 1){
								if (enemy_velX > -(enemy_engagementDistance)){
//									_local_1 = enemy_velX;
//									_local_2 = a;
//									_local_3 = (_local_1[_local_2] - 1);
//									_local_1[_local_2] = _local_3;
									enemy_velX--;
								}
								else {
									enemy_velX = -(enemy_engagementDistance);
								};
							}
							else {
								if (enemy_velX < enemy_engagementDistance){
//									_local_1 = enemy_velX;
//									_local_2 = a;
//									_local_3 = (_local_1[_local_2] + 1);
//									_local_1[_local_2] = _local_3;
									enemy_velX++;
								}
								else {
									enemy_velX = enemy_engagementDistance;
								};
							};
						}
						else {
							enemy_velY = (enemy_velY + 2);
							if (enemy_velY > 25){
								enemy_velY = 25;
							};
							if (enemy_velX > 1){
//								_local_1 = enemy_velX;
//								_local_2 = a;
//								_local_3 = (_local_1[_local_2] - 1);
//								_local_1[_local_2] = _local_3;
								enemy_velX--;
							}
							else {
								if (enemy_velX < -1){
//									_local_1 = enemy_velX;
//									_local_2 = a;
//									_local_3 = (_local_1[_local_2] + 1);
//									_local_1[_local_2] = _local_3;
									enemy_velX++;
								}
								else {
									enemy_velX = 0;
								};
							};
						};
						break;
				};
				if (enemy_velX != 0){
					if (((!((enemy_anim == 4))) && ((enemy_anim < 5)))){
						enemy_anim = 4;
						enemy_fr = 0;
					};
				};
				enemy_x = (enemy_x + enemy_velX);
				if (enemy_velX > 0){
					tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x + 25) / 50)));
					if ( (level.level_collidable[level.level[tileOn]] == 1) ||(level.level_collidable[level.level[tileOn - level.level_width]] == 1) ){
						enemy_x = (((int((enemy_x / 50)) + 1) * 50) - 25);
						enemy_anim = (int((Math.random() * 4)) + 10);
						enemy_fr = 0;
						enemy_frOld = 0;
						enemy_velX = 0;
						if (enemy_aiState == 2){
							if (enemy_face == 0){
								enemy_face = 1;
							}
							else {
								enemy_face = 0;
							};
						}
						else {
							enemy_aiState = 0;
						};
					};
				}
				else {
					if (enemy_velX < 0){
						tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x - 25) / 50)));
						if ((level.level_collidable[level.level[tileOn]] == 1)  ||(level.level_collidable[level.level[tileOn - level.level_width]] == 1)){
							enemy_x = ((int((enemy_x / 50)) * 50) + 25);
							enemy_anim = (int((Math.random() * 4)) + 10);
							enemy_fr = 0;
							enemy_frOld = 0;
							enemy_velX = 0;
							if (enemy_aiState == 2){
								if (enemy_face == 0){
									enemy_face = 1;
								}
								else {
									enemy_face = 0;
								};
							}
							else {
								enemy_aiState = 0;
							};
						};
					}
					else {
						tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x + 25) / 50)));
						if ( (level.level_collidable[level.level[tileOn]] == 1) ||(level.level_collidable[level.level[tileOn - level.level_width]] == 1)){
							enemy_x = (((int((enemy_x / 50)) + 1) * 50) - 25);
						};
						tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x - 25) / 50)));
						if ((level.level_collidable[level.level[tileOn]] == 1) ||(level.level_collidable[level.level[tileOn - level.level_width]] == 1)){
							enemy_x = ((int((enemy_x / 50)) * 50) + 25);
						};
					};
				};
				enemy_y = (enemy_y + enemy_velY);
				if (enemy_jump == true){
					tileOn = ((int(((enemy_y + 5) / 50)) * level.level_width) + int(((enemy_x - 25) / 50)));
					if (level.level_collidable[level.level[tileOn]] == 1){
						enemy_jump = false;
						enemy_y = ((int((enemy_y / 50)) * 50) + 2);
						enemy_velY = 0;
						enemy_velX = 0;
						enemy_anim = 18;
						enemy_fr = 0;
					};
				}
				else {
					if (enemy_face == 0){
						tileOn = ((int(((enemy_y + 5) / 50)) * level.level_width) + int(((enemy_x - 10) / 50)));
						if (level.level_collidable[level.level[tileOn]] == 0){
							enemy_jump = true;
							enemy_anim = 9;
							enemy_fr = 0;
							enemy_velX = 10;
						};
					}
					else {
						tileOn = ((int(((enemy_y + 5) / 50)) * level.level_width) + int(((enemy_x + 10) / 50)));
						if (level.level_collidable[level.level[tileOn]] == 0){
							enemy_jump = true;
							enemy_anim = 9;
							enemy_fr = 0;
							enemy_velX = -10;
							
						};
					};
				};
				if (enemy_anim == 18){
					enemy_velX = 0;
				};
				if (enemy_health_head < enemy_health_headOld){
					if (enemy_anim < 18){
						enemy_anim = (int((Math.random() * 4)) + 10);
						enemy_fr = 0;
						enemy_frOld = 0;
						enemy_velX = 0;
					};
					enemy_aiState = 1;
				}
				else {
					if (enemy_health_body < enemy_health_bodyOld){
						if (enemy_anim < 18){
							enemy_anim = (int((Math.random() * 4)) + 14);
							enemy_fr = 0;
							enemy_frOld = 0;
							enemy_velX = 0;
						};
						enemy_aiState = 1;
					}
					else {
						if (enemy_health_foot < enemy_health_footOld){
							if (enemy_anim < 18){
								c = int((Math.random() * 4));
								if (c == 0){
									enemy_anim = 18;
									enemy_fr = 0;
									enemy_frOld = 0;
									enemy_velX = 0;
								};
							};
							enemy_aiState = 1;
						};
					};
				};
				enemy_health_headOld = enemy_health_head;
				enemy_health_bodyOld = enemy_health_body;
				enemy_health_footOld = enemy_health_foot;
				enemy_frOld = enemy_fr;
				if (enemy_anim != 4){
					enemy_fr = (enemy_fr + 2);
					if(enemy_anim == 18){
						enemy_fr = (enemy_fr + 5);
					}
				}
				else {
					enemy_fr = (enemy_fr + Math.abs((enemy_velX * 0.8)));
				};
				if (enemy_anim == 5){
					if (enemy_fr == 20){
						if (enemy_face == 0){
							Particle.addParticle(21, (enemy_x + 20), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
							Particle.addParticle(21, (enemy_x + 40), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
							Particle.addParticle(21, (enemy_x + 60), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
						}
						else {
							Particle.addParticle(21, (enemy_x - 20), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
							Particle.addParticle(21, (enemy_x - 40), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
							Particle.addParticle(21, (enemy_x - 60), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
						};
					};
				}
				else {
					if (enemy_anim == 6){
						if (enemy_fr == 22){
							if (enemy_face == 0){
								Particle.addParticle(21, (enemy_x + 20), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
								Particle.addParticle(21, (enemy_x + 40), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
								Particle.addParticle(21, (enemy_x + 60), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
							}
							else {
								Particle.addParticle(21, (enemy_x - 20), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
								Particle.addParticle(21, (enemy_x - 40), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
								Particle.addParticle(21, (enemy_x - 60), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
							};
						};
					}
					else {
						if (enemy_anim == 7){
							if (enemy_fr == 14){
								if (enemy_face == 0){
									Particle.addParticle(21, (enemy_x + 20), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
									Particle.addParticle(21, (enemy_x + 40), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
									Particle.addParticle(21, (enemy_x + 60), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
								}
								else {
									Particle.addParticle(21, (enemy_x - 20), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
									Particle.addParticle(21, (enemy_x - 40), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
									Particle.addParticle(21, (enemy_x - 60), (enemy_y - 50), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,zombieData.computeData);
								};
							};
						}
						else {
							if (enemy_anim == 8){
								if ((((enemy_fr > 32)) && ((enemy_fr < 56)))){
									if (((enemy_fr / 2) % 2) == 0){
										if (enemy_face == 0){
											tempRad = (-0.2 - (Math.random() * 0.1));
											Particle.addParticle(12, (enemy_x + 25), (enemy_y - 60), tempRad, Particle.particleLastX, Particle.particleLastY, 0, (Math.cos((tempRad + Math.PI)) * -10), (Math.sin((tempRad + Math.PI)) * -10), 0, int((((tempRad + Math.PI) / (Math.PI * 2)) * 64)), 0, 0, 1, 0.1,zombieData.computeData);
										}
										else {
											tempRad = ((-(Math.PI) + 0.2) + (Math.random() * 0.1));
											Particle.addParticle(12, (enemy_x - 25), (enemy_y - 60), tempRad, Particle.particleLastX, Particle.particleLastY, 0, (Math.cos((tempRad + Math.PI)) * -10), (Math.sin((tempRad + Math.PI)) * -10), 0, int((((tempRad + Math.PI) / (Math.PI * 2)) * 64)), 0, 0, 1, 0.1,zombieData.computeData);
										};
									};
								};
							};
						};
					};
				};
				
				if (enemy_fr > zombieMovieDataVect[enemy_anim].zombie_maxFrames){
					if (enemy_anim != 9){
						enemy_fr = 0;
						enemy_frOld = enemy_fr;
						enemy_anim = (int((Math.random() * 3)) + 1);
					}
					else {
						enemy_fr = zombieMovieDataVect[enemy_anim].zombie_maxFrames;
						enemy_frOld = enemy_fr;
					};
				};
				// warning 无需把脱离视野的怪物杀灭
				/*if ((((Math.abs((enemy_x - player.character_x)) > 1200)) || ((Math.abs((enemy_y - player.character_y)) > 800)))){
					enemy_health_head = -50001;
					enemy_markedForRemoval = true;
				};*/
			}
			else {
				enemy_xOld = enemy_x;
				enemy_yOld = enemy_y;
				if (enemy_markedForRemoval == false){
					enemy_markedForRemoval = true;
					/*_local_1 = weaponProficiencyKills;
					_local_2 = enemy_damagedBy;
					_local_3 = (_local_1[_local_2] + 1);
					_local_1[_local_2] = _local_3;*/
					if (enemy_damagedBy != 20){
						/*if ((((weaponProficiencyKills[enemy_damagedBy] >= 50)) && ((scoreTimesEarned[(enemy_damagedBy + 12)] == 0)))){
							scoreTally = (scoreTally + 100);
							tempScoreQue = "";
							tempScoreQue = (tempScoreQue + scoreNames[(enemy_damagedBy + 12)]);
							scoreQue.push(tempScoreQue);
							if (scoreQue.length > 3){
								scoreQue.splice(0, 1);
							};
							scoreQueTime = 60;
							multiplier_countdown = max_multiplier_countdown;
							scoreTimesEarned[(enemy_damagedBy + 12)] = 1;
						};*/
					}
					else {
						/*if ((((weaponProficiencyKills[enemy_damagedBy] >= 5)) && ((scoreTimesEarned[(enemy_damagedBy + 12)] == 0)))){
							scoreTally = (scoreTally + 100);
							tempScoreQue = "";
							tempScoreQue = (tempScoreQue + scoreNames[(enemy_damagedBy + 12)]);
							scoreQue.push(tempScoreQue);
							if (scoreQue.length > 3){
								scoreQue.splice(0, 1);
							};
							scoreQueTime = 60;
							multiplier_countdown = max_multiplier_countdown;
							scoreTimesEarned[(enemy_damagedBy + 12)] = 1;
						};*/
					};
					/*tempScoreQue = "";
					tempScoreQue = (tempScoreQue + scoreNames[0]);
					scoreTally = (scoreTally + 10);
					_local_1 = scoreTimesEarned;
					_local_2 = 0;
					_local_3 = (_local_1[_local_2] + 1);
					_local_1[_local_2] = _local_3;
					if ((((gun_ammo[character_gunEquipped] == 0)) && ((gun_mag_size[character_gunEquipped] > 2)))){
						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[3]));
						scoreTally = (scoreTally + 5);
						_local_1 = scoreTimesEarned;
						_local_2 = 3;
						_local_3 = (_local_1[_local_2] + 1);
						_local_1[_local_2] = _local_3;
					};*/
					/*if (enemy_anim == 23){
						scoreTally = (scoreTally + 5);
						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[4]));
						_local_1 = scoreTimesEarned;
						_local_2 = 4;
						_local_3 = (_local_1[_local_2] + 1);
						_local_1[_local_2] = _local_3;
					};*/
					if ((((((enemy_health_head <= 0)) && ((enemy_health_body == enemy_health_bodyMax)))) && ((enemy_health_foot == enemy_health_footMax)))){
						canvas.cameraShakeFun(0.5);
						sound.getVolume(enemy_x, enemy_y);
						sound.playSoundEffect((int((Math.random() * 3)) + 42), sound.tempVol, 0);
						enemy_isHeadless = true;
						/*scoreTally = (scoreTally + 5);
						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[1]));
						_local_1 = scoreTimesEarned;
						_local_2 = 1;
						_local_3 = (_local_1[_local_2] + 1);
						_local_1[_local_2] = _local_3;
						if (enemy_jump == true){
							scoreTally = (scoreTally + 5);
							tempScoreQue = (tempScoreQue + (" @ " + scoreNames[8]));
							_local_1 = scoreTimesEarned;
							_local_2 = 8;
							_local_3 = (_local_1[_local_2] + 1);
							_local_1[_local_2] = _local_3;
						};*/
						b = 5;
						while (b < 9) {
							if (enemy_face == 0){
								
								enemy_tempPos_x = ((enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]) + assetConfig.giblet_posX[b]);
								enemy_tempPos_face = 1;
								enemy_tempVel_x = ((Math.random() * -8) - 1);
							}
							else {
								enemy_tempPos_x = ((enemy_x - zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]) - assetConfig.giblet_posX[b]);
								enemy_tempPos_face = -1;
								enemy_tempVel_x = ((Math.random() * 8) + 1);
							};
							enemy_tempPos_y = ((enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]) + assetConfig.giblet_posY[b]);
							enemy_tempVel_y = ((Math.random() * -10) - 2);
							Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
							b++;
						};
						if (enemy_face == 0){
							canvas.placeBloodSplatter((enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]), (enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]), (enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]), (enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]), 0);
						}
						else {
							canvas.placeBloodSplatter((enemy_x - zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]), (enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x - zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]), (enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x - zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]), (enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]), 0);
						};
						SimpleParticle.addSimpleParticle(8, (((enemy_x - 110) + (Math.random() * 50)) - 25), ((enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]) - 75), 0, 0, 0);
						SimpleParticle.addSimpleParticle(5, (((enemy_x - 135) + (Math.random() * 50)) - 25), ((enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]) - 100), 0, 0, 0);
						b = 0;
						while (b < 5) {
							enemy_tempPos_x = (((enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							enemy_tempPos_y = (((enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							if (enemy_face == 0){
								enemy_tempVel_x = ((Math.random() * -10) - 1);
							}
							else {
								enemy_tempVel_x = ((Math.random() * 10) + 1);
							};
							enemy_tempVel_y = ((Math.random() * -15) - 10);
							Particle.addParticle(9, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, int((Math.random() * 5)), 0, 0, 0, 0);
							b++;
						};
					}
					else {
						/*if ((((((enemy_health_body <= 0)) && ((enemy_health_head == enemy_health_headMax)))) && ((enemy_health_foot == enemy_health_footMax)))){
							scoreTally = (scoreTally + 5);
							tempScoreQue = (tempScoreQue + (" @ " + scoreNames[2]));
							_local_1 = scoreTimesEarned;
							_local_2 = 2;
							_local_3 = (_local_1[_local_2] + 1);
							_local_1[_local_2] = _local_3;
						};*/
					};
					wasGibbed = false;
					if ((((((enemy_health_head <= 0)) && ((enemy_health_body <= 0)))) || ((enemy_jump == true)))){
						canvas.cameraShakeFun(1.5);
						wasGibbed = true;
						sound.getVolume(enemy_x, enemy_y);
						sound.playSoundEffect((int((Math.random() * 4)) + 38), sound.tempVol, 0);
						/*scoreTally = (scoreTally + 10);
						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[5]));
						_local_1 = scoreTimesEarned;
						_local_2 = 5;
						_local_3 = (_local_1[_local_2] + 1);
						_local_1[_local_2] = _local_3;
						if (enemy_jump == true){
							scoreTally = (scoreTally + 5);
							tempScoreQue = (tempScoreQue + (" @ " + scoreNames[6]));
							_local_1 = scoreTimesEarned;
							_local_2 = 6;
							_local_3 = (_local_1[_local_2] + 1);
							_local_1[_local_2] = _local_3;
						};*/
						b = 4;
						while (b > -1) {
							switch (b){
								case 0:
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = (enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									canvas.placeBloodSplatter(enemy_tempPos_x, enemy_tempPos_y, 0);
									break;
								case 1:
									if (enemy_face == 0){
										enemy_tempPos_x = ((enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]) - 3);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = ((enemy_x - zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]) + 3);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = ((enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]) + 20);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									break;
								case 2:
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + zombieMovieDataVect[enemy_anim].body_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - zombieMovieDataVect[enemy_anim].body_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = (enemy_y + zombieMovieDataVect[enemy_anim].body_y[int(enemy_fr)]);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									canvas.placeBloodSplatter(enemy_tempPos_x, enemy_tempPos_y, 0);
									break;
								case 3:
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + zombieMovieDataVect[enemy_anim].foot1_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - zombieMovieDataVect[enemy_anim].foot1_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = ((enemy_y + zombieMovieDataVect[enemy_anim].foot1_y[int(enemy_fr)]) - 3);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + zombieMovieDataVect[enemy_anim].foot2_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - zombieMovieDataVect[enemy_anim].foot2_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = ((enemy_y + zombieMovieDataVect[enemy_anim].foot2_y[int(enemy_fr)]) - 3);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									break;
								case 4:
									if (enemy_face == 0){
										enemy_tempPos_x = enemy_x+ zombieMovieDataVect[enemy_anim].hand1_x[int(enemy_fr)] - 3;
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = enemy_x+ zombieMovieDataVect[enemy_anim].hand1_x[int(enemy_fr)] - 3;
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = enemy_y+ zombieMovieDataVect[enemy_anim].hand1_y[int(enemy_fr)] - 3;
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX, Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									break;
							};
							SimpleParticle.addSimpleParticle(8, (((enemy_x - 110) + (Math.random() * 50)) - 25), ((enemy_y - 56) - (Math.random() * 100)), 0, 0, 0);
							SimpleParticle.addSimpleParticle(5, (((enemy_x - 135) + (Math.random() * 50)) - 25), ((enemy_y - 85) - (Math.random() * 100)), 0, 0, 0);
							b--;
						};
						b = 0;
						while (b < 7) {
							enemy_tempPos_x = (((enemy_x + zombieMovieDataVect[enemy_anim].head_x[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							enemy_tempPos_y = (((enemy_y + zombieMovieDataVect[enemy_anim].head_y[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							if (enemy_face == 0){
								enemy_tempVel_x = ((Math.random() * -10) - 1);
							}
							else {
								enemy_tempVel_x = ((Math.random() * 10) + 1);
							};
							enemy_tempVel_y = ((Math.random() * -15) - 10);
							Particle.addParticle(9, enemy_tempPos_x, enemy_tempPos_y, 0, enemy_tempPos_x, enemy_tempPos_y, 0, enemy_tempVel_x, enemy_tempVel_y, 0, int((Math.random() * 5)), 0, 0, 0, 0);
							b++;
						};
					};
					if (wasGibbed == false){
						c = int((Math.random() * 4));
						if (c != 0){
							c = int((Math.random() * 2));
							if (c == 0){
								sound.getVolume(enemy_x, enemy_y);
								sound.playSoundEffect((int((Math.random() * 8)) + 93), (sound.tempVol * 3), 0);
							}
							else {
								sound.getVolume(enemy_x, enemy_y);
								sound.playSoundEffect((int((Math.random() * 9)) + 101), (sound.tempVol * 3), 0);
							};
						};
					};
				
				
			
					/*multiKillCount++;
					multiKillTime = 1;
					if (multiKillCount > 10){
						multiKillCount = 10;
					};
					if (multiKillCount > 1){
						scoreTally = (scoreTally + (5 * (multiKillCount - 1)));
						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[(32 + (multiKillCount - 1))]));
						_local_1 = scoreTimesEarned;
						_local_2 = (32 + (multiKillCount - 1));
						_local_3 = (_local_1[_local_2] + 1);
						_local_1[_local_2] = _local_3;
					};
					scoreQue.push(tempScoreQue);
					if (scoreQue.length > 3){
						scoreQue.splice(0, 1);
					};
					scoreQueTime = 60;
					multiplier = (multiplier + 0.1);
					multiplier_countdown = max_multiplier_countdown;*/
			
				};
				if (enemy_anim < 19){
					enemy_anim = (19 + int((Math.random() * 5)));
					enemy_fr = 0;
				};
				if ((((wasGibbed == true)) || ((enemy_health_head == -50001)))){
					removeEnemyLogic(a);
					removeEnemy(a);
				}
				else {
					enemy_frOld = enemy_fr;
					enemy_fr = (enemy_fr + 2);
					var zombieMovieData:ZombieMovieData=zombieMovieDataVect[enemy_anim];
					if (enemy_fr > zombieMovieData.zombie_maxFrames)
					{
						enemy_fr = zombieMovieData.zombie_maxFrames;
						if (enemy_face == 0){
							
							trans.createBox(1, 1, zombieMovieData.hand2_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.hand2_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.hand2_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.hand2, trans);
							trans.createBox(1, 1, zombieMovieData.foot2_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.foot2_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.foot2_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.foot, trans);
							trans.createBox(1, 1, zombieMovieData.ankle2_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.ankle2_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.ankle2_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.ankle, trans);
							trans.createBox(1, 1, zombieMovieData.body_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.body_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.body_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.body, trans);
							trans.createBox(1, 1, zombieMovieData.head_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.head_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.head_y[zombieMovieData.zombie_maxFrames]));
							if (enemy_isHeadless == false){
								canvas.drawToLevelBm(zombieAsset.head, trans);
							};
							trans.createBox(1, 1, zombieMovieData.foot1_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.foot1_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.foot1_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.foot, trans);
							trans.createBox(1, 1, zombieMovieData.ankle1_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.ankle1_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.ankle1_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.ankle, trans);
							trans.createBox(1, 1, zombieMovieData.hand1_r[zombieMovieData.zombie_maxFrames], (enemy_x + zombieMovieData.hand1_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.hand1_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.hand1, trans);
							
							
						}else {
					
							trans.createBox(-1, 1, zombieMovieData.hand2_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.hand2_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.hand2_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.hand2, trans);
							trans.createBox(-1, 1, zombieMovieData.foot2_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.foot2_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.foot2_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.foot, trans);
							trans.createBox(-1, 1, zombieMovieData.ankle2_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.ankle2_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.ankle2_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.ankle, trans);
							trans.createBox(-1, 1, zombieMovieData.body_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.body_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.body_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.body, trans);
							trans.createBox(-1, 1, zombieMovieData.head_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.head_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.head_y[zombieMovieData.zombie_maxFrames]));
							if (enemy_isHeadless == false){
								canvas.drawToLevelBm(zombieAsset.head, trans);
							};
							trans.createBox(-1, 1, zombieMovieData.foot1_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.foot1_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.foot1_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.foot, trans);
							trans.createBox(-1, 1, zombieMovieData.ankle1_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.ankle1_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.ankle1_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.ankle, trans);
							trans.createBox(-1, 1, zombieMovieData.hand1_r[zombieMovieData.zombie_maxFrames], (enemy_x - zombieMovieData.hand1_x[zombieMovieData.zombie_maxFrames]), (enemy_y + zombieMovieData.hand1_y[zombieMovieData.zombie_maxFrames]));
							canvas.drawToLevelBm(zombieAsset.hand1, trans);
						};
						removeEnemyLogic(a);
						removeEnemy(a);
					};
				};
			};
		}
		public override function excuteRender():void{
			if (enemy_x - canvas.cameraX > -200)
			{
				if (enemy_x - canvas.cameraX < canvas.screenWidth + 200)
				{
					if (enemy_y - canvas.cameraY > -200)
					{
						if (enemy_y - canvas.cameraY < canvas.screenHeight + 200)
						{
							render_a_zombie(enemy_x - canvas.cameraX, enemy_y - canvas.cameraY, enemy_xOld - canvas.cameraX, enemy_yOld - canvas.cameraY, enemy_anim, enemy_fr, enemy_frOld, enemy_face, enemy_spriteSet, enemy_isHeadless);
							renderHpBar();
//							enemiesOnScreen  ++ ;
							
						}
					}
					
				}
			}
			
		}
		
		
		public function render_a_zombie(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
		{
			var zombieAsset:ZombieAsset=assetConfig.getZombieAssetBySprite(enemy_spriteSet);
			zombieMovieDataVect[param5]
			canvas.interpFun(param6, 0, param7, 0);
			interpFrame = canvas.interpFinal.x;
			if (param8 == 0)
			{
				canvas.interpFun(param1, param2, param3, param4);
				trans.createBox(1, 1, zombieMovieDataVect[param5].hand2_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].hand2_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].hand2_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.hand2, trans);
				trans.createBox(1, 1, zombieMovieDataVect[param5].foot2_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].foot2_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].foot2_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.foot, trans);
				trans.createBox(1, 1, zombieMovieDataVect[param5].ankle2_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].ankle2_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].ankle2_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.ankle, trans);
				trans.createBox(1, 1, zombieMovieDataVect[param5].body_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].body_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].body_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.body, trans);
				trans.createBox(1, 1, zombieMovieDataVect[param5].head_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].head_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].head_y[int(interpFrame)]);
				if (param10 == false)
				{
					canvas.bm.draw(zombieAsset.head, trans);
				}
				trans.createBox(1, 1, zombieMovieDataVect[param5].foot1_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].foot1_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].foot1_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.foot, trans);
				trans.createBox(1, 1, zombieMovieDataVect[param5].ankle1_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].ankle1_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].ankle1_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.ankle, trans);
				trans.createBox(1, 1, zombieMovieDataVect[param5].hand1_r[int(interpFrame)], canvas.interpFinal.x + zombieMovieDataVect[param5].hand1_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].hand1_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.hand1, trans);
			}
			else
			{
				canvas.interpFun(param1, param2, param3, param4);
				trans.createBox(-1, 1, zombieMovieDataVect[param5].hand2_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].hand2_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].hand2_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.hand2, trans);
				trans.createBox(-1, 1, zombieMovieDataVect[param5].foot2_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].foot2_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].foot2_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.foot, trans);
				trans.createBox(-1, 1, zombieMovieDataVect[param5].ankle2_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].ankle2_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].ankle2_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.ankle, trans);
				trans.createBox(-1, 1, zombieMovieDataVect[param5].body_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].body_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].body_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.body, trans);
				trans.createBox(-1, 1, zombieMovieDataVect[param5].head_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].head_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].head_y[int(interpFrame)]);
				if (param10 == false)
				{
					canvas.bm.draw(zombieAsset.head, trans);
				}
				trans.createBox(-1, 1, zombieMovieDataVect[param5].foot1_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].foot1_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].foot1_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.foot, trans);
				trans.createBox(-1, 1, zombieMovieDataVect[param5].ankle1_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].ankle1_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].ankle1_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.ankle, trans);
				trans.createBox(-1, 1, zombieMovieDataVect[param5].hand1_r[int(interpFrame)], canvas.interpFinal.x - zombieMovieDataVect[param5].hand1_x[int(interpFrame)], canvas.interpFinal.y + zombieMovieDataVect[param5].hand1_y[int(interpFrame)]);
				canvas.bm.draw(zombieAsset.hand1, trans);
			}
			
			return;
		}// end function
		
	}
}