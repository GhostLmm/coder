package ui.layer
{
	import com.fish.modules.core.models.GuideModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.Sprite;
	
	import core.LayerController;
	import core.PlayerGuideManager;
	import core.WindowManager;
	
	import ui.map.MapScene;

	public class SceneLayer extends Sprite
	{
		public function SceneLayer()
		{
		}
		
		public function destory():void{
			if(scene){
				scene.destory();
				scene=null;
			}
			removeChildren();
		}
		
		private var scene:*;
		
		public function addScene(type:String,arg:Object):void{
			WindowManager.closeAllWindow();
			if(type==Scene_Map){
				scene=new MapScene();
				(scene as MapScene).initData(arg);
				this.addChild(scene);
				LayerController.instance.uiLayer.showOnlyUserInfoBar();
				var guideModel:GuideModel=Context.getInjectInstance(GuideModel);
				if(guideModel && !guideModel.isComplete){
					PlayerGuideManager.getInstance().onShowMap();
				}
			}
		}
		
		public function get curScene():*{
			return scene;
		}
		
		public function remove():void{
			LayerController.instance.uiLayer.showAll();
			if(scene){
				scene.destory();
				scene=null;
			}
			removeChildren();
		}
		
		
		
		
		public static const Scene_Map:String="map";
		
	}
}