package snake.gameEnemys
{
	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticles.SimpleParticle;


	public class Enemy_3 extends Enemy
	{
		public function Enemy_3()
		{
			super();
		}
		
		public override function excuteLogic():void{
			if ((((enemy_health_body > 0)) && ((enemy_health_head > 0)))){
				enemy_xOld = enemy_x;
				enemy_yOld = enemy_y;
				enemy_y = (enemy_y + enemy_velY);
				if (int(enemy_face) == 0){
					enemy_velY = (enemy_velY - 0.1);
					if (enemy_velY < -2){
						enemy_face = 1;
					};
				}
				else {
					enemy_velY = (enemy_velY + 0.1);
					if (enemy_velY > 2){
						enemy_face = 0;
					};
				};
				enemy_fr = (enemy_fr + 0.5);
				if (enemy_fr > 32){
					enemy_fr = 0;
				};
			}
			else {
				sound.playSoundEffect(25, 1, 0);
				SimpleParticle.addSimpleParticle(10, enemy_x, enemy_y, 0, 0, 0);
				b = 0;
				while (b < 30) {
					Particle.addParticle(2, enemy_x, enemy_y, 0, enemy_x, enemy_y, 0, ((Math.random() * 30) - 15), (-(Math.random()) * 10), 0, 0, 0, 0, 0, (Math.random() + 0.5));
					b++;
				};
				discsDestroyed++;
				/*if (levelToLoad == 4){
					if (discsDestroyed < 20){
						messageTime = 60;
						sound.playSoundEffect(86, 2, 0);
						messageText = (("DATA DISC DESTROYED " + discsDestroyed) + "^20");
					}
					else {
						messageTime2 = 70;
						sound.playSoundEffect(85, 2, 0);
						messageText2 = "OBJECTIVE COMPLETE: DESTROY 20 DATA DISCS";
						scoreTally = (scoreTally + 100);
						tempScoreQue = "";
						tempScoreQue = (tempScoreQue + scoreNames[7]);
						scoreQue.push(tempScoreQue);
						if (scoreQue.length > 3){
							scoreQue.splice(0, 1);
						};
						scoreQueTime = 60;
						multiplier_countdown = max_multiplier_countdown;
					};
				}
				else {
					if (discsDestroyed < 10){
						messageTime = 60;
						sound.playSoundEffect(86, 2, 0);
						messageText = (("DATA DISC DESTROYED " + discsDestroyed) + "^10");
					}
					else {
						messageTime2 = 70;
						sound.playSoundEffect(85, 2, 0);
						messageText2 = "OBJECTIVE COMPLETE: DESTROY 10 DATA DISCS";
						scoreTally = (scoreTally + 100);
						tempScoreQue = "";
						tempScoreQue = (tempScoreQue + scoreNames[7]);
						scoreQue.push(tempScoreQue);
						if (scoreQue.length > 3){
							scoreQue.splice(0, 1);
						};
						scoreQueTime = 60;
						multiplier_countdown = max_multiplier_countdown;
					};
				};*/
				removeEnemy(a);
			};
		}
		public override function excuteRender():void{
			rect.width = 60;
			rect.height = 60;
			rect.x = 60 * int(enemy_fr);
			rect.y = 0;
			tempPoint.x = enemy_x - canvas.cameraX - 30;
			tempPoint.y = enemy_y - canvas.cameraY - 30;
			canvas.bm.copyPixels(assetConfig.disc_bm, rect, tempPoint, null, null, false);
		}
	}
}