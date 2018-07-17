package ui.paihangbang
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.TuhaorankVO;
	import com.fish.modules.core.models.RankModel;
	import com.ghostlmm.lightMVC.Context;
	
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import view.Panel_Base;
	
import flash.display.MovieClip
	public class Panel_Tuhao_RankingWindow extends Panel_Base
	{
		public function Panel_Tuhao_RankingWindow()
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
			_scrollController.initItemClass(Item_TuhaoPanel);
		}
		public override function clear():void
		{
			rankModel.rankOpt_SN.remove(updateShow);
			rankModel.VoArrayChane.remove(onVoChange);
			rankModel=null;
			S2CHanlder.instance.Opt_Message_SN.remove(onMessage);
			if(_pos_paihangbang){_pos_paihangbang.destory();_pos_paihangbang=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
			super.clear();
		}
		protected override function registerEvent():void
		{
			rankModel.rankOpt_SN.add(updateShow);
			rankModel.VoArrayChane.add(onVoChange);
			S2CHanlder.instance.Opt_Message_SN.add(onMessage);
		}
		private function onMessage(_megType:String,_code:int):void
		{
			if((_megType==C2SEmitter.REQ_HideChongzhiHonorHandler)&&(_code>0))
			{
				updateShow();
			}
		}
		private function onVoChange(cls:Class):void
		{
			if(cls==TuhaorankVO)
			{
				updateShow();
			}
		}
		protected override function setShow():void
		{		
			C2SEmitter.sendTuhaoRank();
		}
		private function updateShow():void
		{
			_scrollController.setData(rankModel.tuhaoDataArray);
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
