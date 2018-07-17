package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.GameVOManager;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import view.Panel_Base;
	
import flash.display.MovieClip
	public class Panel_Shenhe_ChengyuanWindow extends Panel_Base
	{
		private var _pos:Position;
		private var _scrollController:ScrollController;
		
		public function Panel_Shenhe_ChengyuanWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			_pos=new Position(panelMaterial);
			_scrollController=new ScrollController(_pos);
			_pos.removeChildren();
			_pos.addChild(_scrollController);
			_scrollController.initItemClass(Item_ShenhePanel);
		}
		private function destoryMc():void
		{
			if(_pos){_pos.destory();_pos=null;};
			if(_scrollController){_scrollController.destory();_scrollController=null;};
		}
		public override function clear():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			destoryMc();
			super.clear();
		}
		protected override function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetBanghuiShenqingHandler)
			{
				if(_code==1)
				{
					setChengyuanListShow()
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_BanghuiShenqingHandleHandler)
			{
				if(_code==1)
				{
					setChengyuanListShow()
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function setChengyuanListShow():void
		{
			_scrollController.setData(GameVOManager.getInstance().shengqingpersions);
		}
		protected override function setShow():void
		{
			var gonghuiModel:GonghuiModel=Context.getInjectInstance(GonghuiModel);
			C2SEmitter.getBanghuishenqingPersionList(gonghuiModel.myBanghuiData.bid);
		}
		protected override function get panelClassName():Class
		{
			return panel_chengyuanshenhe; 
		}
		private function get panelMaterial():panel_chengyuanshenhe 
		{
			return material as panel_chengyuanshenhe; 
		}
	}
}
