package ui.vip
{
	import com.fish.modules.core.models.VipModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_vip;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.chongzhi.ChongzhiWindow;
	
	import util.Util;
	
	public class MDI_Vip extends Mediator
	{
		[Inject]
		public var wm:VipWindow;
		[Inject]
		public var vipModel:VipModel;
		public function MDI_Vip()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			wm._page_desc.initItemClass(Item_VipDesc);
			wm._page_desc.addEventListener(TqtEvent.TAB_SELECT,onSelected);
			wm._page_desc.setData(XMLDataManager.Node_vipArray.concat([]));
			var defalutIndex:int=0;
			if(vipModel.hasVip){
				defalutIndex=vipModel.vipLevel-1;
			}
			wm._page_desc.setShowIndex(defalutIndex);
			
			wm._pos_vip.fillWithBitmapByClassName("vip"+vipModel.vipLevel);
			
//			var nodeVip:Node_vip=XMLDataManager.getVipById(vipModel.vipLevel);
			
			if(vipModel.vipLevel==vipModel.getMaxLevel()){
				wm._fnt_desc.text="";
				wm._prg_lv.devider=XMLDataManager.getVipById(vipModel.vipLevel).cash_limit;
				wm._prg_lv.progress=vipModel.vipExp;
				wm._num_suipian.text="";
			}else{
				var targetNode:Node_vip=XMLDataManager.getVipById(vipModel.vipLevel+1);
				wm._prg_lv.devider=targetNode.cash_limit;
				wm._prg_lv.progress=vipModel.vipExp;
				var needExp:int=targetNode.cash_limit-vipModel.vipExp;
				if(needExp<=0) needExp=0;
				wm._fnt_desc.text=Util.getLanguage("达到下一vip需要充值",needExp,vipModel.vipLevel+1);
			}
			
			
			/*if(vipModel.isMaxLevel()){
				wm._fnt_desc.text="";
				wm._prg_lv.devider=1;
				wm._prg_lv.progress=1;
				wm._num_suipian.text="";
			}else{
				
			}*/
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_chongzhi,TqtEvent.BUTTON_CLICK,onClickChognzhi);
		}
		
		
		private function onClickChognzhi(evt:Event):void{
			wm.close();
			WindowManager.openOnlyWinodw(ChongzhiWindow);
		}
		
		
		private function onSelected(evt:TqtEvent):void{
			var level:int=evt.data.index+1;
			wm._fnt_viptitel.text=Util.getLanguage("vip特权",level);
		}
		
		
		public override function destroy():void
		{
			// todo
			super.destroy();
		}
	}
}