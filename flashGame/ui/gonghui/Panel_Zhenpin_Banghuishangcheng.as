package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.TimerModel;
	import com.ghostlmm.lightMVC.Context;
	
	import flash.display.MovieClip;
	
	import ui.widget.Position;
	import ui.widget.ScrollController;
	
	import util.GameTime;
	import util.Util;
	
	import view.Panel_Base;

	public class Panel_Zhenpin_Banghuishangcheng extends Panel_Base
	{
		private var _pos:Position;
		private var _scrollController:ScrollController;
		private var gonghuiModel:GonghuiModel;
		private var timerModel:TimerModel;
		
		protected override function initModule():void
		{
			timerModel=Context.getInjectInstance(TimerModel);
			gonghuiModel=Context.getInjectInstance(GonghuiModel);
			_pos=new Position(panelMaterial.pos_scroll_suipian);
			_scrollController=new ScrollController(_pos);
			_pos.removeChildren();
			_pos.addChild(_scrollController);
			_scrollController.initItemClass(Item_ZhenpinPanel);
		}
		protected override function registerEvent():void
		{
			timerModel.secondTimer_SN.add(onTick);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_GetBanghuiShopHandler)
			{
				if(_code==1)
				{
					freshFlag=false;	
					setZhenpinListShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_BuyBanghuiZhenpinHandler)
			{
				if(_code==1)
				{
					Util.flow("购买帮会珍品成功");
					setZhenpinListShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private var freshFlag:Boolean=false;
		private function onTick():void
		{
			var gameTime:GameTime=new GameTime(gonghuiModel.gonghuiVo.zhenpingRefreshTime-timerModel.serverTime);
			if(gameTime.miliSecond<0 && !freshFlag){
				freshFlag=true;
				C2SEmitter.getShangchengInfo();
			}
		}
		protected override function setShow():void
		{
			C2SEmitter.getShangchengInfo();	
			freshFlag=true;
		}
		private function setZhenpinListShow():void
		{
			_scrollController.setData(gonghuiModel.zhenpinItemList);
		}
		public function Panel_Zhenpin_Banghuishangcheng()
		{
			super();
		}
		protected override function get panelClassName():Class
		{
			return pos_banghui_zhenpin; 
		}
		private function get panelMaterial():pos_banghui_zhenpin 
		{
			return material as pos_banghui_zhenpin; 
		}
		public override function clear():void
		{
			timerModel.secondTimer_SN.remove(onTick);
			timerModel=null;
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			gonghuiModel=null;
			super.clear();
		}
	}
}
