package ui.gonghui
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.GonghuiModel;
	import com.fish.modules.core.models.UserModel;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.lightMVC.impl.Mediator;
	
	import flash.events.Event;
	
	import core.event.TqtEvent;
	
	import util.Util;
	
	import view.viewData.BanghuiChongzhiData;
	import view.viewData.BanghuiHongbaoLingquLog;
	
	public class MDI_BanghuiHongbao extends Mediator
	{
		[Inject]
		public var window:BanghuiHongbaoWindow;
		
		private var banghuiModel:GonghuiModel;
		
		public function MDI_BanghuiHongbao()
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
			window._scroller.initItemClass(Item_BanghuiHongbaoWindow);
		}
		private function registerEvent():void
		{
			S2CHanlder.instance.Opt_Message_SN.add(onOptMessage);
			addViewListener(window._btn_close,TqtEvent.BUTTON_CLICK,onCloseClicked);
			addViewListener(window._btnchongzhi,TqtEvent.BUTTON_CLICK,onChongzhiClicked);
		}
		private function onOptMessage(_msgType:String,_code:int):void
		{
			if(_msgType==C2SEmitter.REQ_BanghuiRedPacketGetHandler)
			{
				if(_code==1)
				{
					var userModel:UserModel=Context.getInjectInstance(UserModel);
					var getCash:int=userModel.userVo.userCash-banghuiModel.LingquHongbaoCash_Before;
					Util.flow("恭喜你成功领取到充值红包",getCash);					
					updateShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
			if(_msgType==C2SEmitter.REQ_BanghuiRedPacketListHandler)
			{
				if(_code==1)
				{
					updateShow();
				}
				else
				{
					GonghuiModel.dealWithErrorCode(_code);
				}
			}
		}
		private function onChongzhiClicked(evt:Event):void
		{
			Util.openChongzhiWinodow();
			window.close();
		}
		private function onCloseClicked(evt:Event):void
		{
			window.close();
		}
		private function setShow():void
		{
			var bili:Number=GonghuiModel.HongbaoTotalPercent;
			window._fnt_percent.text=int(bili*100)+"%";
			C2SEmitter.openBanghuiHongbaoList();
		}
		private function updateShow():void
		{
			setHongbaoDataShow();
			setChongzhiShow();
			setLingquLogShow();
		}
		private function setHongbaoDataShow():void
		{
			window._scroller.setData(banghuiModel.hongbaoDataArray);
		}
		private function setChongzhiShow():void
		{
			var dataArray:Array=banghuiModel.chongzhiDataArray;
			var showDesc:String="";
			var index:int;
			for(index=0;index<dataArray.length;index++)
			{
				var data:BanghuiChongzhiData=dataArray[index] as BanghuiChongzhiData;
				showDesc+=Util.getLanguage("帮会充值记录",data.userName,data.chongzhiNum,data.fanhuanNum)+"\n";
			}
			window._fnt_chongzhijilu.htmlText=showDesc;
		}
		private function setLingquLogShow():void
		{
			var dataArray:Array=banghuiModel.hongbaoLingquLog;
			var showDesc:String="";
			var index:int;
			for(index=0;index<dataArray.length;index++)
			{
				var data:BanghuiHongbaoLingquLog=dataArray[index] as BanghuiHongbaoLingquLog;
				showDesc+=Util.getLanguage("帮会红包领取记录",data.lingquUserName,data.chongzhiUserName,data.lingquCashNum)+"\n";
			}
			window._fnt_lingqujilu.htmlText=showDesc;
		}
		public override function destroy():void
		{
			S2CHanlder.instance.Opt_Message_SN.remove(onOptMessage);
			banghuiModel=null;
			super.destroy();
		}
	}
}