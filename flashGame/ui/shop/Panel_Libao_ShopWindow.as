package ui.shop
{
	import com.fish.modules.core.C2SEmitter;
	import com.fish.modules.core.S2CHanlder;
	import com.fish.modules.core.models.BuyItemModel;
	import com.fish.modules.core.models.ItemModel;
	import com.fish.modules.core.models.RewardsPackData;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;
	import com.mutou.tqt.DigC2SProto;
	import com.mutou.tqt.ItemC2S;
	
	import core.WindowManager;
	
	import ui.widget.Position;
	import ui.widget.ScrollerControllerMatrix;
	import ui.window.CommonRewardWindow;
	
	import util.Util;
	
	import view.Panel_Base;
	
	public class Panel_Libao_ShopWindow extends Panel_Base
	{
		public var _pos_scroll_v_libao:Position;
		public var _scrollController:ScrollerControllerMatrix;
		private var itemModel:ItemModel;
		
		public function Panel_Libao_ShopWindow()
		{
			super();
		}
		protected override function initModule():void
		{
			itemModel=Context.getInjectInstance(ItemModel);
			_pos_scroll_v_libao=new Position(panelMaterial.pos_scroll_shop);
			_scrollController=new ScrollerControllerMatrix(_pos_scroll_v_libao);
			_scrollController.initClass(Item_LibaoPanel);
		}
		protected override function registerEvent():void
		{
			itemModel.modelUpdata_SN.add(setShow);
			S2CHanlder.instance.messageMax_SN.add(onMaxMessage);
		}
		private function onMaxMessage(msType:String,c2s:DigC2SProto,_code:int):void
		{
			if(_code!=1)
			{
				return;
			}
			var node:Node_item;
			if(msType==C2SEmitter.REQ_ItemBuyAndUseHandler){
				node=XMLDataManager.getItemById((c2s.item as ItemC2S).xid);
				var data:RewardsPackData=Util.createPackData(node.id);
				data.desc=Util.getLanguage("获得礼包并使用提示",node.name);
				WindowManager.openOnlyWinodw(CommonRewardWindow,data);
			}
			setShow();
		}
		protected override function setShow():void
		{
			var buyModel:BuyItemModel=Context.getInjectInstance(BuyItemModel);
			_scrollController.setData(buyModel.getLibaoDataArray());
		}
		public override function clear():void
		{
			S2CHanlder.instance.messageMax_SN.remove(onMaxMessage);
			itemModel.modelUpdata_SN.remove(setShow);
			itemModel=null;
			if(_pos_scroll_v_libao){_pos_scroll_v_libao.destory();_pos_scroll_v_libao=null};
			if(_scrollController){_scrollController.destory();_scrollController=null;}
			super.clear();
		}
		protected override function get panelClassName():Class
		{
			return SceneTongyongShop;
		}
		private function get panelMaterial():SceneTongyongShop
		{
			return material as SceneTongyongShop;
		}
	}
}