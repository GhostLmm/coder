package snake.gameEnemys
{
	import com.fish.modules.core.models.BattleModel;
	
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.clearTimeout;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;
	
	import snake.BattleAssetPreload;
	import snake.RenderPlayerArg;
	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.guns.GunData;
	import snake.module.DamageUtil;
	import snake.module.HpBarUtil;
	import snake.viewdata.ViewData_Zombie;
	import snake.viewdata.battle.AttackComputeData;
	
	import util.Util;

	public class Enemy_1 extends Enemy
	{
		
	
		
		public function Enemy_1()
		{
			super();
		}
		/** 改变血量**/
		protected function changeEnemyHealth():void{
			//持续伤害的都不做了
			return;
//			enemy_health_head = enemy_health_head - enemy_statusEffect_atp;
//			enemy_health_body = enemy_health_body - enemy_statusEffect_atp * 0.95;
//			enemy_health_headOld = enemy_health_head;
//			enemy_health_bodyOld = enemy_health_body;
			tempPoint.x=enemy_x + Math.random() * 40 - 20;
			tempPoint.y=enemy_y - Math.random() * 40 - 40;
			Particle.addParticle(13, tempPoint.x,tempPoint.y, 0, 0,0, 0, Math.random() * 20 - 10, 0, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
			c = int(Math.random() * 2);
			if (c == 0)
			{
				Particle.addParticle(3, tempPoint.x - assetConfig.smokeWidth * 0.5, tempPoint.y - assetConfig.gun_flash_smoke_bm.height * 0.5, 0, tempPoint.x,tempPoint.y, 0, 0, Math.random() * 3 + 2, 5, 1.5 + Math.random() * 0.5, 0, 0, 0, 0);
			}
			if (enemy_statusEffect_atp > 0.001)
			{
				Particle.addParticle(13, enemy_x + Math.random() * 40 - 20, enemy_y - Math.random() * 40 - 40, 0, tempPoint.x,tempPoint.y, 0, Math.random() * 20 - 10, 0, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
				if (enemy_statusEffect_atp > 0.005)
				{
					Particle.addParticle(13, enemy_x + Math.random() * 40 - 20, enemy_y - Math.random() * 40 - 40, 0, tempPoint.x,tempPoint.y, 0, Math.random() * 20 - 10, 0, 0, int(Math.random() * 4), 0, 0, 0, Math.random() * 0.5 + 0.25);
				}
			}
		}
		
		// 开枪 后坐力
		protected function gunReciolProccess():void{
			if (enemy_recoil_rot != 0)
			{
				enemy_recoil_rotVel = enemy_recoil_rotVel + enemy_recoil_rot * 0.95;
				enemy_recoil_rot = enemy_recoil_rot - enemy_recoil_rotVel;
				enemy_recoil_rot = enemy_recoil_rot * gun_data.gun_recoil_dampening;
				if (Math.abs(enemy_recoil_rotVel) < 0.01)
				{
					enemy_recoil_rotVel = 0;
					enemy_recoil_rot = 0;
				}
			}
			if (enemy_recoil_x != 0)
			{
				enemy_recoil_x = enemy_recoil_x * gun_data.gun_recoil_xRecover;
				if (Math.abs(enemy_recoil_x) < 0.01)
				{
					enemy_recoil_x = 0;
				}
			}
			if (enemy_recoil_y != 0)
			{
				enemy_recoil_y = enemy_recoil_y * gun_data.gun_recoil_xRecover;
				if (Math.abs(enemy_recoil_y) < 0.01)
				{
					enemy_recoil_y = 0;
				}
			}
		}
		public function enemy_aimFun():void
		{
			
			enemy_inacc_x = enemy_inacc_x - (enemy_inacc_x - enemy_inacc_x_target) / 10;
			enemy_inacc_y = enemy_inacc_y - (enemy_inacc_y - enemy_inacc_y_target) / 10;
			if (Math.abs(enemy_inacc_x - enemy_inacc_x_target) < 0.1)//Fantasy   枪子弹偏移，为0就是不偏移
			{
//				enemy_inacc_x_target = Math.random() * 100 - 50;
				enemy_inacc_x_target=0;
			}
			if (Math.abs(enemy_inacc_y - enemy_inacc_y_target) < 0.1)
			{
//				enemy_inacc_y_target = Math.random() * 100 - 50;
				enemy_inacc_y_target=0;
			}
			enemy_gunRotOld = enemy_gunRot;
			enemy_gunXOld = enemy_gunX;
			enemy_gunYOld = enemy_gunY;
			// warning
			enemy_gunX = player.character_x + enemy_inacc_x;
			enemy_gunY = player.character_y-25 + enemy_inacc_y - 25 - gun_data.gunShoulder_y;//gun_data.gunShoulder_y;
			if (enemy_jump == false)
			{
				if (player.character_x > enemy_x)
				{
					if (enemy_face == 1)
					{
						enemy_face = 0;
						if (enemy_gunRot > 0)
						{
							if (enemy_gunRot > Math.PI * 0.5)
							{
								enemy_gunRot = 0;
							}
						}
						else if (enemy_gunRot < (-Math.PI) * 0.5)
						{
							enemy_gunRot = 0;
						}
						enemy_gunRotOld = enemy_gunRot;
					}
				}
				else if (enemy_face == 0)
				{
					enemy_face = 1;
					if (enemy_gunRot > 0)
					{
						if (enemy_gunRot < Math.PI * 0.5)
						{
							enemy_gunRot = -Math.PI;
						}
					}
					else if (enemy_gunRot > (-Math.PI) * 0.5)
					{
						enemy_gunRot = -Math.PI;
					}
					enemy_gunRotOld = enemy_gunRot;
				}
			}
			d = gun_data.gun_dist;//gun_dist[enemy_gunEquipped];
			if (enemy_face == 0)
			{
				enemy_gunX = player.character_x + enemy_inacc_x + enemy_recoil_x;
				enemy_gunY = player.character_y-25 + enemy_inacc_y - 25 - gun_data.gunShoulder_y + enemy_recoil_y;
				
				
				player.character_gunDX = enemy_gunX - (enemy_x + charAnimDataVect[enemy_anim].body_x[int(enemy_fr)]);
				player.character_gunDY = enemy_gunY - (enemy_y + charAnimDataVect[enemy_anim].body_y[int(enemy_fr)]);
				enemy_radTo = Math.atan2(player.character_gunDY, player.character_gunDX);
				enemy_headRot = enemy_radTo;
				enemy_radTo = enemy_radTo + enemy_recoil_rot;
				enemy_gunRot = enemy_gunRot - (enemy_gunRot - enemy_radTo) / 3;
				if (Math.sqrt(player.character_gunDX * player.character_gunDX + player.character_gunDY * player.character_gunDY) > d)
				{
					enemy_gunX = enemy_x + charAnimDataVect[enemy_anim].body_x[int(enemy_fr)] + Math.cos(enemy_gunRot) * d + enemy_recoil_x;
					enemy_gunY = enemy_y + charAnimDataVect[enemy_anim].body_y[int(enemy_fr)] + Math.sin(enemy_gunRot) * d + enemy_recoil_y;
				}
			}
			else
			{
				enemy_gunX = player.character_x + enemy_inacc_x + enemy_recoil_x;
				enemy_gunY = player.character_y-25 + enemy_inacc_y - 25 - gun_data.gunShoulder_y + enemy_recoil_y;
				player.character_gunDX = enemy_gunX - (enemy_x - charAnimDataVect[enemy_anim].body_x[int(enemy_fr)]);
				player.character_gunDY = enemy_gunY - (enemy_y + charAnimDataVect[enemy_anim].body_y[int(enemy_fr)]);
				enemy_radTo = Math.atan2(player.character_gunDY, player.character_gunDX);
				enemy_headRot = enemy_radTo;
				enemy_radTo = enemy_radTo - enemy_recoil_rot;
				if (enemy_radTo > enemy_gunRot + Math.PI)
				{
					enemy_gunRot = enemy_gunRot + Math.PI * 2;
					enemy_gunRotOld = enemy_gunRot;
				}
				if (enemy_radTo < enemy_gunRot - Math.PI)
				{
					enemy_gunRot = enemy_gunRot - Math.PI * 2;
					enemy_gunRotOld = enemy_gunRot;
				}
				enemy_gunRot = enemy_gunRot - (enemy_gunRot - enemy_radTo) / 3;
				if (Math.sqrt(player.character_gunDX * player.character_gunDX + player.character_gunDY * player.character_gunDY) > d)
				{
					enemy_gunX = enemy_x - charAnimDataVect[enemy_anim].body_x[int(enemy_fr)] + Math.cos(enemy_gunRot) * d + enemy_recoil_x;
					enemy_gunY = enemy_y + charAnimDataVect[enemy_anim].body_y[int(enemy_fr)] + Math.sin(enemy_gunRot) * d + enemy_recoil_y;
				}
			}
			if(Math.abs(player.character_x - enemy_x)<100)
			{
				enemy_gunX = enemy_x + Math.cos(enemy_gunRot) * 2;
			}
			return;
		}
		
		public function enemy_shoot():void
		{
			if (enemy_gunCoolDown < 1)
			{
				sound.getVolume(enemy_x, enemy_y);
				sound.playSoundEffect(gun_data.gun_sfx, sound.tempVol, 0);
				enemy_gunCoolDown = gun_data.gun_coolDown;
				enemy_gunFrame = 1;
				enemy_recoil_x = enemy_recoil_x - Math.cos(enemy_gunRot) * gun_data.gun_recoil_x;
				enemy_recoil_y = enemy_recoil_y - Math.sin(enemy_gunRot) * gun_data.gun_recoil_x;
				enemy_recoil_rot = enemy_recoil_rot + gun_data.gun_recoil_rot;
				
				if(this is Enemy_Leitai)
				{
					enemy_recoil_rot=0;
				}
				//tempSprite=gun_asset.gun_right[enemy_gunFrame];
				
				tempSprite.x = enemy_gunX - canvas.cameraX;
				tempSprite.y = enemy_gunY - canvas.cameraY + gun_data.gunShoulder_y;
				tempSprite.rotation = enemy_gunRot * pi_180;
				if (enemy_face == 0)
				{
					tempSprite.scaleY = 1;
				}
				else
				{
					tempSprite.scaleY = -1;
				}
				gunFlash_pt = new Point(gun_data.gun_barrel_x, gun_data.gun_barrel_y);
				gunFlash_pt = tempSprite.localToGlobal(gunFlash_pt);
				SimpleParticle.addSimpleParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, int(Math.random() * 5), 0);
				var damage:int=zombieData.atk;
				var computeData:AttackComputeData=zombieData.computeData; 
				switch(gun_data.gun_bulletType)
//				switch(7)
				{
					case 0:
					{
						Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, 0,0, 0, Math.cos(enemy_gunRot + Math.PI) * -16,
							Math.sin(enemy_gunRot + Math.PI) * -16, 0, int((enemy_gunRot + Math.PI) / (Math.PI * 2) * 64), gun_data.gun_isIncindiary, 0, 1, damage,computeData);
						break;
					}
					case 1:
					{
						b = 0;
						while (b < 3)
						{
							
							gunTempRand = (Math.random() - 0.8) * 0.4;
							gunTempSpd = 14 + Math.random() * 4;
							Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, 
								0,0, 0, Math.cos(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, 
								int((enemy_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), gun_data.gun_isIncindiary, 0, 1, damage,computeData);
							
							b  ++ ;
							
						}
						break;
					}
					case 2:
					{
						b = 0;
						while (b < 3)
						{
							
							gunTempRand = (Math.random() - 0.8) * 0.4;
							gunTempSpd = 14 + Math.random() * 4;
							Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, 
								0,0, 0, Math.cos(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, 
								int((enemy_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), gun_data.gun_isIncindiary, 0, 1, damage,computeData);
							
							b  ++ ;
							
						}
						break;
					}
					case 4:
					{
						
						a = 0;
						while (a < 5)
						{
							
							gunTempRand = (Math.random() - 0.5) * 0.6;
							gunTempSpd = 14 + Math.random() * 4;
							Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, int((enemy_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), gun_data.gun_isIncindiary, 0, 1, damage,computeData);
							
							a  ++ ;
							
						}
//						gunFlash_pt = new Point(gun_data.gun_barrel_x, gun_data.gun_barrel_x + 10);								
//						gunFlash_pt = gun_enemy_asset.gun_right[gun_data.gunFrames[enemy_gunFrame]].localToGlobal(gunFlash_pt);
//						SimpleParticle.addSimpleParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, int(Math.random() * 5), 0);
						a = 0;
						while (a < 5)
						{
							
							gunTempRand = (Math.random() - 0.5) * 0.6;
							gunTempSpd = 14 + Math.random() * 4;
							Particle.addParticle(1, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), Math.sin(enemy_gunRot + gunTempRand + Math.PI) * (-gunTempSpd), 0, int((enemy_gunRot + gunTempRand + Math.PI) / (Math.PI * 2) * 64), gun_data.gun_isIncindiary, 0, 1, damage,computeData);
							
							a  ++ ;
							
						}
						break;
					}
					case 5://毒
					{
						Particle.addParticle(12, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + Math.PI) * -16, Math.sin(enemy_gunRot + Math.PI) * -16, 0, int((enemy_gunRot + Math.PI) / (Math.PI * 2) * 64), gun_data.gun_isIncindiary, 0, 1, damage,computeData);
						break;
					}
					case 7://激光    现在改成没有衰减
					{
						if (enemy_gunFrame == 1)
						{
							Particle.addParticle(16, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + Math.PI) * -16, Math.sin(enemy_gunRot + Math.PI) * -16, 0, int((enemy_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, 0, 1, 1,computeData);
						}
						else
						{
//							trace(enemy_gunFrame)
//							Particle.addParticle(16, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + Math.PI) * -16, Math.sin(enemy_gunRot + Math.PI) * -16, 0, int((enemy_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, 0, 1, enemy_gunFrame / gun_data.gunFrames.length * 1,computeData);
						}
						break;
					}
					case 8://榴弹
					{
						Particle.addParticle(14, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + Math.PI) * -16, Math.sin(enemy_gunRot + Math.PI) * -16, 0, int((enemy_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, 0, 1, damage,computeData);
						break;
					}
					case 9://来回弹的小颗粒
					{
						Particle.addParticle(15, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + Math.PI) * -30, Math.sin(enemy_gunRot + Math.PI) * -30, 0, int((enemy_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, 0, 1, damage,computeData);
						break;
					}
					case 10://黑色的大球
					{
						Particle.addParticle(18, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_gunRot, Particle.particleLastX, Particle.particleLastY, 0, Math.cos(enemy_gunRot + Math.PI) * -16, Math.sin(enemy_gunRot + Math.PI) * -16, 0, int((enemy_gunRot + Math.PI) / (Math.PI * 2) * 64), 0, 0, 1, damage,computeData);
						break;
					}
					default:
					{
						break;
					}
				}
			}
			return;
		}// end function
		
		public override function excuteLogic():void{
			if ( enemy_health> 0)
			{
				if (enemy_statusEffect == 1)
				{
					changeEnemyHealth();
				}
				gunReciolProccess();
				enemy_aimFun();
//				if ((enemy_hasLineOfSight == true) && (enemy_jump == false))//Fantasy  射击概率逻辑
				if (enemy_hasLineOfSight == true)//Fantasy  射击概率逻辑
				{
					c=(Math.random() * zombieData.fireDerTime);
					if (c == 0){
						enemy_shoot();
					};
				};
				if (enemy_lineOfSightCountdown > enemy_aimTime)//每隔一定时间重新瞄准
				{
					// 到了瞄准时间 
					enemy_tempRise = Math.sin(enemy_headRot) * 25;
					enemy_tempRun = Math.cos(enemy_headRot) * 25;
					enemy_dX = enemy_x - player.character_x;
					enemy_dY = enemy_y - player.character_y-25;
					enemy_lineOfSightCountdown = 0;
					enemy_dist = Math.sqrt(enemy_dX * enemy_dX + enemy_dY * enemy_dY);
					enemy_dist = Math.abs(int(enemy_dist / 25));
					if (enemy_dist > 30)//Fantasy 只算30   导致中间有障碍物   也进行射击
					{
						enemy_dist = 30;
					}
					enemy_hasLineOfSight = true;
					b = 0;
					while (b < enemy_dist)
					{
						
						tileOn = int((enemy_y - 75 + enemy_tempRise * b) / 50) * level.level_width + int((enemy_x + enemy_tempRun * b) / 50);
						if (level.level_collidable[level.level[tileOn]] == 1)
						{
							// 如果 障碍  就设置为无法瞄准
							enemy_hasLineOfSight = false;
							b = 50;
						}
						
						b  ++ ;
						
					}
				}
				else
				{
					enemy_lineOfSightCountdown++;
				}
				
				//Fantasy   22受击    23被打倒
				if (!(enemy_hasLineOfSight == true) && !(enemy_anim == 22) && !(enemy_anim == 23))
//				if(!enemy_hasLineOfSight)
				{
					enemy_hasLineOfSight = false;
					if (enemy_face == 0){
						enemy_headRot = 0;
					}
					else {
						enemy_headRot = -3.14;
					};
				};
				ejectBullet();
				if (enemy_gunCoolDown > 0)
				{
					enemy_gunCoolDown--;
				}
				if ((Math.abs(player.character_y - enemy_y) < Active_DerY)&&(enemy_hasLineOfSight == true))
				{
					enemy_active=true;
				}
				if (enemy_anim < 11)
				{
//					trace("enemy_aiState"+enemy_aiState);
					switch(enemy_aiState)
					{
						
						case 0:
						{
							enemy_isMoving = false;
							if (enemy_hasLineOfSight == true)
							{
								enemy_lineOfSightTimer++;
								if (enemy_lineOfSightTimer > 5)
								{
									if (enemy_jump == false)
									{
										if (Math.abs(player.character_y - enemy_y) < Active_DerY)
										{
											if (enemy_face == 0)
											{
												if (player.character_x - enemy_x < enemy_engagementDistance)
												{
													tileOn = int((enemy_y + 25) / 50) * level.level_width + int((enemy_x - 30) / 50);
													if (level.level_collidable[level.level[tileOn]] == 1)//Fantasy    因为身后的位置可以站  所以才可以后退
													{
//														enemy_velX = enemy_velX - 2;
//														if (enemy_velX < -enemyRunSpeed)
//														{
//															enemy_velX = -enemyRunSpeed;
//														}
//														enemy_isMoving = true;
														//第一种
														tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x - 30) / 50);  
														if(level.level_collidable[level.level[tileOn]] == 1)
														{
															enemy_aiState = 1;
															enemy_nextNode = tileOn+Enemy_RunAway_TileNum;
															enemy_isMoving = false
														}
														else
														{
															tileOn = int((enemy_y + 25) / 50) * level.level_width + int((enemy_x - 30) / 50);
															if((level.nodeMap[tileOn] != 3)&&(level.nodeMap[tileOn] != 4))
															{
																enemy_velX = enemy_velX - 2;																
																var maxSpeed=enemyRunSpeed;
																if((level.level_collidable[level.level[tileOn-1]]==0)||(level.level_collidable[level.level[tileOn-2]]==0))
																{
																	maxSpeed=enemyRunSpeed/4;
																}
																if (enemy_velX < -maxSpeed)
																{
																	enemy_velX = -maxSpeed;
																}
																enemy_isMoving = true;
															}
															else
															{
																enemy_isMoving = false;
															}
														}
														
														//第二种
//														tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x - 30) / 50);
//														if(level.level_collidable[level.level[tileOn]] == 1)
//														{
//															enemy_velX = enemyRunSpeed;
//															enemy_isMoving = true;
//														}
//														else
//														{
//															enemy_velX = enemy_velX - 2;
//															if (enemy_velX < -enemyRunSpeed)
//															{
//																enemy_velX = -enemyRunSpeed;
//															}
//															enemy_isMoving = true;
//														}
														
														//第三种
														//Fantasy  敌人逻辑
//														tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x - 30) / 50);
//														tileOnOther=int((enemy_y-50) / 50) * level.level_width + int((enemy_x - 80) / 50);
//														if((level.level_collidable[level.level[tileOn]] == 1)||(level.level_collidable[level.level[tileOnOther]] == 1))
//														{
//															enemy_velX = enemy_velX + 2;
//															if (enemy_velX > enemyRunSpeed)
//															{
//																enemy_velX = enemyRunSpeed;
//															}
//															enemy_isMoving = true;
//														}
//														else
//														{
//															trace("远离hero");
//															enemy_velX = enemy_velX - 2;
//															if (enemy_velX < -enemyRunSpeed)
//															{
//																enemy_velX = -enemyRunSpeed;
//															}
//															enemy_isMoving = true;
//														}
													}
													else
													{
														enemy_isMoving = false;
													}
												}
												else if ((player.character_x - enemy_x > enemy_engagementDistance * 2)&&(player.character_x - enemy_x<Enemy_CloseTo_Dist))
												{
													tileOn = int((enemy_y + 25) / 50) * level.level_width + int((enemy_x + 30) / 50);
													// warning  如果有障碍 还moving 个 毛啊
													if (level.level_collidable[level.level[tileOn]] == 1)
													{
														//Fantasy  敌人逻辑
														trace("跑向hero");
														enemy_velX = enemy_velX + 2;
														if (enemy_velX > enemyRunSpeed)
														{
															enemy_velX = enemyRunSpeed;
														}
														enemy_isMoving = true;
													}
													else
													{
														enemy_isMoving = false;//Fantasy   change
														tileOn = int((enemy_y - 10) / 50) * level.level_width + int(enemy_x / 50);//Fantasy 是悬崖跳起
														if (level.nodeMap[tileOn] == 3)
														{
															enemy_jump = true;
															enemy_velY = -34;
															enemy_aiState = 2;
															b = 0;
															while (b < 15)
															{
																if (level.nodeMap[tileOn + b] == 4)
																{
																	enemy_nextNode = tileOn + b;
																	enemy_maxJumpHeight = -64 + 2 * (b * 50 / 16);
																	b = 25;
																}
																
																b  ++ ;
																
															}
														}
													}
												}
												else
												{
													enemy_isMoving = false;
												}
											}
											else if (player.character_x - enemy_x > -enemy_engagementDistance)
											{
												tileOn = int((enemy_y + 25) / 50) * level.level_width + int((enemy_x + 30) / 50);
												if (level.level_collidable[level.level[tileOn]] == 1)
												{
//													enemy_velX = enemy_velX + 2;
//													if (enemy_velX > enemyRunSpeed)
//													{
//														enemy_velX = enemyRunSpeed;
//													}
//													enemy_isMoving = true;
													
													//第一种
													tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x + 30) / 50);  
													if(level.level_collidable[level.level[tileOn]] == 1)
													{
														enemy_aiState = 1;
//														var total:int=tileOn-Enemy_RunAway_TileNum;
//														while(total<=tileOn)
//														{ddd
//															if()
//															total++;
//														}
														enemy_nextNode = tileOn-Enemy_RunAway_TileNum;
														enemy_isMoving = false
													}
													else
													{
														tileOn = int((enemy_y + 25) / 50) * level.level_width + int((enemy_x + 30) / 50);
														if((level.nodeMap[tileOn] != 3)&&(level.nodeMap[tileOn] != 4))
														{
															enemy_velX = enemy_velX + 2;
															var maxSpeed=enemyRunSpeed;
															if((level.level_collidable[level.level[tileOn+1]]==0)||(level.level_collidable[level.level[tileOn+2]]==0))
															{
																maxSpeed=enemyRunSpeed/4;
															}
															if (enemy_velX > maxSpeed)
															{
																enemy_velX = maxSpeed;
															}
															enemy_isMoving = true;
														}
														else
														{
															enemy_isMoving = false;
														}
													}
													
													//第二种
//													tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x + 30) / 50);  
//													if(level.level_collidable[level.level[tileOn]] == 1)
//													{
//														enemy_velX = -enemyRunSpeed;
//														enemy_isMoving = true;
//													}
//													else
//													{
//														enemy_velX = enemy_velX + 2;
//														if (enemy_velX > enemyRunSpeed)
//														{
//															enemy_velX = enemyRunSpeed;
//														}
//														enemy_isMoving = true;
//													}
													
													// 第三种
//													tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x + 30) / 50);  
//													tileOnOther = int((enemy_y-50) / 50) * level.level_width + int((enemy_x + 80) / 50);  
//													if((level.level_collidable[level.level[tileOn]] == 1)||(level.level_collidable[level.level[tileOnOther]] == 1))
//													{
//														enemy_velX = enemy_velX - 2;
//														if (enemy_velX < -enemyRunSpeed)
//														{
//															enemy_velX = -enemyRunSpeed;
//														}
//														enemy_isMoving = true;
//													}
//													else
//													{
//														enemy_velX = enemy_velX + 2;
//														if (enemy_velX > enemyRunSpeed)
//														{
//															enemy_velX = enemyRunSpeed;
//														}
//														enemy_isMoving = true;
//													}
												}
												else
												{
													enemy_isMoving = false;
												}
											}
											else if ((player.character_x - enemy_x <-enemy_engagementDistance * 2)&&(player.character_x - enemy_x>-Enemy_CloseTo_Dist))
											{
												tileOn = int((enemy_y + 25) / 50) * level.level_width + int((enemy_x - 30) / 50);
												if (level.level_collidable[level.level[tileOn]] == 1)
												{
													enemy_velX = enemy_velX - 2;
													if (enemy_velX < -enemyRunSpeed)
													{
														enemy_velX = -enemyRunSpeed;
													}
													enemy_isMoving = true;
												}
												else
												{
													enemy_isMoving = false;//Fantasy   change
													tileOn = int((enemy_y - 10) / 50) * level.level_width + int(enemy_x / 50);
													if (level.nodeMap[tileOn] == 4)
													{
														enemy_jump = true;
														enemy_velY = -34;
														enemy_aiState = 2;
														b = 0;
														while (b < 15)
														{
															
															if (level.nodeMap[tileOn - b] == 3)
															{
																enemy_nextNode = tileOn - b;
																enemy_maxJumpHeight = -64 + 2 * (b * 50 / 16);
																b = 25;
															}
															
															b  ++ ;
															
														}
													}
												}
											}
											else
											{
												enemy_isMoving = false;
											}
										}
										else
										{
											enemy_isMoving = false;
										}
									}
								}
								else
								{
									enemy_isMoving = false;
								}
							}
							// 没有瞄准
							else if (enemy_isMoving == false)
							{
								if (enemy_lineOfSightTimer > 0)
								{
									enemy_lineOfSightTimer = 0;
								}
								else
								{
//									var _loc_1:* = enemy_lineOfSightTimer;
//									var _loc_2:* = a;
//									var _loc_3:* = enemy_lineOfSightTimer - 1;
//									_loc_1[_loc_2] = _loc_3;
									enemy_lineOfSightTimer--;
									if (enemy_lineOfSightTimer < -enemy_aimDerTime)//Fantasy 15帧做一次瞄准
									{
										enemy_aiState = 1;
										enemy_nextNode = -1;
										enemy_lineOfSightTimer = 0;
									}
								}
							}
							// Fantasy 躲避 角色的攻击
							if (player.character_gunCoolDown == GunData.gunDataVect[player.character_gunEquipped].gun_coolDown){
								if ((((((enemy_x > player.character_x)) && ((player.character_face == 0)))) || ((((enemy_x < player.character_x)) && ((player.character_face == 1)))))){
									if (enemy_jump == false){
										c = int((Math.random() * 3));
										if (c == 0){
											enemy_jump = true;
											while (c < enemyVect.length) {
												var te:Enemy=enemyVect[c];
												if((te.enemy_jump == true)&&(te.zombieData.id!=this.zombieData.id)){//Fantasy   修改
													enemy_jump = false;
													enemy_velY = 0;
												};
												c++;
											};
											if (enemy_jump == true){
												enemy_velY = ((-(Math.random()) * 15) - 15);
												if (enemy_x > player.character_x){
													enemy_velX = ((Math.random() * 8) + 12);
												}
												else {
													enemy_velX = ((Math.random() * -8) - 12);
												};
												enemy_isMoving = true;
											};
										};
									};
								};
							};
							break;
						}
						case 1://Fantasy AI走路
						{
							if(!enemy_active)
							{
								if(this is Enemy_Leitai)
								{
									//do nothing
								}
								else
								{
									break;
								}
							}
							if (enemy_nextNode == -1){
								if ((((player.character_y < (enemy_y - Enemy_Min_DerY))) && ((player.character_y > (enemy_y - Enemy_Max_DerY))))){//Fantasy   纵向差100到400之间
									tileOn = ((int(((enemy_y - 10) / 50)) * level.level_width) + int((enemy_x / 50)));
									if (level.nodeMap[tileOn] != 5){
										tileOn = ((int(((enemy_y - 20) / 50)) * level.level_width) + int((player.character_x / 50)));
										d = 50;
										e = -1;
										b = -40;
										while (b < 40) {//Fantasy 寻找起跳点
											if (level.nodeMap[(tileOn + b)] == 5){
												if (Math.abs(b) < d){
													d = Math.abs(b);
													enemy_nextNode = (tileOn + b);
												};
											};
											b++;
										};
									}
									else {
										b = 0;
										while (b < 7) {//Fantasy 起跳的方向
											c = -1;
											while (c < 2) {
												tileOn = ((int(((enemy_y - (b * 50)) / 50)) * level.level_width) + int(((enemy_x + (c * 50)) / 50)));
												if ((((level.nodeMap[tileOn] == 3)) || ((level.nodeMap[tileOn] == 4)))){
													enemy_nextNode = tileOn;
													if (level.nodeMap[tileOn] == 3){
														enemy_face = 1;
													}
													else {
														enemy_face = 0;
													};
												};
												c++;
											};
											b++;
										};
										enemy_velY = -34;
										enemy_jump = true;
									};
								}
								else {//Fantasy    这段处理有问题  根本就是随机出的一个方向
									if ((((player.character_y > (enemy_y + Enemy_Min_DerY))) && ((player.character_y < (enemy_y + Enemy_Max_DerY))))){//Fantasy   纵向差100到400之间
										enemy_aiState = 3;
										//Fantasy   changed
//										c = (Math.random() * 2);
//										if (c == 0){
//											if (enemy_velX == 0){
//												enemy_velX = 1;
//											}
//											else {
//												if (enemy_velX < 0){
//													enemy_velX = (enemy_velX * -1);
//												};
//											};
//										}
//										else {
//											if (enemy_velX == 0){
//												enemy_velX = -1;
//											}
//											else {
//												if (enemy_velX > 0){
//													enemy_velX = (enemy_velX * -1);
//												};
//											};
//										};
									}
									else {
										if ((((((((player.character_y > (enemy_y + 400))) || ((player.character_y < (enemy_y - 400))))) || ((player.character_x < (enemy_x - 2000))))) || ((player.character_x > (enemy_x + 2000))))){
											//Fantasy
//											enemy_aiState = 4;
										}
										else {
											if(this is Enemy_Leitai)
											{
												if((Math.abs(player.character_y - enemy_y) < Active_DerY)&&(!enemy_hasLineOfSight))
												{
													enemy_aiState = 3;
												}
												else
												{
													enemy_aiState = 0;
													enemy_nextNode = -1;
												}
											}
											else
											{
												enemy_aiState = 0;
												enemy_nextNode = -1;
											}
										};
									};
								};
							}
							else {
								if (level.nodeMap[enemy_nextNode] == 5){//跑向起跳点
									if ((enemy_x + 15) < (((enemy_nextNode % level.level_width) * 50) + 25)){
										enemy_velX = (enemy_velX + 2);
										if (enemy_velX > enemyRunSpeed){
											enemy_velX = enemyRunSpeed;
										};
										enemy_isMoving = true;
									}
									else {
										if ((enemy_x - 15) > (((enemy_nextNode % level.level_width) * 50) + 25)){
											enemy_velX = (enemy_velX - 2);
											if (enemy_velX < -(enemyRunSpeed)){
												enemy_velX = -(enemyRunSpeed);
											};
											enemy_isMoving = true;
										}
										else {
											enemy_isMoving = false;
											enemy_x = ((int((enemy_x / 50)) * 50) + 25);
											enemy_velX = 0;
											enemy_nextNode = -1;
										};
									};
								}
								else {
									if (level.nodeMap[enemy_nextNode] == 3){//Fantasy   起跳
										if (enemy_jump == true){
											if (int((enemy_y / 50)) == int((enemy_nextNode / level.level_width))){
												if (enemy_velY < -8){
													enemy_velY = -8;
												};
												enemy_velX = (enemy_velX - 2);
												if (enemy_velX < -(enemyRunSpeed)){
													enemy_velX = -(enemyRunSpeed);
												};
												enemy_isMoving = true;
											};
										}
										else {
											enemy_velX = 0;
											enemy_nextNode = -1;
										};
									}
									else {
										if (level.nodeMap[enemy_nextNode] == 4){
											if (enemy_jump == true){
												if (int((enemy_y / 50)) == int((enemy_nextNode / level.level_width))){
													if (enemy_velY < -8){
														enemy_velY = -8;
													};
													enemy_velX = (enemy_velX + 2);
													if (enemy_velX > enemyRunSpeed){
														enemy_velX = enemyRunSpeed;
													};
													enemy_isMoving = true;
												};
											}
											else {
												enemy_velX = 0;
												enemy_nextNode = -1;
											};
										}
										else
										{
											if ((enemy_x + 15) < (((enemy_nextNode % level.level_width) * 50) + 25)){
												enemy_velX = (enemy_velX + 2);
												if (enemy_velX > enemyRunSpeed){
													enemy_velX = enemyRunSpeed;
												};
												enemy_isMoving = true;
											}
											else {
												if ((enemy_x - 15) > (((enemy_nextNode % level.level_width) * 50) + 25)){
													enemy_velX = (enemy_velX - 2);
													if (enemy_velX < -(enemyRunSpeed)){
														enemy_velX = -(enemyRunSpeed);
													};
													enemy_isMoving = true;
												}
												else {
													enemy_isMoving = false;
													enemy_x = ((int((enemy_x / 50)) * 50) + 25);
													enemy_velX = 0;
													enemy_nextNode = -1;
												};
											};
										}
									}
								};
							};
							break;
						}
						case 2://Fantasy   跳起之后的上升过程  左跳和又跳   停止之后变回状态0
							if (enemy_face == 0){
								enemy_velX = 16;
								if ((((enemy_velY > enemy_maxJumpHeight)) && ((enemy_velY < -8)))){
									enemy_velY = -8;
								};
								enemy_isMoving = true;
								if (enemy_jump == false){
									enemy_aiState = 0;
									enemy_velX = 0;
									enemy_nextNode = -1;
								};
							}
							else {
								enemy_velX = -16;
								if ((((enemy_velY > enemy_maxJumpHeight)) && ((enemy_velY < -8)))){
									enemy_velY = -8;
								};
								enemy_isMoving = true;
								if (enemy_jump == false){
									enemy_aiState = 0;
									enemy_velX = 0;
									enemy_nextNode = -1;
								};
							};
							break;
						case 3://Fantasy   仅仅是走，如果走的过程中踩空了   可以跳    存在问题
							if (enemy_jump == false){
								if (enemy_velX > 0){
									enemy_velX = (enemy_velX + 2);
									if (enemy_velX > enemyRunSpeed){
										enemy_velX = enemyRunSpeed;
									};
									enemy_isMoving = true;
								}
								else if(enemy_velX<0){
									enemy_velX = (enemy_velX - 2);
									if (enemy_velX < -(enemyRunSpeed)){
										enemy_velX = -(enemyRunSpeed);
									};
									enemy_isMoving = true;
								}
								else
								{
									if(this is Enemy_Leitai)
									{
										if(player.character_x>=enemy_x)
										{
											tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x - 30) / 50);
											if((!enemy_hasLineOfSight)&&(level.level_collidable[level.level[tileOn]]==0))
											{
												enemy_velX=-2;
												enemy_isMoving = true;
											}
											else
											{
												enemy_velX=2;
												enemy_isMoving = true;
											}
										}
										else
										{
											tileOn = int((enemy_y-50) / 50) * level.level_width + int((enemy_x + 30) / 50);
											if((!enemy_hasLineOfSight)&&(level.level_collidable[level.level[tileOn]]==0))
											{
												enemy_velX=2;
												enemy_isMoving = true;
											}
											else
											{
												enemy_velX=-2;
												enemy_isMoving = true;
											}
										}
									}
									else
									{
										if(player.character_x>=enemy_x)
										{
											enemy_velX=2;
											enemy_isMoving = true;
										}
										else
										{
											enemy_velX=-2;
											enemy_isMoving = true;
										}
									}
//									switch(int(Math.random()*3))
//									{
//										case 0:
//											enemy_velX=2;
//											enemy_isMoving = true;
//											break;
//										case 1:
//											enemy_velX=-2;
//											enemy_isMoving = true;
//											break;
//										case 2:
//											enemy_velX=0;
//											enemy_isMoving = false;
//											break;
//									}
								}
//								
//								tileOn = ((int((enemy_y / 50)) * level.level_width) + int(((enemy_x - 10) / 50)));
//								if (level.level_collidable[level.level[tileOn]] == 0){
//									tileOn = ((int((enemy_y / 50)) * level.level_width) + int(((enemy_x + 10) / 50)));
//									if (level.level_collidable[level.level[tileOn]] == 0){
//										enemy_jump = true;
//									};
//								};
								//Fantasy   觉得上面这块肯定有问题      修改如下
//								if (player.character_x-enemy_x > 100){
//									enemy_velX = (enemy_velX + 2);
//									if (enemy_velX > enemyRunSpeed){
//										enemy_velX = enemyRunSpeed;
//									};
//									enemy_isMoving = true;
//								}
//								else if(player.character_x-enemy_x<100){
//									enemy_velX = (enemy_velX - 2);
//									if (enemy_velX < -(enemyRunSpeed)){
//										enemy_velX = -(enemyRunSpeed);
//									};
//									enemy_isMoving = true;
//								}
//								else
//								{
//									enemy_velX=0;
//									enemy_isMoving = false;
//								}
								var nextTileOn:int=((int(((enemy_y+25) / 50)) * level.level_width) + int(((enemy_x + 30) / 50)));
								var preTileOn:int=((int(((enemy_y+25) / 50)) * level.level_width) + int(((enemy_x - 30) / 50)));
								if((level.level_collidable[level.level[nextTileOn]] == 0)||(level.level_collidable[level.level[preTileOn]] == 0))
								{
									enemy_jump = true;
									trace("应该跳");
								}
							}
							else {
								enemy_isMoving = false;
							};
							break;
						case 4://Fantasy   脱离视野
							if (enemy_hasLineOfSight == true){
								enemy_aiState = 0;
							};
							enemy_health_head = -50001;
							enemy_markedForRemoval = true;
							break;
					};
				};
				
				//以下逻辑跟寻路都有问题
				if (enemy_isMoving == false){//Fantasy   这段代码是让人物停住
					if (enemy_jump == false){
						if (enemy_velX < -4){
							enemy_velX = (enemy_velX + 4);
						}
						else {
							if (enemy_velX > 4){
								enemy_velX = (enemy_velX - 4);
							}
							else {
								enemy_velX = 0;
							};
						};
					}
					else {
						if (enemy_velX < -1){
							enemy_velX = (enemy_velX + 1);
						}
						else {
							if (enemy_velX > 1){
								enemy_velX = (enemy_velX - 1);
							}
							else {
								enemy_velX = 0;
							};
						};
					};
				};
				enemy_xOld = enemy_x;
				enemy_x = (enemy_x + enemy_velX);
				//这段代码是调整人物所在格子
				if (enemy_velX > 0){
					tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x + 25) / 50)));
					if ((((level.level_collidable[level.level[tileOn]] == 1)) || ((level.level_collidable[level.level[(tileOn - level.level_width)]] == 1)))){
						enemy_x = ((int((enemy_x / 50)) * 50) + 25);
						enemy_velX = 0;
					};
				}
				else {
					if (enemy_velX < 0){
						tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x - 25) / 50)));
						if ((((level.level_collidable[level.level[tileOn]] == 1)) || ((level.level_collidable[level.level[(tileOn - level.level_width)]] == 1)))){
							enemy_x = ((int((enemy_x / 50)) * 50) + 25);
							enemy_velX = 0;
						};
					};
				};
				if (enemy_jump == true){
					enemy_yOld = enemy_y;
					enemy_y = (enemy_y + enemy_velY);
					enemy_velY = (enemy_velY + 2);
					if (enemy_velY > 40){
						enemy_velY = 40;
					};
					if (int((enemy_y / 50)) == (enemy_nextNode / level.level_width)){
						if (enemy_velY < -8){
							enemy_velY = -8;
						};
						if (enemy_velY == 0){
							if (int((enemy_x / 50)) < (enemy_nextNode % level.level_width)){
								enemy_velX = enemyRunSpeed;
							}
							else {
								if (int((enemy_x / 50)) > (enemy_nextNode % level.level_width)){
									enemy_velX = -(enemyRunSpeed);
								};
							};
						};
					};
					if (enemy_velY > 0){
						tileOn = ((int((enemy_y / 50)) * level.level_width) + int((enemy_x / 50)));
						if (level.level_collidable[level.level[tileOn]] == 1){
							enemy_jump = false;
							enemy_velY = 0;
							enemy_y = ((int((enemy_y / 50)) * 50) + 2);
							enemy_yOld = enemy_y;
							if (enemy_aiState == 3){
								enemy_aiState = 0;
								enemy_nextNode = -1;
							};
						};
					}
					else {
						tileOn = ((int(((enemy_y - 80) / 50)) * level.level_width) + int((enemy_x / 50)));
						if (level.level_collidable[level.level[tileOn]] == 1){
							enemy_velY = 0;
						};
					};
				}
				else {
					tileOn = ((int((enemy_y / 50)) * level.level_width) + int((enemy_x / 50)));
					if (level.level_collidable[level.level[tileOn]] == 0){
						enemy_jump = true;
					};
				};
				tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int((enemy_x / 50)));
				if (level.level_collidable[level.level[tileOn]] == 1){
					if (level.level_collidable[(level.level[tileOn] - 1)] == 0){
						enemy_x = ((int(((enemy_x - 50) / 50)) * 50) + 25);
					}
					else {
						if (level.level_collidable[(level.level[tileOn] + 1)] == 0){
							enemy_x = ((int(((enemy_x + 50) / 50)) * 50) + 25);
						};
					};
				};
				//Fantasy  change
				if(enemy_health_head<enemy_health_headOld)
				{
					var randomAnim:int=int(Math.random()*3);
//					if(!Util.guideIsCompelete())//新手引导   增加倒地概率
//					{
//						randomAnim=2;
//					}
					switch(randomAnim)
					{
						case 0:
							if (enemy_anim < 20){
								enemy_anim = (int((Math.random() * 4)) + 11);
								enemy_fr = 0;
								enemy_frOld = 0;
								enemy_velX = 0;
							};
							break;
						case 1:
							if (enemy_anim < 20){
								enemy_anim = (int((Math.random() * 4)) + 15);
								enemy_fr = 0;
								enemy_frOld = 0;
								enemy_velX = 0;
							};
							break;
						case 2:
							if (enemy_anim < 20){
//								if (enemy_velX != 0){
//									enemy_anim = (int((Math.random() * 2)) + 22);
//								}
//								else {
//									enemy_anim = (int((Math.random() * 3)) + 19);
//								};
								enemy_anim=(int((Math.random() * 5)) + 19);//提高倒地射击概率
								enemy_fr = 0;
								enemy_frOld = 0;
								enemy_velX = 0;
							};
							break;
					}
				}
				enemy_health_headOld = enemy_health_head;
				enemy_health_bodyOld = enemy_health_body;
				enemy_health_footOld = enemy_health_foot;
				//调整动画
				if (enemy_jump == false){
					if (enemy_anim < 11){
						if (enemy_velX != 0){
							if (enemy_face == 0){
								if (enemy_velX > 0){
									enemy_anim = 2;
								}
								else {
									enemy_anim = 3;
								};
							}
							else {
								if (enemy_velX > 0){
									enemy_anim = 3;
								}
								else {
									enemy_anim = 2;
								};
							};
						}
						else {
							tileOn = ((int((enemy_y / 50)) * level.level_width) + int(((enemy_x - 15) / 50)));
							if (level.level_collidable[level.level[tileOn]] == 0){
								if (enemy_face == 1){
									if (enemy_anim != 9){
										enemy_anim = 9;
										enemy_fr = 0;
										enemy_frOld = enemy_fr;
									};
								}
								else {
									if (enemy_anim != 10){
										enemy_anim = 10;
										enemy_fr = 0;
										enemy_frOld = enemy_fr;
									};
								};
							}
							else {
								tileOn = ((int((enemy_y / 50)) * level.level_width) + int(((enemy_x + 15) / 50)));
								if (level.level_collidable[level.level[tileOn]] == 0){
									if (enemy_face == 1){
										if (enemy_anim != 9){
											enemy_anim = 9;
											enemy_fr = 0;
											enemy_frOld = enemy_fr;
										};
									}
									else {
										if (enemy_anim != 10){
											enemy_anim = 10;
											enemy_fr = 0;
											enemy_frOld = enemy_fr;
										};
									};
								}
								else {
									if (enemy_anim != 1){
										enemy_anim = 1;
										enemy_fr = 0;
										enemy_frOld = enemy_fr;
									};
								};
							};
						};
					};
				}
				else {
					if (enemy_velY < 0){
						if (enemy_anim != 6){
							enemy_anim = 6;
							enemy_fr = 0;
							enemy_frOld = enemy_fr;
						};
					}
					else {
						if (enemy_anim != 7){
							enemy_anim = 7;
							enemy_fr = 0;
							enemy_frOld = enemy_fr;
						};
					};
				};
				enemy_frOld = enemy_fr;
				enemy_fr = (enemy_fr + 2);
				if (enemy_fr > charAnimDataVect[enemy_anim].maxFrames){
					if (enemy_anim > 10){
						enemy_anim = 1;
					};
					enemy_fr = 0;
					enemy_frOld = 0;
				};
			}
			else {
				enemy_xOld = enemy_x;
				enemy_yOld = enemy_y;
				
				
				if (enemy_markedForRemoval == false){
					enemy_markedForRemoval = true;
					var charAnimData:CharAnimData=charAnimDataVect[enemy_anim];
//					_local_1 = weaponProficiencyKills;
//					_local_2 = enemy_damagedBy;
//					_local_3 = (_local_1[_local_2] + 1);
//					_local_1[_local_2] = _local_3;
//					if (enemy_damagedBy != 20){
//						if ((((weaponProficiencyKills[enemy_damagedBy] >= 50)) && ((scoreTimesEarned[(enemy_damagedBy + 12)] == 0)))){
//							scoreTally = (scoreTally + 100);
//							tempScoreQue = "";
//							tempScoreQue = (tempScoreQue + scoreNames[(enemy_damagedBy + 12)]);
//							scoreQue.push(tempScoreQue);
//							if (scoreQue.length > 3){
//								scoreQue.splice(0, 1);
//							};
//							scoreQueTime = 60;
//							multiplier_countdown = max_multiplier_countdown;
//							scoreTimesEarned[(enemy_damagedBy + 12)] = 1;
//						};
//					}
//					else {
//						if ((((weaponProficiencyKills[enemy_damagedBy] >= 5)) && ((scoreTimesEarned[(enemy_damagedBy + 12)] == 0)))){
//							scoreTally = (scoreTally + 100);
//							tempScoreQue = "";
//							tempScoreQue = (tempScoreQue + scoreNames[(enemy_damagedBy + 12)]);
//							scoreQue.push(tempScoreQue);
//							if (scoreQue.length > 3){
//								scoreQue.splice(0, 1);
//							};
//							scoreQueTime = 60;
//							multiplier_countdown = max_multiplier_countdown;
//							scoreTimesEarned[(enemy_damagedBy + 12)] = 1;
//						};
//					};
//					tempScoreQue = "";
//					tempScoreQue = (tempScoreQue + scoreNames[0]);
//					scoreTally = (scoreTally + 10);
//					_local_1 = scoreTimesEarned;
//					_local_2 = 0;
//					_local_3 = (_local_1[_local_2] + 1);
//					_local_1[_local_2] = _local_3;
//					if ((((gun_ammo[character_gunEquipped] == 0)) && ((gun_mag_size[character_gunEquipped] > 2)))){
//						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[3]));
//						scoreTally = (scoreTally + 5);
//						_local_1 = scoreTimesEarned;
//						_local_2 = 3;
//						_local_3 = (_local_1[_local_2] + 1);
//						_local_1[_local_2] = _local_3;
//					};
//					if (enemy_anim == 23){
//						scoreTally = (scoreTally + 5);
//						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[4]));
//						_local_1 = scoreTimesEarned;
//						_local_2 = 4;
//						_local_3 = (_local_1[_local_2] + 1);
//						_local_1[_local_2] = _local_3;
//					};
					//Fantasy change
					var boss:int=0;
					var deadWay:int;
					if(zombieData is ViewData_Zombie)
					{
						boss=(zombieData as ViewData_Zombie).monsterNode.boss
					}
					
					if(boss==1)
					{
						deadWay=0;
					}
					else
					{
						if(this is Enemy_Leitai)
						{
							deadWay=2;
						}
						else
						{
							deadWay=1;
						}
					}
					if ((enemy_health_head <= 0)&&(deadWay==0)){
						canvas.cameraShakeFun(0.5);
						sound.getVolume(enemy_x, enemy_y);
						sound.playSoundEffect((int((Math.random() * 3)) + 42), sound.tempVol, 0);
						enemy_isHeadless = true;
//						scoreTally = (scoreTally + 5);
//						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[1]));
//						_local_1 = scoreTimesEarned;
//						_local_2 = 1;
//						_local_3 = (_local_1[_local_2] + 1);
//						_local_1[_local_2] = _local_3;
//						if (enemy_jump == true){
//							scoreTally = (scoreTally + 5);
//							tempScoreQue = (tempScoreQue + (" @ " + scoreNames[8]));
//							_local_1 = scoreTimesEarned;
//							_local_2 = 8;
//							_local_3 = (_local_1[_local_2] + 1);
//							_local_1[_local_2] = _local_3;
//						};
						b = 5;
						while (b < 9) {
							if (enemy_face == 0){
								enemy_tempPos_x = ((enemy_x + charAnimData.head_x[int(enemy_fr)]) + assetConfig.giblet_posX[b]);
								enemy_tempPos_face = 1;
								enemy_tempVel_x = ((Math.random() * -8) - 1);
							}
							else {
								enemy_tempPos_x = ((enemy_x - charAnimData.head_x[int(enemy_fr)]) - assetConfig.giblet_posX[b]);
								enemy_tempPos_face = -1;
								enemy_tempVel_x = ((Math.random() * 8) + 1);
							};
							enemy_tempPos_y = ((enemy_y + charAnimData.head_y[int(enemy_fr)]) + assetConfig.giblet_posY[b]);
							enemy_tempVel_y = ((Math.random() * -10) - 2);
							Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
							b++;
						};
						if (enemy_face == 0){
							canvas.placeBloodSplatter((enemy_x + charAnimData.head_x[int(enemy_fr)]), (enemy_y + charAnimData.head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x + charAnimData.head_x[int(enemy_fr)]), (enemy_y + charAnimData.head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x + charAnimData.head_x[int(enemy_fr)]), (enemy_y + charAnimData.head_y[int(enemy_fr)]), 0);
						}
						else {
							canvas.placeBloodSplatter((enemy_x - charAnimData.head_x[int(enemy_fr)]), (enemy_y + charAnimData.head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x - charAnimData.head_x[int(enemy_fr)]), (enemy_y + charAnimData.head_y[int(enemy_fr)]), 0);
							canvas.placeBloodSplatter((enemy_x - charAnimData.head_x[int(enemy_fr)]), (enemy_y + charAnimData.head_y[int(enemy_fr)]), 0);
						};
						SimpleParticle.addSimpleParticle(8, (((enemy_x - 110) + (Math.random() * 50)) - 25), ((enemy_y + charAnimData.head_y[int(enemy_fr)]) - 75), 0, 0, 0);
						SimpleParticle.addSimpleParticle(5, (((enemy_x - 135) + (Math.random() * 50)) - 25), ((enemy_y + charAnimData.head_y[int(enemy_fr)]) - 100), 0, 0, 0);
						b = 0;
						while (b < 5) {
							enemy_tempPos_x = (((enemy_x + charAnimData.head_x[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							enemy_tempPos_y = (((enemy_y + charAnimData.head_y[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							if (enemy_face == 0){
								enemy_tempVel_x = ((Math.random() * -10) - 1);
							}
							else {
								enemy_tempVel_x = ((Math.random() * 10) + 1);
							};
							enemy_tempVel_y = ((Math.random() * -15) - 10);
							Particle.addParticle(9, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, int((Math.random() * 5)), 0, 0, 0, 0);
							b++;
						};
					}
					else {
//						if ((((((enemy_health_body <= 0)) && ((enemy_health_head == enemy_health_headMax)))) && ((enemy_health_foot == enemy_health_footMax)))){
//							scoreTally = (scoreTally + 5);
//							tempScoreQue = (tempScoreQue + (" @ " + scoreNames[2]));
//							_local_1 = scoreTimesEarned;
//							_local_2 = 2;
//							_local_3 = (_local_1[_local_2] + 1);
//							_local_1[_local_2] = _local_3;
//						};
					};
					wasGibbed = false;
					if((enemy_health_head <= 0) && (deadWay==1)){
						canvas.cameraShakeFun(1.5);
						wasGibbed = true;//Fantasy   导致没有尸体
						sound.getVolume(enemy_x, enemy_y);
						sound.playSoundEffect((int((Math.random() * 4)) + 38), sound.tempVol, 0);
//						scoreTally = (scoreTally + 10);
//						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[5]));
//						_local_1 = scoreTimesEarned;
//						_local_2 = 5;
//						_local_3 = (_local_1[_local_2] + 1);
//						_local_1[_local_2] = _local_3;
//						if (enemy_jump == true){
//							scoreTally = (scoreTally + 5);
//							tempScoreQue = (tempScoreQue + (" @ " + scoreNames[6]));
//							_local_1 = scoreTimesEarned;
//							_local_2 = 6;
//							_local_3 = (_local_1[_local_2] + 1);
//							_local_1[_local_2] = _local_3;
//						};
						b = 4;
						while (b > -1) {
							switch (b){
								case 0:
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + charAnimData.head_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - charAnimData.head_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = (enemy_y + charAnimData.head_y[int(enemy_fr)]);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									canvas.placeBloodSplatter(enemy_tempPos_x, enemy_tempPos_y, 0);
									break;
								case 1:
									if (enemy_face == 0){
										enemy_tempPos_x = ((enemy_x + charAnimData.head_x[int(enemy_fr)]) - 3);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = ((enemy_x - charAnimData.head_x[int(enemy_fr)]) + 3);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = ((enemy_y + charAnimData.head_y[int(enemy_fr)]) + 20);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									break;
								case 2:
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + charAnimData.body_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - charAnimData.body_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = (enemy_y + charAnimData.body_y[int(enemy_fr)]);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									canvas.placeBloodSplatter(enemy_tempPos_x, enemy_tempPos_y, 0);
									break;
								case 3:
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + charAnimData.foot1_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - charAnimData.foot1_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = ((enemy_y + charAnimData.foot1_y[int(enemy_fr)]) - 3);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									if (enemy_face == 0){
										enemy_tempPos_x = (enemy_x + charAnimData.foot2_x[int(enemy_fr)]);
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = (enemy_x - charAnimData.foot2_x[int(enemy_fr)]);
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = ((enemy_y + charAnimData.foot2_y[int(enemy_fr)]) - 3);
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									break;
								case 4:
									if (enemy_face == 0){
										enemy_tempPos_x = enemy_gunX;
										enemy_tempPos_face = 1;
										enemy_tempVel_x = ((Math.random() * -8) - 1);
									}
									else {
										enemy_tempPos_x = enemy_gunX;
										enemy_tempPos_face = -1;
										enemy_tempVel_x = ((Math.random() * 8) + 1);
									};
									enemy_tempPos_y = enemy_gunY;
									enemy_tempVel_y = ((Math.random() * -10) - 2);
									Particle.addParticle(7, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, b, enemy_tempPos_face, 0, 0, 0);
									break;
							};
							SimpleParticle.addSimpleParticle(8, (((enemy_x - 110) + (Math.random() * 50)) - 25), ((enemy_y - 56) - (Math.random() * 100)), 0, 0, 0);
							SimpleParticle.addSimpleParticle(5, (((enemy_x - 135) + (Math.random() * 50)) - 25), ((enemy_y - 85) - (Math.random() * 100)), 0, 0, 0);
							b--;
						};
						b = 0;
						while (b < 7) {
							enemy_tempPos_x = (((enemy_x + charAnimData.head_x[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							enemy_tempPos_y = (((enemy_y + charAnimData.head_y[int(enemy_fr)]) + (Math.random() * 40)) - 20);
							if (enemy_face == 0){
								enemy_tempVel_x = ((Math.random() * -10) - 1);
							}
							else {
								enemy_tempVel_x = ((Math.random() * 10) + 1);
							};
							enemy_tempVel_y = ((Math.random() * -15) - 10);
							Particle.addParticle(9, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, enemy_tempVel_x, enemy_tempVel_y, 0, int((Math.random() * 5)), 0, 0, 0, 0);
							b++;
						};
					};
					if (wasGibbed == false){
						c = int((Math.random() * 4));
						if (c != 0){
							c = int((Math.random() * 2));
							if (c == 0){
								sound.getVolume(enemy_x, enemy_y);
								sound.playSoundEffect((int((Math.random() * 9)) + 59), (sound.tempVol * 1.5), 0);
							}
							else {
								sound.getVolume(enemy_x, enemy_y);
								sound.playSoundEffect((int((Math.random() * 9)) + 68), (sound.tempVol * 1.5), 0);
							};
						};
					};
					multiKillCount++;
					multiKillTime = 1;
					if (multiKillCount > 10){
						multiKillCount = 10;
					};
//					if (multiKillCount > 1){
//						scoreTally = (scoreTally + (5 * (multiKillCount - 1)));
//						tempScoreQue = (tempScoreQue + (" @ " + scoreNames[(32 + (multiKillCount - 1))]));
//						_local_1 = scoreTimesEarned;
//						_local_2 = (32 + (multiKillCount - 1));
//						_local_3 = (_local_1[_local_2] + 1);
//						_local_1[_local_2] = _local_3;
//					};
//					scoreQue.push(tempScoreQue);
//					if (scoreQue.length > 3){
//						scoreQue.splice(0, 1);
//					};
//					scoreQueTime = 60;
//					multiplier = (multiplier + 0.1);
//					multiplier_countdown = max_multiplier_countdown;
				};
				
				
				if (enemy_anim < 24){
					if (enemy_jump == false){
						tileOn = ((int(((enemy_y - 15) / 50)) * level.level_width) + int((enemy_x / 50)));
						if (enemy_face == 0){
							if ((((level.level_collidable[level.level[(tileOn - 1)]] == 1)) || ((level.level_collidable[level.level[((tileOn + level.level_width) - 1)]] == 0)))){
								enemy_anim = (25 + int((Math.random() * 2)));
							}
							else {
								if (level.level_collidable[level.level[((tileOn + level.level_width) + 1)]] == 1){
									enemy_anim = (24 + int((Math.random() * 5)));
								}
								else {
									enemy_anim = 26;
								};
							};
						}
						else {
							if ((((level.level_collidable[level.level[(tileOn + 1)]] == 1)) || ((level.level_collidable[level.level[((tileOn + level.level_width) + 1)]] == 0)))){
								enemy_anim = (25 + int((Math.random() * 2)));
							}
							else {
								if (level.level_collidable[level.level[((tileOn + level.level_width) - 1)]] == 1){
									enemy_anim = (24 + int((Math.random() * 5)));
								}
								else {
									enemy_anim = 26;
								};
							};
						};
					}
					else {
						enemy_anim = 29;
						enemy_velY = -12;
						if (enemy_face == 0){
							enemy_velX = -(((Math.random() * 10) + 10));
						}
						else {
							enemy_velX = ((Math.random() * 10) + 10);
						};
					};
					enemy_fr = 0;
				};
				if (enemy_anim == 27){
					if ((((enemy_fr == 4)) || ((enemy_fr == 36)))){
						if (enemy_face == 0){
							SimpleParticle.addSimpleParticle(9, enemy_x, (enemy_y - 60), 0, 0, 0);
						}
						else {
							SimpleParticle.addSimpleParticle(9, (enemy_x - 130), (enemy_y - 60), 0, 0, 1);
						};
					};
				}
				else {
					if (enemy_anim == 29){
						enemy_x = (enemy_x + enemy_velX);
						enemy_velX = (enemy_velX * 0.97);
						if (Math.abs(enemy_velX) < 0.5){
							enemy_velX = 0;
						};
						if (enemy_velX > 0){
							tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x + 25) / 50)));
							if ((((level.level_collidable[level.level[tileOn]] == 1)) || ((level.level_collidable[level.level[(tileOn - level.level_width)]] == 1)))){
								enemy_x = (enemy_x - enemy_velX);
								enemy_velX = (enemy_velX * -0.5);
							};
						}
						else {
							if (enemy_velX < 0){
								tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x - 25) / 50)));
								if ((((level.level_collidable[level.level[tileOn]] == 1)) || ((level.level_collidable[level.level[(tileOn - level.level_width)]] == 1)))){
									enemy_x = (enemy_x - enemy_velX);
									enemy_velX = (enemy_velX * -0.5);
								};
							}
							else {
								tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x + 25) / 50)));
								if ((((level.level_collidable[level.level[tileOn]] == 1)) || ((level.level_collidable[level.level[(tileOn - level.level_width)]] == 1)))){
									enemy_x = ((int((enemy_x / 50)) * 50) + 25);
								};
								tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x - 25) / 50)));
								if ((((level.level_collidable[level.level[tileOn]] == 1)) || ((level.level_collidable[level.level[(tileOn - level.level_width)]] == 1)))){
									enemy_x = ((int((enemy_x / 50)) * 50) - 25);
								};
							};
						};
						b = 0;
						while (b < 2) {
							enemy_y = (enemy_y + (enemy_velY * 0.5));
							if (enemy_velY > 0){
								tileOn = ((int(((enemy_y - 2) / 50)) * level.level_width) + int((enemy_x / 50)));
								if (level.level_collidable[level.level[tileOn]] == 1){
									enemy_velY = 0;
									enemy_y = ((int((enemy_y / 50)) * 50) + 2);
									enemy_anim = 28;
									enemy_fr = 10;
								};
							}
							else {
								if (enemy_velY < 0){
									tileOn = ((int(((enemy_y - 70) / 50)) * level.level_width) + int((enemy_x / 50)));
									if (level.level_collidable[level.level[tileOn]] == 1){
										enemy_y = (enemy_y - enemy_velY);
										enemy_velY = 0;
									};
								};
							};
							b++;
						};
						enemy_velY = (enemy_velY + 2);
						if (enemy_velY > 40){
							enemy_velY = 40;
						};
					};
				};
				if ((wasGibbed == true) || (enemy_health_head == -50001)){
//				if (wasGibbed == true){
					// 脱离视野， 后移除敌人  
					if(enemy_health_head!=-50001)
					{
						trace("stop");
					}
					removeEnemyLogic(a);
					removeEnemy(a);
				}
				else {
					removeEnemyLogic(a);
					enemy_frOld = enemy_fr;
					enemy_fr = (enemy_fr + 2);
					if (enemy_anim == 29){
						if (enemy_fr > charAnimDataVect[enemy_anim].maxFrames){
							enemy_fr = 14;
							enemy_frOld = enemy_fr;
						};
					};
					var charAnimData:CharAnimData=charAnimDataVect[enemy_anim];
					var maxFrames:int=charAnimDataVect[enemy_anim].maxFrames;
					var charAsset:CharSpriteAsset;
					if(this is Enemy_Leitai)
					{
						charAsset=BattleAssetPreload.getInstance().getPlayCharAsset(zombieData.appearance,zombieData.color);
					}
					else
					{
						charAsset=charSpriteAssetDic[(zombieData as ViewData_Zombie).monsterTypeNode.id];
					}
					if (enemy_fr > maxFrames){
						if (enemy_face == 0){
							
							trans.createBox(1, 1, charAnimData.hand1_r[maxFrames], (enemy_x + charAnimData.hand1_x[maxFrames]), (enemy_y + charAnimData.hand1_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_hand1, trans);
							trans.createBox(1, 1, charAnimData.foot2_r[maxFrames], (enemy_x + charAnimData.foot2_x[maxFrames]), (enemy_y + charAnimData.foot2_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_foot, trans);
							trans.createBox(1, 1, charAnimData.ankle2_r[maxFrames], (enemy_x + charAnimData.ankle2_x[maxFrames]), (enemy_y + charAnimData.ankle2_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_ankle, trans);
							trans.createBox(1, 1, charAnimData.body_r[maxFrames], (enemy_x + charAnimData.body_x[maxFrames]), (enemy_y + charAnimData.body_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_body, trans);
							trans.createBox(1, 1, charAnimData.head_r[maxFrames], (enemy_x + charAnimData.head_x[maxFrames]), (enemy_y + charAnimData.head_y[maxFrames]));
							if (enemy_isHeadless == false){
								canvas.drawToLevelBm(charAsset.char_head, trans);
							};
							trans.createBox(1, 1, charAnimData.foot1_r[maxFrames], (enemy_x + charAnimData.foot1_x[maxFrames]), (enemy_y + charAnimData.foot1_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_foot, trans);
							trans.createBox(1, 1, charAnimData.ankle1_r[maxFrames], (enemy_x + charAnimData.ankle1_x[maxFrames]), (enemy_y + charAnimData.ankle1_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_ankle, trans);
							trans.createBox(1, 1, charAnimData.hand2_r[maxFrames], (enemy_x + charAnimData.hand2_x[maxFrames]), (enemy_y + charAnimData.hand2_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_hand2, trans);
						}
						else {
							trans.createBox(-1, 1, charAnimData.hand1_r[maxFrames], (enemy_x - charAnimData.hand1_x[maxFrames]), (enemy_y + charAnimData.hand1_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_hand1, trans);
							trans.createBox(-1, 1, charAnimData.foot2_r[maxFrames], (enemy_x - charAnimData.foot2_x[maxFrames]), (enemy_y + charAnimData.foot2_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_foot, trans);
							trans.createBox(-1, 1, charAnimData.ankle2_r[maxFrames], (enemy_x - charAnimData.ankle2_x[maxFrames]), (enemy_y + charAnimData.ankle2_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_ankle, trans);
							trans.createBox(-1, 1, charAnimData.body_r[maxFrames], (enemy_x - charAnimData.body_x[maxFrames]), (enemy_y + charAnimData.body_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_body, trans);
							trans.createBox(-1, 1, charAnimData.head_r[maxFrames], (enemy_x - charAnimData.head_x[maxFrames]), (enemy_y + charAnimData.head_y[maxFrames]));
							if (enemy_isHeadless == false){
								canvas.drawToLevelBm(charAsset.char_head, trans);
							};
							trans.createBox(-1, 1, charAnimData.foot1_r[maxFrames], (enemy_x - charAnimData.foot1_x[maxFrames]), (enemy_y + charAnimData.foot1_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_foot, trans);
							trans.createBox(-1, 1, charAnimData.ankle1_r[maxFrames], (enemy_x - charAnimData.ankle1_x[maxFrames]), (enemy_y + charAnimData.ankle1_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_ankle, trans);
							trans.createBox(-1, 1, charAnimData.hand2_r[maxFrames], (enemy_x - charAnimData.hand2_x[maxFrames]), (enemy_y + charAnimData.hand2_y[maxFrames]));
							canvas.drawToLevelBm(charAsset.char_hand2, trans);
						};
						removeEnemy(a);
					};
				};
			};
		}
		public override function excuteRender():void{
			if (((((enemy_x - canvas.cameraX) > -200)) && (((enemy_x - canvas.cameraX) < (canvas.screenWidth + 200))))){
				if (((((enemy_y - canvas.cameraY) > -200)) && (((enemy_y - canvas.cameraY) < (canvas.screenHeight + 200))))){
//					render_a_character(0);
					var charAnimData:CharAnimData=assetConfig.charAnimDataVect[enemy_anim];
					var charAsset:CharSpriteAsset =charSpriteAssetDic[(zombieData as ViewData_Zombie).monsterTypeNode.id]
					renderPlayerArg._charAnimData=charAnimData;
					renderPlayerArg._charAsset=charAsset;
					renderPlayerArg._face=enemy_face;
					renderPlayerArg._frame=enemy_fr;
					renderPlayerArg._frameOld=enemy_frOld;
					renderPlayerArg._gunAsset=gun_enemy_asset;
					renderPlayerArg._gunData=gun_data;
					renderPlayerArg._gunFrame=enemy_gunFrame;
					renderPlayerArg._gunRot=enemy_gunRot;
					renderPlayerArg._gunRotOld=enemy_gunRotOld;
					renderPlayerArg._gunX=enemy_gunX;
					renderPlayerArg._gunXOld=enemy_gunXOld;
					renderPlayerArg._gunY=enemy_gunY;
					renderPlayerArg._gunYOld=enemy_gunYOld;
					renderPlayerArg._headless=enemy_isHeadless;
					renderPlayerArg._headRot=enemy_headRot;
					renderPlayerArg._posX=enemy_x-canvas.cameraX;
					renderPlayerArg._posX_old=enemy_xOld-canvas.cameraX;
					renderPlayerArg._posY=enemy_y-canvas.cameraY;
					renderPlayerArg._posY_old=enemy_yOld-canvas.cameraY;
					renderPlayerArg._reloadTime=0;
					renderPlayerArg.hasDroppedMag=false;
					
					var boss:int=0;
					if(zombieData is ViewData_Zombie)
					{
						boss=(zombieData as ViewData_Zombie).monsterNode.boss
					};
					switch(boss)
					{
						case 0:
							canvas.render_a_character(renderPlayerArg);
							break;
						case 1:
							canvas.render_a_large_character(renderPlayerArg);
							break;
						default:
							canvas.render_a_character(renderPlayerArg);
							break;
					}
					
					renderHpBar();
				};
			};
		}
		
		
		/**
		 * 弹出弹夹
		 */
		public function ejectBullet():void
		{
			if (enemy_gunFrame > 0)//Fantasy  弹出子弹壳
			{
				enemy_gunFrame++;
				if (enemy_gunFrame == gun_data.gun_frameToEjectShellOn)
				{
					tempSprite.x = enemy_gunX - canvas.cameraX;
					tempSprite.y = enemy_gunY - canvas.cameraY + gun_data.gunShoulder_y;
					tempSprite.rotation = enemy_headRot * pi_180;
					if (enemy_face == 0)
					{
						tempSprite.scaleY = 1;
					}
					else
					{
						tempSprite.scaleY = -1;
					}
					gunFlash_pt = new Point(gun_data.gun_eject_x, gun_data.gun_eject_y);
					gunFlash_pt = tempSprite.localToGlobal(gunFlash_pt);
					gunTempSpd = 20 + Math.random() * 4;
					if (enemy_face == 0)
					{
						Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_headRot, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, 
							enemy_headRot, Math.cos(enemy_headRot - 2) * gunTempSpd, Math.sin(enemy_headRot - 2) * gunTempSpd, 0, 
							int(gun_data.gun_casingType), int((enemy_headRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
					}
					else
					{
						Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_headRot, 
							gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_headRot, 
							Math.cos(enemy_headRot + 2) * gunTempSpd, Math.sin(enemy_headRot + 2) * gunTempSpd, 0, 
							int(gun_data.gun_casingType), int((enemy_headRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
					}
					if (gun_data.gun_bulletType == 4)
					{
						gunFlash_pt = new Point(gun_data.gun_eject_x - 5, gun_data.gun_eject_y);
						gunFlash_pt = tempSprite.localToGlobal(gunFlash_pt);
						gunTempSpd = 15 + Math.random() * 4;
						if (enemy_face == 0)
						{
							Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_headRot, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY,
								enemy_headRot, Math.cos(enemy_headRot - 2) * gunTempSpd, Math.sin(enemy_headRot - 2) * gunTempSpd, 0, 
								int(gun_data.gun_casingType), int((enemy_headRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
						}
						else
						{
							Particle.addParticle(0, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, enemy_headRot, gunFlash_pt.x + canvas.cameraX, gunFlash_pt.y + canvas.cameraY, 
								enemy_headRot, Math.cos(enemy_headRot + 2) * gunTempSpd, Math.sin(enemy_headRot + 2) * gunTempSpd, 0, 
								int(gun_data.gun_casingType), int((enemy_headRot + Math.PI) / (Math.PI * 2) * 16), (int(Math.random() * 4) + 0.25) / 10, 0, 0);
						}
					}
				}
				if (enemy_gunFrame > gun_data.gunFrames.length-1)
				{
					enemy_gunFrame = 0;
				}
			}
		}
	}
}