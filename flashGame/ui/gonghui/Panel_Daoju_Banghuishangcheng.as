package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import util.Util;
	
	import view.Panel_Base;
	
import flash.display.MovieClip
	public class Panel_Daoju_Banghuishangcheng extends Panel_Base
	{
		private var _pos:Position;
		private var _scrollController:ScrollController;
		private var gonghuiModel:GonghuiModel;
		
		public function Panel_Daoju_Banghuishangcheng()
		{
			super();
		}
		protected override function initModule():void
		{
			gonghuiModel=Context.getInjectInstance(GonghuiModel);
			_pos=new Position(panelMaterial.pos_scroll_suipian);
			_scrollController=new ScrollController(_pos);
			_pos.removeChildren();
			_pos.addChild(_scrollController);
			_scrollController.initItemClass(Item_DaojuPanel);
		}
		private function destoryMc():void
		{
			if(_pos){_pos.destory();_pos=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
		}
		protected override function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_BuyBanghuiItemHandler)
			{
				if(_code==1)
				{
					Util.flow("购买帮会道具成功");
					setShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		protected override function setShow():void
		{
			_scrollController.setData(gonghuiModel.daojuItemList);
		}
		protected override function get panelClassName():Class
		{
			return pos_banghui_daoju; 
		}
		private function get panelMaterial():pos_banghui_daoju 
		{
			return material as pos_banghui_daoju; 
		}
		public override function clear():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			gonghuiModel=null;
			destoryMc();
			super.clear();
		}
	}
}
