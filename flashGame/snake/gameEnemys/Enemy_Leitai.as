package snake.gameEnemys
{
	import com.fish.modules.core.models.LeitaiModel;
	
	import flash.geom.Point;
	
	import snake.BattleAssetPreload;
	import snake.gameParticle.particles.Particle;
	import snake.gameParticle.simpleParticles.SimpleParticle;
	import snake.guns.GunData;
	import snake.viewdata.ViewData_Zombie;
	
	import util.Util;

	public class Enemy_Leitai extends Enemy_1
	{
		public function Enemy_Leitai()
		{
			super();
		}
		public override function excuteLogic():void
		{
			super.excuteLogic();
			if(enemy_health_body<=0)
			{
				LeitaiModel.allEnemyDie();
			}
		}
		public override function excuteRender():void{
			if (((((enemy_x - canvas.cameraX) > -200)) && (((enemy_x - canvas.cameraX) < (canvas.screenWidth + 200))))){
				if (((((enemy_y - canvas.cameraY) > -200)) && (((enemy_y - canvas.cameraY) < (canvas.screenHeight + 200))))){
					var charAnimData:CharAnimData=assetConfig.charAnimDataVect[enemy_anim];
					var charAsset:CharSpriteAsset =BattleAssetPreload.getInstance().getPlayCharAsset(zombieData.appearance,zombieData.color);
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
					
					canvas.render_a_character(renderPlayerArg);
					
					renderHpBar();
				};
			};
		}
	}
}