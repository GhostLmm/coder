package ui.paihangbang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.gameVO.DengjirankVO;
	import com.fish.modules.core.models.RankModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import view.Panel_Base;
	public class Panel_Dengji_RankingWindow extends Panel_Base
	{
		public function Panel_Dengji_RankingWindow()
		{
			super();
		}
		private var rankModel:RankModel;
		private var _pos_paihangbang:Position;
		private var _scrollController:ScrollController;
		protected override function initModule():void
		{
			rankModel=Context.getInjectInstance(RankModel);
			_pos_paihangbang=new Position(panelMaterial.pos_scene_paihangbang);
			_scrollController=new ScrollController(_pos_paihangbang);
			_pos_paihangbang.removeChildren();
			_pos_paihangbang.addChild(_scrollController);
			_scrollController.initItemClass(Item_DengjiPanel);
		}
		public override function clear():void
		{
			rankModel.rankOpt_SN.remove(updateShow);
			rankModel.VoArrayChane.remove(onVoChange);
			rankModel=null;
			if(_pos_paihangbang){_pos_paihangbang.destory();_pos_paihangbang=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			super.clear();
		}
		protected override function registerEvent():void
		{
			rankModel.VoArrayChane.add(onVoChange);
			rankModel.rankOpt_SN.add(updateShow);
		}
		private function onVoChange(cls:Class):void
		{
			if(cls==DengjirankVO)
			{
				updateShow();
			}
		}
		protected override function setShow():void
		{			
			C2SEmitter.sendLevelRank();
		}
		private function updateShow():void
		{
			_scrollController.setData(rankModel.dengjiDataArray);
		}
		protected override function get panelClassName():Class
		{
			return ScenePaihangbang; 
		}
		private function get panelMaterial():ScenePaihangbang 
		{
			return material as ScenePaihangbang 
		}
	}
}
