package snake.gameParticle.simpleParticle_bgs
{
	import com.fish.modules.core.models.GuideModel;
	import com.ghostlmm.lightMVC.Context;
	import com.greensock.TweenLite;
	
	import flash.display.Shape;
	
	import core.PlayerGuideManager;
	
	import snake.BattleEnterance;
	import snake.BattleLayer;
	import snake.GameManager;
	import snake.gameobj.Player;

	public class SimpleParticle_bg_portal extends SimpleParticle_bg
	{
		public function SimpleParticle_bg_portal()
		{
			super();
		}
		
		
		public override function excuteLogic():void{
			var player:Player = GameManager.manager.player;
			simpleParticle_bg_p1++;
			if(simpleParticle_bg_p1>assetConfig.portalMovie.frameNum){
				simpleParticle_bg_p1=1;
			}
			
			
			if(simpleParticle_bg_p2==100){
				return ;
			}
			
			
			if (Math.abs(player.character_x - (simpleParticle_bg_x+assetConfig.portalMovie.width/2)) < assetConfig.portalMovie.width/2)
			{
				if (Math.abs(player.character_y-Player.PlayerHeight/2 - (simpleParticle_bg_y + assetConfig.portalMovie.height/2)) < assetConfig.portalMovie.height/2)
				{
					if(GameManager.manager.enemyCreator.monsterLeft<=0)
					{
						trace("接触到传送门");
						simpleParticle_bg_p2=100;
	//					BattleEnterance.enterBattleUseJsonAndPng(1,1);
	//					TweenLite.delayedCall(0.1,BattleEnterance.enterBattleUseJsonAndPng,[1,1]);
						var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
						if(!guideModel.isComplete){
							PlayerGuideManager.getInstance().onEnterPortal();
						}
						BattleLayer.onEnterPortal();
						canvas.endBattle();
					}
				}
			}
		}
		
		public override function excuteRender():void{

			
			rect.x = assetConfig.portalMovie.width*(simpleParticle_bg_p1-1);
			rect.y = 0;
			rect.width = assetConfig.portalMovie.width;
			rect.height = assetConfig.portalMovie.height;
			
			tempPoint.x = simpleParticle_bg_x - canvas.cameraX;
			tempPoint.y = simpleParticle_bg_y - canvas.cameraY;
			
//			var shape:Shape=new Shape();
//			shape.graphics.drawRect(0,0,assetConfig.portalMovie.width,assetConfig.portalMovie.height);
			
			if (((((simpleParticle_bg_x - canvas.cameraX) > -200)) && (((simpleParticle_bg_x - canvas.cameraX) < (canvas.screenWidth + 200))))){
				if (((((simpleParticle_bg_y - canvas.cameraY) > -200)) && (((simpleParticle_bg_y - canvas.cameraY) < (canvas.screenHeight + 200))))){
					canvas.bm.copyPixels(assetConfig.portalMovie.bm, rect, tempPoint, null, null, true);
//					canvas.bm.draw(
				}
			}
		}
		
	}
}