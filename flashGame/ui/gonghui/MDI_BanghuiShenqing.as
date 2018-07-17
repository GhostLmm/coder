package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.gameVO.BanghuiliebiaoVO;
	import com.fish.modules.core.models.GonghuiModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import util.Util;
	
	
	public class MDI_BanghuiShenqing extends Mediator
	{	
		public static const Rukou_Dongfu:String="dongfu_rukou";
		[Inject]
		public var window:BanghuiShenqingWindow;
		
		private var banghuiModel:GonghuiModel;
		private var currentSousuoName:String;		
		public function MDI_BanghuiShenqing()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			initModule();
			registerEvent();
			setShow();
		}
		private function initModule():void
		{
			banghuiModel=Context.getInjectInstance(GonghuiModel);
			window._scrollController.initItemClass(Item_LiebiaoPanel);
		}
		private function registerEvent():void
		{
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btn_fasong,TqtEvent.BUTTON_CLICK,onFasongClicked);
			addViewListener(window._btn_chuangjianbanghui,TqtEvent.BUTTON_CLICK,onChuangjianClicked);
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if((C2SEmitter.REQ_GetBanghuiListHandler==_msgType)||(C2SEmitter.REQ_JoinBanghuiHandler==_msgType)||(C2SEmitter.REQ_JoinCancelBanghuiHandler==_msgType))
			{
				if(1==_code)
				{
					switch(_msgType)
					{
						case C2SEmitter.REQ_GetBanghuiListHandler:
//							Util.flow("");
							break;
						case C2SEmitter.REQ_JoinBanghuiHandler:
							Util.flow("申请加入帮会成功");
							break;
						case C2SEmitter.REQ_JoinCancelBanghuiHandler:
							Util.flow("取消加入帮会申请成功");
							break;
					}
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
				setBanghuiListShow();
			}
		}
		private function onChuangjianClicked(evt:Event):void
		{
			if(banghuiModel.areadyHaveBanghui())
			{
				Util.flow("已经拥有工会了");
				return;
			}
			else
			{
				WindowManager.openOnlyWinodw(BanghuiChuangjianWindow);
			}
		}
		private function onFasongClicked(evt:Event):void
		{
			if(!window._fnt_shuru.isInputed())
			{
				Util.flow("您还没有输入要搜索的工会名字");
				return;
			}
			currentSousuoName=window._fnt_shuru.text;
			setBanghuiListShow();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			if((null!=window._params)&&(window._params==Rukou_Dongfu))
			{
				setBanghuiListShow();
			}
			else
			{
				C2SEmitter.getBanghuiList();
			}
		}
		private function setBanghuiListShow():void
		{
			window._scrollController.setData(GonghuiModel.getBanghuiListByNameKey(currentSousuoName));
			if(banghuiModel.areadyHaveBanghui())
			{
				window._btn_chuangjianbanghui.visible=false;
				window._mc_liaotian.x=window.x+(window.width-window._mc_liaotian.width)/2;
			}
			else
			{
				window._btn_chuangjianbanghui.visible=true;
				window._mc_liaotian.x=window._InitX;
			}
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			banghuiModel=null;
			super.destroy();
		}
	}
}