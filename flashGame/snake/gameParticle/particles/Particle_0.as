package snake.gameParticle.particles
{
	/**
	 * 枪的弹夹
	 */
	internal class Particle_0 extends Particle
	{
		public function Particle_0()
		{
			super();
		}
		
		public override function excuteLogic():void{
			particle_xOld = particle_x;
			particle_yOld = particle_y;
			particle_x = particle_x + particle_velX;
			particle_velX = particle_velX * 0.97; // x速度 减速
			if (particle_velX > 0)
			{
				// 如果遇到阻碍
				tileOn = int((particle_y - 1) / 50) * level.level_width + int((particle_x + particle_velX) / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_x = int(particle_x / 50) * 50 + 45;
					particle_velX = particle_velX * -0.5;// 反弹 弹壳
				}
			}
			else if (particle_velX < 0)
			{
				// 如果遇到阻碍
				tileOn = int((particle_y - 1) / 50) * level.level_width + int((particle_x + particle_velX) / 50);
				if (level.level_collidable[level.level[tileOn]] == 1)
				{
					particle_x = int(particle_x / 50) * 50 + 5;
					particle_velX = particle_velX * -0.5;
				}
			}
			//速度过小 变成 o
			if (Math.abs(particle_velX) < 1)
			{
				particle_velX = 0;
			}
			particle_p2 = particle_p2 - particle_velX * particle_p3;
			if (particle_p2 > 16)
			{
				particle_p2 = particle_p2 - 16;
			}
			if (particle_p2 < 0)
			{
				particle_p2 = particle_p2 + 16;
			}
			particle_velY = particle_velY + 2;
			if (particle_velY > 40)
			{
				//最大 坠落速度
				particle_velY = 40;
			}
			b = 0;
			while (b < 2)  //循环两次计算， 防止穿越
			{
				
				particle_y = particle_y + particle_velY * 0.5;
				// 上下碰撞检测
				if (particle_velY < 0)
				{
					tileOn = int((particle_y - 10) / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_y = particle_y - particle_velY;
						particle_velY = particle_velY * -0.5;
					}
				}
				else if (particle_velY > 0)
				{
					tileOn = int((particle_y + shellHeight[particle_p1]) / 50) * level.level_width + int(particle_x / 50);
					if (level.level_collidable[level.level[tileOn]] == 1)
					{
						particle_y = int((particle_y + shellHeight[particle_p1]) / 50) * 50 - shellHeight[particle_p1];
						if (particle_velY > 10)
						{
							particle_velY = particle_velY * -0.5;
							sound.getVolume(particle_x, particle_y);
							if (particle_p1 == 0)
							{
								sound.playSoundEffect(int(Math.random() * 3) + 26, sound.tempVol, 0);
							}
							else if (particle_p1 == 1)
							{
								sound.playSoundEffect(int(Math.random() * 3) + 29, sound.tempVol, 0);
							}
							else if (particle_p1 == 2)
							{
								sound.playSoundEffect(int(Math.random() * 3) + 32, sound.tempVol, 0);
							}
							else if (particle_p1 == 3)
							{
								sound.playSoundEffect(int(Math.random() * 3) + 26, sound.tempVol, 0);
							}
						}
						else
						{
							if (particle_p4 == 0)
							{
								particle_p4 = 1;
								sound.getVolume(particle_x, particle_y);
								if (particle_p1 == 0)
								{
									sound.playSoundEffect(int(Math.random() * 3) + 26, sound.tempVol, 0);
								}
								else if (particle_p1 == 1)
								{
									sound.playSoundEffect(int(Math.random() * 3) + 29, sound.tempVol, 0);
								}
								else if (particle_p1 == 2)
								{
									sound.playSoundEffect(int(Math.random() * 3) + 32, sound.tempVol, 0);
								}
								else if (particle_p1 == 3)
								{
									sound.playSoundEffect(int(Math.random() * 3) + 26, sound.tempVol, 0);
								}
							}
							particle_velY = 0;
							particle_velX = particle_velX * 0.6;
						}
					}
				}
				
				b  ++ ;
				
			}
			if (Math.abs(particle_velX) < 0.1)
			{
				if (Math.abs(particle_velY) < 0.1)
				{
//					var _loc_1:* = particle_p5;
//					var _loc_2:* = a;
//					var _loc_3:* = particle_p5 + 1;
//					_loc_1[_loc_2] = _loc_3;
					particle_p5++;
					
					
					if (particle_p5 > 2)
					{
						tileOn = int((particle_y - 1) / 50) * level.level_width + int(particle_x / 50);
						if (level.level_collidable[level.level[tileOn]] == 0)
						{
							rect.width = assetConfig.gunCasingWidth[int(particle_p1)];
							rect.height = rect.width;
							rect.x = int(particle_p2) * rect.width;
							rect.y = 0;
							tempPoint.x = particle_x - rect.width * 0.5;
							tempPoint.y = particle_y - rect.height * 0.5;
							canvas.copyToLevelBm(assetConfig.gun_casing_bits[int(particle_p1)], rect, tempPoint, null, null, false);
						}
						Particle.removeParticle();
					}
				}
				else
				{
					particle_p5 = 0;
				}
			}
			else
			{
				particle_p5 = 0;
			}
		}
		public override function excuteRender():void{
			rect.width = assetConfig.gunCasingWidth[int(particle_p1)];
			rect.height = rect.width;
			rect.x = int(particle_p2) * rect.width;
			rect.y = 0;
			canvas.interpFun(particle_x, particle_y, particle_xOld, particle_yOld);
			tempPoint.x = canvas.interpFinal.x - canvas.cameraX - rect.width * 0.5;
			tempPoint.y = canvas.interpFinal.y - canvas.cameraY - rect.height * 0.5;
			canvas.bm.copyPixels(assetConfig.gun_casing_bits[int(particle_p1)], rect, tempPoint, null, null, false);
		}
	}
}