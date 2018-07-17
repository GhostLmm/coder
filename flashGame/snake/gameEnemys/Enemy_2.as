package snake.gameEnemys
{

	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticles.SimpleParticle;

	public class Enemy_2 extends Enemy
	{
		public function Enemy_2()
		{
			super();
		}
		
		// warning 
		private function enemy_large_swordCollisions():void{
			
		}
		
		public override function excuteLogic():void{
			
			enemy_engagementDistance = 200;
			if ((((enemy_health_body > 0)) && ((enemy_health_head > 0)))){
				enemy_xOld = enemy_x;
				enemy_yOld = enemy_y;
				switch (enemy_anim){
					case 0:
						enemy_anim = 1;
						enemy_fr = 0;
						enemy_frOld = 0;
						break;
					case 1:
						enemy_frOld = enemy_fr;
						enemy_fr = (enemy_fr + 2);
						if (enemy_fr > enemy_large_maxFrames[enemy_anim]){
							enemy_fr = 0;
							enemy_frOld = 0;
						};
						if (player.character_x < enemy_x){
							enemy_face = 0;
						}
						else {
							enemy_face = 1;
						};
						if (enemy_face == 0){
							if ((player.character_x - enemy_x) < (-(enemy_engagementDistance) * 2)){
								enemy_anim = 2;
								enemy_fr = 0;
								enemy_frOld = 0;
							}
							else {
								if ((player.character_x - enemy_x) > -(enemy_engagementDistance)){
									c = (Math.random() * 3);
									if (c == 0){
										enemy_anim = 5;
									}
									else {
										if (c == 1){
											enemy_anim = 4;
										}
										else {
											enemy_anim = 3;
										};
									};
									enemy_fr = 0;
									enemy_frOld = 0;
								}
								else {
									c = (Math.random() * 40);
									if (c == 0){
										enemy_anim = 7;
										enemy_fr = 0;
										enemy_frOld = 0;
										enemy_lineOfSightTimer = 0;
										enemy_velX = 0;
									}
									else {
										if (c == 1){
											enemy_anim = 4;
											enemy_fr = 0;
											enemy_frOld = 0;
										};
									};
								};
							};
						}
						else {
							if ((player.character_x - enemy_x) > (enemy_engagementDistance * 2)){
								enemy_anim = 2;
								enemy_fr = 0;
								enemy_frOld = 0;
							}
							else {
								if ((player.character_x - enemy_x) < enemy_engagementDistance){
									c = (Math.random() * 3);
									if (c == 0){
										enemy_anim = 5;
									}
									else {
										enemy_anim = 3;
									};
									enemy_fr = 0;
									enemy_frOld = 0;
								}
								else {
									c = (Math.random() * 40);
									if (c == 0){
										enemy_anim = 7;
										enemy_fr = 0;
										enemy_frOld = 0;
										enemy_lineOfSightTimer = 0;
										enemy_velX = 0;
									}
									else {
										if (c == 1){
											enemy_anim = 4;
											enemy_fr = 0;
											enemy_frOld = 0;
										};
									};
								};
							};
						};
						break;
					case 2:
						enemy_frOld = enemy_fr;
						enemy_fr = (enemy_fr + int(Math.abs((enemy_velX / 3))));
						if (enemy_fr > enemy_large_maxFrames[enemy_anim]){
							enemy_fr = 5;
							enemy_frOld = 5;
						};
						if (Math.abs((player.character_x - enemy_x)) < enemy_engagementDistance){
							if (enemy_velX == 0){
								if (enemy_velX > 1){
									enemy_velX = (enemy_velX - 1);
								}
								else {
									if (enemy_velX < -1){
										enemy_velX = (enemy_velX + 1);
									}
									else {
										enemy_velX = 0;
									};
								};
							}
							else {
								enemy_anim = 1;
								enemy_fr = 0;
								enemy_frOld = 0;
							};
						}
						else {
							if (enemy_face == 0){
								if (enemy_velX > -6){
									enemy_velX = (enemy_velX - 1);
								};
							}
							else {
								if (enemy_velX < 6){
									enemy_velX = (enemy_velX + 1);
								};
							};
						};
						enemy_x = (enemy_x + enemy_velX);
						break;
					case 3:
						enemy_frOld = enemy_fr;
						enemy_fr = (enemy_fr + 2);
						if (enemy_fr > enemy_large_maxFrames[enemy_anim]){
							enemy_anim = 1;
							enemy_fr = 0;
							enemy_frOld = 0;
						};
						if ((((enemy_fr > 70)) && ((enemy_fr < 85)))){
							enemy_large_swordCollisions();
						};
						break;
					case 4:
						enemy_frOld = enemy_fr;
						enemy_fr = (enemy_fr + 2);
						if (enemy_fr > enemy_large_maxFrames[enemy_anim]){
							enemy_anim = 1;
							enemy_fr = 0;
							enemy_frOld = 0;
						};
						if ((((enemy_fr == 48)) || ((enemy_fr == 72)))){
							
							enemy_tempPos_y = ((enemy_y + enemy_large_anims[enemy_anim].gun_y[int(enemy_fr)]) + 10);
							if (enemy_face == 0){
								enemy_tempPos_x = ((enemy_x + enemy_large_anims[enemy_anim].gun_x[int(enemy_fr)]) - 22);
								SimpleParticle.addSimpleParticle(0, enemy_tempPos_x, enemy_tempPos_y, (enemy_large_anims[enemy_anim].gun_r[int(enemy_fr)] - Math.PI), int((Math.random() * 5)), 0);
								Particle.addParticle(1, enemy_tempPos_x, enemy_tempPos_y, -(Math.PI), Particle.particleLastX,Particle.particleLastY, 0, (Math.cos(-0.05) * -16), (Math.sin(-0.05) * -16), 0, int(((-0.05 / (Math.PI * 2)) * 64)), 0, 0, 1, 25);
							}
							else {
								enemy_tempPos_x = ((enemy_x - enemy_large_anims[enemy_anim].gun_x[int(enemy_fr)]) + 22);
								SimpleParticle.addSimpleParticle(0, enemy_tempPos_x, enemy_tempPos_y, enemy_large_anims[enemy_anim].gun_r[int(enemy_fr)], int((Math.random() * 5)), 0);
								Particle.addParticle(1, enemy_tempPos_x, enemy_tempPos_y, 0, Particle.particleLastX,Particle.particleLastY, 0, (Math.cos((0.05 + Math.PI)) * -16), (Math.sin((0.05 + Math.PI)) * -16), 0, int((((0.05 + Math.PI) / (Math.PI * 2)) * 64)), 0, 0, 1, 25);
							};
						};
						break;
					case 5:
						enemy_frOld = enemy_fr;
						enemy_fr = (enemy_fr + 2);
						if (enemy_fr > enemy_large_maxFrames[enemy_anim]){
							enemy_anim = 1;
							enemy_fr = 0;
							enemy_frOld = 0;
						};
						if ((((enemy_fr > 55)) && ((enemy_fr < 63)))){
							enemy_large_swordCollisions();
						};
						break;
					case 6:
						break;
					case 7:
						enemy_frOld = enemy_fr;
						enemy_fr = (enemy_fr + 2);
						if (enemy_fr > enemy_large_maxFrames[enemy_anim]){
							enemy_fr = 24;
							enemy_frOld = 24;
						};
						if (enemy_fr > 23){
							if (enemy_face == 0){
								enemy_velX = -18;
							}
							else {
								enemy_velX = 18;
							};
						};
						enemy_x = (enemy_x + enemy_velX);
						if (enemy_face == 0){
							if (player.character_x > enemy_x){
								enemy_lineOfSightTimer = (enemy_lineOfSightTimer + Math.abs(enemy_velX));
								if (enemy_lineOfSightTimer > 500){
									enemy_velX = 0;
									enemy_anim = 1;
									enemy_fr = 0;
									enemy_frOld = 0;
								};
							};
						}
						else {
							if (player.character_x < enemy_x){
								enemy_lineOfSightTimer = (enemy_lineOfSightTimer + Math.abs(enemy_velX));
								if (enemy_lineOfSightTimer > 500){
									enemy_velX = 0;
									enemy_anim = 1;
									enemy_fr = 0;
									enemy_frOld = 0;
								};
							};
						};
						if (enemy_velX > 0){
							tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x + 60) / 50)));
							if (level.level_collidable[level.level[tileOn]] == 1){
								enemy_velX = 0;
								enemy_anim = 8;
								enemy_fr = 0;
								enemy_frOld = 0;
							};
						}
						else {
							if (enemy_velX < 0){
								tileOn = ((int(((enemy_y - 5) / 50)) * level.level_width) + int(((enemy_x - 60) / 50)));
								if (level.level_collidable[level.level[tileOn]] == 1){
									enemy_velX = 0;
									enemy_anim = 8;
									enemy_fr = 0;
									enemy_frOld = 0;
								};
							};
						};
						if (enemy_fr > 23){
							enemy_large_swordCollisions();
						};
						break;
					case 8:
						enemy_frOld = enemy_fr;
						enemy_fr = (enemy_fr + 2);
						if (enemy_fr > enemy_large_maxFrames[enemy_anim]){
							enemy_anim = 1;
							enemy_fr = 0;
							enemy_frOld = 0;
						};
						break;
				};
			}
			else {
				removeEnemy(a);
			};
			
		}
		public override function excuteRender():void{
//			render_enemy_large(enemy_x - cameraX, enemy_y - cameraY, enemy_xOld - cameraX, enemy_yOld - cameraY, 
//			enemy_anim, enemy_fr, enemy_frOld, enemy_face);
			
			if (((((enemy_x - canvas.cameraX) > -300)) && (((enemy_x - canvas.cameraX) < (canvas.screenWidth + 300))))){
				if (((((enemy_y - canvas.cameraY) > -300)) && (((enemy_y - canvas.cameraY) < (canvas.screenHeight + 300))))){
					
					var param1:Number=enemy_x - canvas.cameraX
					var param2:Number=enemy_y - canvas.cameraY;
					var param3:Number=enemy_xOld - canvas.cameraX;
					var param4:Number=enemy_yOld - canvas.cameraY;
					var param5:Number=enemy_anim;
					var param6:Number=enemy_fr;
					var param7:Number=enemy_frOld;;
					var param8:Number=enemy_face;
					
					canvas.interpFun(param6, 0, param7, 0);
					interpFrame = canvas.interpFinal.x;
					if (param8 == 0)
					{
						canvas.interpFun(param1, param2, param3, param4);
						b = 0;
						while (b < 11)
						{
							
							tempPartToRender = enemy_large_renderOrder[b];
							tempPartSprite = enemy_large_spriteOrder[b];
							
							trans.createBox(1, 1, enemy_large_anims[param5][tempPartToRender + "_r"][int(interpFrame)], 
								canvas.interpFinal.x + enemy_large_anims[param5][tempPartToRender + "_x"][int(interpFrame)], 
								canvas.interpFinal.y + enemy_large_anims[param5][tempPartToRender + "_y"][int(interpFrame)]);
							
							canvas.bm.draw(Enemy["enemy_large_" + tempPartSprite], trans);
							
							b  ++ ;
							
						}
					}
					else
					{
						canvas.interpFun(param1, param2, param3, param4);
						b = 0;
						while (b < 11)
						{
							
							tempPartToRender = enemy_large_renderOrder[b];
							tempPartSprite = enemy_large_spriteOrder[b];
							
							trans.createBox(-1, 1, enemy_large_anims[param5][tempPartToRender + "_r"][int(interpFrame)], 
								canvas.interpFinal.x - enemy_large_anims[param5][tempPartToRender + "_x"][int(interpFrame)], 
								canvas.interpFinal.y + enemy_large_anims[param5][tempPartToRender + "_y"][int(interpFrame)]);
							canvas.bm.draw(Enemy["enemy_large_" + tempPartSprite], trans);
							
							b  ++ ;
							
						}
					}
				}
					
				}
			}
			
			
		
	}
}