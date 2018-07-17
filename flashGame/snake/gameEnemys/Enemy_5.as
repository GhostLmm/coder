package snake.gameEnemys
{

	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticles.SimpleParticle;

	public class Enemy_5 extends Enemy
	{
		public function Enemy_5()
		{
			super();
		}
		public override function excuteLogic():void{
			
			if (enemy_health_body > 0 && enemy_health_head > 0)
			{
				if (enemy_initialized == 0)
				{
					enemy_anim = 0;
					enemy_initialized = 1;
					enemy_engagementDistance = int(Math.random() * 10) + 5;
					enemy_hasLineOfSight = true;
				}
				if (enemy_statusEffect == 1)
				{
					enemy_health_head = enemy_health_head - enemy_statusEffect_atp;
					enemy_health_body = enemy_health_body - enemy_statusEffect_atp * 0.95;
					enemy_health_headOld = enemy_health_head;
					enemy_health_bodyOld = enemy_health_body;
					tempPoint.x=enemy_x + Math.random() * 40 - 20;
					tempPoint.y=enemy_y - Math.random() * 40;
					Particle.addParticle(13, tempPoint.x,tempPoint.y, 0, 0,0, 0, Math.random() * 20 - 10, 0, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
					c = int(Math.random() * 2);
					if (c == 0)
					{
						Particle.addParticle(3, tempPoint.x - assetConfig.smokeWidth * 0.5, tempPoint.y - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, tempPoint.x,tempPoint.y, 0, 0, Math.random() * 3 + 2, 5, 1.5 + Math.random() * 0.5, 0, 0, 0, 0);
					}
					if (enemy_statusEffect_atp > 0.001)
					{
						Particle.addParticle(13, enemy_x + Math.random() * 40 - 20, enemy_y - Math.random() * 40, 0, 0,0, 0, Math.random() * 20 - 10, 0, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
						if (enemy_statusEffect_atp > 0.005)
						{
							Particle.addParticle(13, enemy_x + Math.random() * 40 - 20, enemy_y - Math.random() * 40, 0, 0,0, 0, Math.random() * 20 - 10, 0, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
						}
					}
				}
				if (enemy_anim == 2)
				{
					enemy_fr = enemy_fr + Math.abs(enemy_velX * 0.2);
				}
				else
				{
					enemy_fr++;
//					var _loc_1:* = enemy_fr;
//					var _loc_2:* = a;
//					var _loc_3:* = enemy_fr + 1;
//					_loc_1[_loc_2] = _loc_3;
				}
				if (enemy_fr > teenieAnimDataVect[enemy_anim].teenieAnimFrMax)
				{
					if (enemy_anim != 0)
					{
					}
					if (enemy_anim == 1)
					{
						enemy_anim = int(Math.random() * 2);
					}
					if (enemy_anim != 3)
					{
					}
					if (enemy_anim != 4)
					{
						enemy_fr = 0;
					}
					else
					{
						enemy_fr = teenieAnimDataVect[enemy_anim].teenieAnimFrMax;
					}
				}
				if (enemy_lineOfSightCountdown > 5)
				{
				}
				if (enemy_jump == false)
				{
					enemy_dX = enemy_x - player.character_x;
					enemy_dY = enemy_y - player.character_y;
					enemy_radTo = Math.atan2(enemy_dY, enemy_dX);
					enemy_headRot = enemy_radTo;
					enemy_tempRise = Math.sin(enemy_headRot) * -25;
					enemy_tempRun = Math.cos(enemy_headRot) * -25;
					enemy_lineOfSightCountdown = 0;
					enemy_dist = Math.sqrt(enemy_dX * enemy_dX + enemy_dY * enemy_dY);
					enemy_dist = Math.abs(int(enemy_dist / 25));
					if (enemy_dist > 30)
					{
						enemy_dist = 30;
					}
					enemy_hasLineOfSight = true;
					b = 0;
					while (b < enemy_dist)
					{
						
						tileOn = int((enemy_y - 20 + enemy_tempRise * b) / 50) * level.level_width + int((enemy_x + enemy_tempRun * b) / 50);
						if (level.level_collidable[level.level[tileOn]] == 1)
						{
							enemy_hasLineOfSight = false;
							b = 50;
						}
						
						b  ++ ;
						
					}
				}
				else
				{
//					var _loc_1:* = enemy_lineOfSightCountdown;
//					var _loc_2:* = a;
//					var _loc_3:* = enemy_lineOfSightCountdown + 1;
//					_loc_1[_loc_2] = _loc_3;
					enemy_lineOfSightCountdown++;
				}
				if (enemy_hasLineOfSight == true)
				{
					if (enemy_jump == false)
					{
						if (enemy_x > player.character_x + 20)
						{
							if (enemy_velX > -enemy_engagementDistance)
							{
								(enemy_velX - 1);
							}
							if (enemy_anim != 2)
							{
								enemy_anim = 2;
								enemy_fr = 0;
							}
						}
						else if (enemy_x < player.character_x - 20)
						{
							if (enemy_velX < enemy_engagementDistance)
							{
								(enemy_velX + 1);
							}
							if (enemy_anim != 2)
							{
								enemy_anim = 2;
								enemy_fr = 0;
							}
						}
						else
						{
							if (enemy_velX > 1)
							{
								(enemy_velX - 1);
							}
							else if (enemy_velX < -1)
							{
								(enemy_velX + 1);
							}
							else if (enemy_velX != 0)
							{
								enemy_velX = 0;
								enemy_anim = int(Math.random() * 2);
								enemy_fr = 0;
							}
							if (Math.abs(enemy_y - player.character_y) < 30)
							{
								c = Math.random() * 5;
								if (c == 0)
								{
									enemy_health_head = -100001;
								}
							}
						}
						c = int(Math.random() * 100);
						if (c == 0)
						{
							enemy_jump = true;
							enemy_velY = Math.random() * -16 - 10;
						}
					}
					else
					{
						enemy_velY = enemy_velY + 2;
						if (enemy_velY > 20)
						{
							enemy_velY = 20;
						}
						if (enemy_velY < 0)
						{
							if (enemy_anim != 3)
							{
								enemy_anim = 3;
								enemy_fr = 0;
							}
						}
						else if (enemy_velY > 0)
						{
							if (enemy_anim != 4)
							{
								enemy_anim = 4;
								enemy_fr = 0;
							}
						}
					}
				}
				else if (enemy_jump == true)
				{
					enemy_velY = enemy_velY + 2;
					if (enemy_velY > 20)
					{
						enemy_velY = 20;
					}
					if (enemy_velY < 0)
					{
						if (enemy_anim != 3)
						{
							enemy_anim = 3;
							enemy_fr = 0;
						}
					}
					else if (enemy_velY > 0)
					{
						if (enemy_anim != 4)
						{
							enemy_anim = 4;
							enemy_fr = 0;
						}
					}
					if (enemy_y > player.character_y + 50)
					{
						if (enemy_velX > 4)
						{
							enemy_velX = enemy_velX - 4;
						}
						else if (enemy_velX < -4)
						{
							enemy_velX = enemy_velX + 4;
						}
						else
						{
							enemy_velX = 0;
						}
					}
					else if (enemy_x > player.character_x + 20)
					{
						if (enemy_velX > -enemy_engagementDistance)
						{
							(enemy_velX - 1);
						}
					}
					else if (enemy_x < player.character_x - 20)
					{
						if (enemy_velX < enemy_engagementDistance)
						{
							(enemy_velX + 1);
						}
					}
					else
					{
						if (enemy_velX > 1)
						{
							(enemy_velX - 1);
						}
						else if (enemy_velX < -1)
						{
							(enemy_velX + 1);
						}
						else if (enemy_velX != 0)
						{
							enemy_velX = 0;
						}
						if (Math.abs(enemy_y - player.character_y) < 30)
						{
							c = Math.random() * 5;
							if (c == 0)
							{
								enemy_health_head = -100001;
							}
						}
					}
				}
				else if (player.character_y > enemy_y)
				{
					if (enemy_velX > 0)
					{
						if (enemy_velX < enemy_engagementDistance)
						{
							(enemy_velX + 1);
						}
						if (enemy_anim != 2)
						{
							enemy_anim = 2;
							enemy_fr = 0;
						}
					}
					else if (enemy_velX < 0)
					{
						if (enemy_velX > -enemy_engagementDistance)
						{
							(enemy_velX - 1);
						}
						if (enemy_anim != 2)
						{
							enemy_anim = 2;
							enemy_fr = 0;
						}
					}
					else
					{
						c = int(Math.random() * 2);
						if (c == 0)
						{
							enemy_velX = 1;
						}
						else
						{
							enemy_velX = -1;
						}
					}
				}
				if (enemy_velX > 0)
				{
					enemy_face = 0;
				}
				else if (enemy_velX < 0)
				{
					enemy_face = 1;
				}
				enemy_xOld = enemy_x;
				enemy_yOld = enemy_y;
				enemy_x = enemy_x + enemy_velX;
				if (enemy_velX > 0)
				{
					tileOn = int((enemy_y - 1) / 50) * level.level_width + int((enemy_x + 20) / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						enemy_x = (int(enemy_x / 50) + 1) * 50 - 20;
						if (enemy_hasLineOfSight == false)
						{
							enemy_velX = -1;
						}
					}
					tileOn = int((enemy_y - 50) / 50) * level.level_width + int((enemy_x + 20) / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						enemy_x = (int(enemy_x / 50) + 1) * 50 - 20;
						if (enemy_hasLineOfSight == false)
						{
							enemy_velX = -1;
						}
					}
					tileOn = int((enemy_y - 10) / 50) * level.level_width + int(enemy_x / 50);
					if (level.nodeMap[tileOn] == 3)
					{
						if (player.character_y - 50 < enemy_y)
						{
							enemy_jump = true;
							enemy_velY = -15 - Math.random() * 19;
						}
					}
					else if (level.nodeMap[tileOn] == 5)
					{
						if (enemy_y > player.character_y)
						{
							enemy_jump = true;
							enemy_velY = -20 - Math.random() * 19;
						}
					}
				}
				else if (enemy_velX < 0)
				{
					tileOn = int((enemy_y - 1) / 50) * level.level_width + int((enemy_x - 20) / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						enemy_x = int(enemy_x / 50) * 50 + 20;
						if (enemy_hasLineOfSight == false)
						{
							enemy_velX = 1;
						}
					}
					tileOn = int((enemy_y - 50) / 50) * level.level_width + int((enemy_x - 20) / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						enemy_x = int(enemy_x / 50) * 50 + 20;
						if (enemy_hasLineOfSight == false)
						{
							enemy_velX = 1;
						}
					}
					tileOn = int((enemy_y - 10) / 50) * level.level_width + int(enemy_x / 50);
					if (level.nodeMap[tileOn] == 4)
					{
						if (player.character_y - 50 < enemy_y)
						{
							enemy_jump = true;
							enemy_velY = -15 - Math.random() * 19;
						}
					}
					else if (level.nodeMap[tileOn] == 5)
					{
						if (enemy_y > player.character_y)
						{
							enemy_jump = true;
							enemy_velY = -20 - Math.random() * 19;
						}
					}
				}
				enemy_y = enemy_y + enemy_velY;
				tileOn = int(enemy_y / 50) * level.level_width + int(enemy_x / 50);
				if (level.level_collidable[level.level[tileOn]] == 0)
				{
					if (enemy_jump == false)
					{
						enemy_jump = true;
					}
				}
				else
				{
					enemy_y = int(enemy_y / 50) * 50;
					if (enemy_jump == true)
					{
						enemy_jump = false;
						if (enemy_anim != 3)
						{
						}
						if (enemy_anim == 4)
						{
							enemy_anim = int(Math.random() * 2);
							enemy_fr = 0;
						}
					}
				}
				if (enemy_velY < 0)
				{
					tileOn = int((enemy_y - 50) / 50) * level.level_width + int(enemy_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						enemy_velY = 0;
						enemy_y = int(enemy_y / 50) * 50 + 50;
					}
				}
				// warning 无需把脱离视野的怪物杀灭
				/*if (Math.abs(enemy_x - player.character_x) <= 1200)
				{
					if (Math.abs(enemy_y - player.character_y) > 800)
					{
						enemy_health_head = -50001;
						enemy_markedForRemoval = true;
					}
				}*/
				
			}
			else if (enemy_health_head == -50001)
			{
				removeEnemy(a);
			}
			else if (enemy_health_head == -100001)
			{
				canvas.cameraShakeFun(0.5);
				b = 0;
				while (b < 3)
				{
					
					enemy_tempPos_x = enemy_x + Math.random() * 50 - 25;
					enemy_tempPos_y = enemy_y - 23 + Math.random() * 50 - 25;
					canvas.placeBloodSplatter(enemy_tempPos_x, enemy_tempPos_y, 0);
					
					b  ++ ;
					
				}
				Particle.addParticle(20, enemy_x - 20, enemy_y - 20, 0, 0,0, 0, Math.random() * -15 - 5, Math.random() * -10 - 5, 0, 0, 0, 0, 0, 0);
				Particle.addParticle(20, enemy_x + 20, enemy_y - 20, 0, 0,0, 0, Math.random() * 15 + 5, Math.random() * -10 - 5, 0, 1, 0, 0, 0, 0);
				b = 0;
				while (b < 5)
				{
					
					enemy_tempPos_x = enemy_x + Math.random() * 40 - 20;
					enemy_tempPos_y = enemy_y - 5 - Math.random() * 40;
					if (enemy_face == 0)
					{
						enemy_tempVel_x = Math.random() * -10 - 1;
					}
					else
					{
						enemy_tempVel_x = Math.random() * 10 + 1;
					}
					enemy_tempVel_y = Math.random() * -15 - 10;
					Particle.addParticle(9, enemy_tempPos_x, enemy_tempPos_y, 0, 0,0, 0, enemy_tempVel_x, enemy_tempVel_y, 0, int(Math.random() * 5), 0, 0, 0, 0);
					
					b  ++ ;
					
				}
				SimpleParticle.addSimpleParticle(10, enemy_x, enemy_y - 15, 0, 0, 0);
				player.character_health = player.character_health - 1.25;
				if (player.character_invincibleTime < 1)
				{
					// warning
//					if (KFC.jump == false)
//					{
//					}
//					if (character_velX == 0)
//					{
//						character_hurtTime = 30;
//						anim = int(Math.random() * 4) + 11;
//						fr = 0;
//						frOld = 0;
//						character_velX = 0;
//					}
				}
				removeEnemy(a);
			}
			else
			{
				if (enemy_markedForRemoval == false)
				{
					enemy_markedForRemoval = true;
					canvas.cameraShakeFun(0.5);
					b = 0;
					while (b < 3)
					{
						
						enemy_tempPos_x = enemy_x + Math.random() * 50 - 25;
						enemy_tempPos_y = enemy_y - 23 + Math.random() * 50 - 25;
						canvas.placeBloodSplatter(enemy_tempPos_x, enemy_tempPos_y, 0);
						
						b  ++ ;
						
					}
					Particle.addParticle(20, enemy_x - 20, enemy_y - 20, 0, 0,0, 0, Math.random() * -15 - 5, Math.random() * -10 - 5, 0, 0, 0, 0, 0, 0);
					Particle.addParticle(20, enemy_x + 20, enemy_y - 20, 0, 0,0, 0, Math.random() * 15 + 5, Math.random() * -10 - 5, 0, 1, 0, 0, 0, 0);
					b = 0;
					while (b < 5)
					{
						
						enemy_tempPos_x = enemy_x + Math.random() * 40 - 20;
						enemy_tempPos_y = enemy_y - 5 - Math.random() * 40;
						if (enemy_face == 0)
						{
							enemy_tempVel_x = Math.random() * -10 - 1;
						}
						else
						{
							enemy_tempVel_x = Math.random() * 10 + 1;
						}
						enemy_tempVel_y = Math.random() * -15 - 10;
						Particle.addParticle(9, enemy_tempPos_x, enemy_tempPos_y, 0, 0,0, 0, enemy_tempVel_x, enemy_tempVel_y, 0, int(Math.random() * 5), 0, 0, 0, 0);
						
						b  ++ ;
						
					}
					/*var _loc_1:* = weaponProficiencyKills;
					var _loc_2:* = enemy_damagedBy;
					var _loc_3:* = weaponProficiencyKills[enemy_damagedBy] + 1;
					_loc_1[_loc_2] = _loc_3;
					if (enemy_damagedBy != 20)
					{
						if (weaponProficiencyKills[enemy_damagedBy] >= 50)
						{
						}
						if (scoreTimesEarned[enemy_damagedBy + 12] == 0)
						{
							scoreTally = scoreTally + 100;
							tempScoreQue = "";
							tempScoreQue = tempScoreQue + scoreNames[enemy_damagedBy + 12];
							scoreQue.push(tempScoreQue);
							if (scoreQue.length > 3)
							{
								scoreQue.splice(0, 1);
							}
							scoreQueTime = 60;
							multiplier_countdown = max_multiplier_countdown;
							scoreTimesEarned[enemy_damagedBy + 12] = 1;
						}
					}
					else
					{
						if (weaponProficiencyKills[enemy_damagedBy] >= 5)
						{
						}
						if (scoreTimesEarned[enemy_damagedBy + 12] == 0)
						{
							scoreTally = scoreTally + 100;
							tempScoreQue = "";
							tempScoreQue = tempScoreQue + scoreNames[enemy_damagedBy + 12];
							scoreQue.push(tempScoreQue);
							if (scoreQue.length > 3)
							{
								scoreQue.splice(0, 1);
							}
							scoreQueTime = 60;
							multiplier_countdown = max_multiplier_countdown;
							scoreTimesEarned[enemy_damagedBy + 12] = 1;
						}
					}
					tempScoreQue = "";
					tempScoreQue = tempScoreQue + scoreNames[0];
					scoreTally = scoreTally + 10;
					var _loc_1:* = scoreTimesEarned;
					var _loc_2:int = 0;
					var _loc_3:* = scoreTimesEarned[0] + 1;
					_loc_1[_loc_2] = _loc_3;
					if (gun_ammo[character_gunEquipped] == 0)
					{
					}
					if (gun_mag_size[character_gunEquipped] > 2)
					{
						tempScoreQue = tempScoreQue + (" @ " + scoreNames[3]);
						scoreTally = scoreTally + 5;
						var _loc_1:* = scoreTimesEarned;
						var _loc_2:int = 3;
						var _loc_3:* = scoreTimesEarned[3] + 1;
						_loc_1[_loc_2] = _loc_3;
					}
					getVolume(enemy_x, enemy_y);
					playSoundEffect(int(Math.random() * 3) + 90, tempVol * 3, 0);
					playSoundEffect(int(Math.random() * 5) + 110, tempVol * 2, 0);
					
					multiKillCount  ++ ;
					
					if (multiKillCount > 10)
					{
						multiKillCount = 10;
					}
					multiKillTime = 1;
					if (multiKillCount > 1)
					{
						scoreTally = scoreTally + 5 * (multiKillCount - 1);
						tempScoreQue = tempScoreQue + (" @ " + scoreNames[32 + (multiKillCount - 1)]);
						var _loc_1:* = scoreTimesEarned;
						var _loc_2:* = 32 + (multiKillCount - 1);
						var _loc_3:* = scoreTimesEarned[32 + (multiKillCount - 1)] + 1;
						_loc_1[_loc_2] = _loc_3;
					}
					scoreQue.push(tempScoreQue);
					if (scoreQue.length > 3)
					{
						scoreQue.splice(0, 1);
					}
					scoreQueTime = 60;
					multiplier = multiplier + 0.1;
					multiplier_countdown = max_multiplier_countdown;
					enemy_velY = Math.random() * -3 - 1;
					*/
				}
				enemy_xOld = enemy_x;
				enemy_yOld = enemy_y;
				enemy_y = enemy_y + enemy_velY;
				if (enemy_anim != 5)
				{
					enemy_anim = 5;
					enemy_fr = 0;
				}
				enemy_fr++;
				if (enemy_fr > teenieAnimDataVect[enemy_anim].teenieAnimFrMax)
				{
					removeEnemy(a);
				}
			}
		}
		public override function excuteRender():void{
			if (enemy_x - canvas.cameraX > -300)
			{
				if (enemy_x - canvas.cameraX < canvas.screenWidth + 300)
				{
					if (enemy_y - canvas.cameraY > -300)
					{
						if (enemy_y - canvas.cameraY < canvas.screenHeight + 300)
						{
							render_a_teenie(enemy_x, enemy_y, enemy_xOld, enemy_yOld, enemy_anim, enemy_fr, enemy_face);
							
							//						enemiesOnScreen  ++ ;
							
						}
					}
					
				}
			}
			
		}
		public function render_a_teenie(param1, param2, param3, param4, param5, param6, param7)
		{
			rect.width = teenieAnimDataVect[param5].teenieAnimWidth;
			rect.height = teenieAnimDataVect[param5].teenieAnimHeight;
			rect.x = int(param6) * teenieAnimDataVect[param5].teenieAnimWidth;
			rect.y = 0;
			canvas.interpFun(param1, param2, param3, param4);
			tempPoint.x = canvas.interpFinal.x - teenieAnimDataVect[param5].teenieAnimOrigin_x - canvas.cameraX;
			tempPoint.y = canvas.interpFinal.y - teenieAnimDataVect[param5].teenieAnimOrigin_y - canvas.cameraY;
			canvas.bm.copyPixels(teenieAnimDataVect[param5]["teenie_anim_" + param7], rect, tempPoint, null, null, false);
			return;
		}
	}
}