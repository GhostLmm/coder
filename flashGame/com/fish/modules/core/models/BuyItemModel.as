package com.fish.modules.core.models
{
	import com.fish.modules.core.ResourceConst;
	import com.ghostlmm.lightMVC.Context;
	import com.ghostlmm.xmldata.Node_item;
	import com.ghostlmm.xmldata.XMLDataManager;
	
	import org.osflash.signals.Signal;
	
	import util.SwitchManager;

	public class BuyItemModel extends BaseModel
	{
		public static const CannotBuyPriceType:String="none";
		public function BuyItemModel()
		{
			super();
		}
		
		private var _daojuDataArray:Array;
		private var _libaoDataArray:Array;
		
		public var cacheItemData:Node_item;
		
		public var buycomplete_SN:Signal;
		
		protected override function onGameInitComplete():void
		{
		}
		
		public override function destory():void
		{
			if(buycomplete_SN) {buycomplete_SN.removeAll();buycomplete_SN=null;}
			super.destory();
		}
		public function getLibaoDataArray():Array
		{
			_libaoDataArray=[];
			var itemModel:ItemModel=Context.getInjectInstance(ItemModel);
			var xmlArray:Array=XMLDataManager.Node_itemArray;
			var index:int;
			var vipLibao:int=(Context.getInjectInstance(ChongzhiModel) as ChongzhiModel).shouchongLibaoId;
			for(index=0;index<xmlArray.length;index++)
			{
				var node:Node_item=xmlArray[index] as Node_item;
				if(node.type == "libao" && node.buy_type != CannotBuyPriceType){
					if((node.vip_limit>0)&&(itemModel.checkVipItemIsAreadyBuy(node.id)))
					{
						continue;
					}
					if(vipLibao==node.id){
						continue;
					}
					
					if((node.vip_limit>0)&& !SwitchManager.getInstance().Switch_VIP_Icon){
						continue;
					}
					
					_libaoDataArray.push(node);
				}
			}
			_libaoDataArray.sort(libaoCompare);
			return _libaoDataArray;
		}
		private function libaoCompare(A:Node_item,B:Node_item):int
		{
			var weightA:int = 0;
			var weightB:int = 0;
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			if((A.vip_limit>0)&&(A.vip_limit<=userModel.userVo.vipLevel))
			{
				weightA+=100000;
			}
			if((B.vip_limit>0)&&(B.vip_limit<=userModel.userVo.vipLevel))
			{
				weightB+=100000;
			}
			weightA-=A.id;
			weightB-=B.id;
			return weightB - weightA;
		}
		public function couldBuyItem(itemModel:Node_item):JudgeResult
		{
			var userModel:UserModel=Context.getInjectInstance(UserModel);
			var re:JudgeResult=new JudgeResult();
			if(itemModel.buy_type == ResourceConst.R_cash && userModel.userVo.userCash < itemModel.buy_price) {
				re.success=false;
				re.code=JudgeResult.CD_CashNotEnough;
			} else if (itemModel.buy_type == ResourceConst.R_money && userModel.userVo.userMoney < itemModel.buy_price) {
				re.success=false;
				re.code=JudgeResult.CD_UserMoneyNotEnough;
				re.desc="铜币不足";
			} else {
				re.success=true;
			}
			return re;
		}
	}
}