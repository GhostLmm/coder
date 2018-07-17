package ui.chongzhi
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ChongzhiModel;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.vip.VipWindow;
	
	import util.SwitchManager;
	
	public class MDI_Chongzhi extends Mediator
	{
		[Inject]
		public var wm:ChongzhiWindow;
		[Inject]
		public var chongzhiModel:ChongzhiModel;
		
		public function MDI_Chongzhi()
		{
			super();
		}
		
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			wm._scr_chongzhi.initClass(Item_Chonghzi);
			setShow();
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_vip,TqtEvent.BUTTON_CLICK,openVip);
			addViewListener(wm._btn_shouchong,TqtEvent.BUTTON_CLICK,onClickShouchong);
			chongzhiModel.modelUpdata_SN.add(setShow);
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			// 如果使用了充值礼包的话，那就刷新一下充值界面
			if(msType==C2SEmitter.REQ_ItemUseHandelr){
				if(c2s.item.xid==chongzhiModel.shouchongLibaoId){
					setShow();
				}
			}
		}
		
		private function onClickShouchong(evt:Event):void{
			WindowManager.openOnlyWinodw(ShouchongWindow);
		}
		
		private function setShow():void{
			wm._scr_chongzhi.setData(chongzhiModel.getChongzhiDataArray());
//			var yueka:Item_ChongzhiYueka=Item_Chonghzi.yueka;
			if(chongzhiModel.getShouchongState()==ChongzhiModel.ST_Complete){
				wm._btn_shouchong.visible=false;
			}else{
				wm._btn_shouchong.visible=true;
			}
			
//			if(AppstoreVerify.inVerify){
//				wm._btn_shouchong.visible=false;
//				wm._btn_vip.visible=false;
//			}
			
			if(!SwitchManager.getInstance().Switch_Shouchong){
				wm._btn_shouchong.visible=false;
			}
			
			if(!SwitchManager.getInstance().Switch_VIP_Icon){
				wm._btn_vip.visible=false;
			}
			
		}
		
		private function openVip(evt:Event):void{
			WindowManager.openOnlyWinodw(VipWindow);
		}
		
		
		public override function destroy():void
		{
			// todo
			chongzhiModel.modelUpdata_SN.remove(setShow);
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}