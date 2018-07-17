package com.ghostlmm.story
{
	import com.fish.modules.core.models.HeroModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_monster;
	import com.ghostlmm.xmldata.Node_monster_type;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import snake.GameUtil;
	import snake.PlayerThumb;
	
	import ui.widget.ImageBitmap;
	import ui.widget.Position;

	public class StoryMcImag extends Sprite
	{
		private var thumb:PlayerThumb; 
		public var id:int;
		
//		public var imageWidth:Number;
//		public var imageHeight:Number;
		
		public function StoryMcImag()
		{
			super();
			
		}
		
		public function fill($id:int,$pos:int,$position:Position):void{
			id=$id;
			if(thumb==null){
				thumb=new PlayerThumb();
				thumb.initModule();
				this.addChild(thumb.display);
				var scale:Number=$position.rect.height/thumb.display.height;
				thumb.display.scaleX=scale;
				thumb.display.scaleY=scale;
			}
			if(id==0){
				var heroModel:HeroModel=Context.getInjectInstance(HeroModel);
				thumb.loadAppearance(heroModel.appearance,heroModel.color,
					XMLDataManager.getGunById(heroModel.mainGunId).gun_appearence);
			}else{
				var monsterNode:Node_monster=XMLDataManager.getMonsterById(id);
				var monsterTypeNode:Node_monster_type=XMLDataManager.getMonster_typeById(monsterNode.appearance);
				thumb.loadAppearance(JSON.parse(monsterTypeNode.movie_frame) as Array,GameUtil.turnArryStringToUint(monsterTypeNode.colors),
					XMLDataManager.getGunById(monsterNode.gun).gun_appearence);
			}
			
			
			
			if($pos==1){
				this.scaleX=1;
			}else{
				this.scaleX=-1;
			}
			
		}
		
		
		
		public function destory():void
		{
			if(thumb){
				thumb.destory();
				thumb=null;
			}
			this.removeChildren();
		}
		private function rejustImg(pos:Position):void
		{
//			var scale:Number=Math.min(pos.rect.width/img.width,pos.rect.height/img.height);
//			img.width=img.width*scale;
//			img.height=img.height*scale;
			
			
		}
	}
}
