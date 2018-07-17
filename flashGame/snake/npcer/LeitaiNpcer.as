package snake.npcer
{
	import com.fish.modules.core.models.LeitaiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import snake.BattleAssetPreload;
	import snake.GameManager;
	import snake.PlayerInfoBar;
	import snake.viewdata.leitai.ViewData_LeitaiPerson;

	public class LeitaiNpcer extends GameNpcer
	{
		public function LeitaiNpcer()
		{
			super();
		}
		public override function logic():void
		{		
//			adjustMove();
			adjustAnimInUnJump();
			adjustMissFoot();
			adjustAnimInJump();
			adjustFrame();
			adjustPosX();
			adjustPosY();
			aimFun();
		}
		
		public function initFromLeitaiViewData(viewData:ViewData_LeitaiPerson,$x:Number,$y:Number):void{
			
			this.x=$x;
			y=$y;
			var appearance:Array=viewData.movieFrame;
			var color:Array=viewData.Colors;
			canvas=GameManager.manager.canvas;
			level=GameManager.manager.level.level;
			level_collidable=GameManager.manager.level.level_collidable;
			level_height=GameManager.manager.level.level_height;
			level_width=GameManager.manager.level.level_width;
			
			fr=0;
			frOld=0;
			
			face=0;
			
			setAnimTo(1);
			var gunXmlId:int=viewData.gunId;
			gunAsset=BattleAssetPreload.getInstance().getPlayGunAsset(gunXmlId);
			gunData=BattleAssetPreload.getInstance().gunDataVect[gunXmlId];
			charAsset=BattleAssetPreload.getInstance().getPlayCharAsset(appearance,color);
			
			playerInfoBar=new PlayerInfoBar();
			playerInfoBar.setInfo(1,viewData.userName,PlayerInfoBar.TY_Npc);
		}
		
		/*public override function initData(id:int,):void{
			
			var leitaiModel:LeitaiModel=Context.getInjectInstance(LeitaiModel);
			var viewData:ViewData_LeitaiPerson=leitaiModel.getLeitaiInfoByIndex(id);
			
			this.x=$x;
			y=$y;
			var appearance:Array=viewData.movieFrame;
			var color:Array=viewData.Colors;
			canvas=GameManager.canvas;
			level=GameManager.level.level;
			level_collidable=GameManager.level.level_collidable;
			level_height=GameManager.level.level_height;
			level_width=GameManager.level.level_width;
			
			fr=0;
			frOld=0;
			
			face=0;
			
			setAnimTo(1);
			var gunXmlId:int=viewData.gunId;
			gunAsset=BattleAssetPreload.getInstance().getPlayGunAsset(gunXmlId);
			gunData=BattleAssetPreload.getInstance().gunDataVect[gunXmlId];
			charAsset=BattleAssetPreload.getInstance().getPlayCharAsset(appearance,color);
			
			playerInfoBar=new PlayerInfoBar();
			playerInfoBar.setInfo(1,viewData.userName,PlayerInfoBar.TY_Npc);
		}*/
		protected override function setAnimTo($anim:int):void{
			anim=$anim;		
			charAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
			fr=frOld=int(charAnimData.maxFrames*Math.random());
		}
		protected override function changeAnimTo($anim:int):void{
			if(anim!=$anim){
				anim=$anim;		
				charAnimData=BattleAssetPreload.getInstance().charAnimDataVect[anim];
				fr=frOld=int(charAnimData.maxFrames*Math.random());
			}
		}
	}
}