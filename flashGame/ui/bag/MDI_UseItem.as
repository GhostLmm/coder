package ui.bag
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.ResourceConst;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.ItemModel;
	import com.fish.modules.core.models.JudgeResult;
	import com.fish.modules.core.models.RewardsPackData;
	import com.fish.modules.core.models.tempData.ItemData;
	import com.ghostlmm.lightMVC.impl.Mediator;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	
	import flash.events.Event;
	
	import core.WindowManager;
	import core.event.TqtEvent;
	
	import ui.chaonengli.ChaonengliWindow;
	import ui.chaonengli.Chaonengli_WeiJiesuo_Window;
	import ui.equip.EquipCaozuoWindow;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.CommonControlFun;
	
	public class MDI_UseItem extends Mediator
	{
		[Inject]
		public var wm:UseItemWindow;
		[Inject]
		public var itemModel:ItemModel;
		
		private var itemData:ItemData;
		public function MDI_UseItem()
		{
			super();
		}
		public override function initialize(mediatorData:Object):void
		{
			super.initialize(mediatorData);
			// todo
			
			itemData=itemModel.getItemDataByXid(int(wm._params));
			wm._fnt_desc.text=itemData.node.name;
			wm._btn_chushou.isEnabled=itemData.couldSell();
			
			addViewListener(wm._btn_close,TqtEvent.BUTTON_CLICK,wm.close);
			addViewListener(wm._btn_chushou,TqtEvent.BUTTON_CLICK,onChushou);
			addViewListener(wm._btn_chushou,TqtEvent.BUTTON_CLICK_DISABLE,onDisChoushou);
			addViewListener(wm._btn_shiyong,TqtEvent.BUTTON_CLICK,onShiyong);
			
			S2CHanlder.instance.messageMax_SN.add(onMessage);
		}
		
		private function onMessage(msType:String,c2s:DigC2SProto,code:int):void{
			if(code>=0){
				if(msType==C2SEmitter.REQ_ItemUseHandelr){
					var itemNode:Node_item = XMLDataManager.getItemById(c2s.item.xid);
					if(itemNode.sell_type==ResourceConst.R_money){
//						Util.flow("出售");
						var pack:RewardsPackData=new RewardsPackData();
						pack.bonus_money=itemNode.sell_price;
						pack.desc=Util.getLanguage("出售成功提示",itemNode.name);
						WindowManager.openOnlyWinodw(CommonRewardWindow,pack);
						wm.close();
					}
				}
			}
		}
		
		private function onDisChoushou(evt:Event):void{
			Util.flow("该物品无法出售");
		}
		
		private function onChushou(evt:Event):void{
			var re:JudgeResult=itemModel.couldSellItem(itemData.xid);
			if(re.success){
				C2SEmitter.useItem(itemData.node.id);
			}else{
				CommonControlFun.proccessJudgeResult(re);
			}
		}
		private function onShiyong(evt:Event):void{
			if(itemData.node.tag==ItemModel.TAG_Qianghua){
				WindowManager.openOnlyWinodw(EquipCaozuoWindow);
				WindowManager.closeWindowByClass(BagWindow);
				wm.close();
			}
			if(itemData.node.tag==ItemModel.TAG_Yaoji){
				WindowManager.openOnlyWinodw(ChaonengliWindow);
				WindowManager.closeWindowByClass(BagWindow);
				wm.close();
			}
			if(itemData.node.tag==ItemModel.TAG_Liaotian){
				
			}
		}
		
		
		public override function destroy():void
		{
			// todo
			S2CHanlder.instance.messageMax_SN.remove(onMessage);
			super.destroy();
		}
	}
}